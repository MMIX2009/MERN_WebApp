#!/bin/bash
echo "Getting all record IDs..."

# Get all records and delete them automatically
curl -s http://localhost:5050/record | jq -r '.[]._id' | while read id; do
    if [ "$id" != "null" ] && [ -n "$id" ]; then
        echo "Deleting record: $id"
        curl -X DELETE http://localhost:5050/record/$id
        echo ""
    fi
done

echo "All records deleted!"