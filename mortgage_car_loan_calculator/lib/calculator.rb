def prompt_user(msg)
  puts msg.to_s
end

def welcome_to_program
  prompt_user "Welcome to the calculator program\n"
end

def collect_loan_amount
  prompt_user "Please supply loan amount\n"
  gets
end

def collect_term_in_months
  prompt_user "Please supply the term of loan in months\n"
  gets
end

def collect_annual_percent_rate
  prompt_user "Please supply the annual Percentage Rate\n"
  gets.chomp
end

def convert_percent_to_decimal(percent)
  percent / 100
end

def convert_decimal_to_percent(decimal)
  decimal * 100
end

def calculate_monthly_interest_rate(annual_rate)
  decimal = convert_percent_to_decimal(annual_rate)
  monthly_rate = decimal / 12
  monthly_rate_to_percent = convert_decimal_to_percent(monthly_rate)
  monthly_rate_to_percent.round(3)
end

def present_information(monthly_rate, term, annual_rate, loan_amount)
  puts "The monthly rate is #{monthly_rate} %"
  puts "The annual rate is #{annual_rate} %"
  puts "The loan amount is $#{loan_amount}"
  puts "The term of the loan: No.Months = #{term}"
  puts 'Thank you for using the calculator.'
end

def test_num_is_integer(num)
  Integer(num)
end

def test_num_is_float(num)
  Float(num)
end

def user_finished_with_program?
  prompt_user "Would you like to run another calculation? ('Y/y')"
  reply = gets.chomp.downcase
  reply.start_with?('y') ? false : true
end

def run_program
  loop do
    # Collect term as numeric
    begin
      term = collect_term_in_months
      test_num_is_integer(term)
    rescue ArgumentError => e
      puts "Please enter a numeric value - not #{e}"
      retry
    end

    # Collect annual interest as numeric
    begin
      annual_rate = collect_annual_percent_rate
      test_num_is_float(annual_rate)
    rescue ArgumentError => e
      puts "Please enter a numeric value - not #{e}"
      retry
    end

    # Collect loan amount as numeric
    begin
      loan_amount = collect_loan_amount
      test_num_is_float(loan_amount)
    rescue ArgumentError => e
      puts "Please enter a numeric value - not #{e}"
      retry
    end

    monthly_rate = calculate_monthly_interest_rate(annual_rate.to_f)
    present_information(monthly_rate, term, annual_rate, loan_amount)

    break if user_finished_with_program?
  end
end

# To run tests/specs comment out run_program() method before.
run_program
