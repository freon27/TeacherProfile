require 'spec_helper'

describe PhilosophyPagesController do

  before(:each) do
    @pp = Factory(:philosophy_page)
  end
  
  describe "for signed in users" do
    describe "when user is not owner" do
      before(:each) do
        sign_in_as(Factory(:user))
      end 
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @pp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @pp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end
    end
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@pp.profile.user)
      end      
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @pp.id
          response.should be_success
        end
        
        it "should assign the requested page as @philosophy_page" do
          get 'show', :id => @pp.id
          assigns(:philosophy_page).should == @pp
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @pp.id
          response.should be_success
        end
    
        it "should assign the requested page as @philosophy_page" do
          get 'edit', :id => @pp.id
          assigns(:philosophy_page).should == @pp
        end
      end
    
      describe "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          response.should redirect_to(edit_philosophy_page_path(@pp))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          @pp.reload.philosophy.should == 'New Text'
        end
        
        it "should assign the requested page as @philosophy_page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          assigns(:philosophy_page).should == @pp
        end
      end
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @pp.id
          response.should be_success
        end
        
        it "should assign the requested page as @philosophy_page" do
          get 'show', :id => @pp.id
          assigns(:philosophy_page).should == @pp
        end
      end
    
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @pp.id
          response.should be_success
        end
    
        it "should assign the requested page as @philosophy_page" do
          get 'edit', :id => @pp.id
          assigns(:philosophy_page).should == @pp
        end
      end
    
      describe "PUT 'update'" do

        it "should redirect to the edit page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          response.should redirect_to(edit_philosophy_page_path(@pp))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          @pp.reload.philosophy.should == 'New Text'
        end
        
        it "should assign the requested page as @philosophy_page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          assigns(:philosophy_page).should == @pp
        end
      end
    end
  end
  describe "for non-signed in users" do
      describe "GET 'show'" do
        it "should redirect to the sign in page" do
          get 'show', :id => @pp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @pp.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          response.should redirect_to(sign_in_path)
        end
      end  
  end
end

