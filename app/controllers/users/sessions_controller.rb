module Users
  # Devise Sessions Controller
  class SessionsController < Devise::SessionsController
    include ApplicationHelper

    def create
      super
    end

    def new
      super
    end
  end
end
