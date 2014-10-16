# This migration comes from audrey (originally 20141007205411)
class CreateAudreyVotes < ActiveRecord::Migration
  def change
    create_table :audrey_votes do |t|

      t.references :user, index: true
      t.references :topic, index: true
      t.integer :value

      t.timestamps
    end
  end
end
