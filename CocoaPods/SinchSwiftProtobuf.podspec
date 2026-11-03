Pod::Spec.new do |s|
  s.name          = 'SinchSwiftProtobuf'
  s.version       = '1.39.0'
  s.summary       = 'apple/swift-protobuf 1.39.0 runtime, repackaged for the Sinch SDKs (iOS 16, library evolution)'
  s.description   = <<-DESC
    The unmodified SwiftProtobuf runtime sources from the apple/swift-protobuf 1.39.0 tag,
    built as the `SwiftProtobuf` module. Trunk's SwiftProtobuf pod declares iOS 11.0, which
    Xcode 27 refuses to build, and the prebuilt SinchChatSDK binary needs a resilient
    (library evolution) protobuf module. Used by SinchPushSDK and SinchChatSDK.
    Do not install it next to trunk's SwiftProtobuf pod: both provide the same module.
  DESC
  s.homepage      = 'https://github.com/apple/swift-protobuf'
  s.license       = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }
  s.author        = { 'Apple Inc.' => 'https://github.com/apple/swift-protobuf' }
  s.source        = { :git => 'https://github.com/apple/swift-protobuf.git', :tag => s.version.to_s }
  s.module_name   = 'SwiftProtobuf'
  s.platform      = :ios, '16.0'
  s.swift_version = '5.0'
  s.source_files  = 'Sources/SwiftProtobuf/**/*.swift'
  s.resource_bundle = { 'SwiftProtobuf' => ['Sources/SwiftProtobuf/PrivacyInfo.xcprivacy'] }
  # The same compilation conditions and package name as apple's own podspec, plus
  # library evolution for the prebuilt SinchChatSDK binary.
  s.pod_target_xcconfig = {
    'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => '$(inherited) BinaryDelimitedStreams FieldMaskUtilities',
    'OTHER_SWIFT_FLAGS' => '$(inherited) -package-name SwiftProtobuf',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
end
