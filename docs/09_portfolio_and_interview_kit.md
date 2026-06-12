# Portfolio and Interview Kit

## Resume Bullet Points

- Built a five-page Power BI Customer Churn Analytics Dashboard using Power Query, star-schema modeling, and DAX to analyze 1,500 customers and 33,181 monthly revenue records.
- Developed churn, retention, customer value, monthly churn, revenue lost, and revenue-at-risk KPIs, identifying a 25.7% churn rate and approximately $105K in annual revenue at risk.
- Segmented customers by contract, plan, tenure, payment method, satisfaction, and risk level to support targeted retention recommendations.
- Added interactive slicers, drill-through, tooltips, bookmarks, and conditional formatting to create an executive-friendly BI experience.

Use the best two or three bullets based on the available space.

## LinkedIn Project Description

I built a Customer Churn Analytics Dashboard in Power BI to understand which customers are leaving, the behaviors associated with churn, and the revenue impact of customer loss.

The project uses a synthetic subscription dataset with 1,500 customers and more than 33,000 monthly revenue records. I completed the full BI workflow: business understanding, Power Query cleaning, data modeling, DAX measures, customer segmentation, dashboard design, and executive recommendations.

Key findings included higher churn among month-to-month customers, electronic-check users, customers without autopay, low-satisfaction customers, and customers with repeated support calls. I also created a transparent churn-risk score to identify 125 active high-risk customers representing approximately $105K in annual revenue at risk.

Skills demonstrated: Power BI, Power Query, DAX, data modeling, KPI design, customer segmentation, data visualization, and business storytelling.

## Interview Questions and Suggested Answers

### 1. What business problem did this project solve?

The project helped a subscription company understand who was churning, which behaviors were associated with churn, how much recurring revenue was affected, and which active customers should be prioritized for retention.

### 2. Why did you use two data tables?

Customers has one row per customer and supports segmentation and churn counts. Monthly Revenue has one row per customer-month and supports revenue trends. Separating them avoids repeating customer attributes for every month.

### 3. Why did you create a Date table?

A dedicated Date table provides consistent year, quarter, and month filtering and supports time-based DAX. It also lets me use an inactive relationship to ChurnDate for churn trends.

### 4. How did you calculate churn rate?

For the overall snapshot, I divided distinct churned customers by distinct total customers. For the monthly trend, I divided customers who churned during the month by customers active at the start of the month.

### 5. Why did you use DISTINCTCOUNT?

CustomerID appears many times in the monthly revenue table. DISTINCTCOUNT prevents customers from being counted multiple times when the fact table is involved in the filter context.

### 6. How did you calculate revenue lost?

I annualized the MonthlyCharges of churned customers by multiplying each customer's monthly amount by 12. I clearly labeled it as an annual recurring revenue estimate.

### 7. How did you identify at-risk customers?

I created a transparent rule-based score using contract type, plan, payment behavior, support calls, satisfaction, charges, and tenure. Scores of 70 or more are High Risk.

### 8. Is the risk score a predictive model?

No. It is an explainable business-rule score for prioritization. I would need historical training data, validation, and model-performance metrics before describing it as predictive.

### 9. What was the most important finding?

Churn was concentrated in actionable behaviors. Month-to-month, electronic-check, non-autopay, low-satisfaction, and high-support-call customers had meaningfully higher churn.

### 10. What recommendation would you implement first?

I would contact active high-risk customers because the dashboard identifies 125 customers representing about $105K in annual revenue at risk. This is a targeted and measurable first action.

### 11. How did you validate the report?

I reconciled customer counts and financial KPIs against the source profile, tested duplicate keys and missing values, checked relationship cardinality, and verified slicer, drill-through, and tooltip behavior.

### 12. What would you improve with real company data?

I would add product usage, complaint history, marketing interactions, service outages, retention-offer outcomes, and true profit margin. I would also build and validate a predictive churn model.

## STAR Method Response 1: Building the Dashboard

**Situation:** A subscription company needed a clear view of customer churn and revenue impact.

**Task:** I needed to create an executive-friendly Power BI report that explained who was leaving, why churn was happening, and which active customers were at risk.

**Action:** I cleaned and profiled the data in Power Query, built a three-table model, created DAX measures for churn and revenue, segmented customers, and designed five report pages with slicers, drill-through, tooltips, and conditional formatting.

**Result:** The dashboard identified a 25.7% churn rate, approximately $339K in annual revenue lost, and 125 high-risk active customers representing about $105K in annual revenue at risk.

## STAR Method Response 2: Solving a Data Quality Problem

**Situation:** Customer-level and monthly revenue data had different levels of detail, which could inflate customer counts.

**Task:** I needed to ensure churn and retention measures remained accurate when revenue data was added.

**Action:** I separated the data into a customer table and monthly revenue fact table, created one-to-many relationships, used a dedicated Date table, and used DISTINCTCOUNT for customer KPIs.

**Result:** The model produced consistent totals across pages and supported both customer segmentation and monthly revenue analysis without double-counting customers.

## STAR Method Response 3: Turning Analysis Into Action

**Situation:** A churn dashboard can become descriptive without telling management what to do.

**Task:** I needed to connect the findings to practical retention decisions.

**Action:** I ranked churn drivers, calculated annual revenue at risk, created a high-risk customer list, and matched each major finding with an owner and success metric.

**Result:** The final report recommended targeted outreach, early-life onboarding, autopay promotion, contract conversion, and service recovery instead of a broad untargeted retention campaign.

