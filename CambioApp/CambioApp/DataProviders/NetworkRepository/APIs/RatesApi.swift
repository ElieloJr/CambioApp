//
//  RatesApi.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct RatesApi {
    static let baseUrl = "https://api.apilayer.com/exchangerates_data"
    static let apiKey = "HMOjD7SSdyR9yzVWYs5AozJKMTgDNrrx"
    static let fluctuation = "/fluctuation"
    static let symbols = "/symbols"
    static let timeseries = "/timeseries"
}
