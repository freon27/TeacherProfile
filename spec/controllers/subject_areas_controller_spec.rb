require 'spec_helper'

describe SubjectAreasController do
  before(:each) do 
    @sa = Factory(:subject_area)
  end
  describe "for signed in users" do
    describe "when current user is the owner" do
      before(:each) do
        sign_in_as(@sa.sample_work_page.profile.user)
      end
      describe "GET 'new'" do
        it "should be successful" do
          get 'new', :sample_work_page_id => @sa.sample_work_page_id
          response.should be_success
        end
        it "should assign a new SubjectArea object as @subject_area" do
          get 'new', :sample_work_page_id => @sa.sample_work_page_id
          assigns(:subject_area).should be_a(SubjectArea )
        end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get 'new', :sample_work_page_id => @sa.sample_work_page_id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      
      describe "POST 'create'" do
        before(:each) do
          new_subj = Factory(:subject_area)
          @valid_attributes = new_subj.attributes
          @valid_attributes.delete('sample_work_page_id')
        end
        describe "with valid params" do
          it "should create a new project area" do
            lambda {
              post 'create', :sample_work_page_id => @sa.sample_work_page_id, :subject_area => @valid_attributes
            }.should change(SubjectArea, :count).by(1)
          end
          it "should redirect to the sample work page edit page" do
            post 'create', :sample_work_page_id => @sa.sample_work_page_id, :subject_area => @valid_attributes
            response.should redirect_to( edit_sample_work_page_path(@sa.sample_work_page) )
          end
        end
        
        describe "with invalid params" do
          it "should re-render the new template" do
            @valid_attributes.delete('name')
            post 'create', :sample_work_page_id => @sa.sample_work_page_id, :subject_area => @valid_attributes
            response.should render_template(@sa, :action => :new)
          end
        end
      end
      
      describe "GET 'edit'" do
        it "should be successful" do
          get 'edit', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          response.should be_success
        end
        it "should assign the subject area as @subject_area" do
          get 'edit', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          assigns(:subject_area).should == @sa
        end
        it "should assign the subject area's projects as @projects" do
            get 'edit', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
            assigns(:projects).should == []
          end
        it "should assign @side_bar_name with value 'profiles/page_links'" do
          get 'edit', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
      end
      
      describe "PUT 'update'" do
        describe "with valid params" do
          it "should update the name" do
            put 'update', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id, :subject_area => { :name => 'Resistant Materials' }            
            assigns(:subject_area).name.should == 'Resistant Materials'
          end
          it "should redirect to the subject area edit page" do
            put 'update', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id, :subject_area => { :name => 'Resistant Materials' }            
            response.should redirect_to(edit_sample_work_page_subject_area_path(@sa.sample_work_page, @sa))
          end
        end
        describe "with invalid params" do
          it "should render the edit template" do
            put 'update', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id, :subject_area => { :name => '' }            
            response.should render_template(:edit)
          end
        end
      end
        
      describe "DELETE 'destroy'" do
        it "should delete the record" do
          lambda {
            delete 'destroy', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          }.should change(SubjectArea, :count).by(-1)
        end
      end
    end 
    
    
    describe "when current user is not the owner" do
      before(:each) do
        sign_in_as(Factory(:user))
      end
      describe "GET 'new'" do
        it "should raise a record not found exception" do
          expect { 
            get 'new', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "POST 'create'" do
        it "should raise a record not found exception" do
          expect { 
            new_subj = Factory(:subject_area)
            @valid_attributes = new_subj.attributes
            @valid_attributes.delete('sample_work_page_id')
            post 'create', :sample_work_page_id => @sa.sample_work_page_id, :subject_area => @valid_attributes
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "GET 'edit'" do
        it "should raise a record not found exception" do
          expect { 
            get 'edit', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "PUT 'update'" do
        it "should raise a record not found exception" do
          expect { 
            new_subj = Factory(:subject_area)
            @valid_attributes = new_subj.attributes
            @valid_attributes.delete('sample_work_page_id')
            put 'update', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id, :subject_area => { :name => 'Resistant Materials' }
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
      describe "DELETE 'destroy'" do
        it "should raise a record not found exception" do
          expect { 
            delete 'destroy', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
          }.should raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end 
  end
  describe "for non-signed in users" do 
    describe "GET 'new'" do
      it "should redirect to the sign in page" do
        get 'new', :sample_work_page_id => @sa.sample_work_page_id
        response.should redirect_to(sign_in_path)
      end
    end
    describe "POST 'create'" do
      it "should redirect to the sign in page" do
        new_subj = Factory(:subject_area)
        @valid_attributes = new_subj.attributes
        @valid_attributes.delete('sample_work_page_id')
      end
    end
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        post 'create', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id,  :subject_area => @valid_attributes
        response.should redirect_to(sign_in_path)
      end
    end
    describe "PUT 'update'" do
      it "should redirect to the sign in page" do
        put 'update', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id, :subject_area => { :name => 'Resistant Materials' }
        response.should redirect_to(sign_in_path)
      end
    end
    describe "DELETE 'destroy'" do
      it "should redirect to the sign in page" do
        delete 'destroy', :sample_work_page_id => @sa.sample_work_page_id, :id => @sa.id
        response.should redirect_to(sign_in_path)
      end
    end
    
  end
end
