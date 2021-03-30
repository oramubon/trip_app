class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer    :score,    null: false
      t.text       :content
      t.references :reviewer, foreign_key: {to_table: :users}
      t.references :reviewee, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
