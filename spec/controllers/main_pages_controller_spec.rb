require 'spec_helper'

describe MainPagesController do

  before(:each) do
    @mp = Factory(:main_page)
  end
  
  describe "for signed in users" do
    describe "when user is not owner" do
      before(:each) do
        sign_in_as(Factory(:user))
      end 
      describe "GET 'show'" do
        it "should be successful" do        
          get 'show', :id => @mp.id
          response.should be_success
        end
      end
    
      describe "GET 'edit'" do
        it "should raise a not found exception" do        
          expect { 
            get 'edit', :id => @mp.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "PUT 'update'" do
        it "should raise a not found exception" do        
          expect { 
            put 'update', :id => @mp.id, :main_page => { :introduction => 'New Text' }
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@mp.profile.user)
      end      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @mp.id
          response.should be_success
        end
        
        it "should assign the requested page as @main_page" do
          get 'show', :id => @mp.id
          assigns(:main_page).should == @mp
        end
        
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @mp.id
          response.should be_success
        end
    
        it "should assign the requested page as @main_page" do
          get 'edit', :id => @mp.id
          assigns(:main_page).should == @mp
        end
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'edit', :id => @mp.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'edit', :id => @mp.id
          assigns(:profile).should == @mp.profile
        end
        
      end
    
      describe "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :id => @mp.id, :main_page => { :introduction => 'New Text' }
          response.should redirect_to(edit_main_page_path(@mp))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @mp.id, :main_page => { :introduction => 'New Text' }
          @mp.reload.introduction.should == 'New Text'
        end
        
        it "should assign the requested page as @main_page" do
          put 'update', :id => @mp.id, :main_page => { :introduction => 'New Text' }
          assigns(:main_page).should == @mp
        end
      end
    end
  end
  describe "for non-signed in users" do
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @mp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @mp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @mp.id, :main_page => { :introduction => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end  
  end
end

