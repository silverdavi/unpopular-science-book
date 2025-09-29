#!/bin/bash

# Script to set up a secondary git remote for redundancy
# This provides an additional backup in case primary remote fails

echo "🔗 Setting up secondary git remote for redundancy..."

# Common git hosting services - uncomment and modify the one you want to use

# Option 1: GitLab (free private repos)
# git remote add gitlab git@gitlab.com:silverdavi/unpopular-science-book.git

# Option 2: Bitbucket 
# git remote add bitbucket git@bitbucket.org:silverdavi/unpopular-science-book.git

# Option 3: Local bare repository (on external drive or different directory)
SECONDARY_REPO="/Users/dsilver/Backups/git-repos/unpopular-science-book.git"
if [ ! -d "$SECONDARY_REPO" ]; then
    echo "Creating local bare repository at $SECONDARY_REPO..."
    mkdir -p "$(dirname "$SECONDARY_REPO")"
    git init --bare "$SECONDARY_REPO"
fi
git remote add backup "file://$SECONDARY_REPO"

# Option 4: Another GitHub repo as backup
# git remote add github-backup git@github.com:silverdavi/unpopular-science-book-backup.git

echo "Current remotes:"
git remote -v

echo -e "\n📌 To push to all remotes at once, use:"
echo "   git push origin && git push backup"

echo -e "\n📌 Or create an alias to push to all remotes:"
echo "   git config alias.pushall '!git push origin && git push backup'"
