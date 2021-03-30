class StaticPagesController < ApplicationController
  def home
    # render :home
  end

  def scrape_search_results
    agent = Mechanize.new

    page = agent.get("http://howmanyofme.com/search/")
    #p page.title

    search_form = page.form("datain")
    search_form.given = params[:fname]
    search_form.sur = params[:lname]
    
    page = agent.submit(search_form, search_form.buttons.first)
    #pp page

    # num Of people with the same first name
    @first_name_match = page.search('span.popnum')[0].text
    # num Of  peaple with the same last name
    @last_name_match = page.search('span.popnum')[1].text
    # this will get the num of peaple with the same name
    @full_name_match = page.search('span.popnum')[-1].text

    # render scrape_search_results
  end

  def help
  end

  def about
  end

  def hello
  end
end
