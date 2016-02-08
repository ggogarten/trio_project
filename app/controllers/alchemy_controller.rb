require './alchemyapi.rb'

class AlchemyController < ApplicationController
  def index
  end

  def connect
    key = 'be2d1daed89556039d606f9062dcef7983146537'
    alchemyapi = AlchemyAPI.new(key)

    demo_text = params[:text]
    response_concept = alchemyapi.concepts('text', demo_text)
    response_sentiment = alchemyapi.sentiment('text', demo_text)


    if response_concept['status'] == 'OK' && response_sentiment['status'] == 'OK'
    	@result = '## Response Object ##'
    	@result += JSON.pretty_generate(response_concept)
      @result_sentiment = '## DOC SENTIMENT ##'
      @result_sentiment += JSON.pretty_generate(response_sentiment)

    	@result += "\n" * 2
    	@result += '## Concepts ##'
    	for concept in response_concept['concepts']
        @concept_list_key = concept['text']
        @concept_list_value = concept['relevance']
        @concept_list << @concept_list_key
        @concept_list_class = @concept_list.class
        @result += 'text: ' + concept['text']
        @result += 'relevance: ' + concept['relevance']
        @result += ''
      end
      @result
      @concept_class = @concept.class
      @concept_class
      @concept_list_key
      @concept_list_value
      @concept_list
      @concept_list_class
      @first_concept = @concept_list.last
      @first_concept
        # new_entry = Idealogy.new(concept: concept_text, relevance: concept_relevance)
        # new_entry.save
        # p @result

    #   for sentiment in response_sentiment['docSentiment']['type']
    #     if response['docSentiment'].key?('score')
    # puts 'score: ' + response['docSentiment']['score']
    else
    	puts 'Error in concept tagging call: ' + response['statusInfo']
    end
  end

end
