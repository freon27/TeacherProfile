require 'spec_helper'

describe SampleWorkPage do
  before(:each) do
    @swp = Factory.build(:sample_work_page)
  end
  describe "creation" do
    it "should not be valid without a published attribute" do
      @swp.published = nil
      @swp.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a subject_areas method" do
      @swp.should respond_to(:subject_areas)
    end
    it "should have a user method" do
      @swp.should respond_to(:user)
    end
  end
end
