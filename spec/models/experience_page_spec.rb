require 'spec_helper'

describe ExperiencePage do
  before(:each) do
    @ep = Factory.build(:experience_page)
  end
  describe "creation" do
    it "should not be valid without a publish_positions attribute" do
      @ep.publish_positions = nil
      @ep.should_not be_valid
    end
    it "should not be valid without a publish_qualifications attribute" do
      @ep.publish_qualifications = nil
      @ep.should_not be_valid
    end
    it "should not be valid without a user id" do
      @ep.user = nil
      @ep.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a positions method" do
      @ep.respond_to?(:positions).should == true
    end
    it "should have a user method" do
      @ep.should respond_to(:user)
    end
  end
end
