class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each { |player,strategy| strategy.downcase! }
  raise NoSuchStrategyError unless game.any?{ |player,strategy| ['r','p','s'].include?(strategy)}

  def beats?(one,two)
    case one
      when 'r'
        return two == 's' ? true : false
      when 'p'
        return two == 'r' ? true : false
      when 's'
        return two == 'p' ? true : false
    end
  end

  hash = {}
  game.each { |player,strategy| hash[strategy] = player }

  #same strategies
  if hash.keys.size == 1
    return game[0]
  end

  if beats?(hash.keys[0],hash.keys[1])
    return game[0]
  else
    return game[1]
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].kind_of? String
    winner0 = rps_game_winner(tournament)
  else
    winner0 = rps_tournament_winner(tournament[0])
  end

  if tournament[1][0].kind_of? String
    winner1 = rps_game_winner(tournament)
  else
    winner1 = rps_tournament_winner(tournament[1])
  end

  return rps_game_winner([winner0,winner1])
end

p rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ])
p rps_game_winner([ [ "Armando", "R" ], [ "Dave", "S" ] ])
p rps_game_winner([ [ "Dave", "S" ],[ "Armando", "S" ] ])
p rps_tournament_winner([
                            [
                                [ ["Armando", "P"], ["Dave", "S"] ],
                                [ ["Mihai", "R"],  ["Artem", "S"] ],
                            ],
                            [
                                [ ["Allen", "S"], ["Omer", "P"] ],
                                [ ["David E.", "R"], ["Richard X.", "P"] ]
                            ]
                        ])
