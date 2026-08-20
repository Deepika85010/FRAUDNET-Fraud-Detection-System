FRAUDNET - MySQL Fraud Detection System
========================================

PROJECT OVERVIEW:
This is a complete fraud detection system built in MySQL Workbench.
It detects suspicious transactions, calculates risk scores, and generates daily reports.

HOW TO RUN THE SYSTEM:
1. Open MySQL Workbench
2. Connect to your database
3. Run: USE fraudnet_db;
4. Run detection: CALL run_all_fraud_detection();
5. View alerts: SELECT * FROM suspicious_transaction ORDER BY detected_at DESC;
6. View risk scores: SELECT * FROM risk_score ORDER BY total_score DESC;
7. Export reports to CSV for sharing

KEY FILES:
- Database folder: Contains database backup (fraudnet_db_backup.sql)
- Reports folder: Contains daily CSV reports
- Documentation folder: Contains this README and project summary

FOLDER STRUCTURE:
FRAUDNET_Project/
├── Database/          (database backups)
├── Reports/           (CSV export files)
├── Documentation/     (project documents)
└── Screenshots/       (query results screenshots)

IMPORTANT QUERIES:

1. Run All Fraud Detection:
CALL run_all_fraud_detection();

2. View All Alerts:
SELECT * FROM suspicious_transaction ORDER BY detected_at DESC;

3. View Risk Scores:
SELECT * FROM risk_score ORDER BY total_score DESC;

4. Daily Summary:
SELECT DATE(transaction_time) AS date, COUNT(*) AS total, SUM(amount) AS value
FROM financial_transaction
GROUP BY DATE(transaction_time);

5. High-Risk Accounts:
SELECT * FROM risk_score WHERE risk_level IN ('HIGH','VERY HIGH','CRITICAL')
ORDER BY total_score DESC;

DAILY WORKFLOW:
1. Open MySQL Workbench
2. Run: CALL run_all_fraud_detection();
3. Export suspicious_transactions.csv
4. Export risk_scores.csv
5. Review and share with team

TECHNOLOGY:
- Database: MySQL 8.0
- Tool: MySQL Workbench
- Features: Window functions, stored procedures, foreign keys, check constraints

CONTACT:
Deepika Bontha
deepikareddy850@gmail.com
Date: 2026-08-18]