class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer    :country,  null: false
      t.string     :state,    null: false
      t.integer    :language, null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
