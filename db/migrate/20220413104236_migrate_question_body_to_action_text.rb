class MigrateQuestionBodyToActionText < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :questions, :body, :body_old
    Question.find_each do |question|
      ActiveRecord::Base.no_touching do
        ActionText::RichText.new(name: body.to_s, body: ActionText::Content.new(record.read_attribute(body_old)), record_type: Question.to_s, record_id: question.id, created_at: question.created_at, updated_at: question.updated_at).save
      end
    end
    remove_column :questions, :body_old
  end
end
