use Investor;
Drop table IF EXISTS LAND_ALL_SYMBOLS;
Create table LAND_ALL_SYMBOLS
select distinct Ticker, Name, Exchange, Country, 'Bonds' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_BOND_SYMBOLS 
union
select distinct Ticker, Name, Exchange, Country, 'ETFs' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_ETF_SYMBOLS 
union
select distinct Ticker, Name, Exchange, Country, 'Futures' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_FUTURE_SYMBOLS 
union
select distinct Ticker, Name, Exchange, Country, 'Indexes' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_INDEX_SYMBOLS 
union
select distinct Ticker, Name, Exchange, Country, 'Mutuals' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_MUTUAL_SYMBOLS 
UNION
select distinct Ticker, Name, Exchange, Country, 'Stocks' as Symbol_Type, `Category Name` as Category_Name, `Category Number` as Category_No from Investor.LAND_STOCK_SYMBOLS 
UNION
select distinct Ticker, Name, Exchange, Country, 'Warrants' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_WARRANT_SYMBOLS 
UNION
select distinct Ticker, Name, Exchange, '' as Country, 'Currencies' as Symbol_Type, '' as Category_Name, '' as Category_No from Investor.LAND_CURRENCY_SYMBOLS 
;