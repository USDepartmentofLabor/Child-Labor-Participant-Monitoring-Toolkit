# encoding: UTF-8

survey "Child Intake Survey", :default_mandatory => false do

  section "Basic Questions" do

    q_cl1 "Name", :is_mandatory => true
    a_1 :string

    q_cl2 "Age", :is_mandatory => true
    a_1 :string

    q_cl3 "Did the child engage in any work for at least one hour during the past week?", :help_text => "As employee, self employed, employer or unpaid family worker", :pick => :one
    a_1 "Yes"
    a_2 "No"

    q_cl4 "During the past week, did the child do any of the following activities, even for one hour?", :help_text => "Read each of the questions given below the page and mark/circle the appropriate codes for all affirmative response obtained. However if no affirmative response if obtained, then mark/circle ONLY No.", :pick => :any
    #dependency :rule => "A"
    #condition_A :q_cl3, "==", :a_2
    a_1 "Run or do any kind of business, big or small, for himself/herself or with one or more parters? Examples: Selling things, making things for sale, repairing things, guarding things, hairdressing, crèche business, taxi or other transport business, having a legal or medical practice, performing in public, having a public phone shop, barber, shoe shining, etc."
    a_2 "Do any work for wage, salary, commission or any payment in kind? Examples: a regular job, contract, casual or piece work for pay, work in exchange for food or housing."
    a_3 "Do any work as a domestic worker for a wage, salary or any payment in kind?"
    a_4 "Help unpaid in a household business of any kind? (Don't count normal housework.) Examples: Helping to sell things, making things for sell or exchange, doing the accounts, cleaning up for the business, etc."
    a_5 "Do any work on his/her own or the household's plot, farm, food garden, or help in growing farm produce or in looking after animals for the household? Examples: ploughing, harvesting, looking after livestock."
    a_6 "Do any construction or major repair work on his/her own home, plot, or business or those of the household?"
    a_7 "Catch any fish, prawns, shells, wild animals, or other food for sale or household food?"
    a_8 "Fetch water of collect or collect firewood use?"
    a_9 "Produce any other good for this household use? Examples: clothing, furniture, clay pots, etc"
    a_10 "Did not engage in any of the above activities"

    q_cl5 "Even though the child did not do any of these activities in the past week, does he/she have a job business, or other economic or farming activity that he/she will definitely return to?", :help_text => "(For agriculture activities, the off-season in agriculture is not a temporary absence.)", :pick => :one
    a_1 "Yes"
    a_2 "No"

    q_cl6 "During the past week for how many hours did he/she engaged i this/these activities?", :help_text => "(If more than one job, include all hours in all jobs.)"
    a_1 :integer

    q_cl7 "Describe the main job/task the child was performing, e.g. carrying bricks, mixing baking flour, harvesting maize, etc."
    a_1 :string

  end

  section "Economic Activity" do

    q_cl8 "Describe briefly the main goods produced and services rendered where the child is working."
    a_1 :string

    q_cl9 "During the past week, which of the following best describes the child's work situation at his/her main place of employment?", :pick => :one
    a_1 "Employee"
    a_2 "Own-account worker (His/Her own business without employees)"
    a_3 "Employer (His/Her own business with employees)"
    a_4 "Unpaid family worker"

  end

  section "Health and Safety Issues of Working Children" do

    ht = "Read each of the following and choose \"Yes\" or \"No\"\n" +
         "1. Superficial injuries or open wounds\n" +
         "2. Fractures\n" +
         "3. Dislocations, sprains, or strains\n" +
         "4. Burns, corrosions, salds, or frostbite\n" +
         "5. Breathing problems\n" +
         "6. Eye problems\n" +
         "7. Skin problems\n" +
         "8. Stomach problems/diarrhoea\n" +
         "9. Fever\n" +
         "10. Extreme fatigue\n" +
         "11. Other"

    q_cl10 "Did the child suffer any of the following in the past 12 months because of his/her work?", :help_text => ht, :pick => :one
    a_1 "Yes"
    a_2 "No"

    q_cl11 "Think about his/her most serious illness/injury, how did this/these affect his/her work/schooling?", :pick => :one
    a_1 "Not serious - did not stop work/schooling"
    a_2 "Stopped work or school for a short time"
    a_3 "Stopped work or school completely"

    ht = "Read each of the following and choose \"Yes\" or \"No\"\n" +
         "1. Dust/fumes\n" +
         "2. Fix/gas/flames\n" +
         "3. Load noise or vibration\n" +
         "4. Extreme cold or heat\n" +
         "5. Dangerours tools (knives, etc)\n" +
         "6. Work underground\n" +
         "7. Work at heights\n" +
         "8. Work in water/lake/pond/river\n" +
         "9. Workplace too dark or confined\n" +
         "10. Insufficient ventilation\n" +
         "11. Chemicals (pesticides, glues, etc.)\n" +
         "12. Explosives\n" +
         "13. Other things, processes or conditions bad for your health or safety"

    q_cl12 "Is the child exposed to any of the following at work?", :help_text => ht, :pick => :one
    a_1 :string

    ht = "Read each of the following and choose \"Yes\" or \"No\"\n" +
         "1. Constantly shouted at\n" +
         "2. Repeatedly insulted\n" +
         "3. Beaten/physically hurt\n" +
         "4. Sexually abused (touched or things done to you that you did not want)\n" +
         "5. Other"

    q_cl13 "Has the child ever been subject to the following at work?", :help_text => ht, :pick => :one
    a_1 "Yes"
    a_2 "No"

  end

  section "Household Tasks of Children" do

    ht = "Read each of the following and choose \"Yes\" or \"No\"\n" +
         "1. Shopping for household\n" +
         "2. Repairing any household equipments\n" +
         "3. Cooking cleaning utensils/house\n" +
         "4. Washing clothes\n" +
         "5. Caring for children/old/sick\n" +
         "6. Other household tasks"

    q_cl14 "During the past week, did the child do any of the tasks indicated below for this household?", :help_text => ht, :pick => :one
    a_1 "Yes"
    a_2 "No"

    q_cl15 "During each day of the past week, for how many hours did he/she engage in this/these activities?"
    a_1 :integer

  end

end
