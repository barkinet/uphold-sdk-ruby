require 'logger'
require 'httparty'
require 'dotenv'
require 'virtus'
Dotenv.load

require 'bitreserve/version'
require 'bitreserve/options'
require 'bitreserve/client'

module Bitreserve
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = Options::API_BASE
  @api_version = 0
  @logger = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_version, :logger

    def sandbox=(value)
      self.api_base = if value
                        Options::SANDBOX_API_BASE
                      else
                        Options::API_BASE
                      end
      Bitreserve::Request.update_base_uri
    end
  end
end

require 'bitreserve/helpers'
require 'bitreserve/request'
require 'bitreserve/request_data'
require 'bitreserve/entities/base_entity'
require 'bitreserve/entities/asset'
require 'bitreserve/entities/auth_token'
require 'bitreserve/entities/card'
require 'bitreserve/entities/contact'
require 'bitreserve/entities/ledger_entry'
require 'bitreserve/entities/phone'
require 'bitreserve/entities/ticker'
require 'bitreserve/entities/transaction'
require 'bitreserve/entities/user'
require 'bitreserve/entities/oauth_error'
require 'bitreserve/entities/error'
