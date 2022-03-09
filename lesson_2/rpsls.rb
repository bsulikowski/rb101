require 'yaml'
MESSAGES = YAML.load_file('rpsls_messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_ABBR = %w(r p sc l sp)

WINNING_MOVES = { rock: %w(scissors lizard),
                  paper: %w(rock spock),
                  scissors: %w(paper lizard),
                  lizard: %w(paper spock),
                  spock: %w(rock scissors) }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_MOVES[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt MESSAGES['player_win']
  elsif win?(computer, player)
    prompt MESSAGES['computer_win']
  else
    prompt MESSAGES['tie']
  end
end

prompt MESSAGES['welcome']
loop do
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt "Choose one: #{VALID_CHOICES.join(', ')}"
      prompt "You can also use #{VALID_CHOICES_ABBR.join(', ')}"
      choice = gets.chomp

      if VALID_CHOICES_ABBR.include?(choice)
        choice = VALID_CHOICES[VALID_CHOICES_ABBR.index(choice)]
        break
      elsif VALID_CHOICES.include?(choice)
        break
      else
        prompt MESSAGES['invalid_choice']
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

    player_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)

    display_results(choice, computer_choice)
    sleep 1
    
    prompt "The current score is Player: #{player_score}, Computer: #{computer_score}."
    sleep 1

    break if player_score == 3 || computer_score == 3
  end

  if player_score == 3
    prompt MESSAGES['congrats']
  else 
    prompt MESSAGES['whooped']
  end 
  sleep 2

  prompt MESSAGES['play_again']
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt MESSAGES['goodbye']
