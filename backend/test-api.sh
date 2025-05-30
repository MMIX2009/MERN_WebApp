#!/bin/bash
echo "Creating test records..."
curl -X POST http://localhost:5050/record -H "Content-Type: application/json" -d '{"name": "Test User", "position": "Tester", "level": "Senior"}'

echo -e "\n\nGetting all records..."
curl http://localhost:5050/record | jq

echo -e "\n\nDone!"