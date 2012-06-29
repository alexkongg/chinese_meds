class AdminsController < ApplicationController
  before_filter :signed_in_admin, only: [:edit, :update]
  before_filter :correct_admin, only: [:edit, :update]
  
  
  def new
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:success] = "Welcome #{@admin.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      sign_in @admin
      flash[:success] = "Welcome #{@admin.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
   
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @admin
      redirect_to @admin
    else
      render 'edit'
    end
  end
  
  
  private
    
  
  
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_path) unless current_admin?(@admin)
    end
end
