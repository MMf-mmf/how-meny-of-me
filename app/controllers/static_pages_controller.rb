class StaticPagesController < ApplicationController
  def home 
  end

  def scrape_search_results
    if params[:fname].empty? || params[:lname].empty?
      redirect_to search_path 
    else
      
    
    #ws = WebScrape.new
    #@all_data = ws.scrape(params[:fname], params[:lname])
    def scrape(fname, lname)
      agent = Mechanize.new
      agent.user_agent_alias = 'Mac Safari'
      page = agent.get("http://howmanyofme.com/search/")
      
  
      search_form = page.form("datain")
      search_form.given = fname
      search_form.sur = lname
      
      page = agent.submit(search_form, search_form.buttons.first)
      
      all_info = []
      # num Of people with the same first name
      all_info << @first_name_match = page.search('span.popnum')[0].text.tap{ |s| s.delete!(',') }.to_i
      # num Of  peaple with the same last name
      all_info << @last_name_match = page.search('span.popnum')[1].text.tap{ |s| s.delete!(',') }.to_i
      # this will get the num of peaple with the same name
      all_info << @full_name_match = page.search('span.popnum')[-1].text.tap{ |s| s.delete!(',') }.to_i
      
      # return all_info
     end 
    @all_data = scrape(params[:fname], params[:lname]).map(&:to_i)
  end


    #byebug
    History.create(user_id: current_user.id,
                    s_name: "#{params[:fname]} #{params[:lname]}",
                    first_name_matches: @all_data[0],
                    last_name_matches: @all_data[1],
                    full_name_matches: @all_data[2])

 
   end

  def help
  end

  def about
  end

end
