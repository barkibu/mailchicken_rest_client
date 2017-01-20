module MailchickenRestClient
  class Mail
    include ActiveModel::Serializers::JSON
    attr_accessor :sender, :receiver, :street_address, :city, :company,
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
