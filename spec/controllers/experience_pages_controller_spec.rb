require 'spec_helper'

describe ExperiencePagesController do

  before(:each) do
    @ep = Factory(:experience_page_with_position)
  end
  
  describe "for signed in users" do
    describe "when user is not owner" do
      before(:each) do
        sign_in_as(Factory(:user))
      end 
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @ep.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @ep.id
          response.should redirect_to(sign_in_path)
        end
      end
    
    end
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@ep.profile.user)
      end      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @ep.id
          response.should be_success
        end
        
        it "should assign the requested page as @experience_page" do
          get 'show', :id => @ep.id
          assigns(:experience_page).should == @ep
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @ep.id
          response.should be_success
        end
    
        it "should assign the requested page as @experience_page" do
          get 'edit', :id => @ep.id
          assigns(:experience_page).should == @ep
        end
        
        it "should assign the associated positions as @positions" do
          get 'edit', :id => @ep.id
          assigns(:positions).should == @ep.positions
        end
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'edit', :id => @ep.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'edit', :id => @ep.id
          assigns(:profile).should == @ep.profile
        end

      end
    
    end
  end
  describe "for non-signed in users" do
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @ep.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @ep.id
          response.should redirect_to(sign_in_path)
        end
      end
  end
end

