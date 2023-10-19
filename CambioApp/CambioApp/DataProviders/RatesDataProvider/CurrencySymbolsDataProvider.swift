//
//  CurrencySymbolsDataProvider.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

protocol CurrencySymbolsDataProviderDelegate: DataProviderMenagerDelegate {
    func succes(model: CurrencySymbolObject)
}

class CurrencySymbolsDataProvider: DataProviderMenager<CurrencySymbolsDataProviderDelegate, CurrencySymbolObject> {
    private let currencyStore: CurrencyStore
    
    init(currencyStore: CurrencyStore = CurrencyStore()) {
        self.currencyStore = currencyStore
    }
    
    func fetchSymbols() {
        Task.init {
            do {
                let model = try await currencyStore.fetchSymbols()
                delegate?.succes(model: model)
            } catch {
                delegate?.errorData(delegate, error: error)
            }
        }
    }
}
