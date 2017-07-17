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

Relationship.create([
  { code: '01', canonical_name: 'HEAD', display_name: 'Head of household' },
  { code: '02', canonical_name: 'SPOUSE', display_name: 'Spouse/partner' },
  { code: '03', canonical_name: 'CHILD', display_name: 'Son/daughter' },
  { code: '04', canonical_name: 'STEP_CHILD', display_name: 'Step child' },
  { code: '05', canonical_name: 'ADOPTED_FOSTERED_CHILD', display_name: 'Adopted/fostered child' },
  { code: '06', canonical_name: 'CHILD_IN_LAW', display_name: 'Son-in-law/daughter-in-law' },
  { code: '07', canonical_name: 'GRANDCHILD', display_name: 'Grandchild' },
  { code: '08', canonical_name: 'PARENT', display_name: 'Parent' },
  { code: '09', canonical_name: 'PARENT_IN_LAW', display_name: 'Parent-in-law' },
  { code: '10', canonical_name: 'GRANDPARENT', display_name: 'Grandparent' },
  { code: '11', canonical_name: 'SIBLING', display_name: 'Brother/sister' },
  { code: '12', canonical_name: 'SIBLING_IN_LAW', display_name: 'Brother-in-law/sister-in-law' },
  { code: '13', canonical_name: 'AUNT_UNCLE', display_name: 'Aunt/uncle' },
  { code: '14', canonical_name: 'NIECE_NEPHEW', display_name: 'Niece/nephew' },
  { code: '15', canonical_name: 'COUSIN', display_name: 'Cousin' },
  { code: '16', canonical_name: 'SERVANT', display_name: 'Servant' },
  { code: '17', canonical_name: 'NON_RELATIVE', display_name: 'Non-relative' },
  { code: '18', canonical_name: 'OTHER', display_name: 'Other (specify)' }
])

WorkActivity.create([
  { code: '01', canonical_name: 'RUN_OR_DO_ANY_KIND_OF_BUSINESS_BIG_OR_SMALL_FOR_HIMSELF_HERSELF_OR_WITH_ONE_OR_MORE_PARTNERS', display_name: 'Run or do any kind of business, big or small, for himself/herself or with one or more partners?' },
  { code: '02', canonical_name: 'DO_ANY_WORK_FOR_A_WAGE_SALARY_COMMISSION_OR_ANY_PAYMENT_IN_KIND', display_name: 'Do any work for a wage, salary, commission or any payment in kind?' },
  { code: '03', canonical_name: 'DO_ANY_WORK_AS_A_DOMESTIC_WORKER_FOR_A_WAGE_SALARY_OR_ANY_PAYMENT_IN_KIND', display_name: 'Do any work as a domestic worker for a wage, salary or any payment in kind?' },
  { code: '04', canonical_name: 'HELP_UNPAID_IN_A_HOUSEHOLD_BUSINESS_OF_ANY_KIND', display_name: 'Help unpaid in a household business of any kind?' },
  { code: '05', canonical_name: 'DO_ANY_WORK_ON_HIS_HER_OWN_OR_HOUSEHOLDS_PLOT_FARM_FOOD_GARDEN_OR_HELP_IN_GROWING_FARM_PRODUCE_OR_IN_LOOKING_AFTER_ANIMALS_FOR_THE_HOUSEHOLD', display_name: "Do any work on his/her own or household's plot, farm, food garden, or help in growing farm produce or in looking after animals for the household?" },
  { code: '06', canonical_name: 'DO_ANY_CONSTRUCTION_OR_MAJOR_REPAIR_WORK_ON_HIS_HER_OWN_HOME_PLOT_OR_BUSINESS_OR_THOSE_OF_THE_HOUSEHOLD', display_name: 'Do any construction or major repair work on his/her own home, plot, or business or those of the household?' },
  { code: '07', canonical_name: 'CATCH_ANY_FISH_PRAWNS_SHELLS_WILD_ANIMALS_OR_OTHER_FOOD_FOR_SALE_OR_HOUSEHOLD_FOOD', display_name: 'Catch any fish, prawns, shells, wild animals, or other food for sale or household food?' },
  { code: '08', canonical_name: 'FETCH_WATER_OR_COLLECT_FIREWOOD_FOR_HOUSEHOLD_USE', display_name: 'Fetch water or collect firewood for household use?' },
  { code: '09', canonical_name: 'PRODUCE_ANY_OTHER_GOOD_FOR_THIS_HOUSEHOLD_USE', display_name: 'Produce any other good for this household use?' },
  { code: '10', canonical_name: 'DID_NOT_ENGAGE_IN_ANY_OF_THE_ABOVE_ACTIVITIES', display_name: 'Did not engage in any of the above activities.' }
])

Occupation.create([
  { code: '01', canonical_name: 'BRICKLAYER_MASON', display_name: 'Bricklayer/Mason' },
  { code: '02', canonical_name: 'HELPER_ASSISTANT', display_name: 'Helper/Assistant' },
  { code: '03', canonical_name: 'SHOE_COBBLER', display_name: 'Shoe Cobbler' },
  { code: '04', canonical_name: 'AUTO_MECHANIC', display_name: 'Auto Mechanic' },
  { code: '05', canonical_name: 'PAINTER', display_name: "Painter" },
  { code: '06', canonical_name: 'STREET_CANDY_VENDOR', display_name: 'Street/Candy Vendor' },
  { code: '07', canonical_name: 'FARMER', display_name: 'Farmer' },
  { code: '08', canonical_name: 'HARVESTING_SUGAR_CANE', display_name: 'Harvesting Sugar Cane' },
  { code: '09', canonical_name: 'NANNY', display_name: 'Nanny' }
])

Industry.create([
  { code: '01', canonical_name: 'CONSTRUCTION_HOMEBUILDING', display_name: 'Construction/Homebuilding' },
  { code: '02', canonical_name: 'SHOE_STORE', display_name: 'Shoe Store' },
  { code: '03', canonical_name: 'AUTO_SHOP', display_name: 'Auto Shop' },
  { code: '04', canonical_name: 'CONSTRUCTION_COMPANY', display_name: 'Construction Company' },
  { code: '05', canonical_name: 'STREET_CANDY_VENDING', display_name: "Street/Candy Vending" },
  { code: '06', canonical_name: 'CORN_CROP', display_name: 'Corn Crop' },
  { code: '07', canonical_name: 'SUGAR_CANE_PRODUCTION', display_name: 'Sugar Cane Production' },
  { code: '08', canonical_name: 'OTHER_PERSONS_HOME', display_name: 'Other Persons Home' }
])

HazardousCondition.create([
  { code: '01', canonical_name: 'DUST_FUMES', display_name: 'Dust/fumes' },
  { code: '02', canonical_name: 'FIRE_GAS_FLAMES', display_name: 'Fire/gas/flames' },
  { code: '03', canonical_name: 'LOUD_NOISE_OR_VIBRATION', display_name: 'Loud noise or vibration' },
  { code: '04', canonical_name: 'EXTREME_COLD_OR_HEAT', display_name: 'Extreme cold or heat' },
  { code: '05', canonical_name: 'DANGEROUS_TOOLS', display_name: 'Dangerous tools (knives, etc.)' },
  { code: '06', canonical_name: 'WORK_UNDERGROUND', display_name: 'Work underground' },
  { code: '07', canonical_name: 'WORK_AT_HEIGHTS', display_name: 'Work at heights' },
  { code: '08', canonical_name: 'WORK_IN_WATER', display_name: 'Work in water/lake/pond/river' },
  { code: '09', canonical_name: 'WORKPLACE_TOO_DARK_OR_CONFINED', display_name: 'Workplace too dark or confined' },
  { code: '10', canonical_name: 'INSUFFICIENT_VENTILATION', display_name: 'Insufficient ventilation' },
  { code: '11', canonical_name: 'CHEMICALS', display_name: 'Chemicals (pesticides, glues, etc.)' },
  { code: '12', canonical_name: 'EXPLOSIVES', display_name: 'Explosives' }
])

Abuse.create([
  { code: '01', canonical_name: 'CONSTANTLY_SHOUTED_AT', display_name: 'Constantly shouted at' },
  { code: '02', canonical_name: 'REPEATEDLY_INSULTED', display_name: 'Repeatedly insulted' },
  { code: '03', canonical_name: 'BEATEN_PHYSICALLY_HURT', display_name: 'Beaten/physically hurt' },
  { code: '04', canonical_name: 'SEXUALLY_ABUSED', display_name: 'Sexually abused (touched or things done to you that you do not want)' }
])

HouseholdTask.create([
  { code: '01', canonical_name: 'SHOPPING_FOR_HOUSEHOLD', display_name: 'Shopping for household' },
  { code: '02', canonical_name: 'REPAIRING_ANY_HOUSEHOLD_EQUIPMENT', display_name: 'Repairing any household equipment' },
  { code: '03', canonical_name: 'COOKING_CLEANING_UTENSILS_HOUSE', display_name: 'Cooking cleaning utensils/house' },
  { code: '04', canonical_name: 'WASHING_CLOTHES', display_name: 'Washing clothes' },
  { code: '05', canonical_name: 'CARING_FOR_CHILDREN_OLD_SICK', display_name: 'Caring for children/old/sick' }
])
