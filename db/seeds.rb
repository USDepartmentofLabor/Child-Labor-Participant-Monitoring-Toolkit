# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ServiceType.create([
  { name: 'Formal Educational' },
  { name: 'Non-Formal Educational' },
  { name: 'Vocational' },
  { name: 'Other Educational' },
  { name: 'Livelihood Employment' },
  { name: 'Livelihood Economic Strengthening' },
  { name: 'Other Livelihood' }
])

UnitOfMeasure.create([
  { name: 'Numeric' },
  { name: 'Percentage' }
])

EducationStatus.create([
  { name: 'Formal Education'},
  { name: 'Non-formal Education' },
  { name: 'Vocational Education' }
])

WorkStatus.create([
  { name: 'Engaged in Child Labor', work_type: 'CL' },
  { name: 'Hazardous Child Labor', work_type: 'CL' },
  { name: 'Worst Form of Child Labor (WFCL)', work_type: 'CL' },
  { name: 'High Risk of Entering Child Labor', work_type: 'CACHR' }
])

ProjectTargetType.create([
  { name: 'Child' },
  { name: 'Youth' },
  { name: 'Household' },
  { name: 'Adult Forced Labor'}
])

Region.create([
  { name: 'Africa', },
  { name: 'Latin America' },
  { name: 'Asia-MENA' },
  { name: 'Unknown' }
])

LocationType.create([
  { name: 'Project Headquarters Location' },
  { name: 'Project Field Location' }
])

ReportingStatus.create([
  { name: 'Draft' },
  { name: 'Submitted' },
  { name: 'Ready for Revision' },
  { name: 'In Revision' },
  { name: 'Approved' }
])

ReportingPeriod.create([
  { start_date: '2015-10-01', end_date: '2016-03-31', name: 'PERIOD 1 : 1 Oct. 2015 - 31 Mar. 2016'},
  { start_date: '2016-04-01', end_date: '2016-09-30', name: 'PERIOD 2 : 1 Apr. 2016 - 30 Sept. 2016'},
  { start_date: '2016-10-01', end_date: '2017-03-31', name: 'PERIOD 3 : 1 Oct. 2016 - 31 Mar. 2017'},
  { start_date: '2017-04-01', end_date: '2017-09-30', name: 'PERIOD 4 : 1 Apr. 2017 - 30 Sept. 2017'},
  { start_date: '2017-10-01', end_date: '2018-03-31', name: 'PERIOD 5 : 1 Oct. 2017 - 31 Mar. 2018'},
  { start_date: '2018-04-01', end_date: '2018-09-30', name: 'PERIOD 6 : 1 Apr. 2018 - 30 Sept. 2018'},
  { start_date: '2018-10-01', end_date: '2019-03-31', name: 'PERIOD 7 : 1 Oct. 2018 - 31 Mar. 2019'},
  { start_date: '2019-04-01', end_date: '2019-09-30', name: 'PERIOD 8 : 1 Apr. 2019 - 30 Sept. 2019'},
  { start_date: '2019-10-01', end_date: '2020-03-31', name: 'PERIOD 9 : 1 Oct. 2019 - 31 Mar. 2020'},
])
