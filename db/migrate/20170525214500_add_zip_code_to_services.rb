class AddZipCodeToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :zip_code, :string
  end
end
