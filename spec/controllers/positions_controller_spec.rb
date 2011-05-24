require 'spec_helper'

describe PositionsController do

  before(:each) do
    @pos = Factory(:position)
  end
  
  describe "for signed in users" do
    
    describe "when user is not owner of the profile" do
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
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'edit', :id => @pos.id, :experience_page_id => @pos.experience_page
          assigns(:profile).should ==  @pos.experience_page.profile
        end
        
      end

      describe "GET 'new'" do
        it "should redirect to the sign in page" do
          get 'new', :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'new', :experience_page_id => @pos.experience_page
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'new', :experience_page_id => @pos.experience_page
          assigns(:profile).should == @pos.experience_page.profile
        end
      end

      describe "POST 'create'" do
        it "should redirect to the sign in page" do
          get 'new', :experience_page_id => @pos.experience_page, :position => @pos.attributes
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end

      describe "DELETE" do
        it "should redirect to the sign in page" do
          delete 'destroy', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
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
    
      describe "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@pos.experience_page))
        end
        
        it "should update the page attributes" do
          put 'update', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          @pos.reload.description.should == 'New Text'
        end
        
        it "should assign the requested position as @position" do
          put 'update', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          assigns(:position).should == @pos
        end
      end
    
      describe "GET 'new'" do
        it "should be successful" do
          get 'new', :experience_page_id => @pos.experience_page
          response.should be_success
        end
    
        it "should assign the request user as @position" do
          get 'new', :experience_page_id => @pos.experience_page
          assigns(:position).should be_a(Position)
        end
      end
      
      describe "POST 'create'" do
        it "should be successful" do
          post 'create', :experience_page_id => @pos.experience_page, :position => @pos.attributes.delete(:experience_page_id)
          response.should be_success
        end
    
        it "should assign the request user as @position" do
          post 'create', :experience_page_id => @pos.experience_page, :position => @pos.attributes
          assigns(:position).should be_a(Position)
        end
      end
      
      describe "DELETE" do
        it "should destroy the requested position" do
          lambda do
            delete 'destroy', :experience_page_id => @pos.experience_page, :id => @pos.id
          end.should change(Position, :count).by(-1)
        end
        
        it "should redirect to the edit experience page view" do  
          delete 'destroy', :experience_page_id => @pos.experience_page, :id => @pos.id
          response.should redirect_to(edit_experience_page_path(@pos.experience_page))
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
    
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end

      describe "GET 'new'" do
        it "should redirect to the sign in page" do
          put 'new', :experience_page_id => @pos.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "POST 'create'" do
        it "should redirect to the sign in page" do
          post 'create', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "DELETE" do
        it "should redirect to the sign in page" do
          delete 'destroy', :experience_page_id => @pos.experience_page, :id => @pos.id, :position => { :description => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
  end
end

