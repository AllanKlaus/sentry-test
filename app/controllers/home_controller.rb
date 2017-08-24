class HomeController < ApplicationController
  def success
    render :json => return_json
  end

  def fail
    fail 'Raising exception'
    render :json => return_json
  end

  def send_to_sentry
    Raven.capture_message("When I want to send an error to sentry",
      extra: {
        error: 'Failed cause I want',
        file: 'home_controller.rb',
        method: 'get',
        my_parameter: 'This parameter is what I want'
      },
      level: 'error'
    )
    render :json => return_json
  end

  private

  def return_json
    { name: 'Allan Klaus' }
  end
end