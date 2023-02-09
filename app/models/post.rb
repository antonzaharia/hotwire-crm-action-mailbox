class Post < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :conversation
end
