class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru", <testguru@testguru.com>}
  layout 'mailer'
end
