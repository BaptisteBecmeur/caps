class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :picture, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :town, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone_number, :string
    add_column :users, :fonction, :string
    add_column :users, :hobby1, :string
    add_column :users, :hobby2, :string
    add_column :users, :hobby3, :string
    add_column :users, :biographie, :string
    add_column :users, :address, :string
  end
end
