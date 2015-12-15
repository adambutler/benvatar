class TwitterUser < ActiveRecord::Base
  serialize :auth_hash
end
