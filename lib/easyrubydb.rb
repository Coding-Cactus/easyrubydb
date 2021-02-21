require "http"
require "json"


class DB
	attr_accessor :data

	BASE_URL = "https://s1.kognise.dev/db"

	def initialize(name, token)
		@name = name
		@token = token
		r = HTTP.headers(:Authorization => "Bearer #{@token}").get("#{BASE_URL}/#{@name}").body.to_s
		raise Exception.new "Invalid database token" if r == "Unauthorized"
		r = "{}" if r == "Not Found"
		@data = JSON.parse(r)
	end

	def load
		@data = JSON.parse(HTTP.headers(:Authorization => "Bearer #{@token}").get("#{BASE_URL}/#{@name}").body.to_s)
	end

	def save
		HTTP.headers(:Authorization => "Bearer #{@token}").put("#{BASE_URL}/#{@name}", :body => @data.to_json)
		nil
	end

	def to_s
		@data.to_s
	end

	def [](key)
		@data[key]
	end

	def []=(key, value)
		@data[key] = value
		save
	end
end