class ReportAttachment < ActiveRecord::Base
  has_attached_file :attachment

  # Allow all images, Microsoft Office documents, OpenOffice documents, PDFs,
  # and csv files
  validates_attachment_content_type :attachment, content_type: [
    /\Aimage/, /\Aapplication\/vnd\.[ms|openxml]/, "application/msword",
    "application/pdf", "text/csv", /\Aapplication\/vnd\.oasis\.opendocument/]

  belongs_to :technical_progress_report

  has_many :comments
end
