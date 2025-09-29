#!/bin/bash

# Backup script for unpopular-science-book project
# Prevents data loss from git corruption or accidental deletions

PROJECT_DIR="/Users/dsilver/PythonTests/unpopular-science-book"
BACKUP_BASE="/Users/dsilver/PythonTests/unpopular-science-book-backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
DAILY_BACKUP="$BACKUP_BASE/daily/backup_$(date +%Y%m%d)"
TIMESTAMPED_BACKUP="$BACKUP_BASE/timestamped/backup_$TIMESTAMP"

# Create backup directories if they don't exist
mkdir -p "$BACKUP_BASE/daily"
mkdir -p "$BACKUP_BASE/timestamped"
mkdir -p "$BACKUP_BASE/git-bundles"

echo "🔐 Starting backup of unpopular-science-book..."

# 1. Create timestamped full backup (keeps last 10)
echo "📁 Creating timestamped backup..."
rsync -av --delete \
    --exclude='.git/objects' \
    --exclude='venv/' \
    --exclude='*.pdf' \
    --exclude='compile_pass*.log' \
    "$PROJECT_DIR/" "$TIMESTAMPED_BACKUP/"

# Keep only last 10 timestamped backups
cd "$BACKUP_BASE/timestamped" && ls -t | tail -n +11 | xargs -r rm -rf

# 2. Create/update daily backup (overwrites previous daily)
echo "📅 Updating daily backup..."
rsync -av --delete \
    --exclude='venv/' \
    --exclude='*.pdf' \
    --exclude='compile_pass*.log' \
    "$PROJECT_DIR/" "$DAILY_BACKUP/"

# 3. Create git bundle (complete repository backup)
echo "🎯 Creating git bundle..."
cd "$PROJECT_DIR"
git bundle create "$BACKUP_BASE/git-bundles/repo_$TIMESTAMP.bundle" --all
# Keep only last 5 git bundles
cd "$BACKUP_BASE/git-bundles" && ls -t *.bundle | tail -n +6 | xargs -r rm -f

# 4. Export current git state info
echo "📊 Exporting git state..."
cd "$PROJECT_DIR"
{
    echo "Backup created: $TIMESTAMP"
    echo "Current branch: $(git branch --show-current)"
    echo "Last commit: $(git log -1 --oneline)"
    echo "Git status:"
    git status --short
    echo -e "\nAll branches:"
    git branch -a
    echo -e "\nAll remotes:"
    git remote -v
} > "$BACKUP_BASE/git-state-$TIMESTAMP.txt"

# Keep only last 10 state files
cd "$BACKUP_BASE" && ls -t git-state-*.txt | tail -n +11 | xargs -r rm -f

echo "✅ Backup complete!"
echo "   - Timestamped: $TIMESTAMPED_BACKUP"
echo "   - Daily: $DAILY_BACKUP"
echo "   - Git bundle: $BACKUP_BASE/git-bundles/repo_$TIMESTAMP.bundle"

# Show backup sizes
echo -e "\n📊 Backup sizes:"
du -sh "$BACKUP_BASE"/*/ 2>/dev/null | tail -5
