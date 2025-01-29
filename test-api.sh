#!/bin/bash -xe

# Get the Minikube IP
MINIKUBE_IP=$(minikube ip)
BASE_URL="http://${MINIKUBE_IP}:30000"

echo "🔍 Testing API at ${BASE_URL}"

# Function to check response
check_response() {
    if [ $1 -eq $2 ]; then
        echo "✅ Test passed: $3"
    else
        echo "❌ Test failed: $3 (Expected: $2, Got: $1)"
        exit 1
    fi
}

echo -e "\n📡 Testing root endpoint..."
ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${BASE_URL}/)
check_response $ROOT_STATUS 200 "Root endpoint"

echo -e "\n📚 Creating a new book..."
CREATE_RESPONSE=$(curl -s -X POST ${BASE_URL}/api/books \
    -H "Content-Type: application/json" \
    -d '{
        "title": "The Hobbit",
        "author": "J.R.R. Tolkien",
        "isbn": "978-0547928227",
        "review": "An excellent adventure!",
        "rating": 5
    }')
BOOK_ID=$(echo $CREATE_RESPONSE | grep -o '"id":[0-9]*' | cut -d':' -f2)
check_response $? 0 "Book creation"

echo -e "\n📖 Getting all books..."
LIST_STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${BASE_URL}/api/books)
check_response $LIST_STATUS 200 "List books"

echo -e "\n🔍 Getting specific book..."
GET_STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${BASE_URL}/api/books/${BOOK_ID})
check_response $GET_STATUS 200 "Get book"

echo -e "\n✏️ Updating book..."
UPDATE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X PUT ${BASE_URL}/api/books/${BOOK_ID} \
    -H "Content-Type: application/json" \
    -d '{
        "review": "Even better on second reading!",
        "rating": 5
    }')
check_response $UPDATE_STATUS 200 "Update book"

echo -e "\n🗑️ Deleting book..."
DELETE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE ${BASE_URL}/api/books/${BOOK_ID})
check_response $DELETE_STATUS 204 "Delete book"

echo -e "\n✨ All tests passed successfully!" 