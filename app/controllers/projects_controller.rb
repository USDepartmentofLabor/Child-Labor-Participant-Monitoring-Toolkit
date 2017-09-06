class ProjectsController < ApplicationController
  def show
    @project = Project.first
  end

  def dashboard
    @project = Project.first
    @total_children = Child.count
    @total_households = Household.count
    @total_services = Service.count

    @total_children_target = 0
    @total_children_percentage = 0
    @total_households_target = 0
    @total_households_percentage = 0

    total_children_target =
      @project.project_targets.find_by(project_target_type_id: 2)

    if total_children_target
      @total_children_target = total_children_target.target.to_i
      @total_children_percentage =
        (@total_children.to_f / @total_children_target.to_f) * 100.0
    end

    total_households_target =
      @project.project_targets.find_by(project_target_type_id: 3)

    if total_households_target
      @total_households_target = total_households_target.target.to_i
      @total_households_percentage =
        (@total_households.to_f / @total_households_target.to_f) * 100.0
    end

    @project_complete_percentage = (Date.today.mjd - @project.start_date.mjd) /
      (@project.end_date.mjd - @project.start_date.mjd).to_f * 100.0

    @new_children = Child.order('created_at desc').limit(8)

    reporting_periods = ReportingPeriod.order(:start_date).map(&:name)
    colors = [
      "#3d4341", "#75b5c4", "#c9cb9d", "#c88c85", "#73342e",
      "#bf94c8", "#5a763b", "#4f2962", "#5f73c2", "#6fd291",
      "#cda13e", "#cc488f", "#d25039", "#99d547", "#9047cb"
    ]

    @children_target_vs_actual = {
      labels: reporting_periods,
      datasets: [
        {
          label: "Actuals",
          data: Array.new(8) { rand 0..9 },
          backgroundColor: colors[0]
        },
        {
          label: "Targets",
          data: Array.new(8) { rand 1..8 },
          backgroundColor: colors[1]
        }
      ]
    }

    @households_target_vs_actual = {
      labels: reporting_periods,
      datasets: [
        {
          label: "Actuals",
          data: Array.new(8) { rand 0..9 },
          backgroundColor: colors[0]
        },
        {
          label: "Targets",
          data: Array.new(8) { rand 1..8 },
          backgroundColor: colors[1]
        }
      ]
    }

    @children_by_age = {
      labels: ["5-8", "9-11", "12-14", "15-17"],
      datasets: [{
        data: Child.group_by_age[1..-1],
        backgroundColor: colors[7..-1]
      }]
    }

    sex_count = Child.group(:sex).count

    @children_by_gender = {
      labels: Child.gender_names,
      datasets: [{
        data: [sex_count[1], sex_count[2]],
        backgroundColor: [colors[8], colors[12]]
      }]
    }

    @bar_chart_options = {
      width: 400,
      height: 200,
      scales: {
        yAxes: [{
          ticks: { min: 0, max: 10 }
        }]
      }
    }

    @pie_chart_options = {
      width: '330', height: '230',
      maintainAspectRatio: false,
      legend: { position: 'right' }
    }

    render 'dashboard'
  end

  def status_config
  end

  def reporting_table
    @project = Project.first
    @reporting_periods = ReportingPeriod.all
    @indicators = Indicator.all

  end
end
