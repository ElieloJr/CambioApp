//
//  RateStore.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

protocol RatesStoreProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startData: String, endData: String) async throws -> RatesFluctuationObject
    func fetchTimeseries(by base: String, from symbols: [String], startData: String, endData: String) async throws -> RatesHistoricalObject
}

class RatesStore: BaseStore, RatesStoreProtocol {
    func fetchFluctuation(by base: String, from symbols: [String], startData: String, endData: String) async throws -> RatesFluctuationObject {
        guard let urlRequest = try RatesRouter.fluctuation(base: base, symbols: symbols, startDate: startData, endDate: endData).asUrlRequest() else {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let rates = try RateResult<RatesFluctuationObject>(data: data, response: response).rates
        else { throw error }
        return rates
    }
    
    func fetchTimeseries(by base: String, from symbols: [String], startData: String, endData: String) async throws -> RatesHistoricalObject {
        guard let urlRequest = try RatesRouter.timeseries(base: base, symbols: symbols, startDate: startData, endDate: endData).asUrlRequest() else {
            throw error
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let rates = try RateResult<RatesHistoricalObject>(data: data, response: response).rates
        else { throw error }
        return rates
    }
    
    
}
