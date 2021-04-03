class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string     :title,       null: false
      t.date       :start_on,    null: false
      t.date       :end_on,      null: false
      t.text       :description, null: false
      t.integer    :country_id,  null: false
      t.integer    :price,       null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
