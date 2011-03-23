require 'spec_helper'

describe PositionsController do

  before(:each) do
    @pos = Factory(:position)
  end
  
  describe "for signed in users" do
    describe "when user is not owner" do
      before(:each) do
        sign_in_as(Factory(:user))
      end 
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end

      pending "GET 'new'" do
        it "should redirect to the sign in page" do
          get 'new', :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      pending "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
    end
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@pos.experience_page.profile.user)
      end      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should be_success
        end
        
        it "should assign the requested position as @position" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:position).should == @pos
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should be_success
        end
    
        it "should assign the requested position as @position" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:position).should == @pos
        end
        
      end
    
      pending "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@pos))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          @pos.reload.introduction.should == 'New Text'
        end
        
        it "should assign the requested position as @position" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          assigns(:position).should == @pos
        end
      end
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should be_success
        end
        
        it "should assign the requested position as @position" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:position).should == @pos
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should be_success
        end
    
        it "should assign the request user as @position" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:position).should == @pos
        end
      end
    
      pending "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@pos))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          @pos.reload.introduction.should == 'New Text'
        end
        
        it "should assign the requested position as @position" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          assigns(:position).should == @pos
        end
      end
    end
  end
  describe "for non-signed in users" do
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      pending "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @pos.id, :position => { :introduction => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end  
  end
end

