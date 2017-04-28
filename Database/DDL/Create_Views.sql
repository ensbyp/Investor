/*Create_Views.sql

Description: Creates the Investor database Views

Author: P Ensby
Date: 28/04/2017
Version: 1

Revision History:


*/
use Investor;

/* Create Ticker View */ 

Create or Replace view VW_TICKER AS
Select A.Id,
		D.Stock_Type,
		A.Ticker,
        A.Ticker_Name,
        B.Country,
        B.Exchange,
        C.Category_No,
        C.Category_Name,
        A.Valid_From,
        A.Valid_To
 from INV_TICKER A
left join INV_COUNTRY_EXCHANGE B on A.Exchange_Id = B.Id 
left join INV_STOCK_CATEGORIES C on A.Stock_Symbol_Cat_Id = C.Id
join INV_STOCK_TYPE D on A.Symbol_Type_Id = D.Id
where A.Valid_To is null;