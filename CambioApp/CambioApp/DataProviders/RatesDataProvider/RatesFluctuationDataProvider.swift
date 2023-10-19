//
//  RatesFluctuationDataProvider.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

protocol RatesFluctuationDataProviderDelegate: DataProviderMenagerDelegate {
    func succes(model: RatesFluctuationObject)
}

class RatesFluctuationDataProvider: DataProviderMenager<RatesFluctuationDataProviderDelegate, RatesFluctuationObject> {
    private let ratesStore: RatesStore
    
    init(ratesStore: RatesStore = RatesStore()) {
        self.ratesStore = ratesStore
    }
    
    func fetchFluctuation(by base: String, from symbols: [String], startData: String, endData: String) {
        Task.init {
            do {
                let model = try await ratesStore.fetchFluctuation(by: base, from: symbols, startData: startData, endData: endData)
                delegate?.succes(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
