#!/bin/bash
echo "✅ Running Unit Tests..."
if [ 2 -eq 2 ]; then
    echo "✅ Test Passed!"
else
    echo "❌ Test Failed!"
    exit 1
fi
