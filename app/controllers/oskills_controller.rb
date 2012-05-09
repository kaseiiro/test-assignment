class OskillsController < ApplicationController

  def create
    @occupant = Occupant.find(params[:occupant_id])
    if @occupant.oskills.where(params[:oskill]).exists? == false
      @oskill = @occupant.oskills.create(params[:oskill])
      error = 'Навык добавлен.'
    else
      error = 'Навык уже добавлен ранее.'
    end
    redirect_to edit_occupant_path(@occupant), notice: error
  end
  
  def destroy
    @occupant = Occupant.find(params[:occupant_id])
    @oskill = @occupant.oskills.find(params[:id])
    @oskill.destroy
    redirect_to edit_occupant_path(@occupant)
  end
  
end
