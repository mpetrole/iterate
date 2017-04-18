require 'uri'
require 'open-uri'

class Iterate
  def initialize(url)
    @url = url
  end
  
  def construct #build the iterations
    @finish = Array.new #array to dump all the url iterations into
    for i in ('a'..'n')
      res = @url.sub(/\/\w\//, "\/#{i}\/") #substitute the first instance of /some letter or number/ with a-n and 1-9
      @finish << res
    end
    for i in (1..9)
      res = @url.sub(/\/\w\//, "\/#{i}\/")
      @finish << res
    end
  end
  
  def check #check the resultant urls for connectivity
    results = Array.new
    @finish.each do |url|
    url.chomp! #make sure there isn't any whitespace. URI doesn't like whitespace
      uri = URI.parse(url) #need to make the url into a URI object
        begin
            open(uri) #try the uri
        rescue OpenURI::HTTPError, SocketError
            next #skip to the next one if there's an error
        end
        results << url
    end
    return results
  end
end