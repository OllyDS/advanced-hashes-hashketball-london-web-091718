require 'pry'

def game_hash
  {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        "Brendan Haywood" => {
          number:33,
          shoe:15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        }
      }
    }
  }
end

def num_points_scored(name)
  variable = 0
  game_hash.each do |h_or_a, team_attributes|
    team_attributes.each do |team_atts, players|
      if team_atts == :players
        players.each do |key, player_stat|
          if key == name
            variable = player_stat[:points]
          end
        end
      end
    end
  end
  return variable
end

def shoe_size(name)
  variable = 0
  game_hash.each do |h_or_a, team_attributes|
    team_attributes.each do |team_atts, players|
      if team_atts == :players
        players.each do |key, player_stat|
          if key == name
            variable = player_stat[:shoe]
          end
        end
      end
    end
  end
  return variable
end

def team_colors(name)
  variable = 0
  game_hash.each do |h_or_a, team_attributes|
    if name == "Brooklyn Nets"
      variable = team_attributes[:colors]
      return variable
    elsif name == "Charlotte Hornets"
      variable = game_hash[:away][:colors]
      return variable
    end
  end
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  return names
end

def player_numbers(team)
  numbers = []
  if team == "Brooklyn Nets"
    game_hash[:home][:players].each do |names, stats|
      numbers << stats[:number]
      # here I has to remember to shove << rather than assign =
      # so that it would collect all the numbers.
    end
  elsif team == "Charlotte Hornets"
    game_hash[:away][:players].each do |names, stats|
      numbers << stats[:number]
    end
  end
  return numbers
end

def player_stats(player_name)
  stat = {}
  game_hash.each do |h_a, atts|
    atts[:players].each do |players, stats|
      if players == player_name
        stat = stats.sort
      end
    end
  end
  return stat.to_h
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do |season, team_atts|
      team_atts[:players].each do |name, stats|
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end
