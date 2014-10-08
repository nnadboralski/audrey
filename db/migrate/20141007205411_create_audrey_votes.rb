class CreateAudreyVotes < ActiveRecord::Migration
  def change
    create_table :audrey_votes do |t|

      t.timestamps
    end
  end
end
