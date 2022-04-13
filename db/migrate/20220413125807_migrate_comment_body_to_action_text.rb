class MigrateCommentBodyToActionText < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :comments, :body, :body_old
    Comment.find_each do |comment|
      ActiveRecord::Base.no_touching do
        ActionText::RichText.new(name: :body.to_s, body: ActionText::Content.new(comment.read_attribute(:body_old)), record_type: comment.to_s, record_id: comment.id, created_at: comment.created_at, updated_at: comment.updated_at).save
      end
    end
    remove_column :comments, :body_old
  end
end
