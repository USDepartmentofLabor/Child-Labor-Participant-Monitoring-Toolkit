module ProjectHelper
  def progress_bar value
    content_tag :div, class: 'progress' do
      content_tag :div,'', {class: 'progress-bar', style: "width:#{number_to_percentage value}"}
    end
  end
end
