# GitHub Pages Deployment Checklist

## ✅ Pre-Deployment

### 1. Review and Update Content

- [ ] Update all placeholder text
- [ ] Replace `your-username` with actual GitHub username
- [ ] Update `your-email@example.com` with real email
- [ ] Add actual API credentials or instructions
- [ ] Review all code examples for accuracy
- [ ] Update copyright year if needed

### 2. Customize Branding

- [ ] Update site title in all HTML files
- [ ] Add company logo (replace nav-brand text with logo image)
- [ ] Customize color scheme in `assets/css/style.css`
- [ ] Update footer information
- [ ] Add social media links

### 3. Update Links

- [ ] Update GitHub repository links
- [ ] Update support email addresses
- [ ] Update status page URL
- [ ] Update documentation URLs
- [ ] Verify all internal links work

## 🚀 Deployment Steps

### Step 1: Prepare Repository

```bash
# Create a new repository on GitHub
# Clone it locally
git clone https://github.com/your-username/altafid-api-docs.git
cd altafid-api-docs

# Copy all files to the repository
cp -r /path/to/generated/files/* .

# Review structure
ls -la
```

### Step 2: Commit and Push

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit: Altafid API documentation"

# Push to GitHub
git push origin main
```

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings**
3. Scroll to **Pages** section (left sidebar)
4. Under **Source**:
   - Select branch: `main`
   - Select folder: `/ (root)`
5. Click **Save**

### Step 4: Wait for Deployment

- GitHub will build your site (takes 1-5 minutes)
- Check the Actions tab for build status
- Once complete, visit: `https://your-username.github.io/altafid-api-docs/`

## 🌐 Custom Domain Setup (Optional)

### Step 1: Add CNAME File

```bash
# Create CNAME file with your domain
echo "docs.altafid.com" > CNAME

# Commit and push
git add CNAME
git commit -m "Add custom domain"
git push
```

### Step 2: Configure DNS

#### Option A: CNAME Record (Subdomain)

Add this DNS record to your domain provider:

```
Type:  CNAME
Host:  docs (or your subdomain)
Value: your-username.github.io
TTL:   3600
```

#### Option B: A Records (Apex Domain)

Add these DNS records:

```
Type:  A
Host:  @
Value: 185.199.108.153
TTL:   3600

Type:  A
Host:  @
Value: 185.199.109.153
TTL:   3600

Type:  A
Host:  @
Value: 185.199.110.153
TTL:   3600

Type:  A
Host:  @
Value: 185.199.111.153
TTL:   3600
```

### Step 3: Update Repository Settings

1. Go to Settings → Pages
2. Enter your custom domain (e.g., `docs.altafid.com`)
3. Wait for DNS check to complete
4. Enable **Enforce HTTPS**

### Step 4: Wait for DNS Propagation

- DNS changes can take up to 48 hours
- Check status: `nslookup docs.altafid.com`
- Test: `curl -I https://docs.altafid.com`

## 🔍 Post-Deployment Verification

### Test All Pages

- [ ] Homepage loads correctly
- [ ] Quick Start guide displays properly
- [ ] Documentation page works
- [ ] All links are clickable
- [ ] Navigation menu works
- [ ] Footer links are correct
- [ ] Code blocks are formatted
- [ ] Mobile responsive design works

### Test Functionality

- [ ] Search functionality (if added)
- [ ] Copy code buttons (if added)
- [ ] External links open in new tabs
- [ ] Forms submit correctly (if any)
- [ ] All images load

### Performance Check

- [ ] Page load time < 3 seconds
- [ ] CSS loads correctly
- [ ] No console errors
- [ ] Works on Chrome, Firefox, Safari
- [ ] Works on mobile devices

## 🐛 Common Issues & Solutions

### Issue: 404 Error

**Solutions:**
- Check if GitHub Pages is enabled
- Verify branch is set correctly
- Ensure index.html is in root directory
- Wait a few minutes for build to complete

### Issue: CSS Not Loading

**Solutions:**
- Verify file path: `assets/css/style.css`
- Check file exists in repository
- Clear browser cache (Ctrl+Shift+R)
- Check CSS file for syntax errors

### Issue: Custom Domain Not Working

**Solutions:**
- Verify CNAME file contains correct domain
- Check DNS records are correct
- Wait for DNS propagation (up to 48 hours)
- Enable HTTPS in repository settings
- Check domain provider configuration

### Issue: Links Not Working

**Solutions:**
- Use relative paths (e.g., `quickstart.html` not `/quickstart.html`)
- Update baseurl in `_config.yml`
- Check for typos in href attributes
- Verify file names match exactly (case-sensitive)

## 📱 Mobile Testing

Test on multiple devices:

- [ ] iPhone (Safari)
- [ ] Android (Chrome)
- [ ] iPad (Safari)
- [ ] Desktop (Chrome, Firefox, Safari, Edge)

## 🎯 SEO Optimization

### Before Launch

- [ ] Add meta descriptions to all pages
- [ ] Create sitemap.xml
- [ ] Add robots.txt
- [ ] Optimize page titles
- [ ] Add Open Graph tags
- [ ] Add Twitter Card tags

### After Launch

- [ ] Submit to Google Search Console
- [ ] Submit sitemap to search engines
- [ ] Monitor search performance
- [ ] Update content regularly

## 📊 Analytics Setup (Optional)

### Google Analytics

1. Create GA4 property
2. Get measurement ID
3. Add tracking code to all pages:

```html
<!-- Before closing </head> tag -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🔄 Continuous Deployment

### Automatic Deployment

GitHub Pages automatically rebuilds when you push to the main branch:

```bash
# Make changes locally
# Test changes
# Commit and push
git add .
git commit -m "Update documentation"
git push origin main

# Site automatically rebuilds (1-5 minutes)
```

### Manual Deployment Workflow

1. Edit files locally
2. Test with local server
3. Commit to feature branch
4. Create pull request
5. Review changes
6. Merge to main
7. Automatic deployment

## 📝 Maintenance Checklist

### Monthly

- [ ] Review and update API endpoints
- [ ] Check for broken links
- [ ] Update code examples
- [ ] Review user feedback
- [ ] Update changelog

### Quarterly

- [ ] Full content review
- [ ] Update screenshots
- [ ] Review analytics
- [ ] Performance optimization
- [ ] Accessibility audit

### Annually

- [ ] Major content refresh
- [ ] Design review
- [ ] Technology stack review
- [ ] User survey
- [ ] Roadmap planning

## 🆘 Emergency Rollback

If you need to revert changes:

```bash
# Revert last commit
git revert HEAD
git push origin main

# Or rollback to specific commit
git reset --hard COMMIT_HASH
git push --force origin main
```

## 📧 Support Contacts

- **Technical Issues**: dev@altafid.com
- **Content Updates**: docs@altafid.com
- **Emergency**: emergency@altafid.com

## 🎉 Launch Announcement

After successful deployment:

1. [ ] Announce internally
2. [ ] Update public documentation
3. [ ] Send email to stakeholders
4. [ ] Post on social media
5. [ ] Update other documentation links

---

**Good luck with your deployment! 🚀**

*Remember: Test thoroughly before announcing publicly*
