# Ask the user for two numbers
# Ask the user for an operation to perform
# Perform the operation on the two numbers
# Output the result

# Updates
# - Validation that user is entering
# - use of a seperate YML file for message strings that don't have interpolation
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt_user(msg)
  puts " => #{msg}"
end

def collect_input
  gets.chomp
end

def test_num_is_numeric(num)
  if Integer(num) || Float(num)
    true
  else
    false
  end
end

def user_finished_with_program?
  prompt_user messages('program_finished')
  reply = collect_input.downcase
  reply.start_with?('y') ? false : true
end

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

loop do
  num1 = nil
  num2 = nil
  prompt_user messages('welcome')
  # Collect and validate the first number
  begin
    prompt_user messages('whats_first_num')
    num1 = collect_input
    test_num_is_numeric(num1)
  rescue ArgumentError => e
    prompt_user "You didn't enter a number? #{e}"
    retry
  end

  # Collect and validate the second number
  begin
    prompt_user messages('whats_second_num')
    num2 = collect_input
    test_num_is_numeric(num2)
  rescue ArgumentError => e
    prompt_user "You didn't enter a number? #{e}"
    retry
  end

  # Present the user with operator options and collect choice

  operator_menu = <<-operator_menu
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  operator_menu

  operator = ''

  loop do
    prompt_user(operator_menu)
    operator = collect_input
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt_user "You entered #{operator} - try again"
    end
  end

  result =  case operator
            when '1'
              num1.to_f + num2.to_f
            when '2'
              num1.to_f - num2.to_f
            when '3'
              num1.to_f * num2.to_f
            when '4'
              num1.to_f / num2.to_f
            end

  result.round(2)

  prompt_user "The result is: #{result}"

  break if user_finished_with_program?
end
