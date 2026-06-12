# Phase 3: Data Cleaning

| Item | Definition |
|---|---|
| Business objective | Create accurate and analysis-ready customer and revenue tables |
| Analysis approach | Validate keys, remove duplicates, standardize values, set data types, and test business rules |
| Business value | Prevents incorrect churn rates, inflated revenue, and misleading customer counts |
| Expected insight | Most blanks in ChurnDate and ChurnReason are valid business blanks for active customers |

## Cleaning Rules

### Customers

1. Set `CustomerID` to text.
2. Set `JoinDate`, `ChurnDate`, and `LastActivityDate` to date.
3. Set counts and scores to whole numbers.
4. Set `MonthlyCharges` and `TotalRevenue` to decimal currency values.
5. Trim and clean all text fields.
6. Standardize status, contract, plan, payment, and yes/no labels.
7. Remove duplicate `CustomerID` values.
8. Confirm `ChurnDate` is blank only for active customers.
9. Confirm churned customers have a churn reason.
10. Confirm scores and charges are within reasonable ranges.

### Monthly Revenue

1. Set `MonthStart` to date.
2. Set `CustomerID` to text.
3. Set `MonthlyRevenue` to decimal currency.
4. Remove duplicate combinations of `MonthStart` and `CustomerID`.
5. Remove rows with missing customer IDs or dates.
6. Remove negative revenue values.
7. Confirm every revenue CustomerID exists in Customers.

## Missing Values

| Field | Treatment |
|---|---|
| ChurnDate | Keep null for active customers |
| ChurnReason | Keep null for active customers; replace missing churned reasons with Other |
| Other required fields | Remove or investigate the row |

Do not replace a valid missing churn date with a false date such as January 1, 1900. That would incorrectly identify active customers as churned.

## Duplicate Rules

- Customers must contain exactly one row per `CustomerID`.
- Monthly Revenue must contain one row per `CustomerID` and `MonthStart`.
- Customer counts must always use `DISTINCTCOUNT(CustomerID)`.

## Data Quality Assessment

| Test | Expected Result |
|---|---|
| Customer rows | 1,500 |
| Distinct CustomerID | 1,500 |
| Revenue rows | 33,181 |
| Customer duplicate keys | 0 |
| Revenue duplicate composite keys | 0 |
| ChurnDate for active customers | blank |
| Churn reason for churned customers | populated |
| Monthly revenue below zero | 0 rows |
| Satisfaction score range | 1 to 5 |
| Risk score range | 0 to 100 |

## Final Validation Totals

- Active customers: 1,115
- Churned customers: 385
- Churn rate: 25.7%
- Retention rate: 74.3%

These values are the main reconciliation targets after Power Query and modeling.

