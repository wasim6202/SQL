# backup_postgres.sh

#!/bin/bash

# Set your PostgreSQL credentials
DB_NAME="employee_db"
BACKUP_FILE="employee_db_backup_$(date +%Y%m%d).sql"

# Run backup
pg_dump -U postgres -F p -d $DB_NAME > $BACKUP_FILE

echo "Backup completed: $BACKUP_FILE"
# restore_postgres.sh

#!/bin/bash

# Set your PostgreSQL credentials
DB_NAME="employee_db_restored"
BACKUP_FILE="employee_db_backup_20250620.sql"  # replace with actual filename

# Create the new database
createdb -U postgres $DB_NAME

# Restore from backup
psql -U postgres -d $DB_NAME -f $BACKUP_FILE

echo "Restore completed into database: $DB_NAME"
# Database Backup and Recovery Report (Task 4)

## Objective
To demonstrate how to perform a backup and restore of a PostgreSQL (or MySQL) database.

---

## Step-by-Step Process

### 🛡️ Backup Process (PostgreSQL)

1. Use the `pg_dump` tool to export the entire database.
2. Command: 
   ```bash
   pg_dump -U postgres -F p -d employee_db > employee_db_backup.sql
