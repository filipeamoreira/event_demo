class CreateClickEventsView < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def up
    execute <<~SQL
      create materialized view click_events_views
      with (
        timescaledb.continuous
      ) as
      select
        time_bucket('1 minute', created_at) as bucket,
        mailing_id,
        count(*) as click_events_count
      from click_events
      group by bucket, mailing_id;
    SQL

    execute <<~SQL
      select add_continuous_aggregate_policy(
        'click_events_views',
        start_offset => INTERVAL '1 week',
        end_offset => INTERVAL '1 minute',
        schedule_interval => INTERVAL '1 minute'
      );
    SQL
  end

  def down
    execute 'drop view click_events_views cascade'
  end
end
