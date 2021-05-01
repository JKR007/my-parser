class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :link_id
      t.string :name
      t.text :descrtiption
      t.string :url
      t.timestamps
    end

    add_index :records, :link_id
  end
end
