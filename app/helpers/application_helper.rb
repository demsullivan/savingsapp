module ApplicationHelper
  def page_id
    if id = content_for(:body_id) and id.present?
      return id
    else
      base = controller.class.to_s.gsub("Controller", '').underscore.gsub("/", '_')
      return "#{base}-#{controller.action_name}"
    end
  end

  def page_controller
    controller.class.to_s
  end

  def page_action
    controller.action_name
  end

  def page_class
    controller.class.to_s.gsub("Controller", '').underscore.gsub("/", '_')+" "+content_for(:page_class)
  end
end
