# Portfolio Site

A modern, responsive portfolio website built with HTML, CSS, and Node.js, deployed on GitHub Pages.

## Features
- Responsive design for all devices
- Modern, clean interface
- Optimized performance
- SEO friendly
- Accessible design
- Mobile-first approach

## Tech Stack
- HTML5
- CSS3
- Node.js
- GitHub Pages
- GitHub Actions for CI/CD

## Project Structure
```
S-slavin.github.io/
├── index.html          # Main portfolio page
├── resume.html         # Resume page
├── styles.css          # Main stylesheet
├── server.js           # Development server
├── package.json        # Node.js dependencies
├── .github/           # GitHub Actions workflow
├── assets/            # Icons and images
└── *.svg              # SVG icons for skills
```

## Development
1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the development server:
   ```bash
   npm start
   ```

## Deployment
The site is automatically deployed to GitHub Pages when changes are pushed to the main branch. The deployment process includes:
- Image optimization
- Asset compression
- Security headers
- CORS configuration
- Cache optimization

## Configuration Files
- `.nojekyll` - Prevents GitHub Pages from processing with Jekyll
- `robots.txt` - Search engine crawling instructions
- `sitemap.xml` - SEO sitemap
- `.gitignore` - Git ignore rules

## To Do
- [ ] Add headshot.jpg
- [ ] Add more project details
- [ ] Enhance mobile responsiveness
- [ ] Add dark mode support
- [ ] Add more interactive features

## License
MIT License - See LICENSE file for details 