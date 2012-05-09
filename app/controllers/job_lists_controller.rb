class JobListsController < ApplicationController

  # GET /job_lists
  # GET /job_lists.json
  def index
    @job_lists = JobList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_lists }
    end
  end

  # GET /job_lists/1
  # GET /job_lists/1.json
  def show
    @job_list = JobList.find(params[:id])
    
    @d_list = Array.new                                                                                                              # список требуемых умений (пока пустой)
    @descriptions = @job_list.jskills.select("description").where(:id => @job_list.jskills)   # умения из id в текст
    @descriptions.each do |d|                                                                                                  #
        @d_list << d.description                                                                                                 # заполнение списка умений
    end                                                                                                                                       #
    @good_skills_with_occupant_id = Oskill.select("occupant_id").where(:description => @d_list)                  # выбор подходящих умений среди всех кандидатов
    @id_list = Array.new                                                                                                        # список id подходящих работников (с дублями)
    @good_skills_with_occupant_id.each do |s|                                                                #
        @id_list << s.occupant_id                                                                                           # заполнение списка id
    end                                                                                                                                    #
    @id_list_unique = @id_list.uniq                                                                                     # список уникальных id
    @fully_compatible_occupant_ids = Array.new                                                             # список работников, полностью подходящих по набору умений (пока пустой)
    @id_list_unique.each do |i|                                                                                            #
        if @id_list.find_all{ |ii| ii == i }.size == @d_list.size                                                   #
          @fully_compatible_occupant_ids << i                                                                     # заполнение списка id работников, полностью подходящих по набору умений
        end                                                                                                                                #
    end                                                                                                                                    #
    @partially_compatible_occupant_ids = @id_list_unique - @fully_compatible_occupant_ids   # заполнение списка id работников, частично подходящих по набору умений

    @fully_compatible_occupants = Occupant.where(:status => 1, :id => @fully_compatible_occupant_ids).order("salary ASC")
    @partially_compatible_occupants = Occupant.where(:status => 1, :id => @partially_compatible_occupant_ids).order("salary ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_list }
    end
  end

  # GET /job_lists/new
  # GET /job_lists/new.json
  def new
    @job_list = JobList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_list }
    end
  end

  # GET /job_lists/1/edit
  def edit
    @job_list = JobList.find(params[:id])
  end

  # POST /job_lists
  # POST /job_lists.json
  def create
    @job_list = JobList.new(params[:job_list])

    respond_to do |format|
      if @job_list.save
        format.html { redirect_to @job_list, notice: 'Job list was successfully created.' }
        format.json { render json: @job_list, status: :created, location: @job_list }
      else
        format.html { render action: "new" }
        format.json { render json: @job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_lists/1
  # PUT /job_lists/1.json
  def update
    @job_list = JobList.find(params[:id])

    respond_to do |format|
      if @job_list.update_attributes(params[:job_list])
        format.html { redirect_to @job_list, notice: 'Job list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_lists/1
  # DELETE /job_lists/1.json
  def destroy
    @job_list = JobList.find(params[:id])
    @job_list.destroy

    respond_to do |format|
      format.html { redirect_to job_lists_url }
      format.json { head :no_content }
    end
  end
  
  
end
