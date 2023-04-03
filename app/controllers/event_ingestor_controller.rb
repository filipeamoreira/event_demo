class EventIngestorController < ApplicationController
  def new
    Thread.new do
      ClickEvent.create!(signup_id: rand(100_000),
                         mailing_id: rand(10_000),
                         broadcaster_id: rand(1_000))
    rescue StandardError => e
      Rails.log.error("SDMKF: Error raised => #{e}")
    ensure
      ActiveRecord::Base.clear_active_connections!
    end
  end
end
