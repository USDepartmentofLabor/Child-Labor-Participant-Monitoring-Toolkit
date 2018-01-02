class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout 'login'

  def index
    if Project.all.empty?
      redirect_to initialize_url
      return
    elsif current_user
      redirect_to project_path
      return
    end
  end

  def setup
    @settings = InitialSettings.new
  end

  def create
    User.create!(
      name: settings_params[:admin_name],
      email: settings_params[:admin_email],
      password: settings_params[:admin_password],
      confirmed_at: Time.now,
      role_ids: [Role.find_by_name('Administrator').id])

    client = HTTPClient.new({
      base_url: settings_params[:dol_url],
      default_header: {
        'Authorization' => "Token token=#{settings_params[:api_key]}",
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    })

    response = JSON.parse client.get('/api/projects').body
    project = Project.new(
      name: response['short_name'],
      title: response['name'],
      cooperative_agreement_number: response['grant_number'],
      start_date: response['start_date'],
      end_date: response['end_date'],
      organization: response['grantee_organization'],
      funding_amount: response['funding_amount'],
      duns_number: response['duns_number'],
      region_id: Region.find_by_name(response['region'] || 'Unknown').id,
      api_key: settings_params[:api_key])

    response['targets'].each do |t|
      project.project_targets << ProjectTarget.new(
        project_target_type_id:
          ProjectTargetType.find_by_name(t['target_type']).id,
        target: t['target'])
    end

    response['locations'].each do |l|
      project.locations << Location.new(
        name: l['name'],
        location_type_id: LocationType.find_by_name(l['location_type']).id,
        address_line1: l['address_line1'],
        address_line2: l['address_line2'],
        city: l['city'],
        state: l['state'],
        zip: l['zip'],
        country: l['country'])
    end

    project.save!

    redirect_to root_path
  end

  private

  def settings_params
    params.require(:initial_settings).permit(:dol_url, :api_key, :admin_name,
                                             :admin_email, :admin_password,
                                             :admin_password_confirm)
  end
end
