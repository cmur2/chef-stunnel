maintainer       "freistil IT"
maintainer_email "jochen@freistil.it"
license          "All rights reserved"
description      "Installs/Configures stunnel"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

%w( debian ubuntu ).each do |os|
  supports os
end
