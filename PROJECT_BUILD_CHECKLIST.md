# Customer Churn Dashboard Build Checklist

**Status: Completed.** The finished project opens from `Customer_Churn_Analytics.pbip`.

The checklist below is retained as a learning guide so you can explain how the project was built during interviews.

## 1. Business Understanding

- [ ] Read `docs/01_business_understanding.md`
- [ ] Confirm the business problem and stakeholder needs
- [ ] Review the KPI definitions
- [ ] Keep the report focused on churn, retention, and revenue impact

## 2. Import and Understand the Data

- [ ] Open `data/Customer_Churn_Data_Package.xlsx`
- [ ] Review the Summary and Data Dictionary sheets
- [ ] Import `data/Customers.csv`
- [ ] Import `data/Monthly_Revenue.csv`
- [ ] Confirm 1,500 customers and 33,181 revenue rows

## 3. Power Query and Cleaning

- [ ] Apply `powerbi/Customers_Query.pq`
- [ ] Apply `powerbi/Monthly_Revenue_Query.pq`
- [ ] Confirm CustomerID has no duplicates in Customers
- [ ] Confirm MonthStart and CustomerID are unique together in Monthly Revenue
- [ ] Confirm blank ChurnDate values belong only to active customers
- [ ] Confirm currency, date, text, and whole-number data types

## 4. Data Model

- [ ] Create the Date table using `powerbi/Date_Table.dax`
- [ ] Mark Date as the date table
- [ ] Create the Customers to Monthly Revenue relationship
- [ ] Create the active Date to Monthly Revenue relationship
- [ ] Create the inactive Date to Customers ChurnDate relationship
- [ ] Hide technical keys and sorting columns from report view

## 5. DAX

- [ ] Create a Measures table
- [ ] Add every measure from `powerbi/Measures.dax`
- [ ] Format counts, percentages, and currency measures
- [ ] Validate KPIs against `README.md`

## 6. Dashboard Pages

- [ ] Build Executive Summary
- [ ] Build Customer Analysis
- [ ] Build Subscription Analysis
- [ ] Build Churn Risk Analysis
- [ ] Build Recommendations
- [ ] Add the report-level slicers
- [ ] Add drill-through to Customer Details
- [ ] Add a custom tooltip page
- [ ] Add a Reset Filters bookmark

## 7. Quality Check

- [ ] Check all visual titles
- [ ] Check spelling and number formatting
- [ ] Confirm slicers affect the correct visuals
- [ ] Confirm churn rate uses customers, not rows
- [ ] Confirm revenue lost and revenue at risk are annualized
- [ ] Test drill-through and tooltip behavior
- [ ] Remove unnecessary gridlines, borders, and legends
- [ ] Add a note that the data is synthetic

## 8. Portfolio Publishing

- [ ] Save the report as `Customer_Churn_Analytics_Dashboard.pbix`
- [ ] Export the five pages to PDF
- [ ] Capture one clear screenshot per page
- [ ] Add screenshots to the GitHub README
- [ ] Use the resume and LinkedIn text in `docs/09_portfolio_and_interview_kit.md`
- [ ] Practice the interview answers and STAR stories
