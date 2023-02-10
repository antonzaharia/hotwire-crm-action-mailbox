class ApplicationMailbox < ActionMailbox::Base
  routing ReplyMailbox::MATCHER => :reply
  routing :all => :conversation
end
