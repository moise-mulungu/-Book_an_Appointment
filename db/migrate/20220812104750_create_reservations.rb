class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :datetime
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :doctor, index: true, foreign_key: true
      t.timestamps
    end
  end
end
