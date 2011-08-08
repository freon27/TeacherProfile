require 'spec_helper'

describe ProjectsController do
  describe "for signed in users" do
    describe "GET new" do
      pending "assigns a new project as @project" do
        get :new
        assigns(:project).should be_a(Project)
        assigns[:project].should be_new_record
      end
    end
  end
end
