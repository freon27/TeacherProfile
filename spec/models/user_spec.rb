require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end
  describe "creation" do
    it "should not be valid without a first name" do
      @user.first_name = nil
      @user.should_not be_valid
    end
    it "should not be valid without a last name" do
      @user.last_name = nil
      @user.should_not be_valid
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
    it "should default to a subscribed_until value of 1 week from the creation date" do
      Timecop.freeze
      @new_user = Factory(:user)
      @new_user.subscribed_until.should == 1.week.from_now
    end
  end
  describe "subscribed? method" do
    it "should have a subscribed? method" do
      @user.should respond_to(:subscribed?)
    end
    describe "if the user is currently subscribed" do
      it "should return true" do
        @user.subscribed?.should be_true
      end
    end 
    describe "if the user is currently subscribed" do
      it "should return true" do
        Timecop.travel(@user.subscribed_until + 7)       
        @user.subscribed?.should_not be_true
      end
    end 
  end
    
  describe "associations" do
    it "should have a positions method" do
      @user.should respond_to(:positions)
    end
    it "should have a qualifications method" do
      @user.should respond_to(:qualifications)
    end
    it "should have a subject_areas method" do
      @user.should respond_to(:subject_areas)
    end
    it "should have a projects method" do
      @user.should respond_to(:projects)
    end
    it "should have a documents method" do
      @user.should respond_to(:documents)
    end
    it "should have a subjects method" do
      @user.should respond_to(:subjects)
    end
    it "should have an main_pages method" do
      @user.should respond_to(:main_pages)
    end
    it "should have an experience_pages method" do
      @user.should respond_to(:experience_pages)
    end
    it "should have an philosophy_pages method" do
      @user.should respond_to(:philosophy_pages)
    end
    it "should have an sample_work_pages method" do
      @user.should respond_to(:sample_work_pages)
    end
  end
end
