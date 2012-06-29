class SessionsController < ApplicationController
  
  def create
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      flash[:success] = "Welcome back #{admin.name}!"
      sign_in admin
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def new
    
  end
  
  
  def destroy
    sign_out
    redirect_to root_path
    
  end
  
  
  
end
