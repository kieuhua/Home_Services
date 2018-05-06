require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has none to begin with" do
    expect(User.count).to eq 0
  end
  
  context "create an user" do
     let! (:user) { create :user }
 
     it "has one after adding one" do    
        expect(User.count).to eq 1
     end
  
     it "has firstname attribute" do
        expect(user.firstname).to match(/Kieu/)
     end
     it "has lastname attribute" do
          expect(user.lastname).to match(/Hua/)
       end
  end
end
