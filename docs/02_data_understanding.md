# Phase 2: Data Understanding

| Item | Definition |
|---|---|
| Business objective | Understand the available customer, subscription, experience, risk, and revenue data |
| Analysis approach | Review grain, keys, fields, data types, and analytical roles |
| Business value | Prevents incorrect measures and ensures that each visual answers a valid question |
| Expected insight | Customer attributes explain who churns, while monthly revenue records support time-based financial analysis |

## Dataset Structure

### Customers

- **Grain:** one row per customer
- **Primary key:** `CustomerID`
- **Rows:** 1,500
- **Main use:** customer counts, churn status, segmentation, churn reasons, and risk analysis

### Monthly Revenue

- **Grain:** one row per customer per active month
- **Composite key:** `MonthStart` and `CustomerID`
- **Rows:** 33,181
- **Main use:** revenue trends and customer value calculations

### Data Date

The synthetic data is current through **December 31, 2025**.

## Key Dimensions

Dimensions describe the customer and provide categories used to slice measures:

- Date
- Customer
- Customer status
- Age group
- Gender
- Geography
- Income level
- Tenure band
- Contract type
- Subscription plan
- Payment method
- Autopay status
- Satisfaction score
- Risk category
- Churn reason

## Key Measures

Measures are numeric values aggregated in the report:

- Customer count
- Churned customer count
- Churn rate
- Retention rate
- Monthly revenue
- Historical customer revenue
- Annual revenue lost
- Average customer value
- Customer lifetime value estimate
- Annual revenue at risk

## Important Fields

| Field | Business Meaning |
|---|---|
| CustomerID | Unique identifier used to count and relate customers |
| JoinDate | Start of the customer relationship |
| ChurnDate | Date service ended; blank for active customers |
| CustomerStatus | Current Active or Churned outcome |
| TenureMonths | Length of the customer relationship |
| MonthlyCharges | Current recurring monthly amount |
| TotalRevenue | Historical customer revenue through the analysis date |
| SupportCalls | Recent service-support demand |
| LatePayments | Recent billing behavior |
| SatisfactionScore | Customer experience rating from 1 to 5 |
| RiskScore | Rule-based risk score from 0 to 100 |
| RiskCategory | Low, Medium, High, or Churned |
| ChurnReason | Main reason recorded for a churned customer |
| MonthStart | Revenue reporting month |
| MonthlyRevenue | Revenue recognized for one customer-month |

The full field-level definition is available in `data/Data_Dictionary.csv` and the Data Dictionary sheet in `data/Customer_Churn_Data_Package.xlsx`.

## Data Limitations

- The dataset is synthetic and does not represent a real company.
- The risk score is rule based and should not be described as a predictive model.
- Revenue Lost and Revenue at Risk are annualized estimates based on monthly charges.
- Demographic patterns should be used for descriptive analysis, not discriminatory decision-making.
- Rising churn counts may partly reflect changes in the number of customers. Monthly churn rate is the better time comparison.

