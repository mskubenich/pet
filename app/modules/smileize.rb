module Smileize

  SMILES = {
      ";-)" => "wink", ":-D" => "grin", ":-P" => "tongue", ':-p' => 'emotion', '8-)' => 'eyehard',
      ':_(' => 'sob', ':((' => 'upset', ':o' => 'fear', ':|' => 'nowords', '3-)' => 'sad',
      ':X' => 'mouthclosed', ':(' => 'cry', "<3" => 'heard', "&lt;3" => 'heard', ':-*' => 'kiss', ':-(' => 'goodlook'
  }

  def to_icon(key)
    return "<img class='icon_smile smile_#{ SMILES[key] }'/>"
  end

  module_function  :to_icon
end