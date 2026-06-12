# Phase 5: Power Query Transformations

| Item | Definition |
|---|---|
| Business objective | Turn source files into consistent reporting tables and useful customer segments |
| Analysis approach | Profile columns, assign types, clean keys, rebuild derived bands, and apply quality filters |
| Business value | Makes the transformation process visible, repeatable, and easy to explain in an interview |
| Expected insight | Derived tenure, charge, customer-value, and risk segments make churn patterns easier to communicate |

## Data Profiling

In Power Query, enable:

- View > Column quality
- View > Column distribution
- View > Column profile
- Column profiling based on the entire dataset

Check:

- CustomerID uniqueness
- Blank ChurnDate and ChurnReason values
- Minimum and maximum dates
- Satisfaction and risk score ranges
- Monthly charges and revenue distributions

## Customer Transformations

The supplied `powerbi/Customers_Query.pq` script:

- Imports the CSV
- Promotes headers
- Assigns correct data types
- Trims text
- Removes duplicate customers
- Recreates Age Group
- Creates Tenure Band
- Creates Monthly Charge Band
- Creates Customer Value Segment
- Validates the supplied risk score and recreates the risk category

## Segmentation Rules

### Age Group

- 18-24
- 25-34
- 35-44
- 45-54
- 55-64
- 65+

### Tenure Band

- 0-12 Months
- 13-24 Months
- 25-36 Months
- 37+ Months

### Monthly Charge Band

- Low: below $60
- Medium: $60 to $89.99
- High: $90 or more

### Customer Value Segment

- Low Value: below $1,000 historical revenue
- Medium Value: $1,000 to $2,499.99
- High Value: $2,500 or more

### Risk Category

- Low Risk: score below 40
- Medium Risk: score from 40 to 69
- High Risk: score 70 or above
- Churned: customers who have already left

## Risk Score Logic

The supplied score increases for behaviors associated with churn:

- Month-to-month contract
- Basic plan
- High monthly charges
- Electronic check
- No autopay
- Multiple support calls
- Multiple late payments
- Low satisfaction
- Short tenure

This is an explainable prioritization tool. It should be described as a business rule, not a machine-learning probability.

## Expected Output

The final Customers query should still return 1,500 unique customers. The final Monthly Revenue query should return 33,181 unique customer-month rows.
