//
//  UserService.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import Foundation
import Combine

protocol UserService {
    func getTestData() -> AnyPublisher<TestData, Error>
}

final class UserServiceImpl: UserService {
    
    let executor: NetworkRequestExecutor
    
    init(executor: NetworkRequestExecutor) {
        self.executor = executor
    }
    
    func getTestData() -> AnyPublisher<TestData, Error> {
        func request() -> AnyPublisher<TestDataDTO, Error> {
            return executor
                .performRequest(
                    path: "/test.php",
                    method: .get
                )
        }
        
        return request()
            .map { testDataDTO in
                testDataDTO.toDomainModel()
            }
            .eraseToAnyPublisher()
    }
}
