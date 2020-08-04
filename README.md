# Car Financing Database Project

This project was used as my final project for a databases class held at the university. The goal of this project was to create a small scale version of a car manufacturer's financial database. Functionalities of the project include: procedures to add and sell vehicles from a dealer, calculate payments based on customizable intrest rates, record transactional history for all dealers, record transactional history for all payments made by a customer, and store user information securely within the database. 

## Getting Started

This project requires a schema of jawolf7279. This schema can be changed, but will have to be changed throughout the entirety of the project. Included in the project is a sql file to create the tables that are needed to get started. There are also a few procedures included in the project that will need to be added to the database before adding inventory.


## File Breakdown

### Functions

#### Calc Payment Function.sql
This function calculates a payment due based on the current principle amount, the current annual percentage rate, and the length of the loan.

#### Future Value Function.sql
This calculates the future value of a loan based on the payments being made, and the rate that the loan is given.

### Procedures
 
#### Add Vehicle Procedure.sql
This procedure will add a new vehicle to a customer's portfolio. The procedure will update a transaction table, add customer information, and will assign a vehicle to the current customer.

#### Pay Loan Procedure.sql 
This will allow a customer to pay down on a current loan. The current loan will ONLY be paid down if the customer makes a payment that is more than the min payment for the customer. 


## Built With

```
Microsoft SQL Server Management Studio (https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)
```
