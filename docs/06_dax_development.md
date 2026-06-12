# Phase 6: DAX Development

| Item | Definition |
|---|---|
| Business objective | Convert the model into reusable business KPIs |
| Analysis approach | Create explicit measures for customer counts, churn, retention, value, trends, and risk |
| Business value | Ensures every dashboard page uses consistent definitions |
| Expected insight | Management can compare customer loss and financial exposure across any selected segment |

The complete code is in `powerbi/Measures.dax`.

## Required Measures

### Total Customers

Counts unique customers. `DISTINCTCOUNT` protects the KPI from duplicate rows and fact-table expansion.

### Active Customers

Filters Total Customers to the Active status. This represents the current retained base.

### Churned Customers

Filters Total Customers to the Churned status. This represents customers who have left.

### Churn Rate

Divides Churned Customers by Total Customers. This is the main portfolio-level churn KPI.

### Retention Rate

Divides Active Customers by Total Customers. In this snapshot model it is also `1 - Churn Rate`.

### Revenue Lost

Annualizes the monthly charges of churned customers. It estimates recurring revenue no longer retained:

`Monthly Charges x 12`

### Average Customer Value

Divides historical revenue by total customers. It shows realized revenue per customer in the selected context.

### Customer Lifetime Value

Multiplies average monthly revenue per customer by average customer tenure. This is a simple and explainable portfolio estimate.

### Monthly Churn Rate

Divides customers who churned during the selected month by customers active at the start of that month. This is better for trend analysis than monthly churn counts alone.

### Revenue at Risk

Annualizes monthly charges for active High Risk customers. It gives management a financial priority for retention.

## Supporting Measures

The DAX file also includes:

- Total Revenue
- Monthly Recurring Revenue
- Average Monthly Revenue per Customer
- Average Customer Tenure
- Monthly Churned Customers
- At-Risk Customers
- High-Risk Customer Rate
- Annual Active Revenue
- Revenue Lost by Churn Month

## Formatting

| Measure Type | Format |
|---|---|
| Customer counts | Whole number with thousand separator |
| Rates | Percentage with one decimal |
| Revenue and value | Currency with no decimals on cards |
| Average tenure | One decimal |

## Validation

After creating the measures, confirm:

- Total Customers = 1,500
- Active Customers = 1,115
- Churned Customers = 385
- Churn Rate = 25.7%
- Retention Rate = 74.3%
- Revenue Lost = approximately $339,078
- Revenue at Risk = approximately $105,230
