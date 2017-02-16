class Adult < Person
  def gender_name
    Adult.gender_name(self.sex)
  end
end
