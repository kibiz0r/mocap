require 'bubble-wrap/loader'
require 'bubble-wrap/coalesce'
require 'bubble-wrap/reactr'
require 'bubble-wrap/captivation'
require 'motion_support/concern'

BubbleWrap.require 'lib/mocap/**/*.rb' do
  file("lib/mocap/presentation.rb").depends_on ["lib/mocap/wrap.rb", "lib/mocap/present.rb"]
end
