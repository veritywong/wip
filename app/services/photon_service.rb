class PhotonService
    PHOTON_API_BASE_URL = 'https://photon.komoot.io/api'

    def initialize(query)
        @query = query
        @conn = Faraday.new(url: PHOTON_API_BASE_URL) do |faraday|
            faraday.request :url_encoded
            faraday.response :json, parser_options: { symbolize_names: true }
            faraday.adapter Faraday.default_adapter
        end
    end

    def geocode
        response = @conn.get('', { q: @query, limit: 5 })
        parse_response(response)
    end

    private

    def parse_response(response)
        if response.success?
            features = response.body[:features]
            return [] if features.empty?
            
            features.map do |feature|
                {name: feature[:properties][:name], street: feature[:properties][:street], city: feature[:properties][:city], postcode: feature[:properties][:postcode]}
            end
        else 
            Rails.logger.error("Photon API request failed: #{response.status} - #{response.body}")
      nil
        end
    end
end