//
//  TestDataDTO.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import Foundation

struct TestDataDTO: Codable {
    
    let id: String
    let prop1: Int
    let prop2: Bool
}

extension TestDataDTO: DomainModelConvertible {
    func toDomainModel() -> TestData {
        TestData(
            id: self.id,
            prop1: self.prop1,
            prop2: self.prop2
        )
    }
}
