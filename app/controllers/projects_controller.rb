class ProjectsController < InheritedResources::Base

  before_filter :signed_in_user, except: [:show, :index]
  before_filter :correct_user, only: [:update, :edit, :destroy]

  def show
    @project = Project.find params[:id]
    @author = @project.user.id == current_user.id if signed_in?
    show!
  end

  def create
    @project = Project.new params[:project]
    @project.user = current_user
    create!
  end

  def index
    @projects = Project.order_by(:created_at.desc).page(params[:page]).per(50)
  end

  private

    def correct_user
      @project = current_user.projects.find(params[:id])
      redirect_to root_url if @project.nil?
    end
end
