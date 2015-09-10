module DBMS
  module DefaultData
    module Indicators
      class << self
        def create(project, user)
          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in child labor
          eos
          Report.create!(
            code: "POH1",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in hazardous child labor (if applicable)
          eos
          Report.create!(
            code: "POH2",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in other WFCL 
            (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          Report.create!(
            code: "POH3",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with all children of compulsory school age attending school regularly
          eos
          Report.create!(
            code: "POH4",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of beneficiary children engaged in CL
          eos
          Report.create!(
            code: "POC1",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of beneficiary children engaged in HCL
          eos
          Report.create!(
            code: "POC2",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of beneficiary children in other WFCL (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          Report.create!(
            code: "POC3",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            % of beneficiary children who regularly attended any form of education during the past six (6) months
          eos
          Report.create!(
            code: "POC4",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            # of children engaged in or at high-risk of entering CL provided education or vocational training services
          eos
          Report.create!(
            code: "E1",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            # of HHs receiving livelihood services
          eos
          Report.create!(
            code: "L1",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          indicator = <<-eos
            Capacity Indicator
          eos
          Report.create!(
            code: "C1",
            indicator: indicator,
            indicator_type: "Common",
            service_type: "EducationStatus",
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )
        end
      end
    end
  end
end