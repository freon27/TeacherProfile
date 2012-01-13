require 'spec_helper'

describe Profiles::ShowPresenter do
  before(:each) do
    @profile = Factory(:completed_profile)
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
    describe "introduction" do
      
      it "should respond to introduction" do
        @presenter.should respond_to :introduction
      end
      
      it "should return the introduction text, formatted as HTML" do
        @presenter.introduction.should == RDiscount.new(@profile.main_page.introduction).to_html
      end
      
      it "blank philosophies should come back as an empty string" do
        mp = @profile.main_page
        mp.introduction = nil
        @presenter.introduction.should == '';
      end  
    end
    
    describe "philosophy" do  
      it "should respond to philosophy" do
        @presenter.should respond_to :philosophy
      end
      
      it "should return the philosophy text, formatted as HTML" do
        @presenter.philosophy.should == RDiscount.new(@profile.philosophy_page.philosophy).to_html
      end
      
      it "blank philosophies should come back as an empty string" do
        pp = @profile.philosophy_page
        pp.philosophy = nil
        @presenter.philosophy.should == '';
      end
    end
    
    describe "qualifications" do
      
      it "should respond to qualifications" do
        @presenter.should respond_to :qualifications
      end
      
      it "should return the array of qualifications associated with the profile" do
        @presenter.qualifications.should == @profile.experience_page.qualifications
      end
    end
    
    
    describe "positions" do
      
      it "should respond to positions" do
        @presenter.should respond_to :positions
      end
      
      it "should return the array of qualifications associated with the profile" do
        @presenter.positions.should == @profile.experience_page.positions
      end
    end
    
  end
end