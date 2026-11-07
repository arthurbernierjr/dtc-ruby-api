class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: "not found" }, status: :not_found
  end

  rescue_from ActionController::ParameterMissing do
    render json: { error: "subject and details are required" }, status: :bad_request
  end

  rescue_from ActionDispatch::Http::Parameters::ParseError do
    render json: { error: "malformed JSON body" }, status: :bad_request
  end
end
