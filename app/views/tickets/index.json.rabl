collection @tickets

attributes :id, :name, :user_id

child :pictures do
  attributes :id, :urll
end
