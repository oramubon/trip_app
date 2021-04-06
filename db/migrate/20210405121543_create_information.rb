class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :phone_number, null: false
      t.text       :other
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
