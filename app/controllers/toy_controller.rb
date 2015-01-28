class ToyController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  respond_to :json

  def helloworld
    respond_with "hello, world!"
  end

end
