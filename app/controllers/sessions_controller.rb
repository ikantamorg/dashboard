class SessionsController < ApplicationController
  require 'net/http'
  require 'json'

  def create
    openid_data = params[:token]
    openid_data = Net::HTTP.get(URI.parse("http://loginza.ru/api/authinfo?token=#{params[:token]}"))
    openid_data = JSON.parse openid_data
    user = User.find_or_create_by(openid_identity: openid_data['identity'])
    if user.status != 'banned'
      user.openid_data = openid_data
      user.save
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      redirect_to root_url, :notice => "You blocked!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
