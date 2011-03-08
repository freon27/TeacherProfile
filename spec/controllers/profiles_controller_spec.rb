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
            'name'  => @example_profile.name
          }
        end
        
        it "creates a new user" do
          lambda {
            post :create, :profile => @valid_params
          }.should change(Profile, :count).by(1)
        end
        
        it "assigns a newly created profile as @profile" do
          post :create, :profile => @valid_params
          assigns(:profile).should be_a(Profile)
        end
  
        it "redirects to the created profile" do
          post :create, :profile => @valid_params
          response.should redirect_to(profiles_path(assigns[:profile]))
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
    
    describe "if they own the profile" do
      
    end
    
    describe "if they do not own the profile" do
      
    end
  end

  describe "for non-signed in users" do
    
  end
end
