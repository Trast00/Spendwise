class ErrorController < ApplicationController
  def error_404
    render :status => 404
  end

  def not_accessible
    render :status => 403
  end
end