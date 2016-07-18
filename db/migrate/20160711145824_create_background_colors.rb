class CreateBackgroundColors < ActiveRecord::Migration
  def change
    create_table :background_colors do |t|
      t.string :name
      t.text :code

      t.timestamps null: false
    end
  end
end
