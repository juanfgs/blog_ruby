Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "XTehnwYzXuPphXUd3R2i0p7HA", "DTytodGaF79JYYM5BtPMJjqK1U0NYJeBfgCuWTcj0niurTRuUz"
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1590493784496215','8df4b67a522eaa75a30515ff12f84a85'
end
