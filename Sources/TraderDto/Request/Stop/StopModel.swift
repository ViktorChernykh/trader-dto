//
//  StopModel.swift
//  trader-dto
//
//  Created by Victor Chernykh on 17.10.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// StopModel. (Codable - decoded from the database).
public struct StopModel: Codable, Sendable, Identifiable {
	// 39 properties
	// MARK: Stored properties
	/// Unique ID in Trader database.
	public var id: UUID = .init()

	/// Time of order registration on the server in UTC.
	/// Время, когда заявка была зарегистрирована на сервере. В UTC.
	public var acceptedAt: Date = .init()

	/// Security Board.
	/// Основной режим торгов инструмента.
	public var board: String = .init()

	public var broker: Int16 = 0				// BrokerType

	/// Transaction direction.
	/// Направление сделки.
	public var buySell: Int16 = 0				// BuySell

	/// Time of order canceled on the server in UTC.
	/// Время, когда заявка была отменена на сервере. В UTC.
	public var canceledAt: Date = .init()

	/// Trade Account ID.
	/// Идентификатор торгового счёта.
	public var clientId: String = .init()

	/// Price currency.
	/// Валюта цены.
	public var currency: String = .init()

	/// Expiration date for FORTS order.
	/// Дата экспирации заявки FORTS.
	public var expirationDate: Date = .init()

	/// Linked order ID.
	/// Биржевой номер связанной (активной) заявки.
	public var linkOrder: Int = 0

	/// Market.
	/// Рынок.
	public var market: Int16 = 0				// MarketType

	/// Rejection reason or conditional order resolution.
	/// Причина отказа или вердикт по условной заявке.
	public var message: String = .init()

	/// Order No.
	/// Номер заявки, полученной в результате исполнения стопа.
	public var orderNo: Int = 0

	/// Security Code.
	/// Тикер инструмента.
	public var secid: String = .init()

	/// Order status.
	/// Состояние заявки.
	public var status: Int16 = 0				// StopStatus

	/// Stop Order Id.
	/// Идентификатор стоп-заявки.
	public var stopId: Int = 0

	/// Take profit: local extremum.
	/// Тейк профит: текущий локальный экстремум.
	public var takeProfitExtremum: Double = 0

	/// Take profit: current correction level.
	/// Тейк профит: текущий уровень коррекции.
	public var takeProfitLevel: Double = 0

	/// Trade No.
	/// Номер сделки, которая привела к исполнению стопа.
	public var tradeNo: Int = 0

	/// User id in Trader database.
	public var userId: UUID = .init()

	/// Order valid till date.
	public var validBeforeTime: Date = .init()
	/// Type of order's lifetime.
	public var validBeforeType: Int16 = 0		// OrderValidBefore Type = .unspecified

	/// Stop loss.		- - - - - - - - - - - - - - -

	/// Activation price.
	/// Цена активации.
	public var stopActivationPrice: Double = 0

	/// Market price.
	/// По рынку.
	public var stopIsMarket: Bool = false

	/// Order price.
	/// Цена заявки.
	public var stopPrice: Double = 0

	public var stopQuantityUnits: Int16 = 0		// StopQuantityUnits = .unspecified

	/// Quantity.
	/// Количество.
	public var stopQuantityValue: Double = 0

	/// Time, seconds.
	/// Защитное время, сек.
	public var stopTime: Int = 0

	/// Use credit.
	/// Использовать кредит.
	public var stopUseCredit: Bool = false

	/// Take profit.			- - - - - - - - - - - - - - -

	/// Activation price.
	/// Цена активации.
	public var takeActivationPrice: Double = 0

	/// Units.
	/// Единицы цены.
	public var takeCorrectionPriceUnits: Int16 = 0// StopPriceUnits = .unspecified

	/// Correction.
	/// Коррекция.
	public var takeCorrectionPriceValue: Double = 0

	/// Market price.
	/// По рынку.
	public var takeIsMarket: Bool = false

	public var takeQuantityUnits: Int16 = 0		// StopQuantityUnits = .unspecified

	/// Quantity.
	/// Количество.
	public var takeQuantityValue: Double = 0

	public var takeSpreadPriceUnits: Int16 = 0	// StopPriceUnits

	/// Spread price.
	/// Защитный спред.
	public var takeSpreadPriceValue: Double = 0

	/// Time, seconds.
	/// Защитное время, сек.
	public var takeTime: Int = 0

	/// Use credit.
	/// Использовать кредит.
	public var takeUseCredit: Bool = false

	// MARK: - Init
	public init() { }
}

extension StopModel: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(board)
		hasher.combine(secid)
		hasher.combine(status)
		hasher.combine(stopActivationPrice)
		hasher.combine(takeActivationPrice)
	}
}

extension StopModel {
	public var csv: String {
		"\(id.uuidString)\t\(acceptedAt.timestamp)\t\(board)\t\(broker)\t\(buySell)\t\(canceledAt.timestamp)\t\(clientId)\t\(currency)\t\(expirationDate.timestamp)\t\(linkOrder)\t\(market)\t\(message)\t\(orderNo)\t\(secid)\t\(status)\t\(stopId)\t\(takeProfitExtremum)\t\(takeProfitLevel)\t\(tradeNo)\t\(userId.uuidString)\t\(validBeforeTime.timestamp)\t\(validBeforeType)\t\(stopActivationPrice)\t\(stopIsMarket ? "1" : "")\t\(stopPrice)\t\(stopQuantityUnits)\t\(stopQuantityValue)\t\(stopTime)\t\(stopUseCredit ? "1" : "")\t\(takeActivationPrice)\t\(takeCorrectionPriceUnits)\t\(takeCorrectionPriceValue)\t\(takeIsMarket ? "1" : "")\t\(takeQuantityUnits)\t\(takeQuantityValue)\t\(takeSpreadPriceUnits)\t\(takeSpreadPriceValue)\t\(takeTime)\t\(takeUseCredit ? "1" : "")"
	}
}

extension StopModel {
	public init(_ csv: String) throws {
		let items: [String] = csv.components(separatedBy: "\t")

		guard items.count == 39 else {
			throw "StopModel csv decoder error. Items count != 39"
		}

		guard
			let id: UUID = .init(uuidString: items[0]),
			let acceptedAt: Date = items[1].datetime,
			let broker: Int16 = .init(items[3]),
			let buySell: Int16 = .init(items[4]),
			let canceledAt: Date = items[5].datetime,
			let expirationDate: Date = items[8].datetime,
			let linkOrder: Int = .init(items[9]),
			let market: Int16 = .init(items[10]),
			let orderNo: Int = .init(items[12]),
			let status: Int16 = .init(items[14]),
			let stopId: Int = .init(items[15]),
			let takeProfitExtremum: Double = .init(items[16]),
			let takeProfitLevel: Double = .init(items[17]),
			let tradeNo: Int = .init(items[18]),
			let userId: UUID = .init(uuidString: items[19]),
			let validBeforeTime: Date = items[20].datetime,
			let validBeforeType: Int16 = .init(items[21]),

			let stopActivationPrice: Double = .init(items[22]),
			let stopPrice: Double = .init(items[24]),
			let stopQuantityUnits: Int16 = .init(items[25]),
			let stopQuantityValue: Double = .init(items[26]),
			let stopTime: Int = .init(items[27]),

			let takeActivationPrice: Double = .init(items[29]),
			let takeCorrectionPriceUnits: Int16 = .init(items[30]),
			let takeCorrectionPriceValue: Double = .init(items[31]),
			let takeQuantityUnits: Int16 = .init(items[33]),
			let takeQuantityValue: Double = .init(items[34]),
			let takeSpreadPriceUnits: Int16 = .init(items[35]),
			let takeSpreadPriceValue: Double = .init(items[36]),
			let takeTime: Int = .init(items[37])
		else {
			throw "OrderModel csv decoder error."
		}

		self.init()
		self.id = id								// 0
		self.acceptedAt = acceptedAt
		self.board = items[2]
		self.broker = broker
		self.buySell = buySell
		self.canceledAt = canceledAt
		self.clientId = items[6]
		self.currency = items[7]
		self.expirationDate = expirationDate
		self.linkOrder = linkOrder
		self.market = market						// 10
		self.message = items[11]
		self.orderNo = orderNo
		self.secid = items[13]
		self.status = status
		self.stopId = stopId						// 15
		self.takeProfitExtremum = takeProfitExtremum
		self.takeProfitLevel = takeProfitLevel
		self.tradeNo = tradeNo
		self.userId = userId
		self.validBeforeTime = validBeforeTime		// 20
		self.validBeforeType = validBeforeType

		self.stopActivationPrice = stopActivationPrice
		self.stopIsMarket = items[23] == "1"
		self.stopPrice = stopPrice
		self.stopQuantityUnits = stopQuantityUnits	// 25
		self.stopQuantityValue = stopQuantityValue
		self.stopTime = stopTime
		self.stopUseCredit = items[28] == "1"

		self.takeActivationPrice = takeActivationPrice
		self.takeCorrectionPriceUnits = takeCorrectionPriceUnits	// 30
		self.takeCorrectionPriceValue = takeCorrectionPriceValue
		self.takeIsMarket = items[32] == "1"
		self.takeQuantityUnits = takeQuantityUnits
		self.takeQuantityValue = takeQuantityValue
		self.takeSpreadPriceUnits = takeSpreadPriceUnits	// 35
		self.takeSpreadPriceValue = takeSpreadPriceValue
		self.takeTime = takeTime
		self.takeUseCredit = items[38] == "1"
	}
}

