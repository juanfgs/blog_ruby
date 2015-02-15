class Rating < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user, presence: true, uniqueness: {scope: :post_id}
  validates :post, presence: true
  
end
