##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class IpMessaging < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class RoleList < ListResource
            ##
            # Initialize the RoleList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [RoleList] RoleList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Roles"
            end

            ##
            # Retrieve a single page of RoleInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [role.RoleType] type The type
            # @param [String] permission The permission
            # @return [RoleInstance] Newly created RoleInstance
            def create(friendly_name: nil, type: nil, permission: nil)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'Type' => type,
                  'Permission' => permission,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              RoleInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Lists RoleInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams RoleInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields RoleInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of RoleInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of RoleInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              RolePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of RoleInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of RoleInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              RolePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.IpMessaging.V2.RoleList>'
            end
          end

          class RolePage < Page
            ##
            # Initialize the RolePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [RolePage] RolePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of RoleInstance
            # @param [Hash] payload Payload response from the API
            # @return [RoleInstance] RoleInstance
            def get_instance(payload)
              RoleInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.IpMessaging.V2.RolePage>'
            end
          end

          class RoleContext < InstanceContext
            ##
            # Initialize the RoleContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [RoleContext] RoleContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Roles/#{@solution[:sid]}"
            end

            ##
            # Fetch a RoleInstance
            # @return [RoleInstance] Fetched RoleInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              RoleInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the RoleInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Update the RoleInstance
            # @param [String] permission The permission
            # @return [RoleInstance] Updated RoleInstance
            def update(permission: nil)
              data = Twilio::Values.of({
                  'Permission' => permission,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              RoleInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.IpMessaging.V2.RoleContext #{context}>"
            end
          end

          class RoleInstance < InstanceResource
            ##
            # Initialize the RoleInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [RoleInstance] RoleInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'type' => payload['type'],
                  'permissions' => payload['permissions'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [RoleContext] RoleContext for this RoleInstance
            def context
              unless @instance_context
                @instance_context = RoleContext.new(
                    @version,
                    @params['service_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [role.RoleType] The type
            def type
              @properties['type']
            end

            ##
            # @return [String] The permissions
            def permissions
              @properties['permissions']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # Fetch a RoleInstance
            # @return [RoleInstance] Fetched RoleInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the RoleInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Update the RoleInstance
            # @param [String] permission The permission
            # @return [RoleInstance] Updated RoleInstance
            def update(permission: nil)
              context.update(
                  permission: permission,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.IpMessaging.V2.RoleInstance #{values}>"
            end
          end
        end
      end
    end
  end
end