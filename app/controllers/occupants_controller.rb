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


    @d_list = Array.new                                                                                                                      # ������ ��������� ������ (���� ������)
    @descriptions = @occupant.oskills.select("description").where(:id => @occupant.oskills)   # ������ �� id � �����
    @descriptions.each do |d|                                                                                                          #
        @d_list << d.description                                                                                                         # ���������� ������ ������
    end                                                                                                                                                #
    @good_skills_with_job_id = Jskill.select("job_list_id").where(:description => @d_list)                  # ����� ���������� ������ ����� ���� ��������
    @id_list = Array.new                                                                                                        # ������ id ���������� �������� (� �������)
    @good_skills_with_job_id.each do |s|                                                                          #
        @id_list << s.job_list_id                                                                                              # ���������� ������ id
    end                                                                                                                                    #
    @id_list_unique = @id_list.uniq                                                                                     # ������ ���������� id
    @fully_compatible_job_list_ids = Array.new                                                                # ������ ��������, ��������� ���������� �� ������ ������ (���� ������)

    @current_job_skills = Array.new                                                                                   # ������ ���� ��������� ������ �������� (���������)
    @id_list_unique.each do |i|                                                                                            #
          @current_job_skill_ids = Jskill.select("description").where(:job_list_id => i)       # ��������� ������ id ���� ��������� ������ ��������
          @current_job_skills.clear                                                                                         #
          @current_job_skill_ids.each do |e|                                                                         #
              @current_job_skills << e.description                                                                  # ���������� ������ ���� ��������� ������ ��������
          end                                                                                                                             #
          if (@d_list & @current_job_skills).size == @current_job_skills.size                    #
              @fully_compatible_job_list_ids << i                                                                    # ���������� ������ id ��������, ��������� ���������� �� ������ ������
        end                                                                                                                                #
    end                                                                                                                                    #
    @partially_compatible_job_list_ids = @id_list_unique - @fully_compatible_job_list_ids   # ���������� ������ id ��������, �������� ���������� �� ������ ������

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
