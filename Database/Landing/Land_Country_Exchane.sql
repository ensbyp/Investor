use Investor;
Drop table LAND_COUNTRY_EXCHANGE;
Create table LAND_COUNTRY_EXCHANGE
select distinct Exchange, Country from Investor.LAND_BOND_SYMBOLS where Exchange is not null or Exchange != ''
union
select distinct Exchange, Country from Investor.LAND_ETF_SYMBOLS where Exchange is not null or Exchange != ''
union
select distinct Exchange, Country from Investor.LAND_FUTURE_SYMBOLS where Exchange is not null or Exchange != ''
union
select distinct Exchange, Country from Investor.LAND_INDEX_SYMBOLS where Exchange is not null or Exchange != ''
union
select distinct Exchange, Country from Investor.LAND_MUTUAL_SYMBOLS where Exchange is not null or Exchange != ''
UNION
select distinct Exchange, Country from Investor.LAND_STOCK_SYMBOLS where Exchange is not null or Exchange != ''
UNION
select distinct Exchange, Country from Investor.LAND_WARRANT_SYMBOLS where Exchange is not null or Exchange != ''
UNION
select distinct Exchange, '' as Country from Investor.LAND_CURRENCY_SYMBOLS where Exchange is not null or Exchange != ''
;