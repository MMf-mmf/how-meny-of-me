class StaticPagesController < ApplicationController
  def home
    # render :home
  end

  # UserController

  # def show (aka profile page)
  # end

  # def new
  # rendering a new form aka a signup form
  # end 

  # def create
  #   # Use form info to scrape 
  #   # Use Scrape results + form  data to User.create
  #   # redirect to user show path
  # end 

  def scrape_search_results
    ws = WebScrape.new
    @all_data = ws.scrape(params[:fname], params[:lname])
    # byebug
  end

  def help
  end

  def about
  end

end
