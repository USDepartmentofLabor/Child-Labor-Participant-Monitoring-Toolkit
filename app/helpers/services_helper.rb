module ServicesHelper
  def has_recipients service
    return service.people.count > 0
  end
end
