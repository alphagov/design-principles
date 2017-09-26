module ApplicationHelper

  def nav_link_to(url, html_options = {}, &block)
    text = capture(&block)

    if current_page?(url)
      old_class = html_options.fetch(:class, "")
      new_class = old_class.split.push("current").join(" ")
      link_to(text, url, html_options.merge(class: new_class))
    else
      link_to(text, url, html_options)
    end
  end
end
