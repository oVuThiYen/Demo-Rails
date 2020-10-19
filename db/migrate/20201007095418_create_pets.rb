class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :ten_pet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
