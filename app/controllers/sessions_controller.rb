class SessionsController < ApplicationController
  def create
    session[:current_email] = params[:session][:email]
    redirect_to root_path
  end
end
