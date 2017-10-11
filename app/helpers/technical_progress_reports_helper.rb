module TechnicalProgressReportsHelper
  def tpr_checkbox_helper tpr, id

    prop = "annex_#{id}_included"

    content_tag(:span, class: 'checkbox') do
      content_tag(:label) do
        concat check_box_tag(prop, "1", tpr[prop], {disabled: true, class: "icheck"})
        concat " " + TechnicalProgressReport.human_attribute_name(prop.to_sym)
      end
    end
  end
end
