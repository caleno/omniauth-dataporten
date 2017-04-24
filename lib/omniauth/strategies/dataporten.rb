require 'omniauth-oauth2'

module OmniAuth
    module Strategies
        class Dataporten < OmniAuth::Strategies::OAuth2
            option :name, "dataporten"

            option :client_options, {
                    site: "https://auth.dataporten.no",
                    authorize_url: "/oauth/authorization",
                    token_url: "/oauth/token"
            }

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.

            option :redirect_url

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.

      # Extraction eduPPN from userid_sec ["feide:uid@edu.org"]

            Rails.logger.debug(raw_info['user']['userid_sec'])

            $federation, $eppn = { raw_info['user']['userid_sec'].split(':') }            

            Rails.logger.debug($federation)
            Rails.logger.debug($eppn)

            uid = $eppn
            #uid { raw_info['user']['userid_sec'] }

            info do
                {
                    name:           raw_info['user']['name'],
                    username:       $eppn,
                    email:          raw_info['user']['email']
                    #image:          raw_info['user']['profilepicture']
                }
            end

            extra do
                { raw_info: raw_info }
            end

            def raw_info
                @raw_info ||= access_token.get('/userinfo').parsed
            end

            private

            def callback_url
                options[:redirect_url] + script_name + callback_path
            end

            #def request_phase
            #       options[:response_type] ||= 'code'
	        #       super   
            #end
        end
    end
end

OmniAuth.config.add_camelization 'dataporten', 'Dataporten'
