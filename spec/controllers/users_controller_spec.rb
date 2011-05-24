require 'spec_helper' 

describe UsersController do
  
  before(:each) do
    @user = Factory(:user_with_profile)
  end

  describe "for non-signed in users" do
    describe "GET index" do
      it "should deny access" do
        get :index
        response.should redirect_to(sign_in_path)
      end
    end
  
    describe "GET show" do
      it "should deny access" do
        get :show, :id => @user.id
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe "GET edit" do
      it "should deny access" do
        get :edit, :id => @user.id
        response.should redirect_to(sign_in_path)
      end
    end
  
    describe "PUT update" do
      it "should deny access" do
        put :update, :id => @user, :user => @invalid_params
        response.should redirect_to(sign_in_path)
      end
    end
  
    describe "DELETE destroy" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe "GET dashboard" do
      it "should deny access" do
        get :dashboard, :id => @user.id
        response.should redirect_to(sign_in_path)
      end
    end
    
    describe "GET new" do
      it "assigns a new user as @user" do
        get :new
        assigns(:user).should be_a(User)
        assigns[:user].should be_new_record
      end      

      it "should assign 'users/page_links' as @side_bar_name" do
        get :new
        assigns(:side_bar_name).should == 'users/page_links'
      end
    end
    
    describe "POST create" do
  
      describe "with valid params" do
  
        before do
          @valid_params = {
            'first_name'            => @user.first_name,
            'last_name'             => @user.last_name,
            'email'                 => Factory.next(:email),
            'password'              => @user.password,
            'password_confirmation' => @user.password
          }
        end
        
        it "creates a new user" do
          lambda {
            post :create, :user => @valid_params
          }.should change(User, :count).by(1)
        end
        
        it "assigns a newly created user as @user" do
          post :create, :user => @valid_params
          assigns(:user).should be_a(User)
        end
  
        it "redirects to the created user" do
          post :create, :user => @valid_params
          response.should redirect_to(dashboard_user_path(assigns[:user]))
        end
      end
  
      describe "with invalid params" do
        it "assigns a newly created but unsaved user as @user" do
          User.stub!(:new).and_return(@user)
          post :create, :user => {'these' => 'params'}
          assigns(:user).should be(@user)
        end
  
        it "re-renders the 'new' template" do
          post :create, :user => {}
          response.should render_template("new")
        end
      end
  
    end

  end
  
  describe "for signed in users" do
    
    before(:each) do
      sign_in_as @user
    end
    
    describe "if they are the correct user" do
    
      describe "GET index" do
        it "assigns all users as @users" do
          get :index
          assigns(:users).should eq([@user])
        end
      end
    
      describe "GET show" do
        it "assigns the requested user as @user" do
          get :show, :id => @user.id
          assigns(:user).should == @user
        end
      end
    
      describe "GET edit" do
        it "assigns the requested user as @user" do
          get :edit, :id => @user.id
          assigns(:user).should == @user
        end
        
        it "should assign 'profiles/page_links' as @side_bar_name" do
          get :edit, :id => @user.id
          assigns(:side_bar_name).should == 'users/page_links'
        end
        
      end
    
      describe "PUT update" do
    
        describe "with valid params" do
          
          before(:each) do
            @valid_params = {
              'email' => Factory.next(:email),
              'password' => @user.password,
              'password_confirmation' => @user.password
            }
          end
          it "updates the requested user" do
            new_email = Factory.next(:email)
            @valid_params['email'] = new_email
            put :update, :id => @user, :user => @valid_params
            @user.reload
            @user.email.should == new_email
          end
    
          it "assigns the requested user as @user" do
            put :update, :id => @user
            assigns(:user).should == @user
          end
    
          it "redirects to the user" do
            put :update, :id => @user, :user => @valid_params
            response.should redirect_to(user_url(@user))
          end
        end
    
        describe "with invalid params" do
          
          before(:each) do
            @invalid_params = {
              'email' => ''
            }
          end
          
          it "assigns the user as @user" do
            put :update, :id => @user, :user => @invalid_params
            assigns(:user).should == @user
          end
    
          it "re-renders the 'edit' template" do
            put :update, :id => @user, :user => @invalid_params
            response.should render_template("edit")
          end
        end
    
      end
    
      describe "DELETE destroy" do
        it "destroys the requested user" do
          lambda {
            delete :destroy, :id => @user
          }.should change(User, :count).by(-1)
        end
    
        it "redirects to the users list" do
          delete :destroy, :id => @user
          response.should redirect_to(users_url)
        end
      end
      
      describe "POST create" do
        it "should redirect to the sign in path" do
          post :create
          response.should redirect_to(root_path)
        end
      end
      
      describe "GET dashboard" do
        it "assigns the user as @user" do
          get :dashboard, :id => @user.id
          assigns(:user).should == @user
        end
        
        it "assigns the user's profiles as @profiles" do
          get :dashboard, :id => @user.id
          assigns(:profiles).first.should be_a(Profile)
        end
        
        it "should assign 'users/users_links' as @side_bar_name" do
          get :dashboard, :id => @user.id
          assigns(:side_bar_name).should == 'users/dashboard_links'
        end
      end
    end
    
    
    
    describe "if they are the incorrect user" do
      
      before(:each) do
        @another_user = Factory(:user)
      end
    
      describe "GET show" do
        it "should deny access" do
          get :show, :id => @another_user.id
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "GET edit" do
        it "should deny access" do
          get :edit, :id => @another_user.id
          response.should redirect_to(sign_in_path)
        end
      end
    
      describe "PUT update" do
        it "should deny access" do
          put :update, :id => @another_user, :user => @invalid_params
          response.should redirect_to(sign_in_path)
        end
      end
      
      describe "GET dashboard" do
        it "should deny access" do
          get :dashboard, :id => @another_user.id
          response.should redirect_to(sign_in_path)
        end
      end
    
    end
    
    pending "if they are not an admin user" do
      
    end
    
    pending "if they are an admin user" do
      
    end
  end
end
