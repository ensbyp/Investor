/* Load_INV_COUNTRY_EXCHANGE.sql

Description: Takes data from the landed LAND_COUNTRY_EXCHANGE table and updates the
			INV_COUNTRY_EXCHANGE reference table with new rows found in the landing
            table.

Author: P Ensby
Date: 26/04/2017
Version: 1

ToDo:

Revision History:

*/

USE Investor;


Insert into INV_COUNTRY_EXCHANGE (Country, Exchange)
Select Country,
		Exchange
FROM LAND_COUNTRY_EXCHANGE O
WHERE NOT EXISTS ( SELECT  1
					FROM INV_COUNTRY_EXCHANGE i
                    where i.Country = O.Country and
                    i.Exchange = O.Exchange);
                    


			
            

