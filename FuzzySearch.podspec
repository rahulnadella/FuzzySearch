Pod::Spec.new do |spec|
  spec.name         = 'FuzzySearch'
  spec.version      = '1.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/rahulnadella/FuzzySearch'
  spec.authors      = { 'Rahul Nadella' => 'rahulnadella@yahoo.com' }
  spec.summary      = 'Utility class to find an approximate match for specific String'
  spec.source       = { :git => 'https://github.com/rahulnadella/FuzzySearch.git', :tag => 'v1.1.0' }
  spec.platform = :ios, '8.0'
  spec.requires_arc = true
  spec.source_files = 'FuzzySearch.swift'
end
