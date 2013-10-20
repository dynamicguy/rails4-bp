module Rails4Bp
  # work around reloader
  unless defined? ::Rails4Bp::VERSION
    module VERSION #:nodoc:
      MAJOR = 0
      MINOR = 9
      TINY  = 7
      PRE   = 1

      STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
    end
  end
end
