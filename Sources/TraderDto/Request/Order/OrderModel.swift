//
//  OrderModel.swift
//  trader-dto
//
//  Created by Victor Chernykh on 10.10.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// OrderModel. (Codable - decoded from the database).
public struct OrderModel: Codable, Sendable, Identifiable {
	// 26 properties
	// MARK: Stored properties
	/// Unique ID in Trader database.
	public var id: UUID = .init()
	/// Residual volume in lots. Не исполненный остаток, в лотах.
	public var balance: Int = 0
	/// Security Board.
	public var board: String = .init()
	/// Broker type.
	public var broker: Int16 = 0		// BrokerType
	/// Order No. Appear only when an order is placed in OrderBook.
	/// Transaction direction.
	public var buySell: Int16 = 0		// OrderDirection
	/// Trade Account ID.
	public var clientId: String = .init()
	/// Conditional order properties. Параметры условной заявки.
	public var condition: Int16 = 0		// OrderConditionType
	public var conditionPrice: Double = 0
	/// Price currency.
	public var currency: String = .init()
	/// Order by market / limit.
	public var isMarket: Bool = false
	/// Market.
	public var market: Int16 = 0		// MarketType
	/// Rejection reason or conditional order resolution. Причина отказа или вердикт по условной заявке.
	public var message: String = .init()
	/// Order No. Appear only when an order is placed in OrderBook.
	public var orderNo: Int = 0
	/// The behaviour of the application when placed in OrderBook. Used in Finam api.
	public var property: Int16 = 0		// OrderPropertyType
	/// Volume in lots.
	public var quantity: Int = 0
	/// Security Code.
	public var secid: String = .init()
	/// Order status.
	public var status: Int16  = 0		// OrderStatusType
	/// Transaction Id . Assigned when a command for new order creation is sent.
	public var transactionId: Int = 0
	/// Lot price.
	public var units: Int = 0
	public var nano: Int32 = 0
	/// Use credit. Not available in derivative market.
	/// Использовать кредит. Недоступно для срочного рынка.
	public var useCredit: Bool = false
	/// User id in Trader server.
	public var userId: UUID = .init()
	/// Type of order's lifetime.
	public var validBefore: Int16 = 0	// OrderValidBeforeType
	/// Order valid till date.
	public var validBeforeTime: Date = .init()
	/// Time of order registration on the server in UTC.
	public var acceptedAt: Date = .init()
	/// Time of Order placement in UTC.
	public var createdAt: Date = .init()

	// MARK: - Init
	public init() { }
}

extension OrderModel: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(board)
		hasher.combine(secid)
		hasher.combine(balance)
		hasher.combine(status)
		hasher.combine(units)
		hasher.combine(nano)
	}
}

extension OrderModel {
	public var csv: String {
		"\(id.uuidString)\t\(balance)\t\(board)\t\(broker)\t\(buySell)\t\(clientId)\t\(condition)\t\(conditionPrice)\t\(currency)\t\(isMarket ? "1" : "")\t\(market)\t\(message)\t\(orderNo)\t\(property)\t\(quantity)\t\(secid)\t\(status)\t\(transactionId)\t\(units)\t\(nano)\t\(useCredit ? "1" : "")\t\(userId.uuidString)\t\(validBefore)\t\(validBeforeTime.timestamp)\t\(acceptedAt.timestamp)\t\(createdAt.timestamp)"
	}
}

extension OrderModel {
	public init(_ csv: String) throws {
		let items: [String] = csv.components(separatedBy: "\t")

		guard items.count == 26 else {
			throw "OrderModel csv decoder error. Items count != 26"
		}

		guard
			let id: UUID = .init(uuidString: items[0]),
			let balance: Int = .init(items[1]),
			let broker: Int16 = .init(items[3]),
			let buySell: Int16 = .init(items[4]),
			let condition: Int16 = .init(items[6]),
			let conditionPrice: Double = .init(items[7]),
			let market: Int16 = .init(items[10]),
			let orderNo: Int = .init(items[12]),
			let property: Int16 = .init(items[13]),
			let quantity: Int = .init(items[14]),
			let status: Int16 = .init(items[16]),
			let transactionId: Int = .init(items[17]),
			let units: Int = .init(items[18]),
			let nano: Int32 = .init(items[19]),
			let userId: UUID = .init(uuidString: items[21]),
			let validBefore: Int16 = .init(items[22]),
			let validBeforeTime: Date = items[23].datetime,
			let acceptedAt: Date = items[24].datetime,
			let createdAt: Date = items[25].datetime
		else {
			throw "OrderModel csv decoder error."
		}

		self.init()
		self.id = id
		self.balance = balance
		self.board = items[2]
		self.broker = broker
		self.buySell = buySell
		self.clientId = items[5]
		self.condition = condition
		self.conditionPrice = conditionPrice
		self.currency = items[8]
		self.isMarket = items[9] == "1"
		self.market = market
		self.message = items[11]
		self.orderNo = orderNo
		self.property = property
		self.quantity = quantity
		self.secid = items[15]
		self.status = status
		self.transactionId = transactionId
		self.units = units
		self.nano = nano
		self.useCredit = items[20] == "1"
		self.userId = userId
		self.validBefore = validBefore
		self.validBeforeTime = validBeforeTime
		self.acceptedAt = acceptedAt
		self.createdAt = createdAt
	}
}

