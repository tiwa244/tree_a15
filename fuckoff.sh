#!/bin/bash
# Test if setup_vendor is available

# Hardcode path to extract_utils.sh
HELPER="/home/thiwa21062016/android_tools_extract-utils/extract_utils.sh"

# Source it
source "$HELPER"

# Test if setup_vendor exists
if command -v setup_vendor >/dev/null 2>&1; then
    echo "✅ setup_vendor is loaded!"
else
    echo "❌ setup_vendor NOT found!"
fi

