class AuditRequestsController < ApplicationController

  private

  def audit_request
    Request.create(
      method: request.method,
      url: request.url,
      headers: request_headers,
      query: request.query_parameters,
      body: request.raw_post
    )
  end

  def request_headers
    request.headers.select { |k, v| k.upcase == k }.to_h
  end

  def process(action, *args)
    render json: { id: audit_request.id }
  end
end
