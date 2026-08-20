
## 🚀 Quick Start

1. Import `Database/fraudnet_db_backup_YYYY-MM-DD.sql` into MySQL Workbench
2. Run: `USE fraudnet_db;`
3. Run detection: `CALL run_all_fraud_detection();`
4. View alerts: `SELECT * FROM suspicious_transaction;`
5. Export reports to CSV

## 📊 Key Queries

```sql
-- Run all fraud detection
CALL run_all_fraud_detection();

-- View all alerts
SELECT * FROM suspicious_transaction ORDER BY detected_at DESC;

-- View risk scores
SELECT * FROM risk_score ORDER BY total_score DESC;

-- High-risk accounts
SELECT * FROM risk_score WHERE risk_level IN ('HIGH','VERY HIGH','CRITICAL');
```

## 🛠️ Technologies

- MySQL 8.0
- MySQL Workbench
- SQL (Window Functions, CTEs, Stored Procedures)

## 📈 Detection Rules

| Rule | Description | Risk Points |
|------|-------------|-------------|
| RAPID_TRANSACTION | Multiple transactions <10 min | 15 |
| LARGE_TRANSACTION | Amount >5x account average | 20 |
| SHARED_DEVICE | Device used by multiple customers | 10 |
| CIRCULAR_TRANSFER | Money returns to origin | 25 |

## 📋 Risk Levels

| Level | Score Range | Action |
|-------|-------------|--------|
| LOW | 0-20 | Monitor |
| MODERATE | 21-40 | Review |
| HIGH | 41-60 | Investigate |
| VERY HIGH | 61-80 | Block Account |
| CRITICAL | 81-100 | Immediate Action |

## 📄 Reports

Daily CSV exports include:
- `suspicious_transactions.csv` - All fraud alerts
- `risk_scores.csv` - Account risk levels
- `daily_summary.csv` - Transaction summary
- `high_risk_accounts.csv` - Accounts needing attention

## 👤 Author

-  Name : Deepika Bontha
- Email: deepikareddy850@gmail.com
- LinkedIn: https://www.linkedin.com/in/bontha-deepika-536630287

## 📅 Project Date

August 2026

## 📝 License

This project is open source and available for educational purposes.