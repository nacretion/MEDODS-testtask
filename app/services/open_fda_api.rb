class OpenFDAApi
  include HTTParty
  base_uri 'https://api.fda.gov'

  def self.search_drugs(query)
    response = get("/drug/label.json?search=#{query}")
    response.parsed_response
  end

  def self.search_drugs_by_reactionmeddrapt(query)
    response = get("/drug/event.json?search=patient.reaction.reactionmeddrapt:#{query}")
    response.parsed_response
  end
end
