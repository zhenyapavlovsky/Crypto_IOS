//
//  DomainModelConvertible.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import Foundation

protocol DomainModelConvertible: Codable {
    associatedtype DomainModelType
    
    func toDomainModel() -> DomainModelType
}
