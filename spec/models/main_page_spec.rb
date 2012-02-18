require 'spec_helper'

describe MainPage do
  before(:each) do
    @mp = Factory.build(:main_page)
  end
  describe "creation" do
    
    it "should not be valid without introduction text if published" do
      @mp.introduction = nil
      @mp.published = true
      @mp.should_not be_valid
      @mp.published = false
      @mp.should be_valid
    end
    it "should not be valid without a published attribute" do
      @mp.published = nil
      @mp.should_not be_valid
    end
    it "should not be valid without a user" do
      @mp.user = nil
      @mp.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a published? method" do
      @mp.published = true
      @mp.published?.should be_true
    end
    it "should have a user method" do
      @mp.should respond_to(:user)
    end
  end
end
