require 'rails_helper'

RSpec.describe TemplatesController, type: :controller do

	describe 'GET #index' do
		context 'with params[:page]' do
			# TODO: is_open違う, rename
			it 'pages' do
				template_0 = create(:template)
				template_1 = create(:template, is_open: 1)
				get :index, params: { page: 0 }
				expect(assigns(:templates)).to match_array [template_1]
			end

			it 'render the :index template' do
				get :index, params: { page: 0 }
				expect(response).to render_template :index
			end
		end

		context 'with params[:q]' do
			# TODO: 検索
			it 'populates an array of templates string with q'

			it 'render the :index template'
		end

		context 'without params' do
			# TODO: rename
			it 'pages' do
				template_0 = create(:template)
				template_1 = create(:template, is_open: 1)
				get :index
				expect(assigns(:templates)).to match_array [template_1]
			end

			it 'render the :index template' do
				get :index
				expect(response).to render_template :index
			end
		end
	end

	describe 'GET #show' do
		context	'with params[:id]' do
			it 'assigns the requested Template to @template' do
				template = create(:template)
				get :show, params: { id: template }
				expect(assigns(:template)).to eq template
			end

			it 'renders the :show template' do
				template = create(:template)
				get :show, params: { id: template }
				expect(response).to render_template :show
			end
		end

		context 'without params[:id]' do
			it 'pages'

			it 'renders the :show template'
		end
	end

	describe 'GET #new' do
		# TODO: 認証後のテスト
		# https://qiita.com/iwsksky/items/8e965f3ac17918066907
		# https://qiita.com/Kohei_Kishimoto0214/items/e29e509b12a6eb484a42
		context 'with authentication' do
			it 'assigns a new Template to @template'

			it 'renders the :new template'
		end

		context 'without authentication'
	end

	describe 'GET #edit' do
		it 'assigns the requested Template to @template'

		it 'renders the :edit template'
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'saves the new template in the database'

			it 'redirects to index_path' 
		end

		context 'with invalid attributes' do
			it 'dose not save the new template in the database'

			it 're-renders the :new template'
		end
	end

	describe 'PATCH #update' do
		context 'with valid attributes' do
			it 'located the requested @template'

			it 'changes @templates attributes'

			it 'redirects to the updated template'
		end

		context 'with invalid attributes' do
			it 'does not change the templates attributes'

			it 're-render the edit template'
		end
	end

	describe 'DELETE #destroy' do
		it 'deletes the template'

		it 'redirects to template#index'
	end

	describe 'GET #duplicate' do
		context	'with valid attributes' do
			it 'assigns to the requested Template to @template'

			it 'assigns to a new Page to @page'

			it 'render the :new template'
		end

		context 'with invalid attributes' do
			it 're-render the :index template'
		end
	end
end
