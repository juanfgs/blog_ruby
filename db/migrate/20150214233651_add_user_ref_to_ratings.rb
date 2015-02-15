class AddUserRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :user, index: true
    add_foreign_key :ratings, :users
  end
end
