Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '728398983937918', '5bfbd9469bd843b820adf164f63f576b' #localhost
  provider :facebook, '728398983937918', '5bfbd9469bd843b820adf164f63f576b' #staging
end