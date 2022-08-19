class AddColumnsToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :bill, :string
    add_column :doctors, :image, :string
    add_column :doctors, :location, :string
    add_column :doctors, :email, :string
  end
end
