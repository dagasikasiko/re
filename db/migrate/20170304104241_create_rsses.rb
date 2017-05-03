class CreateRsses < ActiveRecord::Migration[5.0]
  def change
    create_table :rsses do |t|

      t.string :title
      t.text :url
      t.string :site_name
      t.datetime :time
      t.integer :click

      t.timestamps
    end
  end
end
