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
    expect(MailchickenRestClient.send_mail(mail).code).to eq(200)
  end

  it 'does show mails' do
    expect(MailchickenRestClient.show_mails.size).to be > 1
  end

  private

  def create_mail
    MailchickenRestClient::Mail.new(sender: 'David Sender',
                                    receiver: 'Pepe Receiver',
                                    street_address: 'Stree prueba',
                                    city: 'City', company: 'Compay',
                                    country: 'Spain', state: 'State',
                                    postal_code: '15100',
                                    extra_info: 'extra info',
                                    content: 'Content')
  end
end
