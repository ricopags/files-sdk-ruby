# frozen_string_literal: true

module Files
  class DnsRecord
    attr_reader :options, :attributes

    def initialize(attributes = {}, options = {})
      @attributes = attributes || {}
      @options = options || {}
    end

    # string - DNS record domain name
    def domain
      @attributes[:domain]
    end

    # string - DNS record type
    def rrtype
      @attributes[:rrtype]
    end

    # string - DNS record value
    def value
      @attributes[:value]
    end

    # Parameters:
    #   page - integer - Current page number.
    #   per_page - integer - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended).
    #   action - string - Deprecated: If set to `count` returns a count of matching records rather than the records themselves.
    def self.list(params = {}, options = {})
      raise InvalidParameterError.new("Bad parameter: page must be an Integer") if params.dig(:page) and !params.dig(:page).is_a?(Integer)
      raise InvalidParameterError.new("Bad parameter: per_page must be an Integer") if params.dig(:per_page) and !params.dig(:per_page).is_a?(Integer)
      raise InvalidParameterError.new("Bad parameter: action must be an String") if params.dig(:action) and !params.dig(:action).is_a?(String)

      response, options = Api.send_request("/dns_records", :get, params, options)
      response.data.map { |object| DnsRecord.new(object, options) }
    end

    def self.all(params = {}, options = {})
      list(params, options)
    end
  end
end
