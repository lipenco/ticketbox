class Category < ActiveRecord::Base
  has_many :tickets

  def tickets_num
    self.tickets.count
  end


end
