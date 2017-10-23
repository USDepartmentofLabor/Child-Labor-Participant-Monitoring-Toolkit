DATE_FMT = "%m/%d/%Y"

class TechnicalProgressReport < ActiveRecord::Base
  validates :reporting_period_id, presence: true
  validates :reporting_status_id, presence: true
  validates_inclusion_of :is_final_report, :in => [true, false]

  belongs_to :reporting_period
  belongs_to :reporting_status

  has_many :report_attachments

  def has_coversheet
    self.report_attachments.any? {|x| x.attachment_annex == '0'}
  end

  def is_ready_to_submit
    ('a'..'h').each do |x|
      if self["annex_#{x}_included"] && !self.report_attachments.any? {|y| y.attachment_annex == x}
        return false
      end
    end

    return has_coversheet && (self.reporting_status_id == 1 || self.reporting_status_id == 3)
  end

  def to_pdf
    font_path = "/usr/share/fonts/truetype/dejavu"
    project = Project.first
    fgn = project.cooperative_agreement_number
    duns = project.duns_number || "---"
    cpn = project.locations&.first&.country || project.region.name
    cpn = "#{cpn} - #{project.title}"
    hql = project.headquarters_address
    fld = project.field_address
    pstart = project.start_date.strftime DATE_FMT
    pend = project.end_date.strftime DATE_FMT
    rend = self.reporting_period.end_date.strftime DATE_FMT
    fnl = self.is_final_report
    semi = self.is_semi_annual

    Prawn::Document.new(top_margin: 36, bottom_margin: 36, left_margin: 72, right_margin: 72) do
      font_families.update(
        "DejaVu Sans" => {
          :normal => "#{font_path}/DejaVuSans.ttf",
          :italic => "#{font_path}/DejaVuSans-Oblique.ttf",
          :bold   => "#{font_path}/DejaVuSans-Bold.ttf"
        },
        "DejaVu Serif" => {
          :normal => "#{font_path}/DejaVuSerif.ttf",
          :italic => "#{font_path}/DejaVuSerif-Italic.ttf",
          :bold   => "#{font_path}/DejaVuSerif-Bold.ttf"
        }
      )

      define_grid columns: 12, rows: 23, gutter: 0

      grid([0, 0], [0, 11]).bounding_box do
        font "DejaVu Serif", size: 14, style: :bold do
          text "Technical Progress Report", align: :center, color: "1F497D"
        end
      end

      grid([1, 0], [1, 11]).bounding_box do
        font "DejaVu Sans", size: 11 do
          text "Report Date: <i>#{Date.today.strftime DATE_FMT}</i>", align: :center, inline_format: true
          text "<b>Technical Progress Report Cover Sheet</b>", align: :center, inline_format: true
        end
      end

      font "DejaVu Sans", size: 8

      form_box [2, 0], [3, 3],
        "1. Federal Agency and Organization Element to Which Report is Submitted:",
        "USDOL/ILAB/OCFT"

      form_box [2, 4], [3, 7], "2. Federal Grant Number", fgn

      form_box [2, 8], [3, 11], "3. DUNS Number", duns

      form_box [4, 0], [5, 11], "4. Country and Project Name", cpn

      form_box([6, 0], [8, 5]) do
        text "5. Recipient Organization Contact Information"
        text "<i>Headquarters</i>", inline_format: true, indent_paragraphs: 10
        move_down 5
        text hql, indent_paragraphs: 10
      end

      form_box([6, 6], [8, 11]) do
        move_down 9
        text "<i>Field</i>", inline_format: true
        move_down 5
        text fld, indent_paragraphs: 10
      end

      form_box([9, 0], [12, 3]) do
        text "6. Project/Grant Period"
        move_down 5
        text "Start Date: <i>(Month, Day, Year)</i>", inline_format: true
        text pstart
        move_down 5
        text "End Date: <i>(Month, Day, Year)</i>", inline_format: true
        text pend
      end

      form_box([9, 4], [12, 7]) do
        text "7. Reporting Period End Date"
        text "<i>(Month, Day, Year)</i>", inline_format: true
        move_down 5
        text rend
      end

      form_box [9, 8], [10, 11] do
        text "8. Final Report?"
        if fnl
          text "☑ Yes"
          text "☐ No"
        else
          text "☐ Yes"
          text "☑ No"
        end
      end

      form_box [11, 8], [12, 11] do
        text "9. Report Frequency"
        if semi
          text "☑ Semi-annual"
          text "☐ Other"
        else
          text "☐ Semi-annual"
          text "☑ Other"
        end
      end

      form_box([13, 0], [16, 11]) do
        indent 16, 10 do
          text "10. Annexes to submit with every Technical Progress Report, as " +
            "applicable. <i>Please mark the checkboxes below to indicate the " +
            "annexes attached.</i>", inline_format: true, indent_paragraphs: -16

          move_down 9

          text "☑ Annex A: Data Reporting Form for reporting on performance indicators"
          text "☐ Annex B: Updated Work Plan"
          text "☐ Annex C: Response to Donor Comments from Last Technical Progress Report"
          text "☐ Annex D: Update on Project Activities in Response to Evaluation Recommendations"
          text "☐ Annex E: Status of VAT Exemption"
          text "☐ Annex F: Updated Sustainability Strategy (to be included with each October report starting in Year 2)"
          text "☐ Annex G: Major Project Outputs and Research Products"
          text "☐ Annex H: Other Documents"
        end
      end

      grid([17, 0], [18, 11]).bounding_box do
        stroke do
          fill_color "CCCCCC"
          fill_and_stroke_rounded_rectangle [cursor - bounds.height, cursor], bounds.width, bounds.height, 0
        end

        fill_color "000000"

        move_down 3
        indent 3, 3 do
          font "DejaVu Sans", style: :bold do
            text "12. Certification:"
            move_down 8
            indent 10, 10 do
              text "I certify to the best of my knowledge and belief that all " +
                "information and data presented in this report is correct and " +
                "complete."
            end
          end
        end
      end

      form_box [19, 0], [20, 7],
        "12a. Printed Name and Title of Grantee’s Authorized " +
        "Organizational Representative (AOR) or Project Director"

      form_box [19, 8], [19, 11], "12c. Telephone"

      form_box [20, 8], [20, 11], "12d. Email Address"

      form_box [21, 0], [22, 7], "12b. Signature of AOR or Project Director"

      form_box([21, 8], [22, 11]) do
        text "12e. Date Report Submitted"
        text "<i>(Month, Day, Year)</i>", inline_format: true
      end
    end.render
  end

end

module Prawn
  class Document
    def form_box tl, br, title = nil, value = nil, &block
      grid(tl, br).bounding_box do
        stroke_bounds
        move_down 3
        indent 3, 3 do
          if block_given?
            yield
          else
            indent 10, 10 do
              text title, indent_paragraphs: -10
              text value, valign: :center, style: :bold
            end
          end
        end
      end
    end
  end
end
