class TemplatesController < ApplicationController
	before_action :authenticate_author!, only: %i(new create edit update)
  before_action :set_template, only: %i(show edit update destroy)

	def index
		@templates = Template.is_open_templates.page params[:page]
		pp @templates
	end

	def show
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
	end

	def update
		if draft?
			@template.is_open = false
		else
			@template.is_open = true
		end
		@template.update(template_param)
		render 'edit'
	end

	def destroy
		@template.delete
		redirect_to templates_path
	end

	def duplicate
		@template = Template.find(params[:id])
		@page = Page.new @template.inherit_template
		@page.template = @template
		render 'pages/new'
	end

	private

	def template_param
		params.require(:template).permit(Template::TEMPLATE_ATTRIBUTES)
	end

	def draft?
		!params[:draft].nil?
	end

	def set_template
		@template = Template.find(params[:id])
	end
end
