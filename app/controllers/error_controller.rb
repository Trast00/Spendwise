class ErrorController < ApplicationController
  def error404
    render status: 404
  end

  def error403
    render status: 403
  end
end
