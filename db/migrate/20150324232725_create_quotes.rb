class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :tweet_id
      t.string :screen_name
      t.text :content

      t.timestamps null: false
    end
  end
end
