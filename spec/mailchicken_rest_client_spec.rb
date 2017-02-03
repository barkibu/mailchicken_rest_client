require 'spec_helper'

describe MailchickenRestClient do
  it 'has a version number' do
    expect(MailchickenRestClient::VERSION).not_to be nil
  end

  it 'does send a mail' do
    mail = create_mail
    expect(MailchickenRestClient.send_mail(mail).code).to eq(200)
  end

  it 'does update a mail' do
    mail = create_mail
    expect(MailchickenRestClient.update_mail(mail).code).to eq(200)
  end

  it 'does show mails' do
    expect(MailchickenRestClient.show_mails.size).to be > 1
  end

  private

  def create_mail
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
