import webbrowser
import os

# Get the absolute path to the resume_pdf.html file
current_dir = os.path.dirname(os.path.abspath(__file__))
resume_path = os.path.join(current_dir, 'resume_pdf.html')

# Convert the path to a file URL
file_url = 'file://' + resume_path

# Open the file in the default browser
webbrowser.open(file_url) 