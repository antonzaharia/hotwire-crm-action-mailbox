class Post < ApplicationRecord
  belongs_to :author, polymorphic: true
  belongs_to :conversation
  has_many_attached :attachements

  validates :body, presence: true
  validates :message_id, presence: true

  broadcasts_to :conversation
end
