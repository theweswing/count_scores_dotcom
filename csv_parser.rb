require 'csv'

table = CSV.parse(File.read('./vintage_catan_data.csv'), headers: true)
pp(table)

pp(table.by_col[0])

def gather_dates(dates_column)
  all_dates = []
  dates_column.each do |given_column|
    if given_column != nil
      split = given_column.split(' ')
      date = split[0]
      daymonthyear = date.split('/')
      if daymonthyear[2].length == 2
        year = '20' + daymonthyear[2]
        daymonthyear[2] = year
        date = "#{daymonthyear[0]}/#{daymonthyear[1]}/#{year}"
      end
      all_dates.push(date)
    end
  end
  return all_dates
end

def gather_date(date_cell)
  if date_cell != nil
    split = date_cell.split(' ')
    date = split[0]
    daymonthyear = date.split('/')
    if daymonthyear[0].length == 1
      day = '0' + daymonthyear[0]
      daymonthyear[0] = day
    end
    if daymonthyear[1].length == 1
      month = '0' + daymonthyear[1]
      daymonthyear[1] = month
    end
    if daymonthyear[2].length == 2
      year = '20' + daymonthyear[2]
      daymonthyear[2] = year
      date = "#{daymonthyear[0]}/#{daymonthyear[1]}/#{year}"
    end
  end
  return date
end

pp(gather_dates(table.by_col[0]))

def smart_gather_dates(dates_column)
  all_dates = []
  dates_column.each do |given_date_cell|
    date = gather_date(given_date_cell)
    all_dates.push(date)
  end
  return all_dates
end

pp(smart_gather_dates(table.by_col[0]))

def find_user_by_player_name(player)
  users = User.all
  player_name = player[:name].downcase
  users.each do |given_user|
    user_first_name = user[:first_name].downcase
    if user_first_name == player_name
      player.user_id = given_user.id
      player.email = given_user.email
    end
  end
  return player
end

def pull_scores_from_row(table)
  all_matches = []
  row_counter = 0
  dates_column = table.by_col[0]
  headers = table.headers
  dates_column.each do |given_row|
    new_match = { date: gather_date(given_row), game_id: 1, players: [] }
    column_counter = 2
    while column_counter <= 24
      operating_column = table.by_col[column_counter]
      if (operating_column[row_counter] != nil)
        new_player = {
          name: table.headers[column_counter],
          score: operating_column[row_counter],
          is_winner: false,
          user_id: 1,
          email: nil,
        }
        if operating_column[row_counter].to_i >= 10
          new_player = {
            name: table.headers[column_counter],
            score: operating_column[row_counter],
            is_winner: true,
            user_id: 1,
            email: nil,
          }
        end
        new_player = find_user_by_player_name(new_player)
        new_match[:players].push(new_player)
      end
      column_counter += 1
    end
    pp(new_match)
    row_counter += 1
  end
end

pull_scores_from_row(table)
