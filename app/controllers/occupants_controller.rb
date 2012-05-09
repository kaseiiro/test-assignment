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


    @d_list = Array.new                                                                                                                      # список требуемых умений (пока пустой)
    @descriptions = @occupant.oskills.select("description").where(:id => @occupant.oskills)   # умения из id в текст
    @descriptions.each do |d|                                                                                                          #
        @d_list << d.description                                                                                                         # заполнение списка умений
    end                                                                                                                                                #
    @good_skills_with_job_id = Jskill.select("job_list_id").where(:description => @d_list)                  # выбор подходящих умений среди всех вакансий
    @id_list = Array.new                                                                                                        # список id подходящих вакансий (с дублями)
    @good_skills_with_job_id.each do |s|                                                                          #
        @id_list << s.job_list_id                                                                                              # заполнение списка id
    end                                                                                                                                    #
    @id_list_unique = @id_list.uniq                                                                                     # список уникальных id
    @fully_compatible_job_list_ids = Array.new                                                                # список вакансий, полностью подходящих по набору умений (пока пустой)

    @current_job_skills = Array.new                                                                                   # список всех требуемых умений вакансии (временный)
    @id_list_unique.each do |i|                                                                                            #
          @current_job_skill_ids = Jskill.select("description").where(:job_list_id => i)       # получение списка id всех требуемых умений вакансии
          @current_job_skills.clear                                                                                         #
          @current_job_skill_ids.each do |e|                                                                         #
              @current_job_skills << e.description                                                                  # заполнение списка всех требуемых умений вакансии
          end                                                                                                                             #
          if (@d_list & @current_job_skills).size == @current_job_skills.size                    #
              @fully_compatible_job_list_ids << i                                                                    # заполнение списка id вакансий, полностью подходящих по набору умений
        end                                                                                                                                #
    end                                                                                                                                    #
    @partially_compatible_job_list_ids = @id_list_unique - @fully_compatible_job_list_ids   # заполнение списка id вакансий, частично подходящих по набору умений

    @fully_compatible_job_lists = JobList.where("expire > :expire AND id IN (:id)", {:expire => Time.now.to_date, :id => @fully_compatible_job_list_ids}).order("salary DESC")
    @partially_compatible_job_lists = JobList.where("expire > :expire AND id IN (:id)", {:expire => Time.now.to_date, :id => @partially_compatible_job_list_ids}).order("salary DESC")


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
