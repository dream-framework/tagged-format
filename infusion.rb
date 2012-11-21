
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.2"
require 'teapot/build'

define_package "tagged-format-0.2.1" do |package|
	package.build(:all) do |platform, environment|
		top = Teapot::Build.top(Pathname.new(__FILE__).dirname)
		
		top.add_directory('source')
		
		top.execute(:install, environment.flatten)
	end
end
