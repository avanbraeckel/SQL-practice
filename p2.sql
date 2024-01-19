-- PROGRAM 2
/**
*  displays data of the customers who have transactions with a given vendor.
*  The data include customer numbers, customer names, and provinces. Write the program as a
*  function that accepts a vendor name as a parameter and displays data of customers.
*/

create or replace function p2(vendor_name text) returns void as $$
    declare
        c1 cursor for SELECT c.Account, Cname, Province FROM c,t,v WHERE v.Vname=vendor_name
            AND c.Account=t.Account AND t.Vno=v.Vno;
        cust_num CHAR(5);
        cust_name CHAR(20);
        province CHAR(3);
    begin
        -- display heading
        raise notice 'FOR VENDOR: %', vendor_name;
        raise notice '----------------------------------------';
        open c1; 
		loop 
			fetch c1 into cust_num, cust_name, province; 
			exit when not found;
            -- display the customer data
			raise notice 'Customer Number: %', cust_num;
			raise notice 'Customer Name: %', cust_name;
			raise notice 'Province: %', province; 
			raise notice ' '; 
		end loop; 
		close c1;
    end;
$$ language plpgsql;