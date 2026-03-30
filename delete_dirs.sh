#!/bin/bash

# Set your repository details
REPO="LCapy/Transcription-Workbench"
BRANCH="main"  # Change to "master" if your default branch is master

# List of directories to delete
directories=(
  "DE" "ES_ES" "ES_MX" "ES_US" "FR_CA" "FR_FR" "ID_ID" "IT" "MS_MY"
  "cs_CZ" "da_DK" "el_GR" "fi_FI" "hi_IN" "ja_JP" "ko_KR" "lv_LV"
  "mr_IN" "nl_NL" "no_NO" "ro_RO" "sl_SI" "sr_RS" "sv_SE" "te_IN"
  "th_TH" "tr_TR" "vi_VN"
)

# Make sure we're in a git repository
if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository. Please run this from your cloned repo."
    exit 1
fi

# Check if we have the latest changes
echo "Updating repository..."
git pull origin $BRANCH

# Delete each directory
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "Deleting $dir..."
        git rm -r "$dir"
    else
        echo "Warning: $dir does not exist, skipping..."
    fi
done

# Check if there are any changes to commit
if git diff --cached --quiet; then
    echo "No changes to commit. Directories may not exist."
    exit 0
fi

# Commit the changes
echo "Committing changes..."
git commit -m "Delete multiple language directories

- Removed DE, ES_ES, ES_MX, ES_US, FR_CA, FR_FR, ID_ID, IT, MS_MY
- Removed cs_CZ, da_DK, el_GR, fi_FI, hi_IN, ja_JP, ko_KR, lv_LV
- Removed mr_IN, nl_NL, no_NO, ro_RO, sl_SI, sr_RS, sv_SE, te_IN
- Removed th_TH, tr_TR, vi_VN"

# Push to GitHub
echo "Pushing to GitHub..."
git push origin $BRANCH

echo "Done! All directories have been deleted and pushed to GitHub."