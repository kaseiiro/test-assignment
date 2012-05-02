class JobList < ActiveRecord::Base

  has_many :jskills, :dependent => :destroy
end
