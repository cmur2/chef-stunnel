maintainer       "freistil IT"
maintainer_email "cookbooks@freistil.it"
license          "Apache 2.0"
description      "Installs/Configures stunnel"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "1.1.2"

%w( debian ubuntu ).each do |os|
  supports os
end
