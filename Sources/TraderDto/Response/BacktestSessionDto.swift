//
//  BacktestSessionDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 07.06.2024.
//

import Foundation

/// Response object for item of Backtest Session.
public struct BacktestSessionDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public let id: UUID
	public let dateStart: Date
	public let dateEnd: Date
	public let dateDrawdown: String
	public let dateDrawup: String
	public let startBalance: Double
	public let endBalance: Double
	public let totalFee: Double
	public let totalTax: Double
	public let drawdown: Double
	public let drawup: Double
	public let duration: Double
	public let name: String
	public let description: String
	public let strategyId: UUID
	public let userId: UUID
	public let winRate: Double
	public let createdAt: Date

	// MARK: - Init
	public init(
		id: UUID,
		dateStart: Date,
		dateEnd: Date,
		dateDrawdown: String,
		dateDrawup: String,
		startBalance: Double,
		endBalance: Double,
		totalFee: Double,
		totalTax: Double,
		drawdown: Double,
		drawup: Double,
		duration: Double,
		name: String,
		description: String,
		strategyId: UUID,
		userId: UUID,
		winRate: Double,
		createdAt: Date
	) {
		self.id = id
		self.dateStart = dateStart
		self.dateEnd = dateEnd
		self.dateDrawdown = dateDrawdown
		self.dateDrawup = dateDrawup
		self.startBalance = startBalance
		self.endBalance = endBalance
		self.totalFee = totalFee
		self.totalTax = totalTax
		self.drawdown = drawdown
		self.drawup = drawup
		self.duration = duration
		self.name = name
		self.description = description
		self.strategyId = strategyId
		self.userId = userId
		self.winRate = winRate
		self.createdAt = createdAt
	}
}

extension BacktestSessionDto: Equatable {
	public static func == (lhs: BacktestSessionDto, rhs: BacktestSessionDto) -> Bool {
		lhs.id == rhs.id
	}
}

extension BacktestSessionDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
