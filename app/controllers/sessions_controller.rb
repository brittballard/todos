class SessionsController < ApplicationController
  def create
    sign_in(params[:session][:email])
    redirect_to todos_path
  end
end
