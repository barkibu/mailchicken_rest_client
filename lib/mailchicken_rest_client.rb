#require 'mailchicken_rest_client/version'
require 'rest-client'
require 'json'

module MailchickenRestClient
  #URL = 'https://mailchicken.herokuapp.com/api/v1/'.freeze
  URL = 'localhost:3000/api/v1/'
  HEADERS = { Authorization: 'Token token=OJLlRcYrm4MlZ8NC4e69ugtt', content_type: :json, accept: :json }.freeze

  def self.show_mails
    RestClient.get(mails_url, HEADERS)
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
    attr_accessor :id, :sender, :receiver, :street_address, :city, :company,
                  :country, :state, :postal_code, :extra_info, :content

    def as_json(options={})
      {
        id: @id,
        sender: @sender,
        receiver: @receiver,
        street_address: @street_address,
        city: @city,
        company: @company,
        country: @country,
        state: @state,
        postal_code: @postal_code,
        extra_info: @extra_info,
        content: @content
      }
    end

    def to_json(*options)
      as_json(*options).to_json(*options)
    end

    def self.json_create(o)
      mail = new()
      mail.id = o["id"]["number"]
      mail.sender = o["sender"]["string"]
      mail
    end

    def self.create_mail
      mail = MailchickenRestClient::Mail.new()
      mail.id = '1'
      mail.sender = 'David Sender'
      mail.receiver = 'Pepe Receiver'
      mail.street_address = 'Stree prueba'
      mail.city = 'City'
      mail.company = 'Compay'
      mail.country = 'Spain'
      mail.state = 'State'
      mail.postal_code = '15100'
      mail.extra_info = 'extra info'
      mail.content = 'Content'
      mail
    end

  end


mail = MailchickenRestClient::Mail.create_mail
mail_json = mail.to_json
puts mail_json
puts JSON.pretty_generate(mail)
puts JSON.parse(mail_json)
new_mail = MailchickenRestClient::Mail.json_create(mail_json)
puts new_mail.to_json
end
