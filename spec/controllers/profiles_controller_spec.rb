require 'spec_helper' 

describe ProfilesController do
  
  before(:each) do
    @user = Factory(:user)
    @example_profile = Factory(:profile)
  end
  
  describe "for signed in users" do
    before(:each) do
      sign_in_as(@user)
    end
    
    describe "GET new" do
      it "assigns a new profile as @profile" do
        get :new
        assigns(:profile).should be_a(Profile)
        assigns[:profile].should be_new_record
      end
    end
    
    describe "POST create" do
  
      describe "with valid params" do
  
        before do
          @valid_params = {
            'name'  => @example_profile.name,
            'url_suffix' => 'testprofile'
          }
        end
        
        it "creates a new profile" do
          lambda {
            post :create, :profile => @valid_params
          }.should change(Profile, :count).by(1)
        end
        
        it "assigns a newly created profile as @profile" do
          post :create, :profile => @valid_params
          assigns(:profile).should be_a(Profile)
        end
  
        it "redirects to the the user dashboard" do
          post :create, :profile => @valid_params
          response.should redirect_to(dashboard_user_path(@user))
        end
      end
  
      describe "with invalid params" do
        it "assigns a newly created but unsaved prfofile as @profile" do
          Profile.stub!(:new).and_return(@example_profile)
          post :create, :profile => {'these' => 'params'}
          assigns(:profile).should be(@example_profile)
        end
  
        it "re-renders the 'new' template" do
          post :create, :profile => {}
          response.should render_template("new")
        end
      end  
    end
    
    describe "GET edit" do
      describe "if they own the profile" do
        it "assigns the requested profile as @profile" do
          get :edit, :id => @example_profile.id
          assigns(:profile).should == @example_profile
        end
      end  
      
      pending "if they do not own the profile" do
        before(:each) do
          @another_profile = Factory(:profile)
        end
      end  
    end
    
    describe "PUT 'update'" do

      describe "if they own the profile" do
        it "should update the profile with the suggested information" do
          put 'update', :id => @another_profile, :profile => { name => 'new name' }
          assigns(:profile).should == 'new name'
        end
      end
      
      describe "if they do not own the profile" do
        it "should redirect to the sign in page" do
          put 'update', :id => @another_profile
          response.should redirect_to(sign_in_path)
        end
      end
    end

    describe "DELETE" do
      describe "if they own the profile" do
        it "should delete the requested profile" do
          delete 'destroy', :id => @example_profile
          
        end
      end
      
      describe "if they do not own the profile" do
        it "should redirect to the sign in page" do
          @another_profile = Factory(:profile)
          delete 'destroy', :id => @another_profile
          response.should redirect_to(sign_in_path)
        end
      end
    end
  end

  describe "for non-signed in users" do
    
    describe "GET 'edit'" do
      it "should redirect to the sign in page" do
        get 'edit', :id => @example_profile
        response.should redirect_to(sign_in_path)
      end
    end

    describe "GET 'new'" do
      it "should redirect to the sign in page" do
        get 'new', :id => @example_profile
        response.should redirect_to(sign_in_path)
      end
    end

    describe "POST 'create'" do
      it "should redirect to the sign in page" do
        post 'create', :id => @example_profile
        response.should redirect_to(sign_in_path)
      end
    end
    
    pending "PUT 'update'" do
      it "should redirect to the sign in page" do
        put 'update', :id => @example_profile
        response.should redirect_to(sign_in_path)
      end
    end

    pending "DELETE" do
      it "should redirect to the sign in page" do
        delete 'destroy', :id => @example_profile
        response.should redirect_to(sign_in_path)
      end
    end
  end
end
