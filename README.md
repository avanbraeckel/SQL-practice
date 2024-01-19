# **Databases Assignment**
### *Austin Van Braeckel*
<br>

## **Program-Specific Notes:**
- All programs are run with the assumption that *a3data.sql* was run first
    - i.e. they are run with the assumption that the database is populated with the expected data
- All programs have case-sensitive input (eg. 'Smith' as an input will work for *p1* but 'SMITH' and 'sMiTh' will not)
- All programs are expected to be run in succession
    - e.g. run p1, then p2, then p3, then p4, etc.
### **p1.sql** - *p1(text)*
- The parameter is the customer name (eg. 'Smith')
### **p2.sql** - *p2(text)*
- The parameter is the vendor name (eg. 'Walmart')
### **p3.sql** - *p3(text, text, int)*
- Assuming that the user knows, and will input (in order) the following as the parameters:
    - Customer name (text) - (eg. 'Van Braeckel')
    - Province (text) - (eg. 'ONT')
    - Credit limit (int) - (eg. 1000)
- Assuming that the user doesn't know the primary key (customer/account number), so it is generated automatically by the program
- Assuming that all new customers start at a balance of 0.00
    - Therefore, they do not include it in the input
### **p4.sql, p5.sql, p6.sql, p7.sql** - *void (no parameters)*
### **p8.sql** - *p8(text, text, NUMERIC(10,2))*
- Assuming that the user knows, and will input (in order) the following as the parameters:
    - Vendor number (text) - (eg. 'V1')
    - Customer/Account number (text) - (eg. 'A3')
    - Transaction amount (NUMERIC(10,2)) - (eg. 1000.50)
    
<br>
<hr>

### **Other Notes:**
- All function names are the same as the file names (`p1()` for *p1.sql*, `p2()` for *p2.sql*, etc)
- Assume that Vname, Cname have 20 characters maximum, and City has 10 characters maximum
- Assume that Vno, Account, Cno have a maximum of V9999, A9999, and C9999, respectively
- Assume that the dollar amounts (Vbalance, Cbalance, Amount) have a maximum of 9999999999.99
- Assume that Province has 3 characters maximum

<br>

#### **Issues:**

- I was unable to connect to the database server with the command "psql -h db" as directed in the lecture slides
    - *Error Message:*
    ```
    psql: GSSAPI continuation error: Unspecified GSS failure.  Minor code may provide more information
    GSSAPI continuation error: No Kerberos credentials available (default cache: FILE:/tmp/krb5cc_5718)
    ```
    - I only was able to test the scripts on my local machine as a result

### **Data inserted by the initial script**: *(from lecture slides)*
| **Vno** | Vname | City | Vbalance |
|---------|-------|------|----------|
| V1 | IKEA | Toronto | 200.00 |
| V2 | Walmart | Waterloo | 671.05 |
| V3 | Esso | Windsor | 0.00 |
| V4 | Esso | Waterloo | 225.00 |

| **Account** | Cname | Province | Cbalance | Crlimit |
|-------------|-------|----------|----------|---------|
| A1 | Smith | ONT | 2515.00 | 2000 |
| A2 | Jones | BC | 2014.00 | 2500 |
| A3 | Doc | ONT | 150.00 | 1000 |

| **Tno** | Vno | Account | T_date | Amount |
|---------|-----|---------|--------|--------|
| T1 | V2 | A1 | 2020-07-15 | 1325.00 |
| T2 | V2 | A3 | 2019-12-16 | 1900.00 |
| T3 | V3 | A1 | 2020-09-01 | 2500.00 |
| T4 | V4 | A2 | 2020-03-20 | 1613.00 |
| T5 | V4 | A3 | 2020-07-31 | 2212.00 |