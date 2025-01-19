//
//  OrderUpdateDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 16.11.2024.
//

import struct Foundation.UUID
import struct Foundation.Date

public struct OrderUpdateDto {

	// MARK: Stored properties
	public let id: UUID
	public let balance: Int
	public let message: String
	public let orderNo: Int
	public let units: Int
	public let nano: Int32
	public let status: Int16
	public let transactionId: Int
	public let acceptedAt: Date
	public let createdAt: Date

	// MARK: - Init
	public init(
		id: UUID,
		balance: Int,
		message: String,
		orderNo: Int,
		units: Int,
		nano: Int32,
		status: Int16,
		transactionId: Int,
		acceptedAt: Date,
		createdAt: Date
	) {
		self.id = id
		self.balance = balance
		self.message = message
		self.orderNo = orderNo
		self.units = units
		self.nano = nano
		self.status = status
		self.transactionId = transactionId
		self.acceptedAt = acceptedAt
		self.createdAt = createdAt
	}
}

extension OrderUpdateDto {
	public var csv: String {
		"\(id.uuidString)\t\(balance)\t\(message)\t\(orderNo)\t\(units)\t\(nano)\t\(status)\t\(transactionId)\t\(acceptedAt.timestamp)\t\(createdAt.timestamp)"
	}
}

extension OrderUpdateDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 10,
			let id: UUID = .init(uuidString: values[0]),
			let balance: Int = .init(values[1]),
			let orderNo: Int = .init(values[3]),
			let units: Int = .init(values[4]),
			let nano: Int32 = .init(values[5]),
			let status: Int16 = .init(values[6]),
			let transactionId: Int = .init(values[7]),
			let acceptedAt: Date = values[8].datetime,
			let createdAt: Date = values[9].datetime
		else {
			throw "OrderUpdateDto csv decoder error."
		}

		self.init(
			id: id,
			balance: balance,
			message: values[2],
			orderNo: orderNo,
			units: units,
			nano: nano,
			status: status,
			transactionId: transactionId,
			acceptedAt: acceptedAt,
			createdAt: createdAt
		)
	}
}
