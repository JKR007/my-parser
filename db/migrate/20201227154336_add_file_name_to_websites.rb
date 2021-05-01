class AddFileNameToWebsites < ActiveRecord::Migration[5.2]
  def change
    add_column :websites, :file_name, :string
  end
end
