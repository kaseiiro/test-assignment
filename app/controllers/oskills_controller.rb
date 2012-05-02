class OskillsController < ApplicationController

  def create
    @occupant = Occupant.find(params[:occupant_id])
    @oskill = @occupant.oskills.create(params[:oskill])
    redirect_to edit_occupant_path(@occupant)
  end
  
  def destroy
    @occupant = Occupant.find(params[:occupant_id])
    @oskill = @occupant.oskills.find(params[:id])
    @oskill.destroy
    redirect_to edit_occupant_path(@occupant)
  end
  
end
