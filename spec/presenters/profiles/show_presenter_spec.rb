require 'spec_helper'

describe Profiles::ShowPresenter do
  before(:all) do
    
  end
  before(:each) do
    @profile = Factory(:profile)
  end
  
  describe "creation" do
    it "should assign the profile passed as @profile" do
      @presenter = Profiles::ShowPresenter.new(@profile)
      @presenter.profile.should == @profile
    end
    it "should throw an exception if a profile is not passed" do
      expect {
        @presenter = Profiles::ShowPresenter.new
      }.should raise_error ArgumentError
    end
  end
  describe "methods" do
    before(:each) do
      @presenter = Profiles::ShowPresenter.new(@profile)  
    end
    pending "introduction" do
      it "should return the introduction text, formatted as HTML" do
        #@presenter.introduction.should == @profile.main_pages
      end
    end
  end
end