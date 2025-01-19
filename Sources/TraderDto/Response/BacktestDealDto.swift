//
//  BacktestDealDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.05.2024.
//

import Foundation

/// Response object for item of Backtest Deal.
public struct BacktestDealDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public let id: UUID
	public let entryDate: Date
	public let exitDate: Date
	public let entryPrice: Double
	public let exitPrice: Double
	public let lots: Int
	public let dealType: DealType
	public let profit: Double
	public let userId: UUID
	public let sessionId: UUID
	public let securityId: UUID
	public let secid: String
	public let interval: Int

	// MARK: - Init
	public init(
		id: UUID,
		entryDate: Date,
		exitDate: Date,
		entryPrice: Double,
		exitPrice: Double,
		lots: Int,
		dealType: DealType,
		profit: Double,
		userId: UUID,
		sessionId: UUID,
		securityId: UUID,
		secid: String,
		interval: Int
	) {
		self.id = id
		self.entryDate = entryDate
		self.exitDate = exitDate
		self.entryPrice = entryPrice
		self.exitPrice = exitPrice
		self.lots = lots
		self.dealType = dealType
		self.profit = profit
		self.userId = userId
		self.sessionId = sessionId
		self.securityId = securityId
		self.secid = secid
		self.interval = interval
	}
}

extension BacktestDealDto: Equatable {
	public static func == (lhs: BacktestDealDto, rhs: BacktestDealDto) -> Bool {
		lhs.id == rhs.id
	}
}

extension BacktestDealDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
