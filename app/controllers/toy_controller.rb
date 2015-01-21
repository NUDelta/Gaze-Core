class ToyController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def helloworld
    puts "hello, world!"
  end

end
