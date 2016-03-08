
class IPFilter
  def initialize(ipfile)
    @gate = {}
    (0...256).each  {|i| @gate[i] = []}
    IO.foreach(ipfile) do |line|
      s = line.split(/[\.\/]/).map {|c| c.to_i}
      @gate[s[0]] << [s[0...4].pack("C*").unpack("N")[0], s[4]]
    end
  end

  def contain?(ip)
    i = ip.split('.').map{|c| c.to_i}
    ip_addr = i.pack("C*").unpack("N")[0]
    @gate[i[0]].each do |list|
      return true if (ip_addr & (0xFFFFFFFF - (0xFFFFFFFF >> list[1]))) == list[0]
    end
    false
  end
end

ip_filter  = IPFilter.new("")
target_file = ""

IO.foreach(target_file) do |line|
    if result = ip_filter.contain?(line) == true
      print line.strip + "-->"
      p result
    end
end
