require 'spec_helper'

describe QualificationsController do

  before(:each) do
    @qual = Factory(:qualification)
  end
  
  describe "for signed in users" do
    
    describe "when user is not owner of the profile" do
      before(:each) do
        sign_in_as(Factory(:user))
      end
      
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end

      describe "GET 'new'" do
        it "should redirect to the sign in page" do
          get 'new', :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end

      pending "POST 'create'" do
        it "should redirect to the sign in page" do
          get 'new', :experience_page_id => @qual.experience_page, :qualification => @qual.attributes
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end

      describe "DELETE" do
        it "should redirect to the sign in page" do
          delete 'destroy', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
      
    end 
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@qual.experience_page.profile.user)
      end      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should be_success
        end
        
        it "should assign the requested qualification as @qualification" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          assigns(:qualification).should == @qual
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should be_success
        end
    
        it "should assign the requested qualification as @qualification" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          assigns(:qualification).should == @qual
        end
        
      end
    
      describe "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@qual.experience_page))
        end
        
        it "should update the page attributes" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          @qual.reload.location.should == 'New Text'
        end
        
        it "should assign the requested qualification as @qualification" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          assigns(:qualification).should == @qual
        end
      end
      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should be_success
        end
        
        it "should assign the requested qualification as @qualification" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          assigns(:qualification).should == @qual
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should be_success
        end
    
        it "should assign the request user as @qualification" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          assigns(:qualification).should == @qual
        end
      end
    
      describe "GET 'new'" do
        it "should be successful" do
          get 'new', :experience_page_id => @qual.experience_page
          response.should be_success
        end
    
        it "should assign the request user as @qualification" do
          get 'new', :experience_page_id => @qual.experience_page
          assigns(:qualification).should be_a(Qualification)
        end
      end
      
      describe "POST 'create'" do
        it "should be successful" do
          post 'create', :experience_page_id => @qual.experience_page, :qualification => @qual.attributes.delete(:experience_page_id)
          response.should be_success
        end
    
        it "should assign the request user as @qualification" do
          post 'create', :experience_page_id => @qual.experience_page, :qualification => @qual.attributes
          assigns(:qualification).should be_a(Qualification)
        end
      end
      
      describe "PUT 'update'" do
        it "should redirect to the edit page" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@qual.experience_page))
        end
        
        it "should update the page attributes" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          @qual.reload.location.should == 'New Text'
        end
        
        it "should assign the requested qualification as @qualification" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          assigns(:qualification).should == @qual
        end
      end
      
      describe "DELETE" do
        it "should destroy the requested qualification" do
          lambda do
            delete 'destroy', :experience_page_id => @qual.experience_page, :id => @qual.id
          end.should change(Qualification, :count).by(-1)
        end
        
        it "should redirect to the edit experience page view" do  
          delete 'destroy', :experience_page_id => @qual.experience_page, :id => @qual.id
          response.should redirect_to(edit_experience_page_path(@qual.experience_page))
        end
        
      end
    end
  end
  
  describe "for non-signed in users" do
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @qual.id, :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end

      describe "GET 'new'" do
        it "should redirect to the sign in page" do
          put 'new', :experience_page_id => @qual.experience_page
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "POST 'create'" do
        it "should redirect to the sign in page" do
          post 'create', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "DELETE" do
        it "should redirect to the sign in page" do
          delete 'destroy', :experience_page_id => @qual.experience_page, :id => @qual.id, :qualification => { :location => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
  end
end

