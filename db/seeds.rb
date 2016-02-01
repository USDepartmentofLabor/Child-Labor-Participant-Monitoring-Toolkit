# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ServiceType.create([{ name: 'Formal Educational' }, { name: 'Non-Formal Educational' }, { name: 'Vocational' }, { name: 'Other Educational' }, { name: 'Livelihood Employment' }, { name: 'Livelihood Economic Strengthening' }, { name: 'Other Livelihood' }])
UnitOfMeasure.create([{ name: 'Numeric' }, { name: 'Percentage' }])
