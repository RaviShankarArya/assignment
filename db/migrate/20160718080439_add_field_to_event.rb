class AddFieldToEvent < ActiveRecord::Migration
  def change
    add_column :events, :font, :text
  end
end
