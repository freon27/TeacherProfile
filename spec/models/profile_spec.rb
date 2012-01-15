require 'spec_helper'

describe Profile do
  before(:each) do
    @profile = Factory(:profile)
  end
  describe "creation" do
    it "should not be valid without setting published" do
      @profile.published = nil
      @profile.should_not be_valid
    end
    it "should not be valid without a user" do
      @profile.user = nil
      @profile.should_not be_valid
    end
    it "should not be valid without a name" do
      @profile.name = nil
      @profile.should_not be_valid
    end
    it "should not be valid if the user already has 3 accounts" do
      profile2 = Factory(:profile, :name => 'profile B', :user => @profile.user)
      profile3 = Factory(:profile, :name => 'profile C', :user => @profile.user)
      profile4 = Factory.build(:profile, :name => 'profile D', :user => @profile.user)
      profile4.should_not be_valid
    end
    
    it "should require that url is unique" do
      profile2 = Factory.build(:profile, :url_suffix => @profile.url_suffix) 
      profile2.should_not be_valid
    end
    
    
    
  end
  describe "methods" do
    describe "publish" do
      it "should set published to true" do
        @profile.publish
        @profile.published.should be_true
      end
    end
    describe "unpublish" do
      it "should set unpublished to true" do
        @profile.published = true
        @profile.unpublish
        @profile.published.should_not be_true
      end
    end
    describe "published?" do
      it "should return the value of published" do
        @profile.published = true
        @profile.published?.should be_true
        @profile.published = false
        @profile.published?.should_not be_true
      end
    end
  end
  describe "associations" do
    it "should have main page" do
      @profile.main_page.should be_a(MainPage)
    end
    it "should have a philosophy page" do
      @profile.philosophy_page.should be_a(PhilosophyPage)
    end
    it "should have an experience page" do
      @profile.experience_page.should be_a(ExperiencePage)
    end
    it "should have a sample work page" do
      @profile.sample_work_page.should be_a(SampleWorkPage)
    end
  end
  
  describe "attached photo" do
    it { should have_attached_file(:photo) }
    # it { should validate_attachment_content_type(:photo).
    #               allowing('image/png', 'image/gif').
    #               rejecting('text/plain', 'text/xml') }
    # it { should validate_attachment_size(:photo).
    #               less_than(2.megabytes) }
  end
end
