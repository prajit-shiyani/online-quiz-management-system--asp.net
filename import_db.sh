#!/bin/bash

echo "Importing database..."
docker exec -i quiz_db mysql -uquiz_user -pquiz_password onlinequiz < "DATA BASE/onlinequiz.sql"
echo "Database imported successfully!"
