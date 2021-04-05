class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.integer    :phone_number, null: false
      t.text       :string
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
