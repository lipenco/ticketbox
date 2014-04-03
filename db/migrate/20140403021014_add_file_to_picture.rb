class AddFileToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :file, :string
  end
end
