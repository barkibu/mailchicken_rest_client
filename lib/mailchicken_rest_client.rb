require 'mailchicken_rest_client/version'
require 'rest-client'
require 'json'

module MailchickenRestClient
  #URL = 'https://mailchicken.herokuapp.com/api/v1/'.freeze
  URL = 'localhost:3000/api/v1/'
  HEADERS = { Authorization: 'Token token=OJLlRcYrm4MlZ8NC4e69ugtt', content_type: :json, accept: :json }.freeze

  def self.show_mails
    response = RestClient.get(mails_url, HEADERS)
  end

  def self.send_mail(mail)
    RestClient.post(mails_url, HEADERS)
  end

  def self.update_mail(mail)
    RestClient.put(mails_url + mail.id, mail.to_json, HEADERS)
  end

  private

  def self.mails_url
    URL + 'mails/'
  end

  class Mail
    #include ActiveModel::Serializers::JSON
    attr_accessor :id, :sender, :receiver, :street_address, :city, :company,
                  :country, :state, :postal_code, :extra_info, :content

    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      instance_values
    end
  end

end
