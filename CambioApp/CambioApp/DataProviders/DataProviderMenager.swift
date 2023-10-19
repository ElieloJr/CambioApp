//
//  DataProviderMenager.swift
//  CambioApp
//
//  Created by Usr_Prime on 19/10/23.
//

import Foundation

protocol DataProviderMenagerDelegate {
    func succes(model: Any)
    func errorData(_ provider: DataProviderMenagerDelegate?, error: Error)
}

extension DataProviderMenagerDelegate {
    func succes(model: Any) {
        preconditionFailure("This method must be overridden")
    }
    func errorData(_ provider: DataProviderMenagerDelegate?, error: Error) {
        print(error.localizedDescription)
    }
}

class DataProviderMenager<T, S> {
    var delegate: T?
    var model: S?
}
