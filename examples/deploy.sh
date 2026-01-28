#!/bin/bash

# Altafid API Docs - Quick Deployment Script
# This script helps you deploy the documentation to GitHub Pages

set -e  # Exit on error

echo "🚀 Altafid API Documentation Deployment"
echo "========================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: git is not installed"
    echo "Please install git first: https://git-scm.com/downloads"
    exit 1
fi

# Get repository URL
read -p "Enter your GitHub repository URL (e.g., https://github.com/username/altafid-api-docs.git): " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ Error: Repository URL cannot be empty"
    exit 1
fi

# Get custom domain (optional)
read -p "Enter custom domain (optional, press Enter to skip): " CUSTOM_DOMAIN

echo ""
echo "📦 Initializing repository..."
git init

# Add all files
echo "📝 Adding files..."
git add .

# Commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: Altafid API documentation site"

# Add remote
echo "🔗 Adding remote repository..."
git remote add origin "$REPO_URL"

# Create CNAME if custom domain provided
if [ ! -z "$CUSTOM_DOMAIN" ]; then
    echo ""
    echo "🌐 Creating CNAME file for custom domain..."
    echo "$CUSTOM_DOMAIN" > CNAME
    git add CNAME
    git commit -m "Add custom domain"
    
    echo ""
    echo "⚠️  Don't forget to configure DNS:"
    echo "   Add a CNAME record pointing to: your-username.github.io"
    echo "   Or use A records pointing to GitHub Pages IPs"
fi

# Push to GitHub
echo ""
echo "⬆️  Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Go to your repository on GitHub"
echo "   2. Navigate to Settings → Pages"
echo "   3. Under 'Source', select branch: main"
echo "   4. Click 'Save'"
echo "   5. Wait 1-5 minutes for deployment"
echo ""

if [ -z "$CUSTOM_DOMAIN" ]; then
    GITHUB_USERNAME=$(echo "$REPO_URL" | sed -n 's/.*github.com[/:]\([^/]*\)\/.*/\1/p')
    REPO_NAME=$(echo "$REPO_URL" | sed -n 's/.*\/\([^/]*\)\.git/\1/p')
    echo "🌐 Your site will be available at:"
    echo "   https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/"
else
    echo "🌐 Your site will be available at:"
    echo "   https://${CUSTOM_DOMAIN}"
    echo ""
    echo "⏰ Remember: DNS propagation can take up to 48 hours"
fi

echo ""
echo "🎉 Happy documenting!"
