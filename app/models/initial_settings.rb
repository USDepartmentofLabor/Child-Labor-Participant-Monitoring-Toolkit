class InitialSettings
  include ActiveModel::Model

  attr_accessor :dol_url, :api_key, :admin_name, :admin_email, :admin_password,
    :admin_password_confirm
end
