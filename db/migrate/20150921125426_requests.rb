class Requests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :method, null: false
      t.string :url, null: false
      t.json :headers, default: {}
      t.json :query, default: {}
      t.text :body

      t.timestamps
    end
  end
end
