class AddLinkToParsers < ActiveRecord::Migration[5.2]
  def change
    add_column :parsers, :link_id, :bigint

    add_index :parsers, :link_id
  end
end
