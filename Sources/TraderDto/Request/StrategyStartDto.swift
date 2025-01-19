//
//  StrategyStartDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 29.03.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

public struct StrategyStartDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let strategyId: UUID
	public let strategyName: String
	public let cashStart: Double
	public let dateStart: Date
	public let dateEnd: Date
	public let instruments: [String]	// board#secid
	public let timeInterval: Int
	public let shoulder: Double

	public let taxPercent: Double
	public let feePercent: Double
	public let feeMonth: Double
	public let shortPercent: Double
	public let name: String
	public let description: String

	// Strategy parameters
	public let arguments: [String: String]

	// MARK: - Init
	public init(
		userId: UUID,
		strategyId: UUID,
		strategyName: String,
		cashStart: Double,
		dateStart: Date,
		dateEnd: Date,
		instruments: [String],
		timeInterval: Int,
		shoulder: Double,
		taxPercent: Double,
		feePercent: Double,
		feeMonth: Double,
		shortPercent: Double,
		name: String,
		description: String,
		arguments: [String: String]
	) {
		self.userId = userId
		self.strategyId = strategyId
		self.strategyName = strategyName
		self.cashStart = cashStart
		self.dateStart = dateStart
		self.dateEnd = dateEnd
		self.instruments = instruments
		self.timeInterval = timeInterval
		self.shoulder = shoulder
		self.taxPercent = taxPercent
		self.feePercent = feePercent
		self.feeMonth = feeMonth
		self.shortPercent = shortPercent
		self.name = name
		self.description = description

		self.arguments = arguments
	}
}

//	public var arguments: [String] {
//		[
//			"-timeInterval", "\(timeInterval)",
//			"-smaPeriod", "\(smaPeriod)",
//			"-rsiPeriod", "\(rsiPeriod)",
//			"-rsiMin", "\(rsiMin)",
//			"-rsiMax", "\(rsiMax)",
//			"-macdShort", "\(macdShort)",
//			"-macdLong", "\(macdLong)",
//			"-macdSmooth", "\(macdSmooth)",
//		]
//	}

