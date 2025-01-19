//
//  OrderListDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 10.10.2024.
//

import struct Foundation.Date

public typealias StopListDto = OrderListDto

/// Model for Order and Stop ListDto.
public struct OrderListDto: Sendable {

	// MARK: Stored properties
	public let broker: Int 			// BrokerType
	public let clientId: String
	public let secid: String?
	public let board: String?
	public let instrumentId: String?
	public let status: Int	 		// OrderStatusType?
	public let from: Date?
	public let to: Date?

	// MARK: - Init
	public init(
		broker: Int,
		clientId: String,
		secid: String? = nil,
		board: String? = nil,
		instrumentId: String? = nil,
		status: Int,
		from: Date? = nil,
		to: Date? = nil
	) {
		self.broker = broker
		self.clientId = clientId
		self.secid = secid
		self.board = board
		self.instrumentId = instrumentId
		self.status = status
		self.from = from
		self.to = to
	}
}

extension OrderListDto {
	public var csv: String {
		let fromStr: String = from == nil ? "" : "\(from!.timestampSec)"
		let toStr: String = to == nil ? "" : "\(to!.timestampSec)"
		return "\(broker)\t\(clientId)\t\(secid ?? "")\t\(board ?? "")\t\(instrumentId ?? "")\t\(status)\t\(fromStr)\t\(toStr)"
	}
}

extension OrderListDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 8,
			let broker: Int = .init(values[0]),
			let status: Int = .init(values[5])
		else {
			throw "OrderListDto CSV Decoder error."
		}

		self.init(
			broker: broker,
			clientId: values[1],
			secid: values[2] == "" ? nil : values[2],
			board: values[3] == "" ? nil : values[3],
			instrumentId: values[4] == "" ? nil : values[4],
			status: status,
			from: values[6].datetime,
			to: values[7].datetime
		)
	}
}

