module LinkHelper
  def sidebar_link (link, path, class_name = '', icon = 'fa-angle-double-right')
    content_tag :li, class: class_name do
      link_to path do
        content_tag(:i, '', class: "fa #{icon}") + ' ' + link
      end
    end
  end
end
