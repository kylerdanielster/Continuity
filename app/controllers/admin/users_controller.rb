module Admin
  class UsersController < Admin::ApplicationController

    # GET /users
    # GET /users.json
    def index
      @users = User.all
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
