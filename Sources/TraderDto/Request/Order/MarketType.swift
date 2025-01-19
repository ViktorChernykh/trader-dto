//
//  MarketType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.09.2024.
//

/// Market. Used in Finam api.
public enum MarketType: Int, Sendable, CaseIterable {

	/// Moscow Exchange Stock market.
	case stock = 1

	/// Moscow Exchange Derivative market.
	case forts = 4

	/// Saint-Petersburg Exchange.
	case spbex = 7

	/// US Stock market.
	case mma = 14

	/// Moscow Exchange Currency market.
	case ets = 15

	/// Moscow Exchange Bond market.
	case bonds = 20

	/// Moscow Exchange option market.
	case options = 21
}
