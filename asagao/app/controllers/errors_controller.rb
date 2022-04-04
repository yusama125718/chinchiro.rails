class ErrorsController < ActionController: :Base
  def show
    ex = request.env["action_dispatch.exeption"]

    if ex.kind_of?(ActionController::RoutingErrir)
      render "errors/not_found"
    end
  end
end
