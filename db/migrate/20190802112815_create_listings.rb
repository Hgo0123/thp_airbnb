class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :available_bed
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.references :admin, index: true
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
