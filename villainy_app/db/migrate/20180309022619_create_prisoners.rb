class CreatePrisoners < ActiveRecord::Migration[5.1]
  def change
    create_table :prisoners do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.belongs_to :prison, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
