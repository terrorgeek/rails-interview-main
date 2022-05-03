class SessionsController < ApplicationController
  include LoginConcerns

  def new
  end

  def create
    set_a_instance_variable
    user = User.find_by(email: params[:login][:email].downcase)

    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to customers_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
