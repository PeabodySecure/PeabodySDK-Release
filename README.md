# Peabody Compliance SDK

[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Web%20%7C%20Android-blue)](https://peabodycompliance.com)
[![SDK Version](https://img.shields.io/badge/ios-1.0.2-green)](https://peabodycompliance.com/docs.html)
[![License](https://img.shields.io/badge/license-Proprietary-red)](https://peabodycompliance.com/terms.html)

Peabody Compliance provides sub-second location integrity and hardware-backed device verification for high-compliance industries (iGaming, Fintech, Sweepstakes). Our SDKs prevent GPS spoofing, VPN/Proxy usage, and device tampering.

## 🚀 Key Features (v1.0.2)

*   **🛡️ Hardware Attestation:** Utilizes Apple App Attest and Secure Enclave to cryptographically prove request origin.
*   **✍️ HMAC-SHA256 Signing:** Every request is signed at the hardware level to prevent MITM tampering and replay attacks.
*   **🖥️ Remote Desktop Detection:** Advanced heuristics to identify and block TeamViewer, AnyDesk, and unauthorized screen mirroring.
*   **💓 Jurisdictional Heartbeat:** Continuous monitoring mode for active user sessions (e.g., live betting).
*   **🔒 SSL Pinning:** Built-in public key pinning to ensure data is never intercepted by proxy tools.
*   **📡 Multi-Layered VPN Detection:** Combines system-level proxy checks, virtual interface scanning (`utun`), and IP intelligence.

---

## 📱 iOS SDK Integration

### Installation
Add the Peabody SDK to your project via **Swift Package Manager**:
`https://github.com/PeabodySecure/PeabodySDK-Release`

### Configuration
Initialize the SDK in your `AppDelegate` or `@main` struct.

#### Enable Debugging (Development only)
```swift
Peabody.enableDebugLogging()
```

#### Method 1: API Key
```swift
Peabody.configure(apiKey: "YOUR_API_KEY")
```

#### Method 2: Client ID Handshake (Secure)
Acquire a temporary session token automatically using your public Client ID.
```swift
Peabody.configure(clientId: "YOUR_CLIENT_ID")
```

### Usage

#### One-Time Verification
```swift
Peabody.verifyLocation(externalId: "user_123", externalEmail: "player@email.com") { result in
    switch result {
    case .success(let verdict):
        if verdict.isCompliant {
            print("Access Granted. Score: \(verdict.score)")
        }
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

#### Continuous Jurisdictional Monitoring
Keep users compliant during long sessions. The SDK handles app foreground/background transitions automatically.
```swift
Peabody.startMonitoring(interval: 900) { result in
    if case .success(let verdict) = result, !verdict.isCompliant {
        // Handle jurisdictional change (e.g. stop game)
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

### Usage
```javascript
async function checkCompliance() {
    const result = await Peabody.verifySession('user_123', 'user@email.com');
    if (result.compliant) {
        console.log("Verified! Risk Score: " + result.risk_score);
    }
}
```

---

## 🛠 API & Audit Reference

Peabody logs a rich set of signals for every verification call, satisfying GLI-33 Section 2.7.2 requirements.

### Response Data Structure
```json
{
  "status": "success",
  "compliant": true,
  "risk_score": "0",
  "device_integrity": {
    "hardware_integrity": true,
    "is_jailbroken": false,
    "is_mock_location": false,
    "is_vpn_active": false,
    "is_remote_desktop": false
  },
  "ip_intelligence": {
    "proxy_type": "N/A",
    "extensions": { "asn": "7922", "as": "Comcast Cable" }
  },
  "metadata": {
    "sdk_version": "ios-1.0.2",
    "bundle_id": "com.yourdomain.app",
    "os_version": "18.2",
    "uptime": 210688
  }
}
```

---

## 📄 Legal & Support

*   **Documentation:** [peabodycompliance.com/docs.html](https://peabodycompliance.com/docs.html)
*   **Support:** [support@peabodycompliance.com](mailto:support@peabodycompliance.com)

© 2026 Peabody Software, LLC. All rights reserved. Proprietary and Confidential.
