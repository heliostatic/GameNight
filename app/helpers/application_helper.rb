module ApplicationHelper

  def associated_friendship(user)
    friendship = current_user.friendships.find_by_friend_id(user.id) 
  end
 
  def markdown(text)
      rc = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :filter_html => true, :hard_wrap => true)
      #options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
      rc.render(text).html_safe
  end

  def notice_block
    %Q(<section id="notice">#{notice}</section>).html_safe if notice
  end

  def alert_block
    %Q(<section id="alert">#{alert}</section>).html_safe if alert 
  end

  def parent_url_string
    parent = controller.controller_name.singularize
    comments_path(:parent_type => parent, :parent_id => controller.instance_variable_get("@#{parent}").id)
  end
end
