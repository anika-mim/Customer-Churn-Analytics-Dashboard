# Customer Churn Analytics Dashboard

## Project Summary

This project analyzes customer churn for a subscription-based business using Power BI. The goal was to understand why customers are leaving, how much revenue is being lost, and which active customers may need attention before they churn.

The dashboard covers churn trends, customer segments, subscription behavior, revenue loss, and risk levels. I built this project to practice a full Power BI workflow, including data cleaning, data modeling, DAX measures, dashboard design, and business recommendations.

The dataset is synthetic and was created for learning and portfolio purposes. It includes 1,500 customers and monthly revenue records up to December 31, 2025.

## Open the Completed Project

Open **`Customer_Churn_Analytics.pbip`** in Power BI Desktop.


## Business Problem

A subscription business is losing customers and recurring revenue. Management needs a clearer view of:

Which customer groups are more likely to churn
Which subscription or payment patterns are linked to churn
How much revenue has already been lost
Which active customers are currently high risk
What actions could help improve retention

## Dashboard Goal

The goal of this dashboard is to help management quickly understand churn performance and decide where to focus retention efforts.


## Headline KPIs

| KPI | Result |
|---|---:|
| Total Customers | 1,500 |
| Active Customers | 1,115 |
| Churned Customers | 385 |
| Churn Rate | 25.7% |
| Retention Rate | 74.3% |
| Annual Revenue Lost | $339,078 |
| High-Risk Active Customers | 125 |
| Annual Revenue at Risk | $105,230 |

## Dashboard Pages

1. **Executive Summary** - KPIs, churn trend, revenue trend, and customer status
2. **Customer Analysis** - age, gender, geography, tenure, and income
3. **Subscription Analysis** - contract, plan, charges, payment method, and autopay
4. **Churn Risk Analysis** - active customers by risk level and revenue exposure
5. **Recommendations** - management actions supported by dashboard findings
6. **Customer Details** - drill-through customer profile, risk drivers, and revenue history

## Key Insights

- Month-to-month customers have a 32.7% churn rate compared with 15.7% for two-year contracts.
- Electronic check customers have the highest payment-method churn rate at 37.2%.
- Customers without autopay churn at 32.0%, compared with 19.2% for autopay customers.
- Basic plan customers have a 31.9% churn rate, while Standard plan customers have the lowest plan churn at 21.0%.
- Customers with satisfaction scores of 1 or 2 churn at more than 52%.
- Customers making four or more support calls have a 40.1% churn rate.
- There are 125 active high-risk customers representing approximately $105,230 in annual revenue at risk.

## Recommendations

Based on the analysis, the business could focus on:

- Reaching out to high-risk active customers before they cancel
- Encouraging month-to-month customers to move to annual contracts
- Promoting autopay with a small incentive
- Reviewing electronic check payment issues
- Improving the onboarding experience for newer customers
- Escalating customers with low satisfaction or frequent support calls

## Tools Used

Power BI Desktop
Power Query
DAX
Data modeling
CSV data sources

## Skills Demonstrated
Data cleaning
Data modeling
DAX measure creation
KPI design
Dashboard development
Customer segmentation
Churn analysis
Revenue analysis
Business storytelling
Insight generation

## How to Use the Report

1. Open Customer_Churn_Analytics.pbip in Power BI Desktop.
2. Start from the Executive Summary page.
3. Use slicers such as geography, contract type, plan, gender, and risk category.
4. Go to the Churn Risk page to review high-risk active customers.
5. Use the Customer Details page for deeper customer-level analysis.
6. Review the Recommendations page for business actions.


## Project Structure

PowerBI project/
|-- data/
|-- docs/
|-- powerbi/
|-- previews/
|-- scripts/
|-- Customer_Churn_Analytics.pbip
|-- Customer_Churn_Analytics.Report/
|-- Customer_Churn_Analytics.SemanticModel/
`-- PROJECT_BUILD_CHECKLIST.md

## Tools and Skills Demonstrated

- Power BI Desktop
- Power Query
- Data cleaning and profiling
- Star-schema modeling
- DAX measures
- KPI design
- Drill-through, tooltips, slicers, and bookmarks
- Customer segmentation
- Business storytelling and recommendations
