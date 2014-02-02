class ArticleDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  def formatted_created_at
    object.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def comments_count
    h.pluralize article.comments.count, "Comment"
  end

  def delete_icon(link_text = nil)
    delete_icon_filename = 'cancel.png'
    h.link_to h.image_tag(delete_icon_filename) + link_text,
              h.polymorphic_path(article),
              method: :delete,
              confirm: "Delete '#{article}'?"
  end

end
