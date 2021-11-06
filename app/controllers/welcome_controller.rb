class WelcomeController < ApplicationController
	def index
		render json: { hogehoge: 'よろしく' }
	end
end
