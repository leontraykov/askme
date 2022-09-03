module QuestionsHelper
  def sanitized(text)
    sanitized = Rails::Html::LinkSanitizer.new
    sanitized.sanitize(text)
  end
end
