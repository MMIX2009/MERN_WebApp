#!/bin/bash
echo "Creating 10 test records..."
echo "=========================="

# Array of test data
names=("Alice Johnson" "Bob Smith" "Carol Williams" "David Brown" "Emma Davis" "Frank Miller" "Grace Wilson" "Henry Moore" "Ivy Taylor" "Jack Anderson")
positions=("Frontend Developer" "Backend Developer" "Full Stack Developer" "DevOps Engineer" "UI/UX Designer" "Data Scientist" "Product Manager" "Software Architect" "QA Engineer" "Mobile Developer")
levels=("Junior" "Mid-level" "Senior" "Lead" "Junior" "Senior" "Mid-level" "Lead" "Junior" "Senior")

# Create 10 records
for i in {0..9}; do
    echo "Creating record $((i+1))/10: ${names[i]}"
    
    curl -X POST http://localhost:5050/record \
      -H "Content-Type: application/json" \
      -d "{
        \"name\": \"${names[i]}\",
        \"position\": \"${positions[i]}\",
        \"level\": \"${levels[i]}\"
      }" \
      -s -o /dev/null
    
    echo " ✓ Created"
done

echo ""
echo "=========================="
echo "All 10 records created!"
echo "Fetching all records to verify..."
echo ""

# Show all records
curl http://localhost:5050/record | jq '.'