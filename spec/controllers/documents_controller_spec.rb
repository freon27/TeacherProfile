require 'spec_helper'

describe DocumentsController do
  before(:each) do
    @document = Factory(:document)
    @project = @document.project
  end
  describe "for logged in users" do
    describe "when they own the project/document" do
      before(:each) do
        sign_in_as(@document.user)
      end
      describe "GET new" do
        it "should assign the project as @project" do
          get :new, :project_id => @project.id
          assigns(:project).should == @project
        end
        it "should assign a new document as @document" do
          get :new, :project_id => @project.id
          assigns(:document).should be_a(Document)
          assigns(:document).should be_new_record
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get :new, :project_id => @project.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      describe "POST create" do
        describe "with valid params" do
          before(:each) do
            @valid_attributes = Factory(:document).attributes
            @valid_attributes.delete('project')
          end
          it "should create a new project area" do
            lambda {
              post :create, :project_id => @project.id, :document => @valid_attributes
            }.should change(Document, :count).by(1)
          end
          it "should redirect to the edit project page" do
            post :create, :project_id => @project.id, :document => @valid_attributes
            response.should redirect_to(edit_subject_area_project_path(@project.subject_area, @project))
          end
          it "should assign @side_bar_name with value 'profiles/page_links'" do
            post :create, :project_id => @project.id, :document => @valid_attributes
            assigns(:side_bar_name).should == 'profiles/page_links'
          end
        end
        describe "with invalid params" do
          it "should render the new view" do
            post :create, :project_id => @project.id, :document => { :caption => '' }
            response.should render_template(:new)
          end
        end
      end
      describe "GET edit" do
        it "should assign the project as @project" do
          get :edit, :project_id => @project.id, :id => @document.id
          assigns(:project).should == @project
        end
        it "should assign  the document as @document" do
          get :edit, :project_id => @project.id, :id => @document.id
          assigns(:document).should == @document
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get :edit, :project_id => @project.id, :id => @document.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      describe "PUT update" do
        describe "with valid parameters" do
          it "should assign the project as @project" do
            put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
            assigns(:project).should == @project
          end
          it "should assign a new document as @document" do
            put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
            assigns(:document).should == @document
          end
          it "should assign @side_bar_name with value 'profiles/page_links'" do
            put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
            assigns(:side_bar_name).should == 'profiles/page_links'
          end
          it "should redirect to the edit project page" do
            put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
            response.should redirect_to(edit_subject_area_project_path(@project.subject_area.id, @project.id))
          end
          it "should update the document" do
             put :update, :project_id => @project.id, :id => @document.id, :document => { :caption => 'New caption' }
             assigns(:document).caption.should == 'New caption'
          end
        end
        describe "with invalid parameters" do
          it "should render the edit page" do
            put :update, :project_id => @project.id, :id => @document.id, :document => { :caption => '' }
            response.should render_template(:edit)
          end
        end
      end
      describe "DELETE destroy" do
        it "should delete the document" do
          lambda {
            delete :destroy, :project_id => @project.id, :id => @document.id
          }.should change(Document, :count).by(-1)
        end
        it "should redirect to the project edit page" do
          delete :destroy, :project_id => @project.id, :id => @document.id
          response.should redirect_to(edit_subject_area_project_path(@project.subject_area.id, @project.id))
        end
      end
    end
    describe "when they do not own the project/document" do
      before(:each) do
        another_user = Factory(:user)
        sign_in_as(another_user)
      end
      describe "GET new" do
        it "should raise a not found exception" do
          expect { 
            get :new, :project_id => @project.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "POST create" do
        it "should raise a not found exception" do
          expect { 
            post :create, :project_id => @project.id, :document => @document.attributes
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "GET edit" do
        it "should raise a not found exception" do
          expect { 
            get :edit, :project_id => @project.id, :id => @document.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "PUT update" do
        it "should raise a not found exception" do
          expect { 
            put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "DELETE destroy" do
        it "should raise a not found exception" do
          expect { 
            delete :destroy, :project_id => @project.id, :id => @document.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
  describe "for non-logged in users" do
    describe "GET new" do
      it "should redirect to the sign in page" do
        get :new, :project_id => @project.id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "POST create" do
      it "should redirect to the sign in page" do
        post :create, :project_id => @project.id, :document => @document.attributes
        response.should redirect_to(sign_in_path)
      end
    end
    describe "GET edit" do
      it "should redirect to the sign in page" do
        get :edit, :project_id => @project.id, :id => @document.id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "PUT update" do
      it "should redirect to the sign in page" do
        put :update, :project_id => @project.id, :id => @document.id, :document => @document.attributes
        response.should redirect_to(sign_in_path)
      end
    end
    describe "DELETE destroy" do
      it "should redirect to the sign in page" do
        delete :destroy, :project_id => @project.id, :id => @document.id
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
