class SearchController < ApplicationController
  skip_before_filter :authenticate_user
  def index
    query = "
    (SELECT id, 'news' as type, 'news' as category, 'Новости' as category_title, title_#{ I18n.locale } as title, body_#{ I18n.locale } as body FROM news WHERE title_ru LIKE ? OR title_en LIKE ? OR body_en LIKE ? OR body_ru LIKE ?)
    UNION
    (SELECT id, 'products' as type, 'products' as category, 'Товары' as category_title, title, description as body FROM products WHERE title LIKE ? OR description LIKE ? )
    UNION
    (SELECT id, 'good_hands' as type, 'good-hands' as category, 'Питомцы в добрые руки' as category_title, name as title, description as body FROM good_hands WHERE name LIKE ? OR description LIKE ? )
    UNION
    (SELECT id, 'copulation' as type, 'copulation' as category, 'Питомцы на случку' as category_title, name as title, description as body FROM copulations WHERE name LIKE ? OR description LIKE ? )
    UNION
    (SELECT id, 'sale' as type, 'sale' as category, 'Питомцы на продажу' as category_title, name as title, description as body FROM sales WHERE name LIKE ? OR description LIKE ? )"

    result = News.find_by_sql ["SELECT * FROM (#{ query }) AS u LIMIT 10 OFFSET #{(params[:page].to_i - 1) * 10 }", *(["%#{params[:q]}%"]*12)]

    result = result.map do |item|
      {
          id: item[:id],
          type: "##{ item[:type] }",
          title: item[:title],
          category: "##{item[:category]}",
          category_title: item[:category_title],
          body: item[:body][0..500] + '...'
      }
    end

    count = News.count_by_sql(["SELECT COUNT(*) FROM (#{ query }) AS u", *(["%#{params[:q]}%"]*12)])

    render json: {count: count, search_results: result}
  end
end