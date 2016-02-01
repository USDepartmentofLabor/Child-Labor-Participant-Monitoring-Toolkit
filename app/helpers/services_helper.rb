module ServicesHelper
  def has_recipients service
    return service.children.count > 0
  end
end
