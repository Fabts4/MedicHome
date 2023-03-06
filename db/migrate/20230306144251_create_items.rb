class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.integer :price
      t.boolean :drug

      t.timestamps
    end
  end
end
