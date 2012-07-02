class FoodTherapiesController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @food_therapies = FoodTherapy.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_therapies }
    end
  end

  def show
    @food_therapy = FoodTherapy.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_therapy }
    end
  end


  def new
    @admin = current_admin
    @food_therapy = FoodTherapy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_therapy }
    end
  end


  def edit
    @food_therapy = FoodTherapy.find_by_permalink(params[:id])
  end


  def create
    @food_therapy = FoodTherapy.new(params[:food_therapy])

    respond_to do |format|
      if @food_therapy.save
        format.html { redirect_to @food_therapy, notice: 'Article was successfully created.' }
        format.json { render json: @food_therapy, status: :created, location: @food_therapy }
      else
        format.html { render action: "new" }
        format.json { render json: @food_therapy.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @food_therapy = FoodTherapy.find_by_permalink(params[:id])

    respond_to do |format|
      if @food_therapy.update_attributes(params[:food_therapy])
        format.html { redirect_to @food_therapy, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_therapy.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @food_therapy = FoodTherapy.find_by_permalink(params[:id])
    @food_therapy.destroy

    respond_to do |format|
      format.html { redirect_to food_therapies_url }
      format.json { head :no_content }
    end
  end
end
