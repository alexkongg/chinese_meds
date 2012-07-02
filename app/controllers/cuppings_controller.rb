class CuppingsController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @cuppings = Cupping.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cuppings }
    end
  end

  def show
    @cupping = Cupping.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cupping }
    end
  end


  def new
    @admin = current_admin
    @cupping = Cupping.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cupping }
    end
  end


  def edit
    @cupping = Cupping.find_by_permalink(params[:id])
  end


  def create
    @cupping = Cupping.new(params[:cupping])

    respond_to do |format|
      if @cupping.save
        format.html { redirect_to @cupping, notice: 'Article was successfully created.' }
        format.json { render json: @cupping, status: :created, location: @cupping }
      else
        format.html { render action: "new" }
        format.json { render json: @cupping.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @cupping = Cupping.find_by_permalink(params[:id])

    respond_to do |format|
      if @cupping.update_attributes(params[:cupping])
        format.html { redirect_to @cupping, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cupping.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cupping = Cupping.find_by_permalink(params[:id])
    @cupping.destroy

    respond_to do |format|
      format.html { redirect_to cuppings_url }
      format.json { head :no_content }
    end
  end
end
