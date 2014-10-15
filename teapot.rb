
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "1.0"

define_target "tagged-format" do |target|
	target.build do
		source_root = target.package.path + 'source'
		
		copy headers: source_root.glob('TaggedFormat/**/*.{h,hpp}')
		
		build static_library: "TaggedFormat", source_files: source_root.glob('TaggedFormat/**/*.cpp')
	end
	
	target.depends :platform
	target.depends "Build/Files"
	target.depends "Build/Clang"
	target.depends "Language/C++11"
	
	target.provides "Library/TaggedFormat" do
		append linkflags "-lTaggedFormat"
	end
end

define_target "tagged-format-tests" do |target|
	target.build do |environment|
		test_root = target.package.path + 'test'
		
		run tests: "TaggedFormat", source_files: test_root.glob('TaggedFormat/**/*.cpp')
	end
	
	target.depends "Build/Clang"
	
	target.depends :platform
	target.depends "Language/C++11"
	target.depends "Library/UnitTest"
	target.depends "Library/TaggedFormat"
	
	target.provides "Test/TaggedFormat"
end

define_configuration "travis" do |configuration|
	configuration[:source] = "https://github.com/dream-framework"
	
	configuration.require "platforms"
	configuration.require "build-files"
	configuration.require "unit-test"
	configuration.require "euclid"
end
