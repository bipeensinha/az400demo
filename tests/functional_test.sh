#!/bin/bash
echo "🚀 Running Functional Tests..."
curl -Is https://www.google.com | head -n 1
if [ $? -eq 0 ]; then
    echo "✅ Network Test Passed!"
else
    echo "❌ Network Test Failed!"
    exit 1
fi
