//
//  BrokerType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 13.09.2024.
//

public enum BrokerType: Int, Codable, Sendable, CaseIterable, Identifiable {

	public var id: Int { rawValue }

	case none = 0
	case alor = 1
	case bcs = 2
	case finam = 3
	case tInvest = 4

	public var description: String {
		switch self {
		case .none:
			"none"
		case .alor:
			"Alor"
		case .bcs:
			"BCS"
		case .finam:
			"Finam"
		case .tInvest:
			"T-Invest"
		}
	}
}
