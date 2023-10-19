//
//  RateHistoricalDataProvider.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

protocol RateHistoricalDataProviderDelegate: DataProviderMenagerDelegate {
    func succes(model: RatesHistoricalObject)
}

class RateHistoricalDataProvider: DataProviderMenager<RateHistoricalDataProviderDelegate, RatesHistoricalObject> {
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    
    func fetchTimeseries(by base: String, from symbols: [String], startData: String, endData: String) {
        Task.init {
            do {
                let model = try await ratesStore.fetchTimeseries(by: base, from: symbols, startData: startData, endData: endData)
                delegate?.succes(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
