-- PROGRAM 3
/**
*  inserts a new customer record (tuple). Write this program as a function,
*  which takes data of the customer as parameters and stores the data into the customer table. It
*  then displays all the customer records. The balance of the new customer should be zero (0.00).
*
*  - Assumes a balance of 00.00 when a new customer is added.
*/

create or replace function p3(Cname text, Province text, Crlimit int) returns void as $$
    declare
    c1 cursor for SELECT format(' %-7s | %-20s | %-8s | %-8s | %-7s ', c.Account, c.Cname, c.Province, c.Cbalance, c.Crlimit)
        output_str FROM c;
    cust_num CHAR(5);
    cust_name CHAR(20);
    cust_province CHAR(3);
    balance NUMERIC(10,2);
    cr_limit INTEGER;
    table_output text;
    account_id text;
    id int := 1;
    begin
        -- determines the primary key based on the current contents of the table - the customer/account number
        loop
            if not exists(SELECT Account FROM c WHERE Account=('A' || id)) then
                -- set the customer number if it's available (not already in use)
                account_id := 'A' || id;
                exit; -- break loop
            else -- increment to the next customer number
                id := id + 1;
            end if;
        end loop;

        -- inserts a customer record into the customer table with the given data
        EXECUTE format('INSERT INTO c VALUES(%L, %L, %L, 0.00, %s)', account_id, Cname, Province, Crlimit);
        -- display the customer records (in the form of a table), starting with the column headings
        raise notice ' account |        cname         | province | cbalance | crlimit ';
        raise notice '---------+----------------------+----------+----------+---------';
        open c1;
        loop
            fetch c1 into table_output; 
			exit when not found;
            -- display a row of data for the customer record
            raise notice '%', table_output;
        end loop;
        close c1;
    end;
$$ language plpgsql;