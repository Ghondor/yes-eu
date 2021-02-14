module Dashboard
  class DashboardController < ApplicationController
    before_action :authenticate_user!, :authenticate_student!
    layout 'dashboard'
  end
end
