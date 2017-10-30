require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
	# TODO: test書く
  describe 'POST #create' do
    context 'with params[:id]' do
      it 'respond the :js'
    end

    context	'be current author' do
    end

    context 'without params[:id]' do
      it 'respond the :js'
    end

    context	'not current author' do
    end
  end

  describe	'POST #delete' do
    context 'with params[:id]' do
    end

    context 'be current author' do
    end

    context 'without params[:id]' do
    end

    context 'not current author' do
    end
  end
end
