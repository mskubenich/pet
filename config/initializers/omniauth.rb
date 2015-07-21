Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '728398983937918', '5bfbd9469bd843b820adf164f63f576b' #localhost
  provider :facebook, '1748678858692615', '5a14574755204ba66a5bad2825307e50' #staging
end