class AddPostRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :post, index: true
    add_foreign_key :ratings, :posts
  end
end
