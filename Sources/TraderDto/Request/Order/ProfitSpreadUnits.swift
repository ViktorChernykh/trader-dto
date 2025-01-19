//
//  ProfitSpreadUnits.swift
//  trader-dto
//
//  Created by Victor Chernykh on 28.09.2024.
//

public enum ProfitSpreadUnits: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Value in percent.
	case percent = 1

	/// Value in price units.
	case pips = 2

	/// Market price.
	case market = 3
}
