class Occupant < ActiveRecord::Base
  validates :namae,  :presence => true, :format => { :with =>/\A(([а-яА-Я]){3,27} ){2}([а-яА-Я]){3,27}\Z/, :message => "Введите фамилию, имя и отчество на русском языке. В качестве разделителя используйте пробел." }
  validates :contacts, :presence => true, :format => { :with =>/\A(([a-zA-Z])+([a-zA-Z0-9\.\-]){1,}@([a-zA-Z0-9\.\-]){2,}\.([a-zA-Z0-9\.\-]){2,6})|(\+?[0-9\-]{5,11})\Z/, :message => "Введите номер телефона либо адрес электронной почты" }
  validates :status, :presence => true
  validates :salary, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 10000, :message => "Введите целое число не менее 10 000." }
  
  has_many :oskills, :dependent => :destroy
end
