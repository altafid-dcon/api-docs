# Altafid API Documentation

Professional API documentation site built with GitHub Pages.

## 🚀 Live Documentation

Visit the live documentation at: `https://your-username.github.io/altafid-api-docs/`

## 📚 What's Included

- **Homepage** - Modern landing page with feature highlights
- **Quick Start Guide** - Get started in 5 minutes
- **API Reference** - Complete endpoint documentation
- **Code Examples** - Ready-to-use bash scripts
- **Responsive Design** - Works on all devices

## 🎨 Features

- ✅ Clean, modern UI design
- ✅ Fully responsive layout
- ✅ Syntax-highlighted code blocks
- ✅ Easy navigation with sticky navbar
- ✅ Professional styling with CSS variables
- ✅ SEO-friendly structure

## 🛠️ Setup GitHub Pages

### Option 1: Using This Repository

1. **Fork or clone this repository**
   ```bash
   git clone https://github.com/your-username/altafid-api-docs.git
   cd altafid-api-docs
   ```

2. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages" section
   - Under "Source", select "main" branch
   - Click "Save"

3. **Visit your site**
   - Your site will be available at: `https://your-username.github.io/altafid-api-docs/`
   - It may take a few minutes to build

### Option 2: Custom Domain

1. **Add a CNAME file**
   ```bash
   echo "docs.altafid.com" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

2. **Configure DNS**
   - Add a CNAME record pointing to: `your-username.github.io`
   - Or add A records pointing to GitHub Pages IPs:
     - 185.199.108.153
     - 185.199.109.153
     - 185.199.110.153
     - 185.199.111.153

3. **Update repository settings**
   - Go to Settings → Pages
   - Enter your custom domain
   - Enable "Enforce HTTPS"

## 📁 Project Structure

```
altafid-api-docs/
├── index.html              # Homepage
├── quickstart.html         # Quick Start Guide
├── docs.html              # API Reference
├── _config.yml            # Jekyll configuration
├── assets/
│   └── css/
│       └── style.css      # Main stylesheet
├── examples/              # Bash scripts
│   ├── login.sh
│   ├── create-task.sh
│   ├── search-contact.sh
│   ├── list-staff.sh
│   ├── refresh-token.sh
│   └── logout.sh
└── README.md             # This file
```

## 🎨 Customization

### Colors

Edit CSS variables in `assets/css/style.css`:

```css
:root {
    --primary-color: #2563eb;      /* Main brand color */
    --primary-dark: #1e40af;       /* Darker shade */
    --text-primary: #0f172a;       /* Main text color */
    /* ... more variables ... */
}
```

### Content

1. **Update navigation links** in all HTML files
2. **Modify footer** information
3. **Add your logo** in the navbar
4. **Update API endpoints** in docs.html

### Add New Pages

1. Create a new HTML file
2. Copy the header/footer from existing pages
3. Add link to navigation menu
4. Update `_config.yml` if needed

## 🧪 Testing Locally

### With Python

```bash
# Python 3
python -m http.server 8000

# Visit http://localhost:8000
```

### With Node.js

```bash
# Install http-server globally
npm install -g http-server

# Run server
http-server

# Visit http://localhost:8080
```

### With Jekyll (Optional)

```bash
# Install Jekyll
gem install bundler jekyll

# Run Jekyll server
jekyll serve

# Visit http://localhost:4000
```

## 📝 Using the Example Scripts

The `examples/` folder contains ready-to-use bash scripts:

1. **Make scripts executable**
   ```bash
   chmod +x examples/*.sh
   ```

2. **Update credentials**
   - Edit each script to add your credentials
   - Or use environment variables

3. **Run scripts**
   ```bash
   ./examples/login.sh
   ./examples/create-task.sh
   ./examples/search-contact.sh
   ```

## 🔧 Configuration

### _config.yml

Update Jekyll configuration:

```yaml
title: Altafid API Documentation
description: Official API documentation for Altafid platform
url: "https://docs.altafid.com"
baseurl: ""

# Update these to match your setup
```

### SEO

Each page includes meta tags for SEO. Update as needed:

```html
<meta name="description" content="Your description here">
<title>Your Page Title</title>
```

## 📦 Dependencies

This site uses:
- **HTML5** - Structure
- **CSS3** - Styling with custom properties
- **GitHub Pages** - Hosting
- **Jekyll** (optional) - Static site generation

No JavaScript frameworks required! Pure HTML/CSS for maximum performance.

## 🎯 Best Practices

### File Organization

- Keep HTML files in root directory
- Store assets in `assets/` folder
- Use relative paths for portability
- Maintain consistent naming conventions

### Performance

- Minimize external dependencies
- Use inline critical CSS if needed
- Optimize images before uploading
- Enable GitHub Pages caching

### Maintenance

- Update API endpoints regularly
- Test all links periodically
- Keep code examples current
- Monitor GitHub Pages build status

## 🐛 Troubleshooting

### Site Not Loading

1. Check GitHub Pages is enabled in settings
2. Verify branch is set correctly (usually `main`)
3. Wait a few minutes for initial build
4. Check Actions tab for build errors

### Custom Domain Issues

1. Verify DNS records are correct
2. Check CNAME file exists and is correct
3. Wait for DNS propagation (up to 48 hours)
4. Enable "Enforce HTTPS" in settings

### Styling Not Applied

1. Check CSS file path is correct
2. Verify `assets/css/style.css` exists
3. Clear browser cache
4. Check browser console for errors

## 📄 License

This documentation template is provided as-is for use with Altafid API documentation.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📧 Support

- **Email**: support@altafid.com
- **Documentation**: https://docs.altafid.com
- **Issues**: Use GitHub Issues for bugs/features

## 🔗 Useful Links

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Markdown Guide](https://www.markdownguide.org/)

---

**Made with ❤️ for Altafid API Documentation**

*Last updated: January 28, 2026*
