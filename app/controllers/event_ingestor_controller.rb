class EventIngestorController < ApplicationController
  MAILING_ID = [400, 500].freeze

  def new
    ClickEvent.create!(signup_id: rand(100_000),
                       mailing_id: MAILING_ID.sample,
                       broadcaster_id: rand(1_000))
  rescue StandardError => e
    Rails.logger.error("SDMKF: Error raised => #{e}")
  ensure
    ActiveRecord::Base.clear_active_connections!
  end
end
