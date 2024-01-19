-- PROGRAM 6
/**
*  charges each vendor a service fee that is 2.5% of the vendor’s balance, and
*  subtracts the service fee from the balance. The program then displays the name of each vendors,
*  the fee charged, and the new balance.
*
*/

create or replace function p6() returns void as $$
    declare
        c1 cursor for SELECT Vno from v;
        vendor_num text;
        vendor_name text;
        fee NUMERIC(10,2);
        balance NUMERIC(10,2);
    begin
        raise notice 'CHARGING SERVICE FEE TO ALL VENDORS (-2.5%%)';
        raise notice 'SHOWING THE FEE CHARGED, AS WELL AS THE UPDATED BALANCE:';
        raise notice '---------------------------------------------';
        open c1;
        loop
            fetch c1 into vendor_num; 
			exit when not found;
            -- get balance related to the vendor
            SELECT Vbalance, Vname INTO balance, vendor_name FROM v WHERE Vno=vendor_num;
            -- calculate service fee of 2.5% and resultant balance, then update the balance
            fee := balance * 0.025;
            UPDATE v SET Vbalance=balance-fee WHERE Vno=vendor_num;
            -- display updated vendor data
            raise notice '%: (-%) ==> %', vendor_name, fee, balance-fee;
        end loop;
        close c1;
    end;
$$ language plpgsql;