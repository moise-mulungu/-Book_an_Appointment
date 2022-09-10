class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :speciality
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
