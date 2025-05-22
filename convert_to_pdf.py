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
    }
''')

# Convert HTML to PDF with custom CSS
HTML('resume_pdf.html').write_pdf('Shaina_Slavin_Resume.pdf', stylesheets=[css]) 