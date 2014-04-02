class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def date
    self[:date] || Date.today
  end
end
