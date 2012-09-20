require 'bubble-wrap/loader'
require 'bubble-wrap/coalesce'
require 'bubble-wrap/reactr'
require 'bubble-wrap/captivation'
require 'motion_support/concern'

BubbleWrap.require 'lib/mocap/**/*.rb' do
  file("lib/mocap/presentation.rb").depends_on ["lib/mocap/wrap.rb", "lib/mocap/present.rb", "lib/mocap/presents_with.rb"]
  file("lib/mocap/view.rb").depends_on "lib/mocap/viewness.rb"
  file("lib/mocap/viewness.rb").depends_on ["lib/mocap/viewness.rb", "lib/mocap/presented_with.rb"]
  file("lib/mocap/view_model.rb").depends_on "lib/mocap/view_modelness.rb"
end
