class CreatePrisons < ActiveRecord::Migration[5.1]
  def change
    create_table :prisons do |t|
      t.integer :number
      t.belongs_to :user, index: true
    end
  end
end
