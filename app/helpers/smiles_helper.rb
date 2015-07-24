module SmilesHelper
  def expand_smilies(s)
    s = ERB::Util::html_escape(s)
    Smileize::SMILES.each do |smile, smile_class|
      s.gsub!(smile, Smileize.to_icon(smile))
    end
    s.html_safe
  end
end