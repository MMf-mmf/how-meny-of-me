class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    
  end

  def new
    @user = User.new
  end

  def create

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
    @all_data = scrape(params[:user][:name].split[0], params[:user][:name].split[1]).map(&:to_i)
    
    #byebug
    user_hash = user_params
    user_hash[:unique_fname] = @all_data[0]
    user_hash[:unique_lname] = @all_data[1]
    user_hash[:unique_full_name] = @all_data[2]

    @user = User.new(user_hash)
    # @user = User.new(
    #   name: params[:user][:name], 
    #   email: params[:user][:email],
    #   password: params[:user][:password], 
    #   password_digest: params[:user][:password_confirmation],
    #   unique_fname: @all_data[0], 
    #   unique_lname: @all_data[1], 
    #   unique_full_name: @all_data[2])


    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to @user
    else
      render 'new'
  end
end


def history
  @history = current_user.histories

  f_sum = current_user.histories.map{|object| object}.map(&:first_name_matches).inject(0, :+)
  @fname_average = f_sum / current_user.histories.map{|object| object}.map(&:first_name_matches).count

  l_sum = current_user.histories.map{|object| object}.map(&:last_name_matches).inject(0, :+)
  @lname_average = l_sum / current_user.histories.map{|object| object}.map(&:last_name_matches).count

  fullname_sum = current_user.histories.map{|object| object}.map(&:full_name_matches).inject(0, :+)
  @full_name_average = fullname_sum / current_user.histories.map{|object| object}.map(&:full_name_matches).count

  #byebug
end


private


def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end


end
