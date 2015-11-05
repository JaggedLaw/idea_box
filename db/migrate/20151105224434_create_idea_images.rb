class CreateIdeaImages < ActiveRecord::Migration
  def change
    create_table :idea_images do |t|
      t.integer :idea_id
      t.integer :imgage_id

      t.timestamps null: false
    end
  end
end
