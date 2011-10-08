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
        it "should be successful" do
          get 'show', :id => @pp.id
          response.should be_success
        end
      end
    
      describe "GET 'edit'" do
        it "should raise a record not found exception" do
          expect { 
            new_subj = Factory(:subject_area)
            @valid_attributes = new_subj.attributes
            @valid_attributes.delete('sample_work_page_id')
            get 'edit', :id => @pp.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    
      describe "PUT 'update'" do
        it "should raise a record not found exception" do
          expect { 
            new_subj = Factory(:subject_area)
            @valid_attributes = new_subj.attributes
            @valid_attributes.delete('sample_work_page_id')
            put 'update', :id => @pp.id, :philosophy_page => { :philosophy => 'New Text' }
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
    
    
    
    describe "if user is owner" do
      before(:each) do
        sign_in_as(@pp.user)
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
        
        it "should assign the page name as @page_name" do
          get 'show', :id => @pp.id
          assigns(:page_name).should == 'My Teaching Philosophy'
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
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'edit', :id => @pp.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'edit', :id => @pp.id
          assigns(:profile).should == @pp.profile
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
          response.should be_success
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

