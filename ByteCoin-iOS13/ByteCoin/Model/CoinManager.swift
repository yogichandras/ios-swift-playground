//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinDelegate {
    func didFailWithError(_ error: Error?)
    func didSuccessWithBitcoin(_ bitcoin: CoinModel?)
}

struct CoinManager {
    var delegate: CoinDelegate?
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency:String){
        let bitcoinUrl = "\(baseURL)\(currency)"
        performRequest(bitcoinUrl)
    }
    
    func performRequest(_ urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error)
                    return
                }
                
                if let safeData = data {
                    if let result = self.parseJSON(safeData){
                        self.delegate?.didSuccessWithBitcoin(result)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let trimCurrency = decodedData.display_symbol.components(separatedBy: "-")[1]
            let resulData = CoinModel(lastPrice: decodedData.last, currency: trimCurrency)
            return resulData
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
