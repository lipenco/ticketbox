class Category < ActiveRecord::Base
  has_many :ticket_categories
  has_amny :tickets, through: :ticket_categories
end
