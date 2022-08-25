class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:forwarding_url] || tests_path
    else
      flash.now[:alert] = 'Для нахождения на сайте пройдите регистрацию или войдите в систему'
      render :new
    end
  end

  def destroy
    reset_session

    redirect_to login_path
  end
end
