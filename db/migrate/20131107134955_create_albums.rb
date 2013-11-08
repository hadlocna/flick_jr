class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
