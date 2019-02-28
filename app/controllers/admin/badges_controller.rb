class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
    @categories = Category.all
    @tests = Test.all
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image_url, :criterion, :param)
  end
end
