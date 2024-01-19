-- PROGRAM 4
/**
*  displays the most recent transaction of every customer. The program displays
*  account number, customer name, amount, and vendor name. If a customer has no transaction
*  (e.g. the new one), the program should display “no transaction”.
*
*/

create or replace function p4() returns void as $$
    declare
        c1 cursor for SELECT Account from c;
        account_id text;
        cust_name text;
        trans_amt text;
        vendor_name text;
    begin
        raise notice 'MOST RECENT TRANSACTIONS FOR EACH CUSTOMER:';
        raise notice '---------------------------------------------';
        open c1;
        loop
            fetch c1 into account_id; 
			exit when not found;
            -- get transaction dates for the specific customer
            if exists(SELECT T_date from t WHERE t.Account=account_id) then
                -- transactions exist, so get the most recent date
                SELECT c.Account, Cname, Amount, Vname FROM c,v,t
                INTO account_id, cust_name, trans_amt, vendor_name
                WHERE c.Account=t.Account AND t.Vno=v.Vno AND T_date = (
                    SELECT MAX(T_date) FROM t AS latest WHERE latest.Account=account_id
                );
                raise notice '%: % - % (%)', account_id, cust_name, trans_amt, vendor_name;
            else -- customer has no transactions
                -- Still get customer number and name to display with "no transaction"
                SELECT Account, Cname INTO account_id, cust_name FROM c WHERE Account=account_id;
                raise notice '%: % - no transaction', account_id, cust_name;
            end if;
        end loop;
        close c1;
    end;
$$ language plpgsql;