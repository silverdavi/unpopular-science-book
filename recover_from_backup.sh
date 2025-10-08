#!/bin/bash

# Emergency recovery script for when git gets corrupted
# This helps restore your work from various backup sources

echo "🚨 Git Recovery Tool 🚨"
echo "======================"
echo "This script helps recover from git corruption or data loss"
echo ""

# List available backups
BACKUP_BASE="/Users/dsilver/PythonTests/unpopular-science-book-backups"

echo "📁 Available backups:"
echo ""
echo "1. Daily backups:"
ls -la "$BACKUP_BASE/daily/" 2>/dev/null | grep "backup_" | awk '{print "   - " $9 " (modified: " $6 " " $7 " " $8 ")"}'

echo -e "\n2. Timestamped backups:"
ls -la "$BACKUP_BASE/timestamped/" 2>/dev/null | grep "backup_" | head -5 | awk '{print "   - " $9}'

echo -e "\n3. Git bundles:"
ls -la "$BACKUP_BASE/git-bundles/" 2>/dev/null | grep ".bundle" | head -5 | awk '{print "   - " $9 " (" $5 " bytes)"}'

echo -e "\n4. VSCode Local History:"
echo "   Check: .vscode/History/ (if using VSCode/Cursor)"

echo -e "\n🔧 Recovery Options:"
echo "--------------------"
echo "1. Restore from daily backup (safest, may lose today's work)"
echo "2. Restore from timestamped backup"
echo "3. Restore from git bundle"
echo "4. Cherry-pick from backup (selective recovery)"
echo "5. View git state history"
echo "6. Exit"

read -p "Choose option (1-6): " choice

case $choice in
    1)
        echo "Restoring from daily backup..."
        read -p "⚠️  This will replace current directory. Are you sure? (yes/no): " confirm
        if [ "$confirm" = "yes" ]; then
            # Create safety backup first
            mv .git .git.corrupted.$(date +%Y%m%d_%H%M%S) 2>/dev/null
            rsync -av --delete "$BACKUP_BASE/daily/backup_$(date +%Y%m%d)/" ./ 
            echo "✅ Restored from daily backup"
        fi
        ;;
    
    2)
        echo "Available timestamped backups:"
        ls -1 "$BACKUP_BASE/timestamped/" | head -10
        read -p "Enter backup name to restore: " backup_name
        if [ -d "$BACKUP_BASE/timestamped/$backup_name" ]; then
            read -p "⚠️  This will replace current directory. Are you sure? (yes/no): " confirm
            if [ "$confirm" = "yes" ]; then
                mv .git .git.corrupted.$(date +%Y%m%d_%H%M%S) 2>/dev/null
                rsync -av --delete "$BACKUP_BASE/timestamped/$backup_name/" ./
                echo "✅ Restored from $backup_name"
            fi
        else
            echo "❌ Backup not found"
        fi
        ;;
    
    3)
        echo "Available git bundles:"
        ls -1 "$BACKUP_BASE/git-bundles/" | grep ".bundle" | head -10
        read -p "Enter bundle name: " bundle_name
        if [ -f "$BACKUP_BASE/git-bundles/$bundle_name" ]; then
            # Clone from bundle
            temp_dir="/tmp/git_recovery_$(date +%Y%m%d_%H%M%S)"
            git clone "$BACKUP_BASE/git-bundles/$bundle_name" "$temp_dir"
            echo "✅ Cloned from bundle to: $temp_dir"
            echo "   You can now copy files from there or replace .git directory"
        else
            echo "❌ Bundle not found"
        fi
        ;;
    
    4)
        echo "🔍 Cherry-pick recovery (browse backup to selectively restore files)"
        echo "Opening backup directory in new terminal..."
        open "$BACKUP_BASE"
        echo "Use 'cp' or 'rsync' to selectively restore files you need"
        ;;
    
    5)
        echo "📊 Recent git states:"
        ls -1t "$BACKUP_BASE"/git-state-*.txt | head -5 | while read state_file; do
            echo -e "\n--- $state_file ---"
            head -10 "$state_file"
            echo "..."
        done
        ;;
    
    6)
        echo "Exiting..."
        exit 0
        ;;
esac

echo -e "\n💡 Additional recovery tips:"
echo "- Check Time Machine if enabled: tmutil listbackups"
echo "- Look for .git.corrupted.* directories (previous corruption backups)"
echo "- Check reflog if git still works: git reflog"
echo "- Use 'git fsck' to check repository integrity"
