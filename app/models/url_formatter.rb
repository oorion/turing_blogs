class UrlFormatter
  attr_reader :rss_url, :http_regex, :rss_regex, :http

  def initialize(rss_url)
    @rss_url = rss_url
    @http_regex = /^http:\/\//
    @rss_regex = /.+(?=\/.*)/
    @http = "http://"
  end

  def format_rss_url
    unless rss_url.match(http_regex)
      http + rss_url
    else
      rss_url
    end
  end

  def format_url
    unless rss_url.match(http_regex)
      http + rss_url.match(rss_regex)
    else
      rss_url.match(rss_regex)
    end
  end
end
