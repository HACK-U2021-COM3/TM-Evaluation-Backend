class ErrorRespController < ApplicationController
  
  class << self

    #errorのステータスコードを生成して返す関数の作成
    def handle_status_code(err)
      puts "{ #{err.class}: #{err.message} }"
      case err
      when SearchValidatorError, MeasureValidatorError, PastPlansValidatorError
        response_bad_request
      when PlaceApiError, DirectionApiError
        response_internal_server_error
      when AuthValidatorError, AuthServiceError
        response_unauthorized
      else
        response_not_found
      end
    end

    ###エラーコードの定義
    # 400 Bad Request
    def response_bad_request
      { status: 400, json: { error: 'Bad Request' } }
    end

    # 401 Unauthorized
    def response_unauthorized
      { status: 401, json: { error: 'Unauthorized' } }
    end

    # 404 Not Found
    def response_not_found
      { status: 404, json: { error: 'Not Found' } }
    end

    # 409 Conflict
    def response_conflict
      { status: 409, json: { error: 'Conflict' } } 
    end

    # 500 Internal Server Error
    def response_internal_server_error
       { status: 500, json: { error: 'Internal Server Error' } }
    end

  end
end


