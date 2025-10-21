//
//  KeychainSwiftView.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI
import KeychainSwift

// Keychain is similar to UserDefaults or AppStorage
// Keychain is encrypted
// Keychain is good for: passwords, ssn, credit card info, sensitive data
// Keychain persists between installs and across devices

final class KeychainManager {
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, forKey: String) {
        keychain.set(value, forKey: forKey)
    }
    
    func get(_ key: String) -> String? {
        keychain.get(key)
    }
}

struct KeychainManagerKey: EnvironmentKey {
    // Define the default value for the environment key.
    // You could also choose to initialize it with a specific configuration if needed.
    static let defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

struct KeychainSwiftView: View {
//    @Environment(\.keychain) var keychain
//    let keychain = KeychainManager().keychain
//    @State private var userPassword: String = ""
    @KeychainStorage("user_password") var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No Password" : userPassword) {
            let newPassword = "aaaaaa"
            userPassword = newPassword
//            keychain.set(newPassword, forKey: "user_password") // withAccess: .accessibleAfterFirstUnlock)
        
//            keychain.delete("user_password")
//            keychain.clear()
        }
        .onAppear {
            _userPassword.reload()
        }
    }
}

#Preview {
    KeychainSwiftView()
}

// MARK: - Property Wrapper

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    @State private var newValue: String = ""
    let key: String
    let keychain: KeychainManager

    var wrappedValue: String {
        get { newValue }
        nonmutating set { save(newValue: newValue) }
    }

    var projectedValue: Binding<String> {
        Binding(get: { wrappedValue }, set: { newValue in wrappedValue = newValue })
    }

    init(wrappedValue: String, _ key: String) {
        self.key = key
        let keychain = KeychainManager()
        self.keychain = keychain
        newValue = keychain.get(key) ?? ""
        print("SUCCESS READ")
    }

    func save(newValue: String) {
        keychain.set(newValue, forKey: key)
        self.newValue = newValue
        print("SUCCESS SAVED")
    }
    
    func reload() {
        let fresh = keychain.get(key) ?? ""
        newValue = fresh
    }
}
