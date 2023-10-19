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
    static let baseUrl = "https://v6.exchangerate-api.com/v6/"
    static let apiKey = "39c0c84a545d6bf028a94f94"
}
