//
//  ProfitSpreadUnits.swift
//  trader-dto
//
//  Created by Victor Chernykh on 28.09.2024.
//

public enum ProfitSpreadUnits: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Percent.
	/// Значение в процентах.
	case percent = 1

	/// Значение в единицах цены.
	case pips = 2

	/// By market.
	case market = 3

	public var description: String {
		switch self {
		case .percent:
			"Значение в процентах"
		case .pips:
			"Значение в единицах цены"
		case .market:
			"По рынку"
		}
	}
}
