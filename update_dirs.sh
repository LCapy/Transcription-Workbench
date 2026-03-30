# Make sure you're in the Transcription-Workbench directory
cd ~/data_services/transcription/Projects/Transcription-Workbench

# Create the folders
mkdir -p Transcription Uber

# Move non-uber files to Transcription folder
git mv Domains Transcription/
git mv Sub-domains Transcription/
git mv accents Transcription/
git mv countries Transcription/
git mv emotions Transcription/
git mv field_description Transcription/
git mv file_events Transcription/
git mv segment_events Transcription/

# Move uber files to Uber folder
git mv countries_uber Uber/
git mv emotions_uber Uber/
git mv file_events_uber Uber/
git mv segment_events_uber Uber/

# Commit the changes
git add -A
git commit -m "Reorganize files into Transcription and Uber folders

- Moved core files to Transcription/
- Moved Uber-specific files to Uber/"

# Push to GitHub
git push origin main