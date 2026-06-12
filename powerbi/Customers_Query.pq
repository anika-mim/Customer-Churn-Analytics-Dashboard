let
    Source = Csv.Document(
        File.Contents("D:\MY PORTFOLIO\PowerBI project\data\Customers.csv"),
        [Delimiter = ",", Columns = 23, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    ChangedTypes = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"CustomerID", type text},
            {"JoinDate", type date},
            {"ChurnDate", type date},
            {"CustomerStatus", type text},
            {"Age", Int64.Type},
            {"AgeGroup", type text},
            {"Gender", type text},
            {"Geography", type text},
            {"TenureMonths", Int64.Type},
            {"IncomeLevel", type text},
            {"ContractType", type text},
            {"SubscriptionPlan", type text},
            {"MonthlyCharges", Currency.Type},
            {"PaymentMethod", type text},
            {"AutoPay", type text},
            {"SupportCalls", Int64.Type},
            {"LatePayments", Int64.Type},
            {"SatisfactionScore", Int64.Type},
            {"TotalRevenue", Currency.Type},
            {"LastActivityDate", type date},
            {"RiskScore", Int64.Type},
            {"RiskCategory", type text},
            {"ChurnReason", type text}
        }
    ),
    CleanedText = Table.TransformColumns(
        ChangedTypes,
        {
            {"CustomerID", Text.Trim, type text},
            {"CustomerStatus", Text.Trim, type text},
            {"Gender", Text.Trim, type text},
            {"Geography", Text.Trim, type text},
            {"IncomeLevel", Text.Trim, type text},
            {"ContractType", Text.Trim, type text},
            {"SubscriptionPlan", Text.Trim, type text},
            {"PaymentMethod", Text.Trim, type text},
            {"AutoPay", Text.Trim, type text},
            {"ChurnReason", each if _ = null then null else Text.Trim(_), type text}
        }
    ),
    RemovedBlankKeys = Table.SelectRows(
        CleanedText,
        each [CustomerID] <> null and [CustomerID] <> ""
    ),
    RemovedDuplicates = Table.Distinct(RemovedBlankKeys, {"CustomerID"}),
    RemovedExistingDerived = Table.RemoveColumns(
        RemovedDuplicates,
        {"AgeGroup", "RiskCategory"}
    ),
    AddedAgeGroup = Table.AddColumn(
        RemovedExistingDerived,
        "AgeGroup",
        each
            if [Age] < 25 then "18-24"
            else if [Age] < 35 then "25-34"
            else if [Age] < 45 then "35-44"
            else if [Age] < 55 then "45-54"
            else if [Age] < 65 then "55-64"
            else "65+",
        type text
    ),
    AddedTenureBand = Table.AddColumn(
        AddedAgeGroup,
        "TenureBand",
        each
            if [TenureMonths] <= 12 then "0-12 Months"
            else if [TenureMonths] <= 24 then "13-24 Months"
            else if [TenureMonths] <= 36 then "25-36 Months"
            else "37+ Months",
        type text
    ),
    AddedMonthlyChargeBand = Table.AddColumn(
        AddedTenureBand,
        "MonthlyChargeBand",
        each
            if [MonthlyCharges] < 60 then "Low (<$60)"
            else if [MonthlyCharges] < 90 then "Medium ($60-$89)"
            else "High ($90+)",
        type text
    ),
    AddedCustomerValueSegment = Table.AddColumn(
        AddedMonthlyChargeBand,
        "CustomerValueSegment",
        each
            if [TotalRevenue] < 1000 then "Low Value"
            else if [TotalRevenue] < 2500 then "Medium Value"
            else "High Value",
        type text
    ),
    AddedRiskCategory = Table.AddColumn(
        AddedCustomerValueSegment,
        "RiskCategory",
        each
            if [CustomerStatus] = "Churned" then "Churned"
            else if [RiskScore] >= 70 then "High Risk"
            else if [RiskScore] >= 40 then "Medium Risk"
            else "Low Risk",
        type text
    ),
    AddedCleanChurnReason = Table.AddColumn(
        AddedRiskCategory,
        "ChurnReasonClean",
        each
            if [CustomerStatus] = "Active" then null
            else if [ChurnReason] = null or [ChurnReason] = "" then "Other"
            else [ChurnReason],
        type text
    ),
    RemovedOriginalChurnReason = Table.RemoveColumns(
        AddedCleanChurnReason,
        {"ChurnReason"}
    ),
    RenamedChurnReason = Table.RenameColumns(
        RemovedOriginalChurnReason,
        {{"ChurnReasonClean", "ChurnReason"}}
    ),
    ReorderedColumns = Table.ReorderColumns(
        RenamedChurnReason,
        {
            "CustomerID", "JoinDate", "ChurnDate", "CustomerStatus",
            "Age", "AgeGroup", "Gender", "Geography", "TenureMonths", "TenureBand",
            "IncomeLevel", "ContractType", "SubscriptionPlan", "MonthlyCharges",
            "MonthlyChargeBand", "PaymentMethod", "AutoPay", "SupportCalls",
            "LatePayments", "SatisfactionScore", "TotalRevenue",
            "CustomerValueSegment", "LastActivityDate", "RiskScore",
            "RiskCategory", "ChurnReason"
        }
    )
in
    ReorderedColumns
