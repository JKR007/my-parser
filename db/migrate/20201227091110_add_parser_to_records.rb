class AddParserToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :parser_id, :bigint

    add_index :records, :parser_id
  end
end
