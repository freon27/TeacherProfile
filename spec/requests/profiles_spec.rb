require 'spec_helper'

describe "Profiles" do
  pending "signed in user" do
    before(:each) do
      @user = Factory(:user)
      sign_in_as(@user)
    end
    describe "creating a profile" do
      before(:each) do
        profile = Factory(:profile)
      end
      describe "success" do 
        visit 'profiles/new'
        fill_in "Name", :with => @profile.name
        click_button
        response.should render_template('blah')
      end
      pending "failure" do
        
      end
    end
  end
  pending "non-signed in user" do
  end
end
