require 'spec_helper'

describe User do
  describe "creation" do
    before(:each) do
      @user = Factory(:user)
    end
    it "should not be valid without an email address" do
      @user.email = nil
      @user.should_not be_valid
    end
    it "should not be valid unless the email is correctly formatted" do
      @user.email = 'notavalidemail'
      @user.should_not be_valid
    end
    it "should not be valid unless the email is unique" do
      @user2 = User.create(:email => @user.email, :password => @user.password, :password_confirmation => @user.password_confirmation)
      @user2.should_not be_valid
    end
    it "should not be valid if password is blank" do
      @user.password = nil
      @user.should_not be_valid
    end
    it "should not be valid if password does not match confirmation" do
      @user.password_confirmation = 'notthesame'
      @user.should_not be_valid
    end
    it "should not be valid if password is less that 6 characters" do
      @user.password = "a" * 5
      @user.password_confirmation = @user.password
      @user.should_not be_valid
    end
    it "should not be valid if password is longer that 15 characters" do
      @user.password = "a" * 16
      @user.password_confirmation = @user.password
      @user.should_not be_valid
    end
  it "should not be valid if password does not contain at least 1 uppercase characters" do
      @user.password = 'oneone'
      @user.password_confirmation = @user.password
      @user.should_not be_valid
    end
    it "should not be valid if password does not contain at least 1 numeric characters" do
      @user.password = 'Oneone'
      @user.password_confirmation = @user.password
      @user.should_not be_valid
    end
  end
end
