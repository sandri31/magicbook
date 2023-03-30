# frozen_string_literal: true

# Use this middleware to block requests with a forbidden host.
class AllowedHosts
  def initialize(app)
    @app = app
  end

  def call(env)
    if allowed_host?(env['HTTP_HOST'])
      @app.call(env)
    else
      [403, { 'Content-Type' => 'text/html' }, ['Blocked host']]
    end
  end

  private

  def allowed_host?(host)
    host =~ /(?:www\.)?repairemagic\.fr\z/
  end
end
