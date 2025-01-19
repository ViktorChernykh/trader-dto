//
//  OrderType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 27.09.2024.
//

public enum OrderType: Int, Sendable, CaseIterable, Identifiable {

	public var id: Int { self.rawValue }

	case order = 1
	case stopLoss = 2
	case takeProfit = 3
}
