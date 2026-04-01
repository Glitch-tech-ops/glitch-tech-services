# 🚀 CUSTOMER PORTAL - DEPLOYMENT GUIDE

## 📦 FILES TO UPLOAD TO GITHUB:

You need to upload these 4 files (2 new + 2 updated):

### **NEW FILES:**
1. `customer-portal.html` (English portal)
2. `customer-portal-es.html` (Spanish portal)

### **UPDATED FILES:**
3. `index.html` (updated - has Customer Portal link in header)
4. `index-es.html` (updated - has Portal de Clientes link in header)

---

## 📋 STEP-BY-STEP DEPLOYMENT:

### **Step 1: Go to Your GitHub Repository**
1. Open browser
2. Go to: `github.com/Glitch-tech-ops/glitch-tech-services`
3. Make sure you're logged in

### **Step 2: Upload New Portal Files**
1. Click **"Add file"** → **"Upload files"**
2. Drag and drop:
   - `customer-portal.html`
   - `customer-portal-es.html`
3. Scroll down to "Commit changes"
4. Write: "Add customer portal (English & Spanish)"
5. Click **"Commit changes"**

### **Step 3: Update Existing Website Files**
1. Click on `index.html` in the file list
2. Click the **pencil icon** (edit)
3. **Delete all content**
4. Open your local `index.html` file
5. **Copy all content** (Ctrl+A, Ctrl+C)
6. **Paste** into GitHub editor
7. Scroll down, write: "Add customer portal link"
8. Click **"Commit changes"**

9. **REPEAT for `index-es.html`:**
   - Click on `index-es.html`
   - Edit (pencil icon)
   - Delete all, paste new content
   - Commit with message: "Add portal de clientes link"

### **Step 4: Wait for Deployment (2-3 minutes)**
GitHub Pages will automatically rebuild your site.

### **Step 5: Test It!**
1. Go to: `glitch-tech-ops.github.io/glitch-tech-services`
2. You should see **"Customer Portal"** link in header
3. Click it - should go to portal
4. Test login with: `demo@customer.com` / `password123`

---

## 🔗 YOUR NEW URLS:

**Main Site (English):**
`glitch-tech-ops.github.io/glitch-tech-services`

**Main Site (Spanish):**
`glitch-tech-ops.github.io/glitch-tech-services/index-es.html`

**Customer Portal (English):**
`glitch-tech-ops.github.io/glitch-tech-services/customer-portal.html`

**Customer Portal (Spanish):**
`glitch-tech-ops.github.io/glitch-tech-services/customer-portal-es.html`

---

## ✅ WHAT CHANGED:

### **English Website (`index.html`):**
- Header now has: `Español? | Customer Portal | About Us`
- Clicking "Customer Portal" → goes to portal

### **Spanish Website (`index-es.html`):**
- Header now has: `English? | Portal de Clientes | Sobre Nosotros`
- Clicking "Portal de Clientes" → goes to Spanish portal

### **Customer Portal:**
- Standalone login system
- Demo account works
- Repair tracking
- Messaging system
- Full dashboard

---

## 🎯 HOW CUSTOMERS WILL USE IT:

### **Option 1: You Create Account for Them**
1. Customer books a repair
2. You create account (in future: admin panel)
3. You email them login credentials
4. They log in and track repair

### **Option 2: Self-Service (Future)**
1. Customer fills contact form on main site
2. Auto-creates account
3. Sends them email with credentials
4. They can track repair

**For now:** Just use demo mode to show customers what it looks like!

---

## 📱 HOW TO SHOW CUSTOMERS:

When you get a repair job:

**Say:**
"Hey! I have a customer portal where you can track your repair in real-time. Let me set up an account for you real quick."

**Then:**
1. Show them the portal (use demo login)
2. Explain they can:
   - See repair status
   - Message you
   - View history
3. Tell them you'll create their account after they book

---

## 🔧 FUTURE UPGRADES (NOT NOW):

These are ideas for later:

1. **Admin Panel** - Where YOU manage customer repairs
2. **Real Database** - Store data permanently (not just demo)
3. **Email Notifications** - Auto-email when status changes
4. **Payment Integration** - Let customers pay through portal
5. **File Upload** - Customers can upload photos of their issue

**But for now, the portal is DONE and functional!**

---

## 🚨 TROUBLESHOOTING:

### **Portal link doesn't work after deploying?**
- Wait 5 minutes for GitHub Pages to update
- Try hard refresh (Ctrl+Shift+R)
- Check URL is correct

### **Demo login not working?**
- Make sure you uploaded `customer-portal.html` correctly
- Try: `demo@customer.com` / `password123`

### **Header looks weird?**
- Clear browser cache
- The new header has 3 links now instead of 2

---

## ✅ FINAL CHECKLIST:

Before deploying, make sure you have:
- [ ] `customer-portal.html` file ready
- [ ] `customer-portal-es.html` file ready
- [ ] Updated `index.html` with portal link
- [ ] Updated `index-es.html` with portal link
- [ ] Tested portal locally (opened in browser)
- [ ] Ready to upload to GitHub

---

## 🎯 UPLOAD ORDER:

Do it in this order to avoid confusion:

1. Upload `customer-portal.html` (new)
2. Upload `customer-portal-es.html` (new)
3. Update `index.html` (replace)
4. Update `index-es.html` (replace)
5. Wait 2-3 minutes
6. Test everything

---

**Ready to deploy? Follow the steps above and you're live!** 🚀

If you get stuck, just message me and I'll walk you through it!
