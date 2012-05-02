module OccupantsHelper
  def join_skills(occupant)
    occupant.oskills.map { |s| s.description }.join(", ")
  end
end
