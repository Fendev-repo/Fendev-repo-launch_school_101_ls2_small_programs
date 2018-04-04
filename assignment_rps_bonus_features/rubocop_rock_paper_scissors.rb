VALID_CHOICES = %w[rock paper scissors spock lizard].freeze

MEMBERS_AND_VICTIMS = {
  scissors: %w[paper lizard],
  paper: %w[rock spock],
  lizard: %w[spock paper],
  spock: %w[scissors rock],
  rock: %w[scissors lizard]
}.freeze

MEMBERS_AND_INSULTS = {
  scissors: ['Try not to get cut up about it.'],
  paper: ['Looks like the computer had you.... covered.'],
  lizard: ['The lizard smiles...'],
  spock: ['Logically, you are the looser...'],
  rock: ['Rock to the face...']
}.freeze

MEMBERS = %w[scissors paper lizard spock rock].freeze

def prompt_user(msg)
  puts msg
end

def collect_input
  gets.chomp.downcase
end

def computer_chooses
  VALID_CHOICES.sample
end

def shine_the_player_on(c_selection)
  MEMBERS_AND_INSULTS[c_selection.to_sym]
end

def it_a_tie?(p_selection, c_selection)
  p_selection == c_selection
end

def player_wins?(p_selection, c_selection)
  potential_victims = MEMBERS_AND_VICTIMS[p_selection.to_sym]
  potential_victims.include?(c_selection)
end

def announce_results(winner)
  prompt_user(winner.to_s)
end

def print_computers_choice(c_selection)
  prompt_user("The computer chooses #{c_selection}")
end

def congratualate_winner(game_score)
  if game_score[:player] >= 5
    'Well done - you won 5 games first! you are the winner'
  elsif game_score[:computer] >= 5
    'Oh well - you lost 5 games first! you lost the game'
  end
end

def current_score(game_score)
  <<-SCORE
    The current score - you are on #{game_score[:player]}
    and the computer is on #{game_score[:computer]}
    SCORE
end

def finished_game(game_score)
  if game_score[:player] >= 5
    true
  elsif game_score[:computer] >= 5
    true
  end
end

def confirm_who_wins(p_selection, c_selection, game_score)
  if it_a_tie?(p_selection, c_selection)
    "It's a tie"
  elsif player_wins?(p_selection, c_selection)
    game_score[:player] += 1
    'Look at that - you win! woohoo'
  else
    game_score[:computer] += 1
    'The computer beats you on that game!'
  end
end

prompt_user 'Welcome to the Rock, Paper, Scissors, Spock and Lizard Game!'

continue = ''
game_score = { player: 0, computer: 0 }

# Main game loop.
loop do
  players_selection = ''
  loop do
    prompt_user "What is your choice #{VALID_CHOICES.join(', ')}?"
    players_selection = collect_input

    if VALID_CHOICES.include?(players_selection)
      break
    elsif MEMBERS.grep(/#{players_selection}/).size == 1
      players_selection = MEMBERS.grep(/#{players_selection}/)
      players_selection = players_selection[0]
      break
    elsif MEMBERS.grep(/#{players_selection}/).size == 2
      options = MEMBERS.grep(/#{players_selection}/)
      prompt_user "You entered #{players_selection} - did you mean #{options}"
    elsif players_selection.strip.empty?
      prompt_user "You didn't enter anything? - try again"
    else
      prompt_user "#{players_selection} - hmmm??"
      prompt_user 'take a look at the options again'
    end
  end

  computers_selection = computer_chooses
  print_computers_choice(computer_chooses)
  winner = confirm_who_wins(players_selection, computers_selection, game_score)
  announce_results(winner)

  if winner == 'The computer beats you on that game!'
    prompt_user shine_the_player_on(computers_selection)
  end

  prompt_user current_score(game_score)
  prompt_user congratualate_winner(game_score)

  break if finished_game(game_score)

  prompt_user 'You enjoying the game-play?'
  print "care for another round? ('n' to exit) or any other key to continue"
  continue = collect_input
  break if continue == 'n'
end
