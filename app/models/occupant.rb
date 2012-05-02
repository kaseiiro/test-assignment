class Occupant < ActiveRecord::Base


  has_many :oskills, :dependent => :destroy
end
