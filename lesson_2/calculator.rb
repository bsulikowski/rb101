def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when 'A'
    'Adding'
  when 'S'
    'Subtracting'
  when 'D'
    'Dividing'
  when 'M'
    'Multiplying'
  end
end

prompt 'Welcome to Calculator! Enter your name:'
name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt 'Make sure to use a valid name.'
end

prompt "Hi #{name}!"

loop do
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp
    break if valid_number?(number1)
    prompt "That's not a valid number. Please try again:"
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp
    break if valid_number?(number2)
    prompt "That's not a valid number. Please try again:"
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
    prompt "Must choose A, S, D, or M:"
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

  prompt 'Do you want to perform another calculation? (Y to calculate again)'
  answer = gets.chomp
  break unless answer.upcase == 'Y'
end

prompt 'Thanks for using Calculator. Goodbye!'
