-- PROGRAM 5
/**
*  calculates the total amount of transactions of every vendor in the transaction
*  table, and add the total amount to the vendor’s current balance. The program then displays
*  vendor numbers, vendor names, and the new balances.
*
*/

create or replace function p5() returns void as $$
    declare
        c1 cursor for SELECT Vno from v;
        trans_total NUMERIC(10,2);
        vendor_num text;
        vendor_id text;
        vendor_name text;
        balance NUMERIC(10,2);
    begin
        raise notice 'UPDATED VENDOR BALANCES:';
        raise notice '---------------------------------------------';
        open c1;
        loop
            fetch c1 into vendor_num; 
			exit when not found;
            -- get transactions related to the vendor
            if exists(SELECT Tno from t WHERE t.Vno=vendor_num) then
                -- transactions exist, so get the total
                SELECT SUM(Amount) INTO trans_total FROM t WHERE Vno=vendor_num;
            else -- vendor has no transactions
                trans_total := 0;
            end if;
            UPDATE v SET Vbalance=Vbalance+trans_total WHERE Vno=vendor_num;
            -- display updated vendor data
            SELECT Vno, Vname, Vbalance INTO vendor_id, vendor_name, balance FROM v WHERE v.Vno=vendor_num;
            raise notice '% - %: %', vendor_id, vendor_name, balance;
        end loop;
        close c1;
    end;
$$ language plpgsql;