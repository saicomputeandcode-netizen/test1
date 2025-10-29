#!/bin/bash
#
# This script is executed by Cloud Build. 
# It demonstrates accessing automatically provided environment variables
# like commit SHA and branch name, which are crucial for tagging images or logging.

set -e # Exit immediately if a command exits with a non-zero status

echo "--- Starting Custom Build Script ---"

# Cloud Build automatically injects substitution variables from the trigger event:
echo "Build initiated by Cloud Build Trigger: $TRIGGER_NAME"
echo "Source Repository: $REPO_NAME"
echo "Commit SHA: $COMMIT_SHA"
echo "Branch Name: $BRANCH_NAME"
echo "Project ID: $PROJECT_ID"

# --- Simulate Core Build Steps ---

# 1. Install dependencies (e.g., using npm, maven, or pip)
echo "Installing dependencies... (simulated)"
sleep 1 

# 2. Run tests
echo "Running unit and integration tests... (simulated)"
# A real test command might look like: npm test or go test ./...
sleep 2

# Check if tests were successful (simulated success)
if [ $? -eq 0 ]; then
  echo "✅ Tests completed successfully."
else
  echo "❌ Tests failed. Halting build."
  exit 1
fi

# 3. Create a placeholder artifact to show data persistence
mkdir -p build_output
echo "Build complete for branch $BRANCH_NAME (Commit: $COMMIT_SHA)" > build_output/info.txt
echo "Artifact info.txt created."

echo "--- Custom Build Script Finished Successfully ---"
