module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "sub-menu sub-menu-1 active" : ""
  end

end
