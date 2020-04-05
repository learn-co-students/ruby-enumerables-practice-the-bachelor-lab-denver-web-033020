require "pry"
def get_first_name_of_season_winner(data, season)
  data[season].find do |season|
   if season["status"] == "Winner"
    return season["name"].split.first 
end
end
end

def all_contestants(data)
  data.values.flatten
end

def get_contestant_name(data, occupation)
  contestants = all_contestants(data)
  contestants.each do |contestant|
   if contestant["occupation"] == occupation
    return contestant["name"]
end
end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  contestants = all_contestants(data)
  contestants.each do |contestant|
    if contestant["hometown"] == hometown
      # binding.pry
       count += 1
     
    end
  end
  count
end

def get_occupation(data, hometown)
  contestants = all_contestants(data)
  contestants.each do |contestant|
    if contestant["hometown"] == hometown
      return contestant["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  counter = 0 
  age = 0

    data[season].each do |contestants|
      contestants["age"] == "age"
        counter += 1
        age += contestants["age"].to_f
      end
      average_age_per_season = (age/counter).round
      return average_age_per_season
end

