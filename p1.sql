-- PROGRAM 1
/**
*  displays data of all the transactions of a given customer. For each transaction,
*  the data to display include vendor name, date, and amount. Write the program as a function
*  that accepts a customer name as a parameter, and displays transactions of the customer. 
*/

create or replace function p1(cust_name text) returns void as $$
    declare
        c1 cursor for SELECT Vname, T_date, Amount FROM v,c,t WHERE c.Cname=cust_name AND c.Account=t.Account AND t.Vno=v.Vno;
        vendor_name CHAR(20);
        trans_date DATE;
        amt NUMERIC(10,2);
    begin
        -- display heading
        raise notice 'FOR CUSTOMER: %', cust_name;
        raise notice '----------------------------------------';
        open c1; 
		loop 
			fetch c1 into vendor_name, trans_date, amt; 
			exit when not found;
            -- display the transaction data
			raise notice 'Date: %', trans_date;
			raise notice 'Vendor: %', vendor_name;
			raise notice 'Amount: %', amt; 
			raise notice ' '; 
		end loop; 
		close c1;
    end;
$$ language plpgsql;