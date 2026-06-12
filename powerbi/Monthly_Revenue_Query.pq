let
    Source = Csv.Document(
        File.Contents("D:\MY PORTFOLIO\PowerBI project\data\Monthly_Revenue.csv"),
        [Delimiter = ",", Columns = 3, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    ChangedTypes = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"MonthStart", type date},
            {"CustomerID", type text},
            {"MonthlyRevenue", Currency.Type}
        }
    ),
    CleanedCustomerID = Table.TransformColumns(
        ChangedTypes,
        {{"CustomerID", Text.Trim, type text}}
    ),
    RemovedInvalidRows = Table.SelectRows(
        CleanedCustomerID,
        each
            [MonthStart] <> null
            and [CustomerID] <> null
            and [CustomerID] <> ""
            and [MonthlyRevenue] <> null
            and [MonthlyRevenue] >= 0
    ),
    RemovedDuplicates = Table.Distinct(
        RemovedInvalidRows,
        {"MonthStart", "CustomerID"}
    )
in
    RemovedDuplicates

