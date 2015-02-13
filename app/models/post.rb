class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, :styles => { :large =>  "750x370#", :medium => "300x150>", :thumb => "100x50>" }, :default_url => "/images/:style/missing.png"
  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|png)$/
  validates_attachment_size :image, :less_than => 2.megabytes

  belongs_to :user
end
