require "rails_helper"

RSpec.describe Rating do
  

  it "only allows one rating per user"do
    @user = User.create(uid: 'test@foobar.com', password:'asdasd123', password_confirmation: 'asdasd123', name: 'Pepito Juarez' )
    @post = Post.create(title: 'fooobar', content:'fdsafdsa', user:@user, image:File.new(Rails.root + 'spec/fixtures/img/index.jpg'))
    expect(Rating.create user:@user, post: @post, rating:5).to be_valid
    expect(Rating.create user:@user, post: @post, rating:5).to_not be_valid
  end

  
end
