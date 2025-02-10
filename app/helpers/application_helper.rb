module ApplicationHelper
  def active_link?(controller_name)
    "active" if controller_name?(controller_name)
  end

  def breadcrumb(text, url = nil)
    content_tag :li, class: "breadcrumb-item" do
      if url
        link_to text, url
      else
        content_tag :span, text, class: "current"
      end
    end
  end

  def page_title(title)
    content_for(:title) { title }
    content_for(:page_title) { title }
  end

  def meta_description(text)
    content_for(:description) { text }
  end

  def body_class(classes)
    content_for(:body_class) { classes }
  end

  def content_class(classes)
    content_for(:content_class) { classes }
  end
end
