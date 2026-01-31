-- GLITCH TECH SERVICES - DATABASE SCHEMA
-- Run this in Supabase SQL Editor to set up your database

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create customers table
CREATE TABLE customers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    name TEXT NOT NULL,
    phone TEXT,
    verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create repairs table
CREATE TABLE repairs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    repair_number TEXT UNIQUE NOT NULL,
    device_type TEXT NOT NULL,
    brand TEXT,
    issue TEXT NOT NULL,
    service_type TEXT NOT NULL,
    urgency TEXT DEFAULT 'normal',
    status TEXT DEFAULT 'pending',
    estimated_cost TEXT,
    actual_cost TEXT,
    notes TEXT,
    image_url TEXT,
    date_requested TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    date_completed TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create messages table
CREATE TABLE messages (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    repair_id UUID REFERENCES repairs(id) ON DELETE CASCADE,
    from_type TEXT NOT NULL, -- 'customer' or 'tech'
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_repairs_customer ON repairs(customer_id);
CREATE INDEX idx_repairs_status ON repairs(status);
CREATE INDEX idx_messages_customer ON messages(customer_id);
CREATE INDEX idx_messages_repair ON messages(repair_id);

-- Enable Row Level Security (RLS)
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE repairs ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Customers can only see their own data
CREATE POLICY "Customers can view own data" ON customers
    FOR SELECT USING (auth.uid()::text = id::text);

CREATE POLICY "Customers can update own data" ON customers
    FOR UPDATE USING (auth.uid()::text = id::text);

-- Customers can only see their own repairs
CREATE POLICY "Customers can view own repairs" ON repairs
    FOR SELECT USING (customer_id::text = auth.uid()::text OR auth.uid() IS NULL);

CREATE POLICY "Customers can create repairs" ON repairs
    FOR INSERT WITH CHECK (true);

-- Customers can view and create messages for their repairs
CREATE POLICY "Customers can view messages" ON messages
    FOR SELECT USING (customer_id::text = auth.uid()::text OR auth.uid() IS NULL);

CREATE POLICY "Customers can create messages" ON messages
    FOR INSERT WITH CHECK (true);

-- Admin can do everything (we'll handle admin auth in the app)
CREATE POLICY "Allow public read for admin" ON customers
    FOR SELECT USING (true);

CREATE POLICY "Allow public read repairs for admin" ON repairs
    FOR SELECT USING (true);

CREATE POLICY "Allow public update repairs for admin" ON repairs
    FOR UPDATE USING (true);

CREATE POLICY "Allow public read messages for admin" ON messages
    FOR SELECT USING (true);

CREATE POLICY "Allow public insert messages for admin" ON messages
    FOR INSERT WITH CHECK (true);

-- Create storage bucket for repair images
INSERT INTO storage.buckets (id, name, public)
VALUES ('repair-images', 'repair-images', true);

-- Allow public access to repair images
CREATE POLICY "Public can view repair images"
ON storage.objects FOR SELECT
USING (bucket_id = 'repair-images');

-- Allow anyone to upload repair images
CREATE POLICY "Anyone can upload repair images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'repair-images');

-- Function to generate repair numbers (R0001, R0002, etc.)
CREATE OR REPLACE FUNCTION generate_repair_number()
RETURNS TEXT AS $$
DECLARE
    next_num INTEGER;
    repair_num TEXT;
BEGIN
    SELECT COALESCE(MAX(CAST(SUBSTRING(repair_number FROM 2) AS INTEGER)), 0) + 1
    INTO next_num
    FROM repairs;
    
    repair_num := 'R' || LPAD(next_num::TEXT, 4, '0');
    RETURN repair_num;
END;
$$ LANGUAGE plpgsql;

-- Trigger to auto-generate repair numbers
CREATE OR REPLACE FUNCTION set_repair_number()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.repair_number IS NULL THEN
        NEW.repair_number := generate_repair_number();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_set_repair_number
BEFORE INSERT ON repairs
FOR EACH ROW
EXECUTE FUNCTION set_repair_number();

-- Success message
DO $$
BEGIN
    RAISE NOTICE 'Database schema created successfully!';
    RAISE NOTICE 'Tables created: customers, repairs, messages';
    RAISE NOTICE 'Storage bucket created: repair-images';
    RAISE NOTICE 'Ready to use!';
END $$;
