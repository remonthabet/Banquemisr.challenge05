//
//  AppHelper.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import Foundation
import Network
struct AppHelper {
    static func checkInternetConnection() async -> Bool {
        return await withCheckedContinuation { continuation in
            let monitor = NWPathMonitor()
            let queue = DispatchQueue.global(qos: .background)

            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    continuation.resume(returning: true) // Internet connection is available
                } else {
                    continuation.resume(returning: false) // No internet connection
                }
                monitor.cancel() // Stop monitoring after the first check
            }

            monitor.start(queue: queue)
        }
    }
}

