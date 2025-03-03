#!/bin/bash
echo "🚀 Running Functional Tests..."
ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Network Test Passed!"
else
    echo "❌ Network Test Failed!"
    exit 1
fi
