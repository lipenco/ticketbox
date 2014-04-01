class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :ticket_categories
  has_many :categories, through: :ticket_categories
end
