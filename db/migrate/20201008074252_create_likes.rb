class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :ten_like
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
