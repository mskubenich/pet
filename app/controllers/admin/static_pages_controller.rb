class Admin::StaticPagesController < AdminController

  def update
    @page = StaticPage.send(params[:name])
    @page.update_attributes page_params
    render json: {ok: true}
  end

  def show
    @page = StaticPage.send(params[:name])
    render json: {page: @page}
  end

  private

  def page_params
    params.require(:page).permit(:body_ru, :body_en)
  end

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: 'static_pages').each do |attachment|
      if @page.body_ru.include?(attachment.file.url) || @page.body_en.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @page.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end
end

