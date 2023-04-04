class  ClickEventsView < ApplicationRecord
  scope :for_mailing, ->(mailing_id) { where(mailing_id: mailing_id) }
end
