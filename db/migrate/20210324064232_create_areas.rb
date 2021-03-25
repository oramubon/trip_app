class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer    :country_id,  null: false
      t.string     :state,       null: false
      t.integer    :language_id, null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
