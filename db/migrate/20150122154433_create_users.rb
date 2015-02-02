class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.add_column name, :string 
      t.add_column email, :string 
      t.add_column password, :hashed_password
      t.add_Column salt, :salt
      t.timestamps
    end
  end
end
