from weasyprint import HTML, CSS

# Define custom CSS for PDF output
css = CSS(string='''
    @page {
        size: 1200px;
        margin: 0;
    }
    body {
        width: 1200px;
        margin: 0;
        padding: 2rem;
        overflow-x: hidden;
        box-sizing: border-box;
        min-width: 1200px;
        max-width: 1200px;
    }
    * {
        max-width: 1200px;
        box-sizing: border-box;
    }
    .resume {
        width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }
    .resume-section {
        width: 100%;
        max-width: 1200px;
    }
''')

# Convert HTML to PDF with custom CSS
HTML('resume_pdf.html').write_pdf('Shaina_Slavin_Resume.pdf', stylesheets=[css]) 