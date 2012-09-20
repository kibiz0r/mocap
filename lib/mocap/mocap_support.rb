if defined? MotionSupport
  MocapSupport = MotionSupport
elsif defined? ActiveSupport
  MocapSupport = ActiveSupport
else
  raise <<END
  Please include something that can provide an activesupport role

  For Ruby:
    gem "active_support", "~> 3.2.8"

  For RubyMotion:
    gem "motion_support", "~> 0.0.6"
END
end
