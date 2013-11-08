class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :album
      t.string :name
      t.string :location
      t.string :file
      t.timestamps
    end
  end
end
