require 'spec_helper'

describe SampleWorkPagesController do
  before(:each) do 
    @swp = Factory(:sample_work_page)
  end
  describe "for signed in users" do
    before(:each) do
      @populated_sa = Factory(:subject_area)
      @swp = @populated_sa.sample_work_page
      sign_in_as(@swp.user)
    end
    describe "when current user is the owner" do
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @swp.id
          response.should be_success
        end
        it "should assign the requested page as @sample_work_page" do
          get 'show', :id => @swp.id
          assigns(:sample_work_page).should == @swp
        end
        it "should assign only the associated subject areas that have projects as @subject_areas" do
          populated_subject_area = Factory(:subject_area_with_project, :sample_work_page => @swp)
          @swp.subject_areas = [populated_subject_area]
          @swp.subject_areas.push(Factory(:subject_area, :sample_work_page => @swp))
          @swp.save!
          get 'show', :id => @swp.id
          assigns(:subject_areas).should == [populated_subject_area]
        end
        it "should assign the 'sample_work_pages/project_list as @side_bar_name'" do
          get 'show', :id => @swp.id
          assigns(:side_bar_name).should == 'subject_area_list'
        end
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
          get 'edit', :id => @swp.id
          assigns(:subject_areas).should == @populated_sa.sample_work_page.subject_areas.includes(:projects)
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get 'edit', :id => @swp.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end 
      describe "PUT update" do
        describe "with valid params" do
          it "should assign the requested page as @sample_work_page" do
            put 'update', :id => @swp.id, :sample_work_page => { :published => true }
            assigns(:sample_work_page).should == @swp
          end
          it "should redirect to the sample work page edit path" do
            put 'update', :id => @swp.id, :sample_work_page => { :published => true }
            response.should redirect_to(edit_sample_work_page_path(@swp.id))
          end
          it "should assign the requested page as @sample_work_page" do
            put 'update', :id => @swp.id, :sample_work_page => { :published => true }
            assigns(:sample_work_page).should == @swp
          end
          it "should update the sample work page" do
            @swp.published = false
            @swp.save
            put 'update', :id => @swp.id, :sample_work_page => { :published => true }
            assigns(:sample_work_page).published.should == true
          end
        end
        describe "with invalid params" do
          it "should render the edit template" do
            put 'update', :id => @swp.id, :sample_work_page => { :published => nil }
            response.should render_template(:edit)
          end
        end
      end
      
    end 
    describe "when current user is not the owner" do
      before(:each) do
        @another_swp = Factory(:sample_work_page)
      end
      describe "GET 'show'" do
        it "should be successful" do
          get 'show', :id => @swp.id
          response.should be_success
        end
        it "should raise a not found exception" do
          expect { 
            get 'edit', :id => @another_swp.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "PUT update" do
        it "should raise a not found exception" do
          expect { 
            put 'update', :id => @another_swp.id, :sample_work_page => { :published => true }
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end 
  end
  describe "for non-signed in users" do 
    describe "GET 'show'" do
      it "should be successful" do
        get 'show', :id => @swp.id
        response.should be_success
      end
    end
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        get 'edit', :id => @swp.id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "PUT update" do
      it "should redirect to the sign in page" do
        put 'update', :id => @swp.id, :sample_work_page => { :published => true }
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
