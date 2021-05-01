class AddLinkToWebsites < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :website_id, :integer
    add_index :links, :website_id 
  end
end
