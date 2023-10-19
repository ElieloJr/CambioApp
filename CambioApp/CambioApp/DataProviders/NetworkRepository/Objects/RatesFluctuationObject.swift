//
//  RatesFluctuationObject.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

struct RatesFluctuationObjectValue: Codable {
    let change: Double
    let changePct: Double
    let endRate: Double

    enum CodingKeys: String, CodingKey {
        case change
        case endRate = "end _rate"
        case changePct = "change_pct"
    }
}

typealias RatesFluctuationObject = [String: RatesFluctuationObjectValue]
