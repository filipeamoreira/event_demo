class AddClickEventsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :click_events, id: false do |t|
      t.integer :signup_id, null: false
      t.integer :mailing_id, null: false
      t.integer :broadcaster_id, null: false

      t.datetime :created_at, null: false
    end
  end
end
