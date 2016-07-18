class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :background_color_id

      t.timestamps null: false
    end
  end
end
