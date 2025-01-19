//
//  BrokerType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 13.09.2024.
//

public enum BrokerType: Int, Codable, Sendable, CaseIterable, Identifiable {

	public var id: Int { rawValue }

	case alor = 0
	case bcs = 1
	case finam = 2
	case tInvest = 3

	public var description: String {
		switch self {
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
