module JobListsHelper
  def join_jskills(job_list)
    job_list.jskills.map { |s| s.description }.join(", ")
  end
end
