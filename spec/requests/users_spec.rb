require 'spec_helper'

describe "Users" do
  before(:each) do
    @user = Factory(:user)
  end
 pending "signup" do
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit sign_up_path
          fill_in "First name",             :with => ""
          fill_in "Last name",              :with => ""
          fill_in "Email",                  :with => ""
          fill_in "Password",               :with => ""
          fill_in "Confirm password",       :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#errorExplanation")
        end.should_not change(User, :count)
      end
    end
    describe "success" do
      it "should make a new user" do
        lambda do
          visit sign_up_path
          fill_in "First name",             :with => @user.first_name
          fill_in "Last name",              :with => @user.last_name
          fill_in "Email",                  :with => Factory.next(:email)
          fill_in "Password",               :with => @user.password
          fill_in "Confirm password",       :with => @user.password
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#flash_notice",
                                        :content => "You are now signed up")
        end.should change(User, :count).by(1)
      end
    end
  end
  pending "sign in/out" do
    describe "failure" do
      it "should not sign a user in" do
        visit sign_in_path
        fill_in :email,    :with => ""
        fill_in :password, :with => ""
        click_button
        response.should have_selector("div#flash_failure", :content => "Bad email or password")
      end
    end
    describe "success" do
      it "should sign a user in and out" do
        visit sign_in_path
        fill_in :email,    :with => @user.email
        fill_in :password, :with => @user.password
        click_button
        response.should have_selector("div#flash_success", :content => "Signed in")
        response.should render_template('users/dashboard')
        click_link "Sign out"
        response.should render_template('sessions/new')
      end
    end
  end
  pending "user dashboard" do
    it "should list the profiles" do
      visit sign_in_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
      response.should render_template('users/dashboard')
    end
  end
end
