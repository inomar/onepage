require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:author) { create(:author) }

  describe 'GET #index' do
    subject { get :index, params: params }

    # TODO: 未実装 タグ検索
    context 'with params[:tag]' do
      let(:params) { { tag: 'test' } }
    end

    # TODO: 未実装 カテゴリ検索
    context 'with params[:category]'

    # TODO: 未実装 作者検索
    context 'with params[:author]'

    # TODO: 未実装 タイトル検索
    context 'with params[:title]' do
      let(:page) { create(:page, title: 'ハーモニー') }
      let(:params) { { title: 'ハーモニー' } }
      before { page }
      it 'populates an array of pages string with the title'
    end

    context 'without params' do
      subject { get :index }
      it 'populate an array of all pages' do
        page1 = create(:page, title: '走れメロス')
        page2 = create(:page, title: '鼻')
        subject
        expect(assigns(:pages)).to match_array([page1, page2])
      end

      it 'render the :index template' do
        subject
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    subject { get :show, params: params }

    context 'with params[:id]' do
      let(:page) { create(:page, id: 1) }
      let(:params) { { id: 1 } }
      before { page }

      it 'assigns the requested page to @page' do
        subject
        expect(assigns(:page)).to eq page
      end

      it 'render the :show template' do
        subject
        expect(response).to render_template :show
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    context 'when author is logging in' do
      let(:author) { create(:author) }
      before { login_author author }

      it 'assigns the requested page to @page' do
        subject
        expect(assigns(:page)).to be_a_new(Page)
      end

      it 'render the :new template' do
        subject
        expect(response).to render_template :new
      end
    end

    context 'when author is not logged in' do
      it 'redirect to the :index' do
        subject
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_author_session_path
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }
    let(:author) { create(:author) }
    let(:params) do
      {
        title: 'ハーモニー',
        summary: 'この話の要約',
        story: 'long long ago..',
        category_id: '1'
      }
    end

    context 'with valid attributes' do
      before { login_author author }
      it 'saves the new page in the database'
    end

    context 'with invalid attributes'
  end

  describe 'GET #edit' do
    it 'assigns the requested page to @page'

    it 'render the :edit template'
  end

  describe 'PATCH #update' do
    context 'with valid attributes'

    context 'with invalid attributes'
  end

  describe 'DELETE destroy' do
    it 'deleted the page'

    it 'redirect to the :index'
  end
end
