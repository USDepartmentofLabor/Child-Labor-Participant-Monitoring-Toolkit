# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ServiceTypeCategory.create([{
  name: 'Educational Services',
  definition: 'Education services refer to all formal and non-formal education services, including vocational \
education.'
  }, {
  name: 'Livelihood Services',
  definition: 'Livelihood services may include, but are not limited to, the provision or linkage to education and \
training, employment services, economic strengthening services, consumption smoothing services, and social capital \
services.'
}])

ServiceType.create([{
  name: 'Education: Formal',
  service_type_category_id: 1,
  definition: 'Formal education is provided and/or recognized by the government. Formal education may include \
government schools, private schools, religious schools, etc. Formal education services may involve the provision of \
goods and/or services including direct costs such as school fees and teaching and learning materials and indirect \
costs such as school uniforms, transportation costs, etc. These goods and/or services are intended to ensure that the \
child will attend and stay in school.'
  }, {
  name: 'Education: Non-Formal',
  service_type_category_id: 1,
  definition: 'Non-formal education is provided by any organization or body outside of the formal school system. This \
education may include literacy, mainstreaming education, accelerated learning, community-based education, bridge \
courses, remedial education, life skills, etc. Non-formal education services may lead to mainstreaming into formal \
education or equivalent school certificates.'
  }, {
  name: 'Education: Vocational',
  service_type_category_id: 1,
  definition: 'Education, apprenticeships, and/or training related to a specific vocation, trade or occupation. \
Vocational education is differentiated from formal or non-formal education and should not be counted under formal and \
non-formal education services. Vocational services provided by a project should reflect a market assessment to \
determine appropriate skills needed for securing decent work in a given geographic area.'
  }, {
  name: 'Livelihood: Economic Strengthening',
  service_type_category_id: 2,
  definition: 'Economic strengthening services aim to increase the economic well-being of participants. Economic \
strengthening services may include the provision or linkage to micro-credit/loan programs, productivity transfers, \
cooperatives, and consumption smoothing services.'
  }, {
  name: 'Livelihood: Adult Employment',
  service_type_category_id: 2,
  definition: 'Employment services for adults aim to increase employment, job retention, earnings, and occupational \
skills of participants. Employment services may include the provision or linkage to employment assistance programs, \
occupational safety and health training, micro-franchise programs, job placement, apprenticeships and public works \
programs.',
  }, {
  name: 'Livelihood: Other',
  service_type_category_id: 2,
  definition: 'Livelihood services other than employment and economic strengthening include any project-specific \
interventions that do not fit under the other sub-indicators. Social capital services, for example, aim to connect a \
participant with networks or groups for purposes including promoting sustainable livelihoods and reducing \
vulnerability to child labor.  Social capital services facilitate the coordination resources for the mutual benefit \
of the participants. Social capital services may include the provision or linkage to support groups, farmer \
organizations and labor sharing arrangements.'
}])

UnitOfMeasure.create([
  { name: 'Numeric' },
  { name: 'Percentage' }
])

EducationStatus.create([
  { name: 'Formal Education' },
  { name: 'Non-formal Education' },
  { name: 'Vocational Education' }
])

WorkStatus.create([
  { name: 'Engaged in Child Labor',            work_type: 'CL' },
  { name: 'Hazardous Child Labor',             work_type: 'CL' },
  { name: 'Worst Form of Child Labor (WFCL)',  work_type: 'CL' },
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

Locale.create([
  { code: 'en', name: 'English' },
  { code: 'es', name: 'Spanish' }
])

Translation.create([
  { locale: 'en', key: 'general.logo_alt', value: 'Department of Labor Seal' },
  { locale: 'en', key: 'general.submit', value: 'Submit' },
  { locale: 'en', key: 'login.banner', value: 'Direct Beneficiary Monitoring System' },
  { locale: 'en', key: 'login.email', value: 'Email Address' },
  { locale: 'en', key: 'login.forgot_password', value: 'Forgot your password?' },
  { locale: 'en', key: 'login.instruction', value: 'Login with your email address and password' },
  { locale: 'en', key: 'login.password', value: 'Password' },
  { locale: 'en', key: 'login.remember_me', value: 'Remember me' },
  { locale: 'en', key: 'login.tagline', value: 'The more we connect, the better it gets.' },

  { locale: 'es', key: 'general.logo_alt', value: 'Sello del Departamento de Trabajo' },
  { locale: 'es', key: 'general.submit', value: 'Presentar' },
  { locale: 'es', key: 'login.banner', value: 'Direct Beneficiary Monitoring System' },
  { locale: 'es', key: 'login.email', value: 'Dirección de correo electrónico' },
  { locale: 'es', key: 'login.forgot_password', value: '¿Olvidaste tu contraseña?' },
  { locale: 'es', key: 'login.instruction',
    value: 'Iniciar sesión con su dirección de correo electrónico y contraseña' },
  { locale: 'es', key: 'login.password', value: 'Contraseña' },
  { locale: 'es', key: 'login.remember_me', value: 'Recuérdame' },
  { locale: 'es', key: 'login.tagline', value: 'Cuanto más nos conectamos, mejor se pone.' }
])

CustomSection.create([
    { title: 'Section 1', model_type: 'Child', sort_order: 1},
    { title: 'Economic Activity', model_type: 'Child', sort_order: 2},
    { title: 'Health and Safety of Working Children', model_type: 'Child', sort_order: 3},
    { title: 'Hosehold Tasks of Children', model_type: 'Child', sort_order: 4}
])
