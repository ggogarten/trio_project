class IdeologyController < ApplicationController
  def save_result
    for concept in response_concept['concepts']
      new_speech = Speeches.find(param[:id]).idealogies.create(concept: concept['text'], relevance: concept['relevance'])
      Candidate.find(param[:id]).speeches << new_speech
    end
  end
end
