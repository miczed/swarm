class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many   :comments, as: :commentable, dependent: :destroy
  has_many   :votes,    as: :votable, dependent: :destroy

  validates :body, presence: true, no_attachments: true
  has_rich_text :body

  scope :order_by_newest, -> { order("id desc") }
  scope :order_by_oldest, -> { order("id asc") }

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
