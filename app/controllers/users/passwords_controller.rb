# Users Module
module Users
  # Devise Password Controller
  class PasswordsController < Devise::PasswordsController
    include ApplicationHelper

    def new
      super
    end
  end
end
