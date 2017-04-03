# coding: utf-8

#
# - import users
#

require 'spreadsheet' 

desc 'import users'

task :import_users => :environment do

  puts " ---- process start -----"

  Spreadsheet.open("#{Rails.root}/public/users.xls") do |user|
    user.worksheet('ELENCO').each 1 do |row|
      break if row[0].nil?

      #create group
      user_group = nil
      if row[1].present?
        user_group = UserGroup.find_or_create_by!(name: row[1])
      end

      # create user      
      email = row[3].nil? ? ("#{row[5]}"+".#{row[4]}@iwbank.it").downcase! : row[3]
      user = User.find_by(email: email)
      second_name = "#{row[6]} #{row[7]}"

      if user.present?
        options = {email: email, promotore: row[0], manager_id: row[2], first_name: row[5], last_name: row[4], second_name: second_name}
        user.update_attributes!(options)
      else
        password = SecureRandom.hex(10)
        options = {email: email, password: password, password_confirmation: password, promotore: row[0], manager_id: row[2], first_name: row[5], last_name: row[4], second_name: second_name}
        user = User.create!(options)
      end

      # create user group
      if user_group.present?
        unless user.user_groups.include?(user_group)
         user.user_groups << user_group
        end
      end
    end

  end

  puts " ------ process end ----------"

end