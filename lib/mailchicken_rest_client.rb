require 'mailchicken_rest_client/version'
require 'rest-client'

module MailchickenRestClient
  URL = 'https://mailchicken.herokuapp.com/api/v1/'.freeze
  HEADERS = { Authorization: 'Token token=2YoOrP2lSCQ0XXq3QAZB5gtt', content_type: :json, accept: :json }.freeze

  def self.show_mails
    response = RestClient.get(mails_url, HEADERS)
  end

  def self.send_mail(mail)
    RestClient.post(mails_url, HEADERS, mail)
  end

  def self.update_mail(mail)
    RestClient.put(mails_url + mail.id, HEADERS, mail)
  end

  private

  def self.mails_url
    URL + 'mails/'
  end
end
