class StaticPage < ActiveRecord::Base

  NAMES = [:help, :rules, :team, :contacts]

  class << self
    NAMES.each do |page_name|
      define_method page_name do
        where(name: page_name).first_or_create
      end
    end
  end
end
