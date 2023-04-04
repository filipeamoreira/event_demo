class ClickEventsViewController < ApplicationController
  def show
    @mailing_id = params[:id]

    @data = ClickEventsView.for_mailing(@mailing_id).pluck(:bucket, :click_events_count)
  end
end
