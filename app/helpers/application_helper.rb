module ApplicationHelper
  def current_user_header_color
    current_user&.header_color || "#370617"
  end
end
