require 'pry'


def get_first_name_of_season_winner(data, season)
  winner_lady = data[season].find {|person_inf| person_inf['status'] == "Winner"}
  #binding.pry
  winner_lady['name'].split.first
end

def get_all_ladies data
  ladies = []
  data.each do |season|
    season[1].each do |person_inf|
      ladies << person_inf
    end
  end
  ladies
end

def get_contestant_name(data, occupation)
  ladies = get_all_ladies data 
  lady_name_by_occup = ladies.find {|person_inf| person_inf['occupation'] == occupation}
  lady_name_by_occup['name']
end

def count_contestants_by_hometown(data, hometown)
  count_persons_by_town = 0
  data.each do |season, persons_arr|
    persons_arr.each do |facts| 
      if facts['hometown'] == hometown
        count_persons_by_town += 1
      end
    end
  end
  count_persons_by_town
end

def get_occupation(data, hometown)
  ladies = get_all_ladies data 
  lady_occup_by_town = ladies.find {|person_inf| person_inf['hometown'] == hometown}
  lady_occup_by_town['occupation']
end

def get_average_age_for_season(data, season)
  ladies_ages = []
  data[season].each {|person_inf| 
     ladies_ages << person_inf['age']
  }
  #binding.pry
  ladies_ages_int = ladies_ages.map {|i| i.to_f}
  average = ladies_ages_int.inject(&:+)/ladies_ages_int.length
  average.round
end
