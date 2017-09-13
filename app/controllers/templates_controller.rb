class TemplatesController < ApplicationController
	before_action :authenticate_author!, only: %i(new create edit update)
	def index
		@templates = Template.all
	end

	def show
		@template = Template.find(params[:id])
	end

	def new
		@template = Template.new
	end

	def create
		@template = Template.new(template_param)
		@template.author = current_author
		#@template.is_open = false if draft?
		@template.save
		redirect_to templates_path
	end

	def edit
		@template = Template.find(params[:id])

	end

	def update
		@template = Template.find(params[:id])
		if draft?
			@template.is_open = false
		else
			@template.is_open = true
		end
		@template.update(template_param)
		render 'edit'
	end

	def preview
		@template = Template.find(params[:id])
	end

	def duplicate
		@template = Template.find(params[:id])
		page = Page.new
		redirect_to templates_path
	end

	private

	def template_param
		params.require(:template).permit(Template::TEMPLATE_ATTRIBUTES)
	end

	def draft?
		!params[:draft].nil?
	end
end
