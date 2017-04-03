class AddSecondNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :second_name, :string
    add_column :users, :promotore, :string
    add_column :users, :token, :string
    add_column :users, :token_expire, :datetime
  end
end
