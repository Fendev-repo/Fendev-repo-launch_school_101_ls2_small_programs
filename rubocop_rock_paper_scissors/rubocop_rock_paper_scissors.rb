VALID_CHOICES = %w(rock paper scissors).freeze

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
    'Computer won!'
  else
    "It's a tie"
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  player = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = Kernel.gets.chomp

    VALID_CHOICES.include?(player) ? break : prompt("That's not a valid choice")
  end

  computer = VALID_CHOICES.sample

  prompt "You chose #{player}, the computer chose #{computer}"

  prompt display_results(player, computer)

  prompt('Do you want to play again?')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing, thank you')
