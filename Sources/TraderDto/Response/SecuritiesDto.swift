//
//  SecuritiesDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 24.06.2024.
//

import struct Foundation.UUID

extension SecuritiesDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(price)
	}
}

extension SecuritiesDto: Equatable {
	public static func == (lhs: SecuritiesDto, rhs: SecuritiesDto) -> Bool {
		lhs.id == rhs.id &&
		lhs.price == rhs.price
	}
}

extension SecuritiesDto: Comparable {
	public static func < (lhs: SecuritiesDto, rhs: SecuritiesDto) -> Bool {
		lhs.id.uuidString < rhs.id.uuidString &&
		lhs.exchange < rhs.exchange &&
		lhs.board < rhs.board &&
		lhs.secid < rhs.secid &&
		lhs.price ?? 0 < rhs.price ?? 0
	}
}

public struct SecuritiesDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: String
	public let board: String
	public let secid: String
	public let shortName: String
	public let isQualifiedInvestors: Bool?
	public let eveningSession: Bool?
	public let listLevel: Int?
	public let lotSize: Int?
	public let currencyId: String
	public let decimals: Int
	public let minStep: Double?
	public var price: Double?
	/// Yesterday's closing price.
	public var prevPrice: Double?
	/// Value today.
	public var valToday: Int?
	public var changePrice: Double

	// MARK: - Init
	public init(
		id: UUID = .init(),
		exchange: String = "MOEX",
		board: String = "TQBR",
		secid: String = "ABIO",
		shortName: String = "Артген",
		isQualifiedInvestors: Bool? = false,
		eveningSession: Bool? = true,
		listLevel: Int? = 1,
		lotSize: Int? = 1,
		currencyId: String = "RUR",
		decimals: Int = 2,
		minStep: Double? = 0.1,
		price: Double? = nil,
		prevPrice: Double? = nil,
		valToday: Int? = nil,
		changePrice: Double = 0.0
	) {
		self.id = id
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.shortName = shortName
		self.isQualifiedInvestors = isQualifiedInvestors
		self.eveningSession = eveningSession
		self.listLevel = listLevel
		self.currencyId = currencyId
		self.decimals = decimals
		self.minStep = minStep
		self.lotSize = lotSize
		self.price = price
		self.prevPrice = prevPrice
		self.valToday = valToday
		self.changePrice = changePrice
	}

	/// Custom initializer for decoding
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(UUID.self, forKey: .id)
		exchange = try container.decode(String.self, forKey: .exchange)
		board = try container.decode(String.self, forKey: .board)
		secid = try container.decode(String.self, forKey: .secid)
		shortName = try container.decode(String.self, forKey: .shortName)
		isQualifiedInvestors = try container.decodeIfPresent(Bool.self, forKey: .isQualifiedInvestors)
		eveningSession = try container.decodeIfPresent(Bool.self, forKey: .eveningSession)
		listLevel = try container.decodeIfPresent(Int.self, forKey: .listLevel)
		lotSize = try container.decodeIfPresent(Int.self, forKey: .lotSize)
		currencyId = try container.decode(String.self, forKey: .currencyId)
		decimals = try container.decode(Int.self, forKey: .decimals)
		minStep = try container.decodeIfPresent(Double.self, forKey: .minStep)
		price = try container.decodeIfPresent(Double.self, forKey: .price)
		prevPrice = try container.decodeIfPresent(Double.self, forKey: .prevPrice)
		valToday = try container.decodeIfPresent(Int.self, forKey: .valToday)
		changePrice = try container.decodeIfPresent(Double.self, forKey: .changePrice) ?? 0.0
	}

	/// Coding keys for decoding
	private enum CodingKeys: String, CodingKey {
		case id
		case exchange
		case board
		case secid
		case shortName
		case isQualifiedInvestors
		case eveningSession
		case listLevel
		case lotSize
		case currencyId
		case decimals
		case minStep
		case price
		case prevPrice
		case valToday
		case changePrice
	}
}

extension SecuritiesDto {
	public var csv: String {
		let _listLevel: String = listLevel == nil ? "" : "\(listLevel!)"
		let _lotSize: String = lotSize == nil ? "" : "\(lotSize!)"
		let _minStep: String = minStep == nil ? "" : "\(minStep!)"

		return "\(id.uuidString)\t\(exchange)\t\(board)\t\(secid)\t\(shortName)\t\(convertBool(isQualifiedInvestors))\t\(convertBool(eveningSession))\t\(_listLevel )\t\(_lotSize)\t\(currencyId)\t\(decimals)\t\(_minStep)"
	}

	func convertBool(_ value: Bool?) -> String {
		guard let value else {
			return ""
		}
		return value ? "1" : "0"
	}
}

extension SecuritiesDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 12,
			let id: UUID = UUID(uuidString: values[0]),
			let decimals: Int = .init(values[10])
		else {
			throw "SecuritiesDto CSV Decoder error."
		}

		self.init(
			id: id,
			exchange: values[1],
			board: values[2],
			secid: values[3],
			shortName: values[4],
			isQualifiedInvestors: values[5] == "" ? nil : values[5] == "1",
			eveningSession: values[6] == "" ? nil : values[6] == "1",
			listLevel: Int(values[7]),
			lotSize: Int(values[8]),
			currencyId: values[9],
			decimals: decimals,
			minStep: Double(values[11])
		)
	}
}

