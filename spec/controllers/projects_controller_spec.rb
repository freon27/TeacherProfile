require 'spec_helper'

describe ProjectsController do
  before(:each) do
    @project = Factory(:project)
    @subject_area = @project.subject_area
  end
  describe "for signed in users" do
    before(:each) do
      sign_in_as(@subject_area.sample_work_page.profile.user)
    end
    describe "if they own the profile" do
      describe "GET new" do
        it "should assign the subject area as @subject_area" do
          get :new, :subject_area_id => @subject_area.id
          assigns(:subject_area).should == @subject_area
        end
        it "should assign a new project as @project" do
          get :new, :subject_area_id => @subject_area.id
          assigns(:project).should be_a(Project)
          assigns[:project].should be_new_record
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get :new, :subject_area_id => @subject_area.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      describe "POST 'create'" do
        describe "with valid params" do
          before(:each) do
            @valid_attributes = Factory(:project).attributes
            @valid_attributes.delete('subject_area')
          end
          it "should create a new project area" do
            lambda {
              post 'create', :subject_area_id => @subject_area.id, :project => @valid_attributes
            }.should change(Project, :count).by(1)
          end
        end
      end
      describe "GET 'edit'" do
        it "should assigned the subject area as @subject_area" do
          get 'edit', :subject_area_id => @subject_area.id, :id => @subject_area
          assigns(:subject_area).should == @subject_area
        end
        it "should assigned the project as @project" do
          get 'edit', :subject_area_id => @subject_area.id, :id => @subject_area
          assigns(:project).should == @project
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get 'edit', :subject_area_id => @subject_area.id, :id => @subject_area
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      describe "PUT 'update" do
        describe "with valid params" do
          it "should redirect to the edit page" do
            put 'update', :subject_area_id => @subject_area.id, :id => @project.id, :project => { :name => 'new name' }
            response.should redirect_to(edit_subject_area_project_path(@subject_area.id, @project.id))
          end
          it "should update the project" do
            put 'update', :subject_area_id => @subject_area.id, :id => @project.id, :project => { :name => 'new name' }
            assigns(:project).name.should == 'new name'
          end
        end
        describe "with invalid params" do
          it "should render the edit page" do
            put 'update', :subject_area_id => @subject_area.id, :id => @project.id, :project => { :name => '' }
            response.should render_template :action => 'edit'
          end
        end
      end
      describe "DELETE 'destroy'" do
        it "should delete the requested project" do
          lambda {
            delete 'destroy', :subject_area_id => @subject_area.id, :id => @project.id
          }.should change(Project, :count).by(-1)
        end
        it "should display the edit subject area page" do
          delete 'destroy', :subject_area_id => @subject_area.id, :id => @project.id
          response.should redirect_to edit_sample_work_page_subject_area_path(@subject_area.sample_work_page.id, @subject_area.id)
        end
      end
    end
    
    describe "if they do not own the subject area/project" do
      before(:each) do
        @another_subject_area = Factory(:subject_area)
      end
      describe "GET new" do
        it "should raise a not found exception" do
          expect { 
            get :new, :subject_area_id => @another_subject_area.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "POST 'create'" do
        it "should redirect to the sign in page" do
          expect { 
            post 'create', :subject_area_id => @another_subject_area.id, :id => @project.id, :project => @project.attributes
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do        
          expect { 
            get 'edit', :subject_area_id => @another_subject_area.id, :id => @project
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "PUT 'update'" do
        it "should redirect to the sign in page" do        
          expect { 
            put 'update', :subject_area_id => @another_subject_area.id, :id => @project.id, :project => @project.attributes
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "DELETE 'destroy'" do
        it "should redirect to the sign in page" do        
          expect { 
            delete 'destroy', :subject_area_id => @another_subject_area.id, :id => @project.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
  describe "for non-signed in users" do
    describe "GET 'new" do
      it "should redirect to the sign in page" do
        get :new, :subject_area_id => @subject_area.id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "POST 'create'" do
      it "should redirect to the sign in page" do
        post 'create', :subject_area_id => @subject_area.id,  :id => @project.id, :project => @project.attributes
        response.should redirect_to(sign_in_path)
      end
    end
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        get 'edit', :subject_area_id => @subject_area.id, :id => @project.id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "PUT 'update'" do
      it "should redirect to the sign in page" do
        put 'update', :subject_area_id => @subject_area.id, :id => @project.id, :project => @project.attributes
        response.should redirect_to(sign_in_path)
      end
    end
    describe "DELETE 'destroy'" do
      it "should redirect to the sign in page" do
        delete 'destroy', :subject_area_id => @subject_area.id, :id => @project.id
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
