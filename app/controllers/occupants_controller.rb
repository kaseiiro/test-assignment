class OccupantsController < ApplicationController
  # GET /occupants
  # GET /occupants.json
  def index
    @occupants = Occupant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occupants }
    end
  end

  # GET /occupants/1
  # GET /occupants/1.json
  def show
    @occupant = Occupant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /occupants/new
  # GET /occupants/new.json
  def new
    @occupant = Occupant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /occupants/1/edit
  def edit
    @occupant = Occupant.find(params[:id])
  end

  # POST /occupants
  # POST /occupants.json
  def create
    @occupant = Occupant.new(params[:occupant])

    respond_to do |format|
      if @occupant.save
        format.html { redirect_to @occupant, notice: 'Occupant was successfully created.' }
        format.json { render json: @occupant, status: :created, location: @occupant }
      else
        format.html { render action: "new" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /occupants/1
  # PUT /occupants/1.json
  def update
    @occupant = Occupant.find(params[:id])

    respond_to do |format|
      if @occupant.update_attributes(params[:occupant])
        format.html { redirect_to @occupant, notice: 'Occupant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupants/1
  # DELETE /occupants/1.json
  def destroy
    @occupant = Occupant.find(params[:id])
    @occupant.destroy

    respond_to do |format|
      format.html { redirect_to occupants_url }
      format.json { head :no_content }
    end
  end
end
