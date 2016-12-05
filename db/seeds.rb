# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ServiceTypeCategory.create([
  { name: 'Educational Services', definition: 'Education services refer to all formal and non-formal education services, including vocational education.' },
  { name: 'Livelihood Services',  definition: 'Livelihood services may include, but are not limited to, the provision or linkage to education and training, employment services, economic strengthening services, consumption smoothing services, and social capital services.'}
])

ServiceType.create([
  { name: 'Education: Formal',                  definition: 'Formal education is provided and/or recognized by the government. Formal education may include government schools, private schools, religious schools, etc. Formal education services may involve the provision of goods and/or services including direct costs such as school fees and teaching and learning materials and indirect costs such as school uniforms, transportation costs, etc. These goods and/or services are intended to ensure that the child will attend and stay in school.',                                                                                                               service_type_category_id: 1 },
  { name: 'Education: Non-Formal',              definition: 'Non-formal education is provided by any organization or body outside of the formal school system. This education may include literacy, mainstreaming education, accelerated learning, community-based education, bridge courses, remedial education, life skills, etc. Non-formal education services may lead to mainstreaming into formal education or equivalent school certificates.',                                                                                                                                                                                                                        service_type_category_id: 1 },
  { name: 'Education: Vocational',              definition: 'Education, apprenticeships, and/or training related to a specific vocation, trade or occupation. Vocational education is differentiated from formal or non-formal education and should not be counted under formal and non-formal education services. Vocational services provided by a project should reflect a market assessment to determine appropriate skills needed for securing decent work in a given geographic area.',                                                                                                                                                                                 service_type_category_id: 1 },
  { name: 'Livelihood: Economic Strengthening', definition: 'Economic strengthening services aim to increase the economic well-being of participants. Economic strengthening services may include the provision or linkage to micro-credit/loan programs, productivity transfers, cooperatives, and consumption smoothing services.',                                                                                                                                                                                                                                                                                                                                         service_type_category_id: 2 },
  { name: 'Livelihood: Adult Employment',       definition: 'Employment services for adults aim to increase employment, job retention, earnings, and occupational skills of participants. Employment services may include the provision or linkage to employment assistance programs, occupational safety and health training, micro-franchise programs, job placement, apprenticeships and public works programs.',                                                                                                                                                                                                                                                          service_type_category_id: 2 },
  { name: 'Livelihood: Other',                  definition: 'Livelihood services other than employment and economic strengthening include any project-specific interventions that do not fit under the other sub-indicators. Social capital services, for example, aim to connect a participant with networks or groups for purposes including promoting sustainable livelihoods and reducing vulnerability to child labor. Social capital services facilitate the coordination resources for the mutual benefit of the participants. Social capital services may include the provision or linkage to support groups, farmer organizations and labor sharing arrangements.',  service_type_category_id: 2 }
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
  { name: 'Engaged in Child Labor',             work_type: 'CL' },
  { name: 'Hazardous Child Labor',              work_type: 'CL' },
  { name: 'Worst Form of Child Labor (WFCL)',   work_type: 'CL' },
  { name: 'High Risk of Entering Child Labor',  work_type: 'CACHR' }
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

Ability.create([
  { name: 'child_index',                       category: 'child',                     action: 'index'   },
  { name: 'child_show',                        category: 'child',                     action: 'show'    },
  { name: 'child_create',                      category: 'child',                     action: 'create'  },
  { name: 'child_edit',                        category: 'child',                     action: 'edit'    },
  { name: 'child_destroy',                     category: 'child',                     action: 'destroy' },
  { name: 'household_index',                   category: 'household',                 action: 'index'   },
  { name: 'household_show',                    category: 'household',                 action: 'show'    },
  { name: 'household_create',                  category: 'household',                 action: 'create'  },
  { name: 'household_edit',                    category: 'household',                 action: 'edit'    },
  { name: 'household_destroy',                 category: 'household',                 action: 'destroy' },
  { name: 'service_index',                     category: 'service',                   action: 'index'   },
  { name: 'service_show',                      category: 'service',                   action: 'show'    },
  { name: 'service_create',                    category: 'service',                   action: 'create'  },
  { name: 'service_edit',                      category: 'service',                   action: 'edit'    },
  { name: 'service_destroy',                   category: 'service',                   action: 'destroy' },
  { name: 'service_type_index',                category: 'service_type',              action: 'index'   },
  { name: 'service_type_show',                 category: 'service_type',              action: 'show'    },
  { name: 'service_type_create',               category: 'service_type',              action: 'create'  },
  { name: 'service_type_edit',                 category: 'service_type',              action: 'edit'    },
  { name: 'service_type_destroy',              category: 'service_type',              action: 'destroy' },
  { name: 'indicator_index',                   category: 'indicator',                 action: 'index'   },
  { name: 'indicator_show',                    category: 'indicator',                 action: 'show'    },
  { name: 'indicator_create',                  category: 'indicator',                 action: 'create'  },
  { name: 'indicator_edit',                    category: 'indicator',                 action: 'edit'    },
  { name: 'indicator_destroy',                 category: 'indicator',                 action: 'destroy' },
  { name: 'custom_field_create',               category: 'custom_field',              action: 'create'  },
  { name: 'custom_field_destroy',              category: 'custom_field',              action: 'destroy' },
  { name: 'project_edit',                      category: 'project',                   action: 'edit'    },
  { name: 'role_index',                        category: 'role',                      action: 'index'   },
  { name: 'role_create',                       category: 'role',                      action: 'create'  },
  { name: 'role_edit',                         category: 'role',                      action: 'edit'    },
  { name: 'role_destroy',                      category: 'role',                      action: 'destroy' },
  { name: 'user_index',                        category: 'user',                      action: 'index'   },
  { name: 'user_create',                       category: 'user',                      action: 'create'  },
  { name: 'user_edit',                         category: 'user',                      action: 'edit'    },
  { name: 'user_destroy',                      category: 'user',                      action: 'destroy' },
  { name: 'technical_progress_report_index',   category: 'technical_progress_report', action: 'index'   },
  { name: 'technical_progress_report_show',    category: 'technical_progress_report', action: 'show'    },
  { name: 'technical_progress_report_create',  category: 'technical_progress_report', action: 'create'  },
  { name: 'technical_progress_report_edit',    category: 'technical_progress_report', action: 'edit'    },
  { name: 'technical_progress_report_destroy', category: 'technical_progress_report', action: 'destroy' },
  { name: 'technical_progress_report_submit',  category: 'technical_progress_report', action: 'submit'  }
])

Role.create(
  name: 'Administrator',
  ability_ids: (1..42).to_a
)

Frequency.create ([
  { code: 'Q',  name: 'Quarterly' },
  { code: 'SA', name: 'Semiannual' },
  { code: 'A',  name: 'Annual' },
  { code: 'B',  name: 'Biennial' }
])
