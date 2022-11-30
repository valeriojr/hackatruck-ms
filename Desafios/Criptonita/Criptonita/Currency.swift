//
//  Currency.swift
//  Criptonita
//
//  Created by Student on 25/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let id: String?
    let rank: String?
    let symbol: String?
    let name: String?
    let supply: String?
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    let vwap24Hr: String?
    let explorer: String?
}

struct CoinCapData : Codable {
    let data: [Currency]?
    let timestamp: Int?
}
