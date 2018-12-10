require 'grape'
module API
  class Root < Grape::API
    prefix 'api/'
    mount API::Ver1::Poker


    get do


    end
  end
end

# class Root < Grape::API
# http://localhost:3000/api/
# mount API::Ver1::Root
#mount API::Ver2::Root
