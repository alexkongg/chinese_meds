class HerbsController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  
  # GET /herbs
  # GET /herbs.json
  
  
  def index
    
    @herbs = Herb.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @herbs }
    end
  end

  # GET /herbs/1
  # GET /herbs/1.json
  def show
    @herb = Herb.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @herb }
    end
  end

  # GET /herbs/new
  # GET /herbs/new.json
  def new
    @admin = current_admin
    @herb = Herb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @herb }
    end
  end

  # GET /herbs/1/edit
  def edit
    @herb = Herb.find_by_permalink(params[:id])
  end

  # POST /herbs
  # POST /herbs.json
  def create
    @herb = Herb.new(params[:herb])

    respond_to do |format|
      if @herb.save
        format.html { redirect_to @herb, notice: 'Herb was successfully created.' }
        format.json { render json: @herb, status: :created, location: @herb }
      else
        format.html { render action: "new" }
        format.json { render json: @herb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /herbs/1
  # PUT /herbs/1.json
  def update
    @herb = Herb.find_by_permalink(params[:id])

    respond_to do |format|
      if @herb.update_attributes(params[:herb])
        format.html { redirect_to @herb, notice: 'Herb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @herb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /herbs/1
  # DELETE /herbs/1.json
  def destroy
    @herb = Herb.find_by_permalink(params[:id])
    @herb.destroy

    respond_to do |format|
      format.html { redirect_to herbs_url }
      format.json { head :no_content }
    end
  end
end
