class StaticPagesController < ApplicationController
  def home
    
  end



 

 

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
