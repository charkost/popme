class String
  def utf8_encode
    if encoding == Encoding::UTF_8
      self
    else
      force_encoding('ISO-8859-1').encode('UTF-8')
    end
  end

  def unescape_html
    CGI.unescape(CGI.unescapeHTML(self))
  end

  def uri_encode
    URI.encode(self)
  end
end
