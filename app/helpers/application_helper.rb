module ApplicationHelper

  def nav_link_to(text, url_options = {}, html_options = {}, &block)
    unless text.is_a? String
      html_options = url_options
      url_options = text
      text = capture(&block)
    end
    
    if current_page?(url_options)
      old_class = html_options.fetch(:class, "")
      new_class = old_class.split.push("current").join(" ")
      link_to(text, url_options, html_options.merge(class: new_class))
    else
      link_to(text, url_options, html_options)
    end
  end
end
