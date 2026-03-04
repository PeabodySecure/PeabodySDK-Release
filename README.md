# Peabody Compliance SDK for iOS

[![Platform](https://img.shields.io/badge/platform-iOS-blue)](https://peabodycompliance.com)
[![SDK Version](https://img.shields.io/badge/ios-1.0.2-green)](https://peabodycompliance.com/docs.html)
[![License](https://img.shields.io/badge/license-Proprietary-red)](https://peabodycompliance.com/terms.html)

**Peabody Compliance** provides the industry's most robust, sub-second location integrity and hardware-backed device verification. Built for high-compliance sectors like **iGaming, Fintech, Sports Betting, and Sweepstakes**, our SDK ensures your platform remains compliant with applicable jurisdictional regulations.

Peabody prevents fraud at the source by identifying GPS spoofing, VPN/Proxy usage, and advanced device tampering before a single transaction is processed.

## 🚀 Key Security Features (v1.0.3)

*   **🛡️ Hardware Attestation:** Utilizes Apple **App Attest** and the **Secure Enclave** to cryptographically prove that location requests originate from a genuine, unmodified Apple device.
*   **✍️ HMAC-SHA256 Payload Signing:** Every request is hardware-signed to prevent Man-in-the-Middle (MITM) tampering, interception, and replay attacks.
*   **🖥️ Remote Desktop Detection:** Advanced heuristics identify and block **TeamViewer, AnyDesk, AirPlay**, and unauthorized screen mirroring tools used to bypass geofencing.
*   **💓 Jurisdictional Heartbeat:** Continuous monitoring mode for active user sessions ensures compliance throughout the entire player journey, not just at login.
*   **🔒 SSL Pinning:** Built-in public key pinning validates our compliance servers, preventing credential theft via proxy tools like Charles or Fiddler.
*   **📡 Multi-Layered VPN & Proxy Detection:** Combines system-level proxy checks, virtual interface scanning (`utun/tun`), and carrier-grade IP intelligence.

---

## 📱 iOS SDK Integration

### Installation
Add the Peabody SDK to your project via **Swift Package Manager**:
`https://github.com/PeabodySecure/PeabodySDK-Release`

### Configuration
Initialize the SDK in your `AppDelegate` or `@main` struct.

#### Method 1: API Key
```swift
Peabody.configure(apiKey: "YOUR_API_KEY")
```

#### Method 2: Client ID Handshake (Recommended)
Exchanges a public Client ID for a temporary session token, keeping your API key out of the binary.
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
            print("Verified Safe. Risk Score: \(verdict.score)")
        } else {
            print("Access Denied: \(verdict.reason)")
        }
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

#### Continuous Jurisdictional Monitoring
Automate re-verification every 15 minutes. The SDK handles foreground/background lifecycle events to preserve battery while maintaining strict compliance.
```swift
Peabody.startMonitoring(interval: 900) { result in
    if case .success(let verdict) = result, !verdict.isCompliant {
        // Take action: e.g. pause the game session
    }
}
```

---

## 🌐 Other Platforms

Information regarding the **Peabody JavaScript Plugin** for web applications and the **Android SDK Package** is available exclusively on our official website. 

👉 **[Explore Web & Android Solutions](https://www.peabodycompliance.com/solutions.html)**

---

## 🧪 Free Developer Testing

Developers can sign up for a **Free API Key** to begin testing location integrity and device signals in their own sandbox environment. Get access to the Peabody Dashboard and real-time logs in minutes.

👉 **[Register for a Developer Account](https://www.peabodycompliance.com/signup.html)**

---

## 🛠 Audit & Compliance Reference

Peabody logs a comprehensive suite of integrity signals for every verification call, satisfying **GLI-33 Section 2.7.2** requirements for jurisdictional and device integrity.

### Sample Compliance Response
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
    "os_version": "18.2"
  }
}
```

---

## 📄 Support

*   **Official Documentation:** [peabodycompliance.com/docs.html](https://peabodycompliance.com/docs.html)
*   **Email Support:** [support@peabodycompliance.com](mailto:support@peabodycompliance.com)

© 2026 Peabody Software, LLC. All rights reserved. Proprietary and Confidential.
