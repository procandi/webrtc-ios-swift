post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3'
        end
    end
end

# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'WebRTC iOS Swift' do
    pod "libjingle_peerconnection"
    pod "SocketRocket"
end

target 'WebRTC iOS SwiftTests' do

end

target 'WebRTC iOS SwiftUITests' do

end

