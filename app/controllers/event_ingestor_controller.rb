class EventIngestorController < ApplicationController
  def new
    ClickEvent.create!(signup_id: rand(100_000),
                       mailing_id: rand(10_000),
                       broadcaster_id: rand(1_000))
  end
end