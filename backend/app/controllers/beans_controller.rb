class BeansController < ActionController::API
  def index
    beans = Bean.all
    render json: beans, status: :ok
  end

  def create
    bean = Bean.new(beans_param)
   
    if bean.save
      render json: { status: 200, bean: bean, message: "success" }
    else
      render json: { status: 500, bean: nil, message: bean.errors }
    end
  end

  def show
    bean = Bean.find(params[:id])
  end

  def edit
    bean = Bean.find(params[:id])
  end

  def update
    bean = Bean.find(params[:id])
    bean.update!(beans_param)
    redirect_to bean
  end

  def destroy
    bean = Bean.find(params[:id])
    bean.destroy!
    redirect_to bean
  end

  private

  def beans_param
    params.require(:bean).permit(
      :name,
      :producingArea,
      :kind,
      :degreeOfRoasting,
      :price,
      :acidity,
      :bitter,
      :sweety,
      :fullBody,
      :aroma,
      :inputBeans,
    )
  end
end
