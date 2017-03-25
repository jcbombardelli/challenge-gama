# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_busca_de_endereco
    get '/'
    assert_match /Busca de Endereço/, last_response.body
  end

  def test_busca_endereco

  	get '/?url=Avenida+PAULISTA'
	assert_match '/AVENIDA PAULISTA/', last_response.body
  end

  def test_busca_blank_error
  	get '/'
  	assert_match last_response.ok?


  end



end

