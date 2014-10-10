class DropFirstAndLastNameFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :first_name, :string
    remove_column :people, :last_name, :string
  end
end
