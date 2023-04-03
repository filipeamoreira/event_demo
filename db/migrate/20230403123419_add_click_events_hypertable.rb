class AddClickEventsHypertable < ActiveRecord::Migration[5.2]
  def change
    execute "SELECT create_hypertable('click_events', 'created_at');"
  end
end
