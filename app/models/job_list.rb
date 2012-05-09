class JobList < ActiveRecord::Base
  validates :title,  :presence => true
  validates :salary, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 10000, :message => "Введите целое число не менее 10 000." }
  validates :contacts, :presence => true, :format => { :with =>/\A(([a-zA-Z])+([a-zA-Z0-9\.\-]){1,}@([a-zA-Z0-9\.\-]){2,}\.([a-zA-Z0-9\.\-]){2,6})|(\+?[0-9\-]{5,11})\Z/, :message => "Введите номер телефона либо адрес электронной почты" }

  has_many :jskills, :dependent => :destroy
end
