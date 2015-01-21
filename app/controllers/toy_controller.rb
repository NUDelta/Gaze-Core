class ToyController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def helloworld
    respond_with "hello, world!"
  end

end
