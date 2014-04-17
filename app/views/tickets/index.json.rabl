collection @tickets

attributes :id, :name, :user_id, :date, :category_id, :description

child :pictures do
  attributes :id, :urll
end
