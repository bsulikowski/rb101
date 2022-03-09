require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

MONTHS_IN_A_YEAR = 12
DECIMAL_FORMAT = 0.01

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def apr_to_monthly_interest(apr)
  (apr.to_f / MONTHS_IN_A_YEAR) * DECIMAL_FORMAT
end

def years_to_months(years)
  years.to_i * MONTHS_IN_A_YEAR
end

prompt MESSAGES['welcome']

# Get and validate name input
name = ''

loop do
  name = gets.chomp
  break unless name.empty?
  prompt MESSAGES['invalid_name']
end

prompt "Hi there #{name}!"

# Main calculation loop
loop do
  # Get and validate loan amount
  prompt MESSAGES['loan_amount']
  loan_amount = ''

  loop do
    loan_amount = gets.chomp
    break if number?(loan_amount)
    prompt MESSAGES['invalid_loan_amount']
  end

  # Get and validate APR
  prompt MESSAGES['apr']
  apr = ''

  loop do
    apr = gets.chomp
    break if number?(apr)
    prompt MESSAGES['invalid_apr']
  end

  # Get and validate loan duration
  prompt MESSAGES['loan_duration']
  loan_duration_years = ''

  loop do
    loan_duration_years = gets.chomp
    break if number?(loan_duration_years)
    prompt MESSAGES['invalid_loan_duration']
  end

  # Calculate monthly interest
  monthly_interest = apr_to_monthly_interest(apr)

  # Calculate loan duration in months
  loan_duration_months = years_to_months(loan_duration_years)

  # Calculate monthly payment
  prompt MESSAGES['calculating']
  sleep 2

  monthly_payment = loan_amount.to_f *
                    (monthly_interest / 
                    (1 - (1 + monthly_interest)**(-loan_duration_months)))

  # Display result
  prompt "Your monthly payment is $#{format('%.2f', monthly_payment)}."

  # Ask to restart if wanted
  prompt MESSAGES['another_calculation']
  restart = gets.chomp.downcase

  break unless restart.start_with?('y')
end

prompt MESSAGES['goodbye']
