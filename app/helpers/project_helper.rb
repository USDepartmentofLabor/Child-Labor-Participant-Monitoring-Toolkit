module ProjectHelper
  def progress_bar value
    return '' if value.nil? || value == ''
    content_tag :div, class: 'progress' do
      content_tag :div,'',
        { class: 'progress-bar', style: "width:#{number_to_percentage value}" }
    end
  end

  def info_box title, value, percent, description, icon, color
    content_tag :div, class: "info-box bg-#{color}" do
      content_tag(:span, fa_icon(icon), {class: "info-box-icon"}) +
      content_tag(:div, class: "info-box-content") do
        concat content_tag(:span, title, class: "info-box-text")
        concat content_tag(:span, value, class: "info-box-number")
        concat progress_bar(percent)
        concat content_tag(:span, description, class: "progress-description")
      end
    end 
  end

  def collapsible_box title, color, &block
    content_tag :div, class: "box box-#{color}" do
      concat collapsible_box_header title
      concat box_body(&block)
    end
  end

  def collapsible_box_header title, &block
    content_tag :div, class: "box-header with-border" do
      concat content_tag(:h3, title, class: "box-title")
      concat box_tools &block
    end
  end

  def box_body &block
    content_tag :div, class: "box-body" do
      capture(&block)
    end
  end

  def box_tools &block
    content_tag :div, class: "box-tools pull-right" do
      if block_given?
        concat(content_tag(:span, class: "box-tools") do
          capture(&block)
        end)
      end
      concat(content_tag(:button, {class: "btn btn-box-tool",
        data: {widget: "collapse"}}) do
        fa_icon "minus"
      end)
      concat(content_tag(:button, {class: "btn btn-box-tool",
        data: {widget: "remove"}}) do
        fa_icon "times"
      end)
    end
  end
end
