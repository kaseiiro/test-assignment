class JskillsController < ApplicationController

  def create
    @job_list = JobList.find(params[:job_list_id])
    @jskill = @job_list.jskills.create(params[:jskill])
    redirect_to edit_job_list_path(@job_list)
  end
  
  def destroy
    @job_list = JobList.find(params[:job_list_id])
    @jskill = @job_list.jskills.find(params[:id])
    @jskill.destroy
    redirect_to edit_job_list_path(@job_list)
  end
  
end
