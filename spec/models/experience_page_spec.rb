require 'spec_helper'

describe ExperiencePage do
  before(:each) do
    @ep = Factory(:experience_page)
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
  end
  describe "methods" do
    it "should have a positions method" do
      @ep.respond_to?(:positions).should == true
    end
  end
end
