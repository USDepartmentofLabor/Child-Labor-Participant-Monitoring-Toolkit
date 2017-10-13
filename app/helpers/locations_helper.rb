module LocationsHelper
  def format_location location
    raw (
      location.address_line1 + '<br>' +
      location.address_line2 + '<br>' +
      location.city + ', ' +
      location.state + ' ' + location.zip
    )
  end
end
