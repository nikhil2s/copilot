#!/bin/bash

# Auto-commit and push with AI-generated message
echo "📦 Adding all changes..."
git add .

# Ask GitHub Copilot to suggest a commit message
echo "🤖 Generating commit message with Copilot..."
commit_message=$(gh copilot suggest commit 2>/dev/null | tail -n 1)

if [ -z "$commit_message" ]; then
  commit_message="Auto commit $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "📝 Commit message: $commit_message"
git commit -m "$commit_message"

echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ All done!"
