class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid, null:false
      t.string :password
      t.string :salt      
      t.timestamps
    end
  end
end
