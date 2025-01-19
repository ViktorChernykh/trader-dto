//
//  StopQuantityUnits.swift
//  trader-dto
//
//  Created by Victor Chernykh on 26.09.2024.
//

public enum StopQuantityUnits: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Percent.
	/// Значение а процентах.
	case percent = 1

	/// Lots.
	/// Значение в лотах.
	case lots = 2

	public var description: String {
		switch self {
		case .percent:
			"Значение а процентах"
		case .lots:
			"Значение в лотах"
		}
	}
}
