require_relative 'test_helper'
require_relative '../lib/calculator.rb'

# To run tests comment out run_program() method.

describe 'calculator' do
  let(:io) { StringIO.new('1') }

  def point_stdin_to_string_io
    $stdin = io
  end

  def return_stdin_to_default
    $stdin = STDIN
  end

  describe 'prompting user for inputs' do
    it 'should welcome the user to the program' do
      proc { welcome_to_program }.must_output "Welcome to the calculator program\n"
    end

    it 'should ask the user for the term of the loan - in months' do
      point_stdin_to_string_io
      proc { collect_term_in_months }.must_output "Please supply the term of loan in months\n"
      return_stdin_to_default
    end

    it 'should ask the user for the the annual percentage rate' do
      point_stdin_to_string_io
      proc { collect_annual_percent_rate }.must_output "Please supply the annual Percentage Rate\n"
      return_stdin_to_default
    end

    it 'should ask the user for the loan amount' do
      point_stdin_to_string_io
      proc { collect_loan_amount }.must_output "Please supply loan amount\n"
      return_stdin_to_default
    end
  end

  describe 'make correct calculations' do
    it 'should calculate the correct monthly interest rate' do
      annual_percent_rate = 5.00
      calculate_monthly_interest_rate(annual_percent_rate).must_equal 0.417
    end
  end
end
