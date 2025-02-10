# frozen_string_literal: true

class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    result = TodoSchema.execute(
      query,
      variables: variables,
      operation_name: operation_name,
      context: {}
    )

    render json: result
  rescue StandardError => e
    handle_error_in_development(e)
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param.to_unsafe_h
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    if Rails.env.development?
      render json: {
        errors: [{ message: error.message, backtrace: error.backtrace }],
        data: {}
      }, status: 500
    else
      render json: {
        errors: [{ message: "Internal server error" }],
        data: {}
      }, status: 500
    end
  end
end
