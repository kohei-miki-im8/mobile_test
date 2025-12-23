#!/bin/bash
# Generate .env file for CI builds with dummy values
# This script extracts all environment variable names from env.dart and creates a .env file

ENV_FILE="${1:-.env}"
DUMMY_VALUE="dummy_ci_value"

echo "# Auto-generated .env file for CI builds" > "$ENV_FILE"
echo "# Generated at $(date)" >> "$ENV_FILE"
echo "" >> "$ENV_FILE"

# Extract all varName values from env.dart
grep -oP "varName: '\\K[^']+(?=')" lib/presentations/env.dart | while read -r var_name; do
    echo "${var_name}=${DUMMY_VALUE}" >> "$ENV_FILE"
done

echo "Generated $ENV_FILE with $(grep -c '=' "$ENV_FILE") environment variables"

