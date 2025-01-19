//
//  SecurityDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 25/03/2024.
//

import struct Foundation.Date
import class Foundation.DateFormatter
import struct Foundation.UUID

extension SecurityDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

extension SecurityDto: Equatable {
	public static func == (lhs: SecurityDto, rhs: SecurityDto) -> Bool {
		lhs.id == rhs.id // &&
	}
}

/// Response data for Security.
public struct SecurityDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: String
	/// Moex id.
	public let externalId: String
	public let type: String
	public let group: String
	public let primaryBoardId: String

	public let secid: String
	public let shortName: String
	public let regnumber: String?
	public let name: String
	public let isin: String?
	public let isTraded: Bool

	public let emitentId: Int?
	public let emitentTitle: String?
	public let emitentInn: String?
	public let emitentOkpo: String?

	/// From security model.
	public let isQualifiedInvestors: Bool?
	public let morningSession: Bool?
	public let eveningSession: Bool?
	public let typeName: String
	public let issueSize: Int?
	public let faceValue: Double?
	public let faceUnit: String?
	public let issueDate: Date
	public let latName: String
	public let listLevel: Int?

	public let historyFrom: Date?
	public let historyTill: Date?
	public let listedFrom: Date?
	public let listedTill: Date?
	public let currencyId: String?
	public let decimals: Int

	public let lotSize: Int?
	public let minStep: Double?
	public let settleDate: Date?

	// MARK: - Init
	public init(
		id: UUID = UUID(),
		exchange: String,
		externalId: String,
		type: String,
		group: String,
		primaryBoardId: String,

		secid: String,
		shortName: String,
		regnumber: String?,
		name: String,
		isin: String?,
		isTraded: Bool,

		emitentId: Int?,
		emitentTitle: String?,
		emitentInn: String?,
		emitentOkpo: String?,

		/// from security model
		isQualifiedInvestors: Bool?,
		morningSession: Bool?,
		eveningSession: Bool?,
		typeName: String,
		issueSize: Int?,
		faceValue: Double?,
		faceUnit: String?,
		issueDate: Date,
		latName: String,
		listLevel: Int?,

		historyFrom: Date?,
		historyTill: Date?,
		listedFrom: Date?,
		listedTill: Date?,
		currencyId: String?,
		decimals: Int,

		lotSize: Int?,
		minStep: Double?,
		settleDate: Date?
	) {
		self.id = id
		self.exchange = exchange
		self.externalId = externalId
		self.type = type
		self.group = group
		self.primaryBoardId = primaryBoardId

		self.secid = secid
		self.shortName = shortName
		self.regnumber = regnumber
		self.name = name
		self.isin = isin
		self.isTraded = isTraded

		self.emitentId = emitentId
		self.emitentTitle = emitentTitle
		self.emitentInn = emitentInn
		self.emitentOkpo = emitentOkpo

		self.isQualifiedInvestors = isQualifiedInvestors
		self.morningSession = morningSession
		self.eveningSession = eveningSession
		self.typeName = typeName
		self.issueSize = issueSize
		self.faceValue = faceValue
		self.faceUnit = faceUnit
		self.issueDate = issueDate
		self.latName = latName
		self.listLevel = listLevel

		self.historyFrom = historyFrom
		self.historyTill = historyTill
		self.listedFrom = listedFrom
		self.listedTill = listedTill
		self.currencyId = currencyId
		self.decimals = decimals

		self.lotSize = lotSize
		self.minStep = minStep
		self.settleDate = settleDate
	}
}
