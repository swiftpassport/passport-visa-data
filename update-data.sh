#!/bin/bash

# Download and Update Passport Index Data Script
# This script downloads the latest passport index data and commits it to the repository

echo "🌍 Downloading latest Passport Index Dataset..."

# Download the CSV file
curl -L https://raw.githubusercontent.com/ilyankou/passport-index-dataset/master/passport-index-tidy.csv -o passport-index-tidy.csv

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "✅ Download successful!"
    echo "📊 File size: $(wc -c < passport-index-tidy.csv) bytes"
    echo "📊 Total records: $(wc -l < passport-index-tidy.csv)"
    
    # Add to git
    git add passport-index-tidy.csv
    git commit -m "Update passport index data - $(date +%Y-%m-%d)"
    git push
    
    echo "✅ Data updated and pushed to repository!"
else
    echo "❌ Download failed!"
    exit 1
fi