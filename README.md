# Peabody Compliance SDK

[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Web-blue)](https://peabodycompliance.com)
[![License](https://img.shields.io/badge/license-Proprietary-red)](https://peabodycompliance.com/terms.html)

Peabody Compliance provides sub-second location integrity and hardware-backed device verification for high-compliance industries (iGaming, Fintech, Sweepstakes). Our SDKs prevent GPS spoofing, VPN/Proxy usage, and device tampering.

## 🚀 Key Features

*   **Hardware Integrity:** Utilizes Apple App Attest and Secure Enclave to prove request origin.
*   **Spoofing Detection:** Identifies Mock Locations, Simulators, and GPS manipulation.
*   **Network Intelligence:** Real-time detection of VPNs, Proxies, and Tor exit nodes.
*   **Geofencing:** Precise jurisdictional verification (State/Country level) using GPS vs. IP consistency.
*   **Tamper Protection:** Detection of Jailbroken/Rooted devices and screen mirroring.

---

## 📱 iOS SDK Integration

### Installation
Add the Peabody SDK to your project via **Swift Package Manager**:
`https://github.com/PeabodySecure/PeabodySDK-Release`

### Configuration
Initialize the SDK in your `AppDelegate` or `@main` struct.

#### Method 1: API Key (Simple)
```swift
Peabody.configure(apiKey: "YOUR_API_KEY")
```

#### Method 2: Client ID Handshake (Secure)
Acquire a temporary session token automatically using your public Client ID.
```swift
Peabody.configure(clientId: "YOUR_CLIENT_ID")
```
*Note: You can also add `PeabodyClientID` to your `Info.plist` for auto-configuration.*

### Usage
```swift
Peabody.verifyLocation { result in
    switch result {
    case .success(let verdict):
        if verdict.isCompliant {
            print("Access Granted. Score: \(verdict.score)")
        } else {
            print("Access Denied: \(verdict.reason)")
        }
    case .failure(let error):
        print("Error: \(error)")
    }
}
```

---

## 🌐 Web SDK Integration

### Installation
Include the Peabody script on your page:
```html
<script src="https://peabodycompliance.com/resources/js/peabody.min.js"></script>
```

### Configuration & Usage
```javascript
// Initialize with your token or key
Peabody.config.sessionToken = 'acquired_session_token';

// Run verification
async function checkCompliance() {
    const result = await Peabody.verifySession('user_123', 'user@email.com');
    if (result.compliant) {
        console.log("Verified!");
    }
}
```

---

## 🛠 API Reference

If you are performing server-to-server validation, use our REST endpoint:

**POST** `https://peabodycompliance.com/verify.php`

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `apiKey` | String | Permanent API Key (Optional if token used) |
| `sessionToken` | String | Temporary Session Token (Optional if key used) |
| `lat` / `lon` | Double | GPS Coordinates |
| `attestAssertion` | String | Hardware integrity proof (iOS) |

---

## 📄 Legal & Support

*   **Documentation:** [peabodycompliance.com/docs.html](https://peabodycompliance.com/docs.html)
*   **Terms of Service:** [peabodycompliance.com/terms.html](https://peabodycompliance.com/terms.html)
*   **Support:** [support@peabodycompliance.com](mailto:support@peabodycompliance.com)

© 2026 Peabody Software, LLC. All rights reserved.

