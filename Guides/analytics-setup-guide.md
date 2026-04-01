# 📊 ANALYTICS SETUP FOR GLITCH TECH SERVICES

## Option 1: Google Analytics (Recommended - FREE)

### Step 1: Create Google Analytics Account
1. Go to https://analytics.google.com
2. Click "Start measuring"
3. Create account:
   - Account name: "Glitch Tech Services"
   - Property name: "Glitch Tech Website"
   - Time zone: US/Eastern
   - Currency: USD

### Step 2: Get Your Tracking Code
After creating account, you'll get a **Measurement ID** that looks like:
```
G-XXXXXXXXXX
```

### Step 3: Add to Your Website
Add this code to BOTH `index.html` and `index-es.html` right before the closing `</head>` tag:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

(Replace G-XXXXXXXXXX with your actual Measurement ID)

### Step 4: Upload Updated Files to GitHub
Upload both updated `index.html` and `index-es.html` files to your GitHub repository.

### What You'll See in Analytics:
- **Real-time visitors** - Who's on your site RIGHT NOW
- **Daily visitors** - How many people visit per day
- **Where they come from** - OfferUp, Facebook, Google, Direct
- **What pages they view** - English site vs Spanish site
- **How long they stay** - Engagement time
- **Device breakdown** - Mobile vs Desktop vs Tablet
- **Location data** - What cities are visiting

---

## Option 2: Simple Counter (FREE, No Account Needed)

If you want something SUPER simple without creating accounts:

### GoatCounter (Privacy-Focused, Free)
1. Go to https://www.goatcounter.com
2. Create free account
3. Add this ONE LINE to your site (before `</body>`):

```html
<script data-goatcounter="https://YOURSITE.goatcounter.com/count" async src="//gc.zgo.at/count.js"></script>
```

Shows:
- Page views
- Unique visitors
- Referrers (where traffic comes from)
- Browser/OS data

Much simpler than Google Analytics, but less detailed.

---

## Option 3: GitHub Traffic (Already Available!)

GitHub Pages gives you SOME analytics for free:

1. Go to your GitHub repo
2. Click "Insights" tab
3. Click "Traffic"

Shows:
- Total views (last 14 days)
- Unique visitors
- Referring sites
- Popular content

**Limitation:** Only shows last 14 days, not as detailed as Google Analytics.

---

## My Recommendation:

**Start with GitHub Traffic** (already there, no setup needed) to see if you're getting any visitors.

**Then add Google Analytics** once you start getting traffic - it's free and gives you WAY more detail.

**Why Google Analytics is worth it:**
- See what services people are looking at most
- Know if people are filling out your contact form
- Track which marketing efforts work (OfferUp vs Facebook vs flyers)
- See what times of day people visit
- Know if mobile optimization is needed

---

## Setting Up Form Tracking (Advanced)

Once you have Google Analytics, you can track when people submit your contact form:

Add this to your form submission JavaScript:

```javascript
// After form submits successfully
gtag('event', 'generate_lead', {
  'event_category': 'Contact Form',
  'event_label': 'Quote Request',
  'value': 1
});
```

This will show you exactly how many quote requests you get!

---

## What to Monitor Daily

Once analytics are set up:

### Every Morning Check:
1. **Visitor count** - Any traffic yesterday?
2. **Traffic sources** - Where did they come from?
3. **Form submissions** - Any quote requests?

### Weekly Check:
1. **Trending pages** - What services are people interested in?
2. **Bounce rate** - Are people leaving immediately? (May need to improve page)
3. **Device breakdown** - Mostly mobile? (Make sure mobile experience is good)

---

## Quick Setup Instructions (Google Analytics)

**5-Minute Setup:**

1. Create account at analytics.google.com
2. Copy your Measurement ID (G-XXXXXXXXXX)
3. Add the tracking code to both website files
4. Upload to GitHub
5. Visit your own site to test
6. Check Analytics dashboard (may take 24 hours for data)

**Done!**

---

## Need Help?

If you get stuck setting up analytics, just message me the step you're on and I'll walk you through it!
