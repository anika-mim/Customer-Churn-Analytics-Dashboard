# Phase 7: Dashboard Development

| Item | Definition |
|---|---|
| Business objective | Present churn, revenue, customer segments, and retention priorities to senior management |
| Analysis approach | Use five focused pages with consistent KPIs, slicers, colors, and interactions |
| Business value | Turns analysis into a clear decision-making tool |
| Expected insight | Users can move from the overall problem to the affected segment, customer risk, and recommended action |

## Design Rules

- Canvas: 16:9
- Background: very light gray or off-white
- Primary color: dark navy
- Secondary color: blue
- Churn and risk color: muted red
- Retention color: green
- Use no more than five KPI cards on one row
- Use short titles that state the business question
- Keep visual backgrounds white with light borders
- Use the same slicers across pages

Import `powerbi/Customer_Churn_Theme.json` before formatting the report.

## Report-Level Slicers

- Date
- Geography
- Contract Type
- Subscription Plan
- Customer Status

Synchronize the first four slicers across pages 1 to 4. Customer Status is optional on the Executive and Customer pages and should not be used on the active-only risk page.

## Page 1: Executive Summary

### Objective

Show the size of the churn problem, its financial impact, and recent direction.

### KPI Cards

- Total Customers
- Churn Rate
- Retention Rate
- Revenue Lost
- Revenue at Risk

### Visuals

| Visual | Fields | Expected Insight |
|---|---|---|
| Line chart | Date[Year Month], Monthly Churn Rate | Whether churn is improving or worsening |
| Line or area chart | Date[Year Month], Total Revenue | Revenue movement over time |
| Donut chart | Customer Status, Total Customers | Active versus churned customer mix |
| Bar chart | Contract Type, Churn Rate | Fast view of the highest-risk contract |
| Smart narrative or text box | Key findings | Management summary |

Use a Reset Filters bookmark in the top-right corner.

## Page 2: Customer Analysis

### Objective

Identify demographic and lifecycle groups with high churn or high customer value.

### Visuals

| Visual | Fields | Business Question |
|---|---|---|
| Clustered bar | Age Group, Churn Rate | Which age groups churn most? |
| 100% stacked bar | Gender, Customer Status, Total Customers | Is churn materially different by gender? |
| Filled map or bar chart | Geography, Churn Rate | Which regions have the highest churn? |
| Column chart | Tenure Band, Churn Rate | When in the lifecycle does churn occur? |
| Combo chart | Income Level, Churn Rate, Total Revenue | Which income groups churn and generate revenue? |

Add a tooltip containing Total Customers, Churn Rate, Total Revenue, and Average Customer Value.

## Page 3: Subscription Analysis

### Objective

Identify contract, plan, billing, and payment choices associated with churn.

### Visuals

| Visual | Fields | Business Question |
|---|---|---|
| Bar chart | Contract Type, Churn Rate | Which contracts have the highest churn? |
| Matrix | Subscription Plan, Total Customers, Churn Rate, Total Revenue | Which plans combine risk and value? |
| Column chart | Monthly Charge Band, Churn Rate | Does churn vary by monthly charge? |
| Bar chart | Payment Method, Churn Rate | Which payment methods have the highest churn? |
| Clustered bar | AutoPay, Churn Rate | Does autopay relate to retention? |

Use conditional formatting on the matrix:

- Red for high churn
- Green for high revenue
- Data bars for customer count

## Page 4: Churn Risk Analysis

### Objective

Give customer success a prioritized list of active customers for outreach.

### KPI Cards

- At-Risk Customers
- Revenue at Risk
- High-Risk Customer Rate
- Average Monthly Revenue per Customer

### Visuals

| Visual | Fields | Expected Insight |
|---|---|---|
| Donut or bar | Risk Category, Total Customers | Size of each active risk group |
| Bar chart | Risk Category, Annual Active Revenue | Financial exposure by risk level |
| Scatter plot | Monthly Charges, Risk Score, size by Total Revenue, legend by Plan | High-value and high-risk customers |
| Customer table | CustomerID, Risk Score, Monthly Charges, Contract, Plan, Support Calls, Satisfaction | Outreach priority list |

Apply a page filter: `CustomerStatus = Active`.

Use conditional formatting:

- Risk Score 70 or above: red
- Risk Score 40 to 69: amber
- Risk Score below 40: green

### Drill Through

Create a hidden Customer Details page with `CustomerID` as the drill-through field. Show:

- Customer profile
- Contract and payment details
- Satisfaction and support history
- Revenue history line chart
- Risk drivers

## Page 5: Recommendations

### Objective

Convert findings into a short management action plan.

Use five recommendation cards:

1. **Protect high-risk revenue** - prioritize the 125 active high-risk customers.
2. **Reduce early-life churn** - improve onboarding and first-year engagement.
3. **Promote contract upgrades** - offer annual-contract incentives to suitable month-to-month customers.
4. **Improve billing experience** - promote autopay and review electronic-check friction.
5. **Trigger service recovery** - contact customers with low satisfaction or four or more support calls.

Add an Impact and Effort label to each recommendation:

- High impact, medium effort
- Medium impact, low effort
- High impact, high effort

## Required Power BI Features

| Feature | Use in This Project |
|---|---|
| Power Query | Cleaning, data types, segmentation, and risk logic |
| Data model | Date, Customers, and Monthly Revenue relationships |
| DAX | All KPIs and time-based measures |
| KPI cards | Executive and risk pages |
| Slicers | Date, geography, contract, and plan |
| Drill through | Customer Details page |
| Tooltips | Segment-level churn and revenue context |
| Bookmarks | Reset Filters and optional navigation |
| Conditional formatting | Risk table and subscription matrix |
| Interactive visuals | Cross-filtering between segments and KPIs |

## Final Quality Standard

The report should be understandable in under one minute:

1. What is happening?
2. Where is churn concentrated?
3. How much money is affected?
4. Who should the company contact?
5. What should management do next?
