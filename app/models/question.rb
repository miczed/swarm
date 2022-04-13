class Question < ApplicationRecord
  belongs_to :user
  has_many   :answers, dependent: :destroy
  has_many   :comments, as: :commentable, dependent: :destroy
  has_many   :votes,    as: :votable, dependent: :destroy

  validates :title, presence: true

  validates :body, presence: true, no_attachments: true
  has_rich_text :body

  scope :order_by_newest, -> { order("id desc") }

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
