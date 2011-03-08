class MainPagesController < ApplicationController
  def show
    @main_page = MainPage.find(params[:id])
  end

  def edit
    @main_page = MainPage.find(params[:id])
  end

  def update
    @main_page = MainPage.find(params[:id])
  end
  
end
