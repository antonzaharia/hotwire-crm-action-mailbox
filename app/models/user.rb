class User < ApplicationRecord
  has_many :posts, as: :author
  has_rich_text :body
end
