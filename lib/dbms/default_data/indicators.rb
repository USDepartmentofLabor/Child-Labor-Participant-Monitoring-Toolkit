module DBMS
  module DefaultData
    module Indicators
      class << self
        def create(project_id, user_id)
          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in child labor
          eos
          Indicator.create!(
            code: "POH1",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in hazardous child labor (if applicable)
          eos
          Indicator.create!(
            code: "POH2",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with at least one child engaged in other WFCL 
            (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          Indicator.create!(
            code: "POH3",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of livelihood beneficiary HHs with all children of compulsory school age attending school regularly
          eos
          Indicator.create!(
            code: "POH4",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of beneficiary children engaged in CL
          eos
          Indicator.create!(
            code: "POC1",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of beneficiary children engaged in HCL
          eos
          Indicator.create!(
            code: "POC2",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of beneficiary children in other WFCL (only applicable if project specifically targets this population; majority of projects will not use)
          eos
          Indicator.create!(
            code: "POC3",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            % of beneficiary children who regularly attended any form of education during the past six (6) months
          eos
          Indicator.create!(
            code: "POC4",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            # of children engaged in or at high-risk of entering CL provided education or vocational training services
          eos
          Indicator.create!(
            code: "E1",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            # of HHs receiving livelihood services
          eos
          Indicator.create!(
            code: "L1",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )

          indicator = <<-eos
            Capacity Indicator
          eos
          Indicator.create!(
            code: "C1",
            indicator: indicator.strip,
            indicator_type: "Common",
            user_id: user_id,
            project_id: project_id
          )
        end
      end
    end
  end
end