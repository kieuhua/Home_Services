require 'rails_helper'

RSpec.describe :user, type: :model do
  
  it "has none to begin with" do
    expect(Profile.count).to eq 0
  end
  
  context "create an user" do
     let! (:profile) { create :profile }
 
     it "has one after adding one" do    
        expect(Profile.count).to eq 1
        expect(profile.city).to match(/Acton/)
     end
  end
end
