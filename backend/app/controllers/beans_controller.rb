class BeansController < ActionController::API
  def index
    
    render json: { message: "This is a test message from Rails INDEX"}
  end

  def create
    # beans = beans.new(beans_param)
    # beans.save
    # render json: beans, status: :created
    render json: { message: "This is a test message from Rails"}

  end
  private

  def beans_param
    params.require(:beans).permit(
      :name
    )
  end
end
