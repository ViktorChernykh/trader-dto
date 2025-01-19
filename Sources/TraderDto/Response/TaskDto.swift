//
//  TaskDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 27.12.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

public struct TaskDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: ExchangeType
	public let engine: String
	public let market: String
	public let board: String
	public let secid: String
	public let price1: Double
	public let price2: Double?
	public let decimals: Int
	public let subjectType: SubjectType
	public let compareType: CompareType
	public let deviationType: DeviationType
	public var quantityTimes: Int
	public let action: Int
	public let expired: Date?
	public let expireType: TaskDateType
	public let name: String
	public let notification: String
	public let createdAt: Date

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		market: String,
		board: String,
		secid: String,
		price1: Double,
		price2: Double?,
		decimals: Int,
		subjectType: SubjectType,
		compareType: CompareType,
		deviationType: DeviationType,
		quantityTimes: Int,
		action: Int,
		expired: Date?,
		expireType: TaskDateType,
		name: String,
		notification: String,
		createdAt: Date
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.market = market
		self.board = board
		self.secid = secid
		self.price1 = price1
		self.price2 = price2
		self.decimals = decimals
		self.subjectType = subjectType
		self.compareType = compareType
		self.deviationType = deviationType
		self.quantityTimes = quantityTimes
		self.action = action
		self.expired = expired
		self.expireType = expireType
		self.name = name
		self.notification = notification
		self.createdAt = createdAt
	}
}

extension TaskDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(secid)
		hasher.combine(price1)
		hasher.combine(expired)
		hasher.combine(expireType)
		hasher.combine(name)
	}
}
