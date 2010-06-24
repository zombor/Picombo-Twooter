require 'dm-core'

DataMapper.setup(:default,
                 {:host => 'localhost',
                  :adapter => 'mysql',
                  :database => 'twooter',
                  :username => 'foo',
                  :password => 'bar'})