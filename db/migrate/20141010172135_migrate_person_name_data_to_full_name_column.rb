class MigratePersonNameDataToFullNameColumn < ActiveRecord::Migration
  def change
    Person.all.each do |person|
      str  = person.first_name
      str << " "
      str << person.last_name

      person.full_name = str
    end
  end
end

# class MigratePersonNameDataToFullNameColumn < ActiveRecord::Migration
#   def change
#     begin
#       Person.all.each do |person|
#         str  = person.first_name
#         str << " "
#         str << person.last_name

#         person.full_name = str
#       end
#     rescue
#       # left blank intentionally
#     end
#   end
# end
