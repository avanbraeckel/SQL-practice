-- PROGRAM 7
/**
*  charges a service fee for each customer whose current balance is greater than
*  the credit limit and add the charge to the balance. The service fee is 10% of the portion over
*  the credit limit. The program then displays the name of each of such customers and the new balance
*
*/

create or replace function p7() returns void as $$
    declare
        c1 cursor for SELECT Account from c;
        cust_num text;
        cust_name text;
        fee NUMERIC(10,2);
        balance NUMERIC(10,2);
        credit_limit INTEGER;
        over_limit NUMERIC(10,2);
    begin
        raise notice 'CHARGING SERVICE FEE TO ALL CUSTOMERS WHO HAVE EXCEEDED THE CREDIT LIMIT (-10%% of portion over the limit)';
        raise notice 'CUSTOMERS AFFECTED, ALONG WITH THEIR UPDATED BALANCE:';
        raise notice '-------------------------------------------------------------------------------------------------------------';
        open c1;
        loop
            fetch c1 into cust_num; 
			exit when not found;
            -- get data related to the customer
            SELECT Cbalance, Cname, Crlimit INTO balance, cust_name, credit_limit FROM c WHERE Account=cust_num;
            -- calculate service fee if the balance exceeds the credit limit, then update the balance
            if balance > credit_limit then
                fee := (balance - credit_limit) * 0.10;
                UPDATE c SET Cbalance=balance-fee WHERE Account=cust_num;
                -- display updated customer data
                raise notice '%: %', cust_name, balance;
            end if;
        end loop;
        close c1;
    end;
$$ language plpgsql;