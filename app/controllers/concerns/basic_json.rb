module BasicJson
  extend ActiveSupport::Concern

  def render_json_and_html(source)
    respond_to do |f|
      f.json { render json: source }
      f.html {}
    end
  end

end
