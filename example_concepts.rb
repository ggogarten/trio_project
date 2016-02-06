
#	Copyright 2013 AlchemyAPI
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


require './alchemyapi'

# demo_text = 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.'
# demo_url= 'http://www.npr.org/2013/11/26/247336038/dont-stuff-the-turkey-and-other-tips-from-americas-test-kitchen'
# demo_url= 'http://www4.pictures.zimbio.com/gi/George+Gogarten+6y3yla3a2BZm.jpg'
# demo_url= 'http://preview.netcarshow.com/Porsche-911_Carrera-2013-hd.jpg'
demo_url= 'http://wirednewyork.com/images/city-guide/liberty/liberty.jpg'
demo_html = '<html><head><title>Python Demo | alchemyapi</title></head><body><h1>Did you know that alchemyapi works on HTML?</h1><p>Well, you do now.</p></body></html>'

demo_text = gets.chomp

alchemyapi = AlchemyAPI.new()


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Concept Tagging Example                 #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.concepts('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Concepts ##'
	for concept in response['concepts']
		puts 'text: ' + concept['text']
		puts 'relevance: ' + concept['relevance']
		puts ''
	end
else
	puts 'Error in concept tagging call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Sentiment Analysis Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing html: ' + demo_html
puts ''

response = alchemyapi.sentiment('html', demo_html)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Document Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']

	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end
else
	puts 'Error in sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Targeted Sentiment Analysis Example    #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.sentiment_targeted('text', demo_text, 'Denver')

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Targeted Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']

	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end

else
	puts 'Error in targeted sentiment analysis call: ' + response['statusInfo']
end




puts ''
puts ''
