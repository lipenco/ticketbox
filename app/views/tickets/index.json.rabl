collection @tickets

attributes :id, :name, :user_id, :date, :category_id

child :pictures do
  attributes :id, :urll
end
