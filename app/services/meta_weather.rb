class MetaWeather
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def search
    if locations_data = LocationsQueryData.find_by(query: params[:query])
      JSON.parse(locations_data.response)
    else
      response = RestClient.get('https://www.metaweather.com/api/location/search/', params: { query: params[:query] })
      LocationsQueryData.create(query: params[:query], response: response.body)
      JSON.parse(response.body)
    end
  rescue
    []
  end

  def location_data
    if location_data = LocationData.find_by(location_id: params[:id])
      JSON.parse(location_data.response)
    else
      response = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
      LocationData.create(location_id: params[:id], response: response.body)
      JSON.parse(response.body)
    end
  rescue 
    {}
  end
end