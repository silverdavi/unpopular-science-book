# 🛡️ Backup System for Unpopular Science Book

This project has multiple layers of backup protection to prevent data loss from git corruption or accidental deletions.

## 🚀 Quick Start

1. **Run initial backup:**
   ```bash
   ./backup_project.sh
   ```

2. **Set up secondary remote (recommended):**
   ```bash
   ./setup_secondary_remote.sh
   ```

## 📁 Backup Components

### 1. **Automatic Git Hook Backups**
- Location: `.git/hooks/post-commit`
- Triggers: After every commit
- Creates: Timestamped backups automatically

### 2. **Manual Backup Script**
- Script: `backup_project.sh`
- Creates:
  - Daily backup (overwrites previous daily)
  - Timestamped backups (keeps last 10)
  - Git bundles (complete repo snapshots, keeps last 5)
  - Git state files (branch/commit info)

### 3. **VSCode/Cursor Auto-Save**
- Settings: `.vscode/settings.json`
- Features:
  - Auto-save after 1 second
  - Local history (last 50 versions per file)
  - Git operation confirmations

### 4. **Recovery Tools**
- Script: `recover_from_backup.sh`
- Options:
  - Restore from daily backup
  - Restore from timestamped backup
  - Restore from git bundle
  - Cherry-pick specific files
  - View git state history

## 📍 Backup Locations

```
/Users/dsilver/PythonTests/unpopular-science-book-backups/
├── daily/                  # Latest daily backup
├── timestamped/            # Last 10 timestamped backups  
├── git-bundles/            # Last 5 complete repo bundles
└── git-state-*.txt         # Git status snapshots
```

## 🔧 Common Tasks

### Run Manual Backup
```bash
./backup_project.sh
```

### Recover from Corruption
```bash
./recover_from_backup.sh
# Follow the interactive menu
```

### Push to All Remotes
```bash
git push origin && git push backup
# Or if you set up the alias:
git pushall
```

### Check Backup Status
```bash
ls -la /Users/dsilver/PythonTests/unpopular-science-book-backups/
```

### Set Up Automated Backups (Cron)
```bash
# Add to crontab for hourly backups:
crontab -e
# Add line:
0 * * * * /Users/dsilver/PythonTests/unpopular-science-book/backup_project.sh
```

## ⚠️ Important Notes

1. **Git bundles** can recreate the entire repository including all branches and history
2. **Daily backups** include the .git directory for complete restoration
3. **VSCode Local History** provides additional per-file versioning
4. **Always test recovery** procedures before you need them

## 🚨 Emergency Recovery

If git becomes corrupted:

1. **DON'T PANIC** - Your work is backed up
2. **DON'T USE `git reset --hard`** or force operations
3. Run `./recover_from_backup.sh` and follow prompts
4. If needed, check Time Machine: `tmutil listbackups`

## 🔐 Best Practices

1. Run `./backup_project.sh` before major changes
2. Commit frequently (triggers auto-backup)
3. Push to both remotes regularly
4. Verify backups weekly
5. Keep this file updated with any changes

---

*Last updated: Setup completed on [DATE]*
