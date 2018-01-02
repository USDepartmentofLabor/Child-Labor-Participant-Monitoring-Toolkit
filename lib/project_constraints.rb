class ProjectConstraints
  def matches? request
    Project.all.empty?
  end
end
