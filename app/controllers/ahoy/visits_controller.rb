module Ahoy
  class VisitsController < BaseController
    def create
      ahoy.track_visit

      response = {
        visit_token: ahoy.visit_token,
        visitor_token: ahoy.visitor_token,
        # legacy
        visit_id: ahoy.visit_token,
        visitor_id: ahoy.visitor_token,
      }

      if ahoy.tenant
        response[:tenant_id] = ahoy.tenant.id
      end

      render json: response
    end
  end
end
