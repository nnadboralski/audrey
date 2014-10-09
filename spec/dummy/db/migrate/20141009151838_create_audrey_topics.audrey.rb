# This migration comes from audrey (originally 20141007132909)
class CreateAudreyTopics < ActiveRecord::Migration
  def change
    create_table :audrey_topics do |t|
      t.string  :topic
      t.text    :content

      t.integer :owner_id
      t.timestamps
    end
  end
end
