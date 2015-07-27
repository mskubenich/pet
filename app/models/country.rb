class Country
  def self.all
    [
        {title_ru: 'Россия', title_en: 'Russia', code: 'ru', id: 1 },
        {title_ru: 'Украина', title_en: 'Ukraine', code: 'ua', id: 2 },
        {title_ru: 'Белоруссия', title_en: 'Belarus', code: 'by', id: 3 },
        {title_ru: 'Казахстан', title_en: 'Kazakhstan', code: 'kz', id: 4 },
    ]
  end

  def self.find(id)
    all.select{|hash| hash[:id] == id }.try(:first)
  end
end