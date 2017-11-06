class CreateTwits < ActiveRecord::Migration[5.1]
  def change
    create_table :twits do |t|
      t.string :message
      t.timestamps
    end
  end
end
