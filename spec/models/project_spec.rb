require 'spec_helper'

describe Project do
  before(:each) do
    @project = Factory(:project)
  end
  it "should not be valid without a name" do
    @project.name = ''
    @project.should_not be_valid
  end
  it "should not be valid without a description" do
    @project.description = ''
    @project.should_not be_valid
  end
  describe "methods" do
    it "should have a documents method" do
      @project.respond_to?(:documents).should == true
    end
    it "should have a profile method" do
      @project.respond_to?(:profile).should == true
    end
  end
end
