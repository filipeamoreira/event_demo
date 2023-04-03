Rails.application.configure do
  config.lograge.enable = true
  config.lograge.custom_options = lambda do |event|
    { time: event.time }
  end
end
