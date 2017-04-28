/* Load_INV_STOCK_CATEGORIES.sql

Description: Takes data from the landed LAND_STOCK_SYMBOLS table and updates the
			INV_STOCK_CATEGORIES reference table with new rows found in the landing
            table.

Author: P Ensby
Date: 27/04/2017
Version: 1

ToDo:

Revision History:

*/

USE Investor;


Insert into INV_STOCK_CATEGORIES (`Category_No`, `Category_Name`)
Select Distinct `Category Number`,
		`Category Name`
FROM LAND_STOCK_SYMBOLS O
WHERE NOT EXISTS ( SELECT  1
					FROM INV_STOCK_CATEGORIES i
                    where i.`Category_No` = O.`Category Number`);


			
            

