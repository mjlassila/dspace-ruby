module Dspace
  class Config
    attr_accessor :opts
    
    def initialize
      self.opts = {}
    end

    def [] (k)
      opts[k]
    end
    
    def []= (k, v)
      opts[k] = v
    end
    
    def length
      opts.length
    end
    
    # def find

    def self.load(path)
      if File.exist?(path)
        Config.parse File.read(path)
      else
        raise "Configuration file does not exist.  #{path}"
      end
    end
    
    def self.parse(config)
      retval = Config.new
      
      line_stack = []
      config.each do |line|
        line.sub!(/\#(.+?)$/, '') # ignore comments
        
        # join multi-line statements
        if line.strip =~ /\\$/
          line_stack.push line.sub(/\\/, '').strip
          next
        elsif line_stack.length != 0
          line = (line_stack + [line]).join(' ')
          line_stack = []
        end

        l = line.split('=').collect {|i| i.strip}
        if l.length > 1
          key = l.delete_at(0)
          val = l.join(' = ').split(',').collect {|i| i.strip}
          retval[key] = val.length == 1 ? val.first : val
        end
      end
      retval
    end
  end
end