class Order < ActiveRecord::Base
  attr_accessible :email, :phone, :username

  after_create :send_notification
  after_create :send_to_crm

  def send_notification
    #response = HTTParty.get(
    #    'http://api.sms24x7.ru',
    #    query: {
    #        method: 'push_msg',
    #        email: 'agatovs@gmail.com',
    #        password: 'avv6rqE',
    #        phone: '79037928959',
    #        text: sms_text,
    #        sender_name: 'abardacha'
    #    }
    #)
    #
    #if response.parsed_response['response']['msg']['text'] == 'OK'
    #  true
    #else
    #  false
    #end

    Pony.mail ({
      to: 'abardacha@gmail.com',
      subject: I18n.t('email.title', locale: 'en'),
      body: sms_text,
      via: :smtp,
      via_options: {
        address: 'smtp.gmail.com',
        port: 587,
        enable_starttls_auto: true,
        user_name: 'abardacha',
        password: 'fiolent149',
        authentication: :plain
      }
    })


  end

  def send_to_crm
    HTTParty.post(
      'http://crm.abardacha.ru/api/clients',
      query: {
          client: {
              name: username,
              phone: phone
          }
      }
    )
  end

  def sms_text
    I18n.translate(
        'sms.notification_message',
        username: username,
        phone: phone
    )
  end
end
