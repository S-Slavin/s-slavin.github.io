# Portfolio Site Build Specifications

## Core Requirements
1. Desktop-only portfolio site (no mobile version needed)
2. Single column layout with vertical stacking
3. Clean, minimal, and modern design
4. No columns or complex layouts
5. Must work with GitHub Pages (https://s-slavin.github.io)

## Layout Structure
1. Navigation Bar
   - Fixed at top
   - White background with subtle shadow
   - Links: Portfolio (index.html) and Resume (resume.html)
   - Active state highlighting

2. Main Content (Vertical Stack)
   - Headshot section at top
   - Header with name and title
   - Contact information
   - Summary section
   - Technical Skills section with icons
   - Project Highlights section
   - Footer with resume link

## Design Specifications
1. Typography
   - Font: Inter (primary), Arial (fallback)
   - Clean, modern text styling
   - Consistent spacing

2. Colors
   - Background: #fafbfc (light gray)
   - Text: #23272f (dark gray)
   - Accent: #007aff (blue)
   - Subtle shadows for depth

3. Components
   - Headshot: 200x200px circular with white border
   - Project Cards: Light gray background, rounded corners
   - Skills Section: Interactive buttons with icons
   - Navigation: Fixed position with hover effects

## File Structure
```
S-slavin.github.io/
├── index.html          # Main portfolio page
├── styles.css          # Main stylesheet
├── js-icon.svg         # JavaScript icon
├── headshot.jpg        # Profile picture
└── resume.html         # Resume page
```

## Technical Requirements
1. No JavaScript required
2. No mobile responsiveness needed
3. No complex animations
4. No external dependencies
5. Must work with GitHub Pages hosting

## Content Sections
1. Header
   - Name: Shaina Slavin
   - Title: Software Engineer
   - Professional headshot

2. Contact Information
   - Email
   - LinkedIn
   - GitHub
   - Location

3. Summary
   - Professional overview
   - Key strengths
   - Career focus

4. Technical Skills
   - Programming languages
   - Frameworks
   - Tools
   - Technologies
   - Each with appropriate icon

5. Project Highlights
   - Project name
   - Description
   - Technologies used
   - GitHub link
   - Live demo link (if applicable)

## Implementation Notes
1. Keep HTML structure clean and semantic
2. Use CSS for all styling (no inline styles)
3. Optimize images for web
4. Ensure all links work correctly
5. Test on desktop browsers only

## To Do List
- [ ] Create index.html with basic structure
- [ ] Add styles.css with desktop-only layout
- [ ] Create resume.html page
- [ ] Add headshot.jpg
- [ ] Create skill icons
- [ ] Add project content
- [ ] Test on GitHub Pages
- [ ] Verify all links work
- [ ] Check desktop browser compatibility 