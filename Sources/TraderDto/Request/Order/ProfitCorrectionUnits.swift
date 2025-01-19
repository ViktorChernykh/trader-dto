//
//  ProfitCorrectionUnits.swift
//  trader-dto
//
//  Created by Victor Chernykh on 26.09.2024.
//

public enum ProfitCorrectionUnits: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Percent.
	/// Значение а процентах.
	case percent = 1

	/// Значение в единицах цены.
	case pips = 2

	public var description: String {
		switch self {
		case .percent:
			"Значение а процентах"
		case .pips:
			"Значение в единицах цены"
		}
	}
}
