module ChildrenHelper
	def gender_text(child)
		option = Child::SEX_OPTIONS[child.sex - 1]
		return I18n.t(option[0])
	end
end
