# Problem: Mortgage / Car Loan Calculator

> You'll need three pieces of information
>> The loan amount
>> The annual Percentage Rate (APR)
>> The loan duration

> From the above, you'll need to calculate the following two things:
>> Monthly interest rate
>> Loan duration in months

### You can use the following formula:

```rb
m = p * (j / (1 - (1 + j)**(-n)))
```
> m = monthly payment
> p = loan amount
> j = monthly interest rate
> n = loan duration in months


# Solution: Mortgage / Car Loan Calculator (PEDAC)

### Problem
Problem statement is clear and explicit on the problem
Take three inputs (amount, percent, duration), then provide the monthly interest rate, and loan duration in months.
** The problem statement does not explicity say that I cannot ask for user for loan duration in months from the begining - so I will.

### Examples / test cases
calculate_monthly_payment()
calculate_monthly_interest_rate()


### Data-structures
#### Input
String
#### Processing
String to Integer - number of months
String to Float - annual percentage rate
String to Integer - loan amount
#### Output
String monthly interest rate
String loan duration in months

### Algorithm
START of program
PRINT the welcome statement 
UNTIL user has supplied all three valid inputs
  GET and VALIDATE(must be numeric) loan_amount
  GET and VALIDATE(must be Float) annual_percentate_rate
  GET and VALIDATE(must be Integer) loan_duration_in_months

```ruby
  calculate_monthly_interest_rate(rate)
    rate_to_decimal = rate / 100
    monthly_rate = rate_to_decimal / 12
  end
```
PRINT The loan duration
PRINT monthy interest rate
END UNTIL

END of program

### Code












