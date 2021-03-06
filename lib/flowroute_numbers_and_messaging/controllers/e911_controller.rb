# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module FlowrouteNumbersAndMessaging
  # E911Controller
  class E911Controller < BaseController
    @instance = E911Controller.new

    class << self
      attr_accessor :instance
    end

    def instance
      self.class.instance
    end

    # Returns a list of your E911 Records.
    # @param [Integer] limit Optional parameter: Limits the number of records to
    # retrieve. A maximum of 200 items can be retrieved.
    # @param [Integer] offset Optional parameter: Offsets the list of records by
    # your specified value. For example, if you have 4 inbound records and you
    # entered 1 as your offset value, then only 3 of your records will be
    # displayed in the response.
    # @return void response from the API call
    def list_e911s(limit = 10,
                   offset = 0)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        {
          'limit' => limit,
          'offset' => offset
        },
        array_serialization: Configuration.array_serialization
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def e911_details(e911_id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s/{e911_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'e911_id' => e911_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def validate(e911_record)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s/validate'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.post(
        _query_url,
        parameters: e911_record
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def create(e911_record)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.post(
        _query_url,
        parameters: e911_record
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def update(e911_id, e911_record)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s/{e911_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'e911_id' => e911_id
      )

      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.patch(
        _query_url,
        parameters: e911_record
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def associate(did_id, e911_id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/{did_id}/relationships/e911s/{e911_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'did_id' => did_id,
        'e911_id' => e911_id
      )

      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.patch(
        _query_url
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def unassociate(did_id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/{did_id}/relationships/e911s'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'did_id' => did_id
      )

      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.delete(
        _query_url
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def list_associations(e911_id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s/{e911_id}/relationships/numbers'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'e911_id' => e911_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    def delete_record(e911_id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/e911s/{e911_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'e911_id' => e911_id
      )

      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.delete(
        _query_url
      )

      BasicAuth.apply(_request)
      _context = execute_request(_request)

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)
      
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

  end
end