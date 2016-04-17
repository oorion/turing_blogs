class UrlFormatter
  attr_reader :rss_url, :http_regex, :rss_regex, :medium_rss_regex, :http

  def initialize(rss_url)
    @rss_url = rss_url
    @http_regex = /^(http|https):\/\//
    @rss_regex = /.+(?=\/.*)/
    @medium_rss_regex = /.+\/feed\/.+/
    @http = "http://"
  end

  def format_rss_url
    remove_trailing_slash_if_present
    unless rss_url.match(http_regex)
      http + rss_url
    else
      rss_url
    end
  end

  def format_url
    case
    when rss_url.match(medium_rss_regex)
      rss_url.gsub("/feed", "")
    when !rss_url.match(http_regex)
      http + rss_url.match(rss_regex)
    else
      rss_url.match(rss_regex)
    end
  end

  private

  def remove_trailing_slash_if_present
    @rss_url[-1] = "" if rss_url.last == "/"
  end
end
