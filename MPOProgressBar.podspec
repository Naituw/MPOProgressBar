
Pod::Spec.new do |s|

	s.name 			= "MPOProgressBar"
	s.version		= "0.0.1"
	s.authors		= ["Naituw", "The Material Components authors"]
	s.summary		= "A material design progress bar, supports both determinate and indeterminate modes"
	s.homepage		= "https://github.com/Naituw/MPOProgressBar"
	s.license		= "Apache 2.0"
	s.source		= { :git => "https://github.com/Naituw/MPOProgressBar.git", :tag => "v0.0.1" }
	s.requires_arc  = true
	s.frameworks 	= 'QuartzCore'
	s.platforms		= { :ios => "7.0", :osx => "10.10" }
	s.source_files  = 'MPOProgressBar/*.{h,m}'
end