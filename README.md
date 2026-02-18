Peabody SDK for iOS

The Peabody SDK is a specialized location-compliance framework built to help iOS applications meet strict jurisdictional requirements. By combining advanced device integrity checks with location verification, Peabody ensures that users are physically present within authorized borders before accessing regulated features or sensitive data.

Installation

Swift Package Manager (Recommended)

In Xcode, open your project and navigate to File > Add Packages...

In the search bar, paste the repository URL:
https://github.com/PeabodySecure/PeabodySDK-Release.git

Select the version requirement (e.g., Up to Next Major Version: 1.0.0).

Click Add Package.

Ensure PeabodySDK is checked for your target and click Finish.

Jurisdictional Compliance Flow

1. Global Initialization

Initialize the SDK once at app launch to prepare the security handshake with Peabody's compliance servers.

import PeabodySDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Use your Production API Key
        Peabody.configure(apiKey: "PB_PROD_YOUR_API_KEY")
        
        return true
    }
}


2. Verify Jurisdictional Status

Use this check whenever a user enters a restricted workflow (e.g., filing a tax return, accessing state-specific insurance documents, or making a regulated transaction).

Peabody.verifyLocation { result in
    switch result {
    case .success(let verdict):
        // verdict.isCompliant confirms the user is in the correct jurisdiction
        // and the device environment is secure.
        if verdict.isCompliant {
            print("Jurisdictional Verification Successful.")
            print("Confidence Score: \(verdict.score)%")
        } else {
            // Block access or redirect based on the specific failure reason
            print("Compliance Failure: \(verdict.reason)")
        }
    case .failure(let error):
        print("System Error during verification: \(error.localizedDescription)")
    }
}


Core Compliance Features

Jurisdictional Geofencing: Real-time validation of user coordinates against state and national boundaries to satisfy regional laws.

Anti-Spoofing & VPN Detection: Identifies attempts to mask or fake location data using VPNs, proxies, or simulated GPS coordinates.

Device Integrity (Root/Jailbreak): Ensures the device has not been compromised, preventing attackers from bypassing location-based restrictions via system-level exploits.

Audit-Ready Logging: Every verification generates a cryptographically signed compliance token, providing a legal trail for regulatory audits.

Requirements

iOS: 15.0 or later

Xcode: 15.0 or later

Swift: 5.9+

Support

For technical support, integration consulting, or to obtain an API key, please visit PeabodyCompliance.com/support.

© 2026 Peabody Compliance. All rights reserved.
