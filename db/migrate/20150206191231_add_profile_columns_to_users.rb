class AddProfileColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users,  :summary, :text
    add_column :users,  :facebook, :string
    add_column :users,  :twitter, :string    
  end
end
