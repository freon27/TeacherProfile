require 'spec_helper'

describe SubjectsController do
  before(:each) do
    @subject = Factory(:subject)
  end
  
  describe "for signed in users" do
    before(:each) do
      sign_in_as(@subject.qualification.experience_page.profile.user)
    end
    
    describe "if user does not own profile" do
      
      before(:each) do
        @another_qualification = Factory(:qualification)
      end
      
      describe "GET 'new'" do
        it "should redirect to the sign in page" do
          get 'new', :qualification_id => @another_qualification.id
          response.should redirect_to(sign_in_path)
        end
      end

      describe "POST 'create'" do
        it "should redirect to the sign in page" do
          post 'create', :qualification_id => @another_qualification.id, :subject => @subject.attributes.delete(:id)
          response.should redirect_to(sign_in_path)
        end
      end

      describe "DELETE" do
        it "should redirect to the sign in page" do
          delete 'destroy', :id => @subject.id, :qualification_id => @another_qualification.id
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "GET 'edit'" do
        it "should redirect to the sign in page" do
          get 'edit', :id => @subject.id, :qualification_id => @another_qualification.id
          response.should redirect_to(sign_in_path)
        end
      end

      describe "PUT 'update'" do
        it "should redirect to the sign in page" do
          put 'update', :id => @subject.id, :qualification_id => @another_qualification.id
          response.should redirect_to(sign_in_path)
        end
      end
      
    end
    
    describe "if user owns profile" do
      
      describe "GET 'new'" do
        it "should redirect be successful" do
          get 'new', :qualification_id => @subject.qualification.id
          response.should be_success
        end
        
        it "should assign a new Subject object as @subject" do
          get 'new', :qualification_id => @subject.qualification.id
          assigns(:subject).should be_a(Subject )
        end
        
        it "should assign the requested Qualificiation object as @qualification" do
          get 'new', :qualification_id => @subject.qualification.id
          assigns(:qualification).id.should == @subject.qualification.id
        end
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get 'new', :qualification_id => @subject.qualification.id
          assigns(:side_bar_name).should == 'profiles/page_links'
        end
        
        it "should the profile as @profile" do
          get 'new', :qualification_id => @subject.qualification.id
          assigns(:profile).should == @subject.qualification.experience_page.profile
        end
        
      end  
          

      describe "POST 'create'" do
        
        before(:each) do
          new_subj = Factory(:subject)
          @valid_attributes = new_subj.attributes
          @valid_attributes.delete('qualification_id')
        end
        
        it "should create a new record" do        
          lambda {
            post 'create', :qualification_id => @subject.qualification.id, :subject => @valid_attributes
          }.should change(Subject, :count).by(1)
        end
        
        it "should create redirect to the experience page edit action" do

          post 'create', :qualification_id => @subject.qualification.id, :subject => @valid_attributes
          response.should redirect_to(edit_experience_page_path(@subject.qualification.experience_page))
        end
        
      end
      
      describe "GET 'edit'" do
      
          it "should assign a new Subject object as @subject" do
            get 'edit', :id => @subject.id, :qualification_id => @subject.qualification.id
            assigns(:subject).should be_a(Subject )
          end

          it "should assign the requested Qualificiation object as @qualification" do
            get 'edit', :id => @subject.id, :qualification_id => @subject.qualification.id
            assigns(:qualification).id.should == @subject.qualification.id
          end
          
          it "should assign 'profiles/page_links' as @side_bar_name" do
            get 'edit', :id => @subject.id, :qualification_id => @subject.qualification.id
            assigns(:side_bar_name).should == 'profiles/page_links'
          end

          it "should the profile as @profile" do
            get 'edit', :id => @subject.id, :qualification_id => @subject.qualification.id
            assigns(:profile).should == @subject.qualification.experience_page.profile
          end
      end

      describe "PUT 'update'" do
        
        it "should redirect to the edit page" do
          put 'update', :id => @subject.id, :qualification_id => @subject.qualification.id, :subject => { :name => 'New Text' }
          response.should redirect_to(edit_experience_page_path(@subject.qualification.experience_page))
        end
        
        it "should update the page attributes" do
          put 'update', :id => @subject.id, :qualification_id => @subject.qualification.id, :subject => { :name => 'New Text' }
          @subject.reload.name.should == 'New Text'
        end
        
        it "should assign the requested subject as @subject" do
          put 'update', :id => @subject.id, :qualification_id => @subject.qualification.id, :subject => { :name => 'New Text' }
          assigns(:subject).should == @subject
        end
      end
      
      describe "DELETE" do
        it "should delete the requested subject" do
          lambda {
            delete 'destroy', :id => @subject.id, :qualification_id => @subject.qualification.id
          }.should change(Subject, :count).by(-1)
        end
      end
    end
  end
  


  describe "for non-signed in users" do
    

    describe "GET 'new'" do
      it "should redirect to the sign in page" do
        put 'new', :qualification_id => @subject.qualification.id
        response.should redirect_to(sign_in_path)
      end
    end
  
    describe "POST 'create'" do
      it "should redirect to the sign in page" do
        post 'create', :qualification_id => @subject.qualification.id, :subject => @subject.attributes.delete(:id)
        response.should redirect_to(sign_in_path)
      end
    end
  
    describe "DELETE" do
      it "should redirect to the sign in page" do
        delete 'destroy', :id => @subject.id, :qualification_id => @subject.qualification.id
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        get 'edit', :id => @subject.id, :qualification_id => @subject.qualification.id
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe "PUT 'update'" do
      it "should redirect to the sign in page" do
        put 'update', :id => @subject.id, :qualification_id => @subject.qualification.id
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
