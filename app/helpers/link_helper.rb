module LinkHelper
  def sidebar_link (link, path, class_name = '', icon = 'fa-angle-double-right')
    if current_page? path
      class_name = class_name + ' active'
    end

    content_tag :li, class: class_name do
      link_to path do
        content_tag(:i, '', class: "fa #{icon}") + ' ' + link
      end
    end
  end
end
