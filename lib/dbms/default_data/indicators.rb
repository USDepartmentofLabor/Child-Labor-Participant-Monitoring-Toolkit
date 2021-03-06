module DBMS
  module DefaultData
    module Indicators
      class << self
        def create()

          numeric_unit_of_measure = UnitOfMeasure.find_by name: 'Numeric'
          percentage_unit_of_measure = UnitOfMeasure.find_by name: 'Percentage'

          indicator = <<-eos
            % of livelihood participant HHs with at least one child engaged in child labor
          eos
          use = <<-eos
            Shows changes in child labor status (all types) at the household level.
            We are collecting this data only from households that are livelihood participants.
            This indicator allows us to track changes in child labor status that may result from livelihood services
            (as our theory of change posits that such services lead to increased income, increased school attendance, and less dependence on child labor).
          eos
          definitions = <<-eos
            Numerator: number of livelihood participant HHs with at least one child engaged in CL in the past 12 months
            Denominator: total number of livelihood participant HHs (HHs that have received services and were counted under L1)
            'Child labor' is defined by project definitions for all children under 18 years of age, and includes any form of CL (including HCL and other WFCL) per national and international framework.
            Reference period for engagement in child labor: In the past 12 months, AND in the past week. If the answer is "yes" to either of these, the child is in child labor.
            'Household' is defined by project definitions.
          eos
          freq = <<-eos
            Collection:  Twice during life of project to allow for before-after comparison.  Data will be collected at HH intake and at end of project.
            Reporting:  Once at the end of the project; projects will aggregate all HHs into single intake and end-of-project percentages.
          eos
          Indicator.create!(
            code: "POH1",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of livelihood participant HHs with at least one child engaged in hazardous child labor (if applicable)
          eos
          use = <<-eos
            Same as above, but shows changes in hazardous child labor status at the household level.
            This is "if applicable" so that projects with strong youth components can opt for it but others may not (assumption being that for youth projects, doing this breakdown may show a more dramatic decline in HCL than CL in general).
          eos
          definitions = <<-eos
            Numerator: number of livelihood participant HHs with at least one child engaged in HCL in the past 12 months
            Denominator:  total number of livelihood participant HHs (HHs that have received services and were counted under L1)
            'Hazardous Child labor' is defined by project definitions for children engaged in hazardous work per ILO Convention 182, Article 3(d); ILO Recommendation 190; and the national legal framework, and excludes other WFCL as outlined in Convention 182 Article 3(a-c)
            Reference period for engagement in hazardous child labor: In the past 12 months, AND in the past week. If the answer is "yes" to either of these, the child is in hazardous child labor.
            'Household' is defined by project definitions.
          eos
          freq = <<-eos
            Collection:  Twice during life of project to allow for before-after comparison.  Data will be collected at HH intake and at end of project .
            Reporting:  Once at the end of the project; projects will aggregate all HHs into single intake and end-of-project percentages
          eos
          Indicator.create!(
            code: "POH2",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of livelihood participant HHs with at least one child engaged in other WFCL
            (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          use = <<-eos
            Shows changes in worst forms of child labor status at the household level. Most projects not working with populations of WFCL other than hazardous labor, reported above.
          eos
          definitions = <<-eos
            Numerator: number of livelihood participant HHs with at least one child engaged in other WFCL (other than HCL) in the past 12 months
            Denominator:  total number of livelihood participant HHs (HHs that have received services and were counted under L1)
            'Worst Forms of Child labor other than HCL' is defined by ILO Convention 182, Article 3 (a-c).
            Reference period for engagement in other worst forms of child labor: In the past 12 months, AND in the past week. If the answer is "yes" to either of these, the child is in child labor.
            'Household' is defined by project definitions.
          eos
          freq = <<-eos
            Collection:  Twice during life of project to allow for before-after comparison.  Data will be collected at HH intake and at end of project.
            Reporting:  Once at the end of the project; projects will aggregate all HHs into single intake and end-of-project percentages.
          eos
          Indicator.create!(
            code: "POH3",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of livelihood participant HHs with all children of compulsory school age attending school regularly
          eos
          use = <<-eos
            Shows educational outcomes at the HH level. May help provide evidence regarding shifting of labor across child members of HH.  Same resource implications as above, since education status of ALL children in HH will have to be gathered.
          eos
          definitions = <<-eos
            Numerator: Number of livelihood participant HHs with all children of compulsory age attending school regularly during the past six months.
            Denominator: Number of livelihood participant HHs (HHs that have been counted as receiving services under L1) with children of compulsory school age
            'Compulsory school age' should be defined according to national law
            'Attending school regularly' should be defined by the project and should take into account any national guidelines; in the absence of such guidelines a default is 75%. A reference period of six months should be used, and school holidays should be excluded.
            'Household' is defined by project definitions.
          eos
          freq = <<-eos
            Collection:  Twice during life of project to allow for before-after comparison.  Data will be collected at HH intake and at end of project .
            Reporting:  Once at the end of the project; projects will aggregate all HHs into single intake and end-of-project percentages.
          eos
          Indicator.create!(
            code: "POH4",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of participant children engaged in CL
          eos
          use = <<-eos
            Shows labor outcomes at the child participant level.  This is a high priority indicator, and is what projects use to track labor status of child participants.
          eos
          definitions = <<-eos
            Participant children: Children receiving project education, training, or livelihood services
            Numerator: Number of participant children engaged in child labor in the past six months.
            Denominator: Total number of participant children
            'Child labor' is defined by project definitions for all children under 18 years of age, and includes any form of CL (including HCL and other WFCL) per national and international framework
            Reference period for engagement in child labor: In the past 6 months, AND in the past week. If the answer is "yes" to either of these, the child is in child labor.
          eos
          freq = <<-eos
            Data collection and reporting frequency is every 6 months.
          eos
          Indicator.create!(
            code: "POC1",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of participant children engaged in HCL
          eos
          use = <<-eos
            Shows changes in HCL status at the child participant level. Is sub-set of POC1.
          eos
          definitions = <<-eos
            Participant children: Children receiving project education, training, or livelihood services
            Numerator: Number of participant children engaged in HCL in the past six months.
            Denominator: Total number of participant children
            'Hazardous Child labor' is defined by project definitions for children engaged in hazardous work per ILO Convention 182, Article 3(d); ILO Recommendation 190; and the national legal framework, and excludes other WFCL as outlined in Convention 182 Article 3 (a-c), in the past 6 months
            Reference period for engagement in hazardous child labor: In the past 6 months, AND in the past week. If the answer is "yes" to either of these, the child is in hazardous child labor.
          eos
          freq = <<-eos
            Data collection and reporting frequency_definitions is every 6 months.
          eos
          Indicator.create!(
            code: "POC2",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of participant children in other WFCL (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          use = <<-eos
            Shows changes in WFCL other than HCL status at the child participant level. Is sub-set of POC1.
          eos
          definitions = <<-eos
            Participant children: Children receiving project education, training, or livelihood services
            Numerator: Number of participant children engaged in WFCL other than HCL in the past six months.
            Denominator: Total number of participant children
            Worst Forms of Child labor other than HCL' is defined by ILO Convention 182, Article 3 (a-c).
            Reference period for engagement in WFCL other than HCL: In the past 6 months, AND in the past week. If the answer is "yes" to either of these, the child is in WFCL other than HCL.
          eos
          freq = <<-eos
            Data collection and reporting frequency is every 6 months.
          eos
          Indicator.create!(
            code: "POC3",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            % of participant children who regularly attended any form of education during the past six (6) months
          eos
          use = <<-eos
            This indicator is used to monitor child participants' education status.
          eos
          definitions = <<-eos
            Participant children: Children receiving project education, training, or livelihood services
            Numerator: Number of participant children attending school regularly during the past 6 months
            Denominator: Total number of children receiving project education, training, or livelihood services
            'Attending school regularly' should be defined by the project and should take into account any national guidelines; in the absence of such guidelines a default is 75%. A reference period of six months should be used, and school holidays should be excluded.
          eos
          freq = <<-eos
            Data collection and reporting frequency is every 6 months.
          eos
          Indicator.create!(
            code: "POC4",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: percentage_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            # of children engaged in or at high-risk of entering CL provided education or vocational training services
          eos
          use = <<-eos
            Shows if projects are providing education/vocation services to participant population as planned.
          eos
          definitions = <<-eos
            Each project has its own unique menu of education or vocational training services. These services are defined in the project's CMEP.
            Grantees must report the total number and disaggregated figures by the type of education or training service provided.
          eos
          freq = <<-eos
            Data collection and reporting frequency is every 6 months.
          eos
          Indicator.create!(
            code: "E1",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: numeric_unit_of_measure.id,
            reporting_frequency_id: 2
          )

          indicator = <<-eos
            # of HHs receiving livelihood services
          eos
          use = <<-eos
            Shows if projects are providing livelihood services to participant HHs as planned.
          eos
          definitions = <<-eos
            Each project offers its own unique menu of livelihood services. These services are defined in the project's CMEP.
            Grantees must report the total number and disaggregated figures by the type of livelihood service received.
          eos
          freq = <<-eos
            Reporting frequency is every 6 months.
          eos
          Indicator.create!(
            code: "L1",
            indicator: indicator.strip,
            use: use.strip,
            definitions: definitions.strip,
            frequency_definitions: freq.strip,
            indicator_type: "Common",
            unit_of_measure_id: numeric_unit_of_measure.id,
            reporting_frequency_id: 2
          )

        end
      end
    end
  end
end
