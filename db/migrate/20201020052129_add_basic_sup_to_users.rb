class AddBasicSupToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superior, :boolean
  end
end
