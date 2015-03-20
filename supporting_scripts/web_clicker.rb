require 'mechanize'
require 'logger'

class WebClicker

  # def self.send_request_with_proxy(url, proxy_addr, proxy_port)
  #   uri = URI(url)
  #   response = Net::HTTP.new(uri.hostname, uri.port, proxy_addr, proxy_port).start { |http|
  #     http.get(uri)
  #   }
  #
  #   puts response
  # end

  def self.load_mechanize_agent(proxy_addr, proxy_port)
    # using tap in case of proxy_addr is host_name
    Mechanize.new.tap do |agent|
      agent.set_proxy(proxy_addr, proxy_port)
      agent.log = Logger.new 'mech.log'
      agent.user_agent_alias = 'Linux Firefox'
    end
  end

  def self.get_web_page(url, proxy_addr, proxy_port)
    agent = self.load_mechanize_agent(proxy_addr, proxy_port)
    page = agent.get(url)

    puts page
  end

end

proxy_addr = '107.182.17.149'
proxy_port = 7808

WebClicker.get_web_page('http://www.tut.by', proxy_addr, proxy_port)