Description
===========

This Chef cookbook installs stunnel. 

[![Build Status](https://secure.travis-ci.org/freistil/chef-stunnel.png)](http://travis-ci.org/freistil/chef-stunnel)


Requirements
============

None.


Attributes
==========

See `attributes/default.rb` for default values.

* `node['stunnel']['services']` - service definitions
* `node['stunnel']['certs']` - SSL certificates


Usage
=====

Set the stunnel attributes in a role, for example:

    "stunnel" => {
      "services" => {
        "mydb" => {
          "accept" => "3307",
          "connect" => "127.0.0.1:3306",
          "cert" => "/etc/stunnel/mydb.pem"
        }
      },
      "certs" => {
        "mydb" => "-----BEGIN PRIVATE KEY-----..."
      }

The `default` recipe will write each certificate to a `.pem` file and create a service configuration like this:

    [mydb]
    accept = 3307
    connect = 127.0.0.1:3306
    cert = /etc/stunnel/mydb.pem


License and Author
==================

Author:: Jochen Lillich <jochen@freistil.it>

Copyright 2012, freistil IT

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
