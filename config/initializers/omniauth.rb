Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '728398983937918', '5bfbd9469bd843b820adf164f63f576b' #localhost
  provider :facebook, '1748678858692615', '5a14574755204ba66a5bad2825307e50' #staging
  # provider :vkontakte, '5004595', 'WEId2hiHYnug8t6FDIsN' #localhost
  provider :vkontakte, '5004777', 'X8FCUos9VhOSJCXlXrL8' #staging
  provider :odnoklassniki, '1147009024', '8E70F282B395F1653B0EFE90', :public_key => 'CBAJPOFFEBABABABA' #localhost

  provider :mailru, '735849', '56b8dc57c225e595afbbb42c3232df63', {
                      :callback_url => 'http://localhost:3000',
                      public_key: '56b8dc57c225e595afbbb42c3232df63'
                  }
end