module ApplicationHelper

  def nav_link_to(body, url_options = {}, html_options = {})
    if current_page?(url_options)
      old_class = html_options.fetch(:class, "")
      new_class = old_class.split.push("current").join(" ")
      link_to(body, url_options, html_options.merge(class: new_class))
    else
      link_to(body, url_options, html_options)
    end
  end
end
