# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def login
    if params[:user] == nil
      username = password = ""
    else
      username = params[:user][:username]
      password = params[:user][:password]
    end
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" + username +
      "','" + password + "')").to_i
    if username == password && username == "guest"
      cookies.signed[:user_id] = -1
      cookies.signed[:authenticated] = false
      redirect_to :controller => "author_books", :action => "index"
    elsif user_id > 0
      user = User.find(user_id)
      cookies.signed[:user_id] = user_id
      cookies.signed[:authenticated] = true
      redirect_to :controller => "pages", :action => "continue"
    end  
  end

  def logout
  end

end
