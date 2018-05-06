require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
    let! (:user) { create :user }
    render_views
    
   describe "GET redirect" do
      it "has a 200 status code" do
         sign_in user.email, user.password 
      
         get :index
         expect(response.status).to eq(302)
      end
      
      it " has empty body" do
          sign_in user.email, user.password          
          expect(response.body).to eq ""
      end
      
      it "render categories" do
          get 'index'
          sign_in user.email, user.password          
          expect(response.body).to match(/categories/)
      end
      
      
   end
end