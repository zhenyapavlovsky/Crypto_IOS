//
//  Date.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 29.03.2023.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "MM.dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        return str
    }
}
