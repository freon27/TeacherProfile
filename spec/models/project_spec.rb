require 'spec_helper'

describe Project do
  before(:each) do
    @project = Factory.build(:project)
  end
  it "should not be valid without a name" do
    @project.name = nil
    @project.should_not be_valid
  end
  it "should not be valid without a user" do
    @project.user = nil
    @project.should_not be_valid
  end
  it "should not be valid without a description" do
    @project.description = nil
    @project.should_not be_valid
  end
  describe "methods" do
    it "should have a documents method" do
      @project.respond_to?(:documents).should == true
    end
    it "should have a subject_area method" do
      @project.respond_to?(:subject_area).should == true
    end
  end
end
