require "base64"
require "uri"

# taken from https://gist.github.com/patrickfav/3f9127e25dd6538f0d682b89cbfaefd9

module ObfuscateMailAddress
    def mailObfuscate(input)
      base64Mail = Base64.strict_encode64(Addressable::URI.encode(input + '@' + 'krupkat.cz'))
      output = "<a href=\"#\" "
      output += "data-contact=\"#{base64Mail}\" target=\"_blank\" "
      output += "onfocus=\"this.href = 'mailto:' + atob(this.dataset.contact)\">"
      output += "<script type=\"text/javascript\">document.write(atob(\"#{base64Mail}\"));</script></a>"
      return output
    end
  end
  
  Liquid::Template.register_filter(ObfuscateMailAddress)