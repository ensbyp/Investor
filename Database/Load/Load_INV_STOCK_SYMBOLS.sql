/* Load_INV_TICKER.sql

Description: Takes data from the landed LAND_ALL_SYMBOLS table and updates the
			INV_TICKER reference table with new rows found in the landing
            table.

Author: P Ensby
Date: 28/04/2017
Version: 1

ToDo:

Revision History:

*/
use Investor;

Insert into INV_TICKER (Ticker, 
						Ticker_Name, 
                        Symbol_Type_Id,
                        Exchange_Id,
                        Stock_Symbol_Cat_Id)
	SELECT * from (
		Select L.Ticker, 
			L.Name as Ticker_Name, 
            SS.Id as Symbol_Type_Id,
            I.Id as Exchange_Id,
            S.Id as Stock_Symbol_Cat_Id
            from LAND_ALL_SYMBOLS as L
		LEFT join INV_COUNTRY_EXCHANGE as I 
			on L.Exchange = I.Exchange
			and L.Country = I.Country 
		Left Join INV_STOCK_CATEGORIES as S
			on L.Category_No = S.Category_No
		LEFT Join INV_STOCK_TYPE as SS
			on L.Symbol_Type = SS.Stock_Type
		Where I.Valid_To is null 
			or S.Valid_To is Null 
			or SS.Valid_To is Null) AS O
	WHERE NOT EXISTS (
		Select 1 FROM INV_TICKER I
			Where I.Ticker = O.Ticker
				)
        
    



 