require 'spec_helper'

describe SampleWorkPagesController do
  before(:each) do 
    @swp = Factory(:sample_work_page)
  end
  describe "for signed in users" do
    describe "when current user is the owner" do
      before(:each) do
        sign_in_as(@swp.profile.user)
      end
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :id => @swp.id
          response.should be_success
        end
        it "should assign the requested page as @sample_work_page" do
          get 'edit', :id => @swp.id
          assigns(:sample_work_page).should == @swp
        end
        it "should assign the associated subject areas as @subject_areas" do
          @populated_sa = Factory(:subject_area)
          get 'edit', :id => @populated_sa.sample_work_page.id
          assigns(:subject_areas).should == @populated_sa.sample_work_page.subject_areas
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get 'edit', :id => @swp.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end 
    end 
    describe "when current user is not the owner" do
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @swp.id
          response.should redirect_to(sign_in_path)
        end
      end
    end 
  end
  describe "for non-signed in users" do 
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        get 'edit', :id => @swp.id
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
