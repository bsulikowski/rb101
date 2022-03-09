require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

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

def operation_to_message(op)
  word = case op
         when 'A'
           'Adding'
         when 'S'
           'Subtracting'
         when 'D'
           'Dividing'
         when 'M'
           'Multiplying'
         end

  word
end

prompt MESSAGES['welcome']
name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt MESSAGES['valid_name']
end

prompt "Hi #{name}!"

loop do
  number1 = ''
  loop do
    prompt MESSAGES['first_number']
    number1 = gets.chomp
    break if number?(number1)
    prompt MESSAGES['invalid_number']
  end

  number2 = ''
  loop do
    prompt MESSAGES['second_number']
    number2 = gets.chomp
    break if number?(number2)
    prompt MESSAGES['invalid_number']
  end

  operator_prompt = <<-MSG
  What operation would you like to perform? 
  A for add
  S for Subtract
  D for divide
  or M for multiply
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.upcase.chomp
    break if %w(A S D M).include?(operator)
    prompt MESSAGES['invalid_operator']
  end

  prompt "#{operation_to_message(operator)} the two numbers..."
  sleep 2

  result = case operator
           when 'A'
             number1.to_i + number2.to_i
           when 'S'
             number1.to_i - number2.to_i
           when 'D'
             number1.to_f / number2.to_f
           when 'M'
             number1.to_i * number2.to_i
           end

  prompt "The result is #{result}"

  prompt MESSAGES['another_calculation']
  answer = gets.chomp
  break unless answer.upcase == 'Y'
end

prompt MESSAGES['goodbye']
