Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'event_ingestor/new'
  get 'click_events_view/:id' => 'click_events_view#show'
end
