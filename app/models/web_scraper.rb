    class WebScrape 
      def scrape(fname, lname)
        agent = Mechanize.new
        agent.user_agent_alias = 'Mac Safari'
        page = agent.get("http://howmanyofme.com/search/")
        #p page.title

        search_form = page.form("datain")
        search_form.given = fname
        search_form.sur = lname
        
        page = agent.submit(search_form, search_form.buttons.first)
        #pp page
        all_info = []
        # num Of people with the same first name
        all_info << @first_name_match = page.search('span.popnum')[0].text
        # num Of  peaple with the same last name
        all_info << @last_name_match = page.search('span.popnum')[1].text
        # this will get the num of peaple with the same name
        all_info << @full_name_match = page.search('span.popnum')[-1].text
        
        return all_info
        
       end 

    end