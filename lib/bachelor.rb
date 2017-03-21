require "pry"
def get_first_name_of_season_winner(data, season)

  data.each do |season_number, info_array|
    if season_number == season
      info_array.each do |x|
        x.each do |k, v|
        return v.split(" ")[0] if x.values.include?("Winner") && k == "name"
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_number, info_array|
    info_array.each do |x|
      x.each do |k, v|
        return v if x.values.include?(occupation) && k == "name"
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0

  data.each do |season, info_array|
    info_array.each do |x|
      x.each do |k, v|
        count += 1 if v == hometown
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  occupation = []

  data.each do |season, info_array|
    info_array.each do |x|
      x.each do |k, v|
        occupation << v if x.values.include?(hometown) && k == "occupation"
      end
    end
  end
  occupation[0]
end

def get_average_age_for_season(data, season)
  ages = []

  data.each do |season_number, info_array|
    if season_number == season
      info_array.each do |x|
        x.each do |k, v|
          ages << v.to_f if k == "age"
        end
      end
    end
  end
  ((ages.inject(0, :+))/ages.length).round
end
