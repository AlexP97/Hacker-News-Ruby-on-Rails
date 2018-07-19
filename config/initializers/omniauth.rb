Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "422125884306-ui71n2a4rs3s81jvi3jq93dd07eakffm.apps.googleusercontent.com", "isNNzvl0PhzOaoygX471iDSw"
end