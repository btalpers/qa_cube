require "qa_cube/version"
require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

module QaCube
  class SheetsAppender

    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    APPLICATION_NAME = 'Google Sheets API Test Result Appender'
    SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS

    def initialize(sheet_name:, spreadsheet_id:, range:, verbose: nil, client_secrets_path:, workspace_dir:)
      @credential_path = File.join(workspace_dir, '.credentials','sheetsappender.yaml')
      @verbose ||= verbose
      if @verbose.nil?
        @verbose = false
      end
      @client_secrets_path = client_secrets_path
      @service = Google::Apis::SheetsV4::SheetsService.new
      @service.authorization = authorize
      @spreadsheet_id = spreadsheet_id
      @sheet_name = sheet_name
      @range = "\'#{sheet_name}\'!#{range}"
    end

    def append(values:)
      request_body = Google::Apis::SheetsV4::ValueRange.new({values: values})
      response = @service.append_spreadsheet_value(@spreadsheet_id, @range, request_body, value_input_option: "USER_ENTERED")
      if @verbose
        puts response.to_json
      end
    end

    def authorize
      FileUtils.mkdir_p(File.dirname(@credentials_path))
      client_id = Google::Auth::ClientId.from_file(@client_secrets_path)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: @credentials_path)
      authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URI)
        puts "First time auth URL"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(user_id: user_id, code: code, base_url: OOB_URI)
      end
      credentials
    end
  end
end
