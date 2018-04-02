VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') || 
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
      prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    "Computer won!"
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
    player = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer = VALID_CHOICES.sample

  prompt "You chose #{player}, the computer chose #{computer}"

  prompt display_results(player, computer)
  

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, thank you")