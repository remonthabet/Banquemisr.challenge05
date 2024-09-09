//
//  Extentions.swift
//  Banquemisr.challenge05
//
//  Created by remon on 10/09/2024.
//

import Foundation
import Combine
// Extension to convert Combine Publisher to Async/Await
extension Publisher {
    func asAsync() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            cancellable = self.sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                },
                receiveValue: { value in
                    continuation.resume(returning: value)
                    cancellable?.cancel()
                }
            )
        }
    }
}
