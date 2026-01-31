#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0
#
# Generate SUMMARY.md for GitBook navigation

set -uo pipefail

# Function to convert filename to title
# Removes .md extension, replaces dashes with spaces, and capitalizes each word
filename_to_title() {
  local filename="$1"
  # Step 1: Remove .md extension
  local no_ext
  no_ext=$(echo "$filename" | sed 's/.md$//')
  # Step 2: Replace dashes with spaces
  local with_spaces
  with_spaces=$(echo "$no_ext" | sed 's/-/ /g')
  # Step 3: Capitalize first letter of each word
  echo "$with_spaces" | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1'
}

# Start SUMMARY.md
cat > SUMMARY.md << 'EOF'
# Summary

* [Introduction](README.md)

EOF

# Add Articles section
echo "## Articles" >> SUMMARY.md
echo "" >> SUMMARY.md

# List all articles
for file in content/articles/*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    title=$(filename_to_title "$filename")
    echo "* [$title]($file)" >> SUMMARY.md
  fi
done

echo "" >> SUMMARY.md

# Add Guides section
echo "## Guides" >> SUMMARY.md
echo "" >> SUMMARY.md

# List all guides
for file in content/guides/*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    title=$(filename_to_title "$filename")
    echo "* [$title]($file)" >> SUMMARY.md
  fi
done

echo "" >> SUMMARY.md

# Add Convention section
echo "## Convention" >> SUMMARY.md
echo "" >> SUMMARY.md

# List all conventions
for file in content/convention/*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    title=$(filename_to_title "$filename")
    echo "* [$title]($file)" >> SUMMARY.md
  fi
done

echo "SUMMARY.md generated successfully"
