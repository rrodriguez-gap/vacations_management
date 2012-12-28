ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "growthaccelerationpartners.com",
  :user_name            => "rrodriguez",
  :password             => "roro2001",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://sharp-warrior-3260.heroku.com"

