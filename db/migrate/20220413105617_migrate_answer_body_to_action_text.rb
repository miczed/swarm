class MigrateAnswerBodyToActionText < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :answers, :body, :body_old
    Answer.find_each do |answer|
      ActiveRecord::Base.no_touching do
        ActionText::RichText.new(name: :body.to_s, body: ActionText::Content.new(answer.read_attribute(:body_old)), record_type: Answer.to_s, record_id: answer.id, created_at: answer.created_at, updated_at: answer.updated_at).save
      end
    end
    remove_column :answers, :body_old
  end
end
