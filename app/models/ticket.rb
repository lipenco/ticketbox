class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :pictures

  def date
    self[:date] || Date.today
  end
end
