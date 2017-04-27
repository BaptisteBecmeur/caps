class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :pseudo
      t.references :user, foreign_key: true
      t.string :city
      t.string :country
      t.string :cover
      t.string :introduction
      t.text :content
      t.string :tag

      t.timestamps
    end
  end
end
