# Getting Started with Your Altafid API Documentation Site

Welcome! This guide will help you set up and customize your professional API documentation site.

## 📦 What You Have

Your documentation site includes:

1. **Professional Pages**
   - `index.html` - Beautiful landing page
   - `quickstart.html` - 5-minute quick start guide
   - `docs.html` - Complete API reference
   
2. **Styling**
   - `assets/css/style.css` - Modern, responsive CSS
   - Mobile-friendly design
   - Professional color scheme
   
3. **Example Scripts**
   - `examples/login.sh` - Authentication example
   - `examples/create-task.sh` - Task creation
   - `examples/search-contact.sh` - Contact search
   - `examples/list-staff.sh` - Staff listing
   - More utility scripts
   
4. **Deployment Tools**
   - `deploy.sh` - Automated deployment script
   - `DEPLOYMENT.md` - Detailed deployment checklist
   - `README_GITHUB_PAGES.md` - GitHub Pages setup guide

## 🚀 Quick Start (2 Methods)

### Method 1: Automated Deployment (Recommended)

```bash
# Navigate to your documentation folder
cd path/to/altafid-api-docs

# Run the deployment script
chmod +x deploy.sh
./deploy.sh

# Follow the prompts
```

The script will:
- Initialize git repository
- Commit all files
- Push to GitHub
- Optionally configure custom domain

### Method 2: Manual Setup

```bash
# 1. Initialize git repository
git init

# 2. Add all files
git add .

# 3. Commit
git commit -m "Initial commit: Altafid API documentation"

# 4. Add remote repository
git remote add origin https://github.com/your-username/altafid-api-docs.git

# 5. Push to GitHub
git branch -M main
git push -u origin main
```

Then enable GitHub Pages in repository settings.

## ✏️ Customization Guide

### Step 1: Update Site Information

Edit these files to customize your site:

**In all HTML files (`index.html`, `quickstart.html`, `docs.html`):**

1. Update GitHub repository link:
   ```html
   <a href="https://github.com/YOUR-USERNAME/altafid-api-docs">
   ```

2. Update footer information:
   ```html
   <footer class="footer">
       <!-- Update links and contact info -->
   </footer>
   ```

3. Update navigation (if needed)

**In `_config.yml`:**

```yaml
title: Your API Name
description: Your description
url: "https://your-domain.com"
```

### Step 2: Customize Colors

Edit `assets/css/style.css`:

```css
:root {
    --primary-color: #2563eb;      /* Change to your brand color */
    --primary-dark: #1e40af;       /* Darker shade of brand color */
    /* ... customize more colors ... */
}
```

### Step 3: Update API Endpoints

In `docs.html`, update the API base URL and endpoints:

```html
<code>https://api.your-domain.com</code>
```

### Step 4: Add Your Logo (Optional)

Replace the text logo in the navbar:

```html
<!-- Before -->
<div class="nav-brand">
    <h1>Altafid API</h1>
</div>

<!-- After -->
<div class="nav-brand">
    <img src="assets/images/logo.png" alt="Your Logo" height="40">
</div>
```

## 🌐 Domain Configuration

### Using GitHub Pages Default Domain

Your site will be at: `https://your-username.github.io/altafid-api-docs/`

No additional configuration needed!

### Using Custom Domain

1. **Create CNAME file:**
   ```bash
   echo "docs.yourdomain.com" > CNAME
   ```

2. **Configure DNS at your domain provider:**
   
   For subdomain (docs.yourdomain.com):
   ```
   Type: CNAME
   Host: docs
   Value: your-username.github.io
   ```
   
   For apex domain (yourdomain.com):
   ```
   Type: A
   Host: @
   Value: 185.199.108.153
   
   (Repeat for .109, .110, .111)
   ```

3. **Update GitHub Pages settings:**
   - Go to Settings → Pages
   - Enter your custom domain
   - Enable "Enforce HTTPS"

## 📝 Content Updates

### Adding New Sections

1. Open the relevant HTML file
2. Add your content using the existing structure
3. Update the sidebar navigation
4. Commit and push changes

Example:
```html
<h2 id="new-section">New Section</h2>
<p>Your content here...</p>

<!-- Add to sidebar -->
<li><a href="#new-section">New Section</a></li>
```

### Updating Code Examples

Code blocks use this format:
```html
<pre><code class="language-bash">
# Your code here
curl https://api.example.com
</code></pre>
```

### Adding New Pages

1. Create a new HTML file (e.g., `changelog.html`)
2. Copy header/footer from existing pages
3. Add your content
4. Update navigation in all pages
5. Commit and push

## 🎨 Design Tips

### Color Schemes

Professional color combinations:
- **Blue/Tech**: `#2563eb` (primary), `#1e40af` (dark)
- **Green/Growth**: `#10b981` (primary), `#059669` (dark)  
- **Purple/Creative**: `#8b5cf6` (primary), `#7c3aed` (dark)
- **Orange/Energy**: `#f97316` (primary), `#ea580c` (dark)

### Typography

Current font stack:
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

For code blocks:
```css
font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', monospace;
```

### Responsive Breakpoints

The site is responsive at:
- Mobile: < 480px
- Tablet: < 768px
- Desktop: > 768px

## 🧪 Testing Your Site

### Test Locally

**Using Python:**
```bash
python -m http.server 8000
# Visit http://localhost:8000
```

**Using Node.js:**
```bash
npx http-server
# Visit http://localhost:8080
```

### Test Checklist

- [ ] All pages load correctly
- [ ] Navigation links work
- [ ] Code examples are readable
- [ ] Mobile view works
- [ ] All external links work
- [ ] Forms function properly (if any)
- [ ] No console errors

## 🔧 Maintenance

### Regular Updates

**Weekly:**
- Check for broken links
- Review user feedback
- Update any changed endpoints

**Monthly:**
- Full content review
- Update examples
- Check analytics (if enabled)

**Quarterly:**
- Design review
- Performance optimization
- User survey

### Common Tasks

**Update API endpoint:**
1. Edit `docs.html`
2. Find the endpoint section
3. Update URL, parameters, or examples
4. Test locally
5. Commit and push

**Add new endpoint:**
1. Copy existing endpoint structure
2. Update content
3. Add to sidebar navigation
4. Test locally
5. Commit and push

## 📊 Analytics (Optional)

### Adding Google Analytics

Add before closing `</head>` in all HTML files:

```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🐛 Troubleshooting

### Site Not Loading?

1. Check GitHub Pages is enabled
2. Verify branch is set to `main`
3. Wait 2-5 minutes for build
4. Check Actions tab for errors

### CSS Not Loading?

1. Verify file path: `assets/css/style.css`
2. Check file exists in repository
3. Clear browser cache (Ctrl+Shift+R)
4. Check for CSS syntax errors

### Custom Domain Issues?

1. Verify CNAME file is correct
2. Check DNS records
3. Wait up to 48 hours for propagation
4. Enable HTTPS in settings

## 📚 Additional Resources

- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [Jekyll Documentation](https://jekyllrb.com/)
- [Markdown Guide](https://www.markdownguide.org/)
- [HTML/CSS Reference](https://developer.mozilla.org/en-US/docs/Web)

## 💡 Pro Tips

1. **Keep it Simple**: Don't over-complicate the design
2. **Test Often**: Check on multiple browsers and devices
3. **Stay Consistent**: Use the same formatting throughout
4. **Document Changes**: Keep a changelog
5. **Backup Regularly**: Commit frequently to git
6. **Get Feedback**: Ask users what they need

## 🎯 Next Steps

1. [ ] Customize colors and branding
2. [ ] Update all content placeholders
3. [ ] Test locally
4. [ ] Deploy to GitHub Pages
5. [ ] Configure custom domain (if applicable)
6. [ ] Share with stakeholders
7. [ ] Set up analytics
8. [ ] Plan regular updates

## 📧 Need Help?

If you get stuck:
1. Check the DEPLOYMENT.md file
2. Review GitHub Pages documentation
3. Check GitHub Issues
4. Contact support@altafid.com

## 🎉 You're All Set!

Your professional API documentation site is ready to go. Deploy it, share it, and keep it updated!

**Remember:** Great documentation is always evolving. Keep listening to your users and improving.

---

**Happy documenting! 📖**

*Created with ❤️ for Altafid API*
