require './alchemyapi.rb'

class AlchemyController < ApplicationController
  def index
  end

  def connect
    key = 'be2d1daed89556039d606f9062dcef7983146537'
    alchemyapi = AlchemyAPI.new(key)

    demo_text = params[:text]

    response = alchemyapi.concepts('text', demo_text)

    if response['status'] == 'OK'
    	@result = '## Response Object ##'
    	@result += JSON.pretty_generate(response)


    	@result += ''
    	@result += '## Concepts ##'
    	for concept in response['concepts']
    		@result += 'text: ' + concept['text']
    		@result += 'relevance: ' + concept['relevance']
    		@result += ''
    	end
      @result
    else
    	puts 'Error in concept tagging call: ' + response['statusInfo']
    end
  end
end
