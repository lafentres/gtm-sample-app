module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Look At My Cat"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def meta_tags(meta_tags)
    content_for :meta_tags, meta_tags
  end


  def get_ga_event(event)
    session[event]
  end

  def clear_ga_event(event)
    session.delete(event)
  end

end
