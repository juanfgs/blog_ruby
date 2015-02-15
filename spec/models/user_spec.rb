require "rails_helper"

RSpec.describe User do
  
  it "validates email if no provider is set" do
    expect(@user = User.create(uid: '421432', password:'asdasd123', password_confirmation: 'asdasd123', name: 'Pepito Juarez' )).to_not be_valid
  end

  it "returns user if secret is correct" do
    @user = User.create(uid: 'foo@baz.com', password:'asdasd123', password_confirmation: 'asdasd123', name: 'Pepito Juarez' )

    
  end
  
end
