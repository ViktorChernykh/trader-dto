//
//  ExchangeType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 03.01.2025.
//

import Foundation

public enum ExchangeType: String, Codable, Sendable, CaseIterable, Identifiable {

	// MARK: Static properties
	public static let schema: String = "exchange_type"

	public var id: String { rawValue }

	case moex = "MOEX"
	case spb = "СПБ"
	case nise = "NISE"
	case nasdaq = "NASDAQ"
	case lse = "LSE"
	case fwb = "FWB"
	case hkse = "HKSE"
	case sgx = "SGX"
	case sse = "SSE"
	case szse = "SZSE"
	case tse = "TSE"
	case binance = "Binance"
	case huobi = "Huobi"
	case bybit = "Bybit"
	case bitget = "Bitget"
	case gateIo = "Gate.io"

	public var description: String {
		switch self {
		case .moex:
			"Moscow exchange"
		case .spb:
			"SPB exchange"
		case .nise:
			"New York Stock Exchange"
		case .nasdaq:
			"National Association of Securities Dealers Automated Quotation"
		case .lse:
			"London Stock Exchange Group"
		case .fwb:
			"Frankfurt Stock Exchange"
		case .hkse:
			"Hong Kong Stock Exchange"
		case .sgx:
			"Singapore Exchange"
		case .sse:
			"Shanghai Stock Exchange"
		case .szse:
			"Shenzhen Stock Exchange"
		case .tse:
			"Tokyo Stock Exchange"
		case .binance:
			"Binance"
		case .huobi:
			"Huobi"
		case .bybit:
			"Bybit"
		case .bitget:
			"Bitget"
		case .gateIo:
			"Gate.io"
		}
	}

	public var timeZone: TimeZone? {
		switch self {
		case .moex:
			return TimeZone(identifier: "Europe/Moscow")
		case .spb:
			return TimeZone(identifier: "Europe/Moscow")
		case .nise:
			return TimeZone(identifier: "America/New_York")
		case .nasdaq:
			return TimeZone(identifier: "America/New_York")
		case .lse:
			return TimeZone(identifier: "Europe/London")
		case .fwb:
			return TimeZone(identifier: "Europe/Berlin")
		case .hkse:
			return TimeZone(identifier: "Asia/Hong_Kong")
		case .sgx:
			return TimeZone(identifier: "Asia/Singapore")
		case .sse:
			return TimeZone(identifier: "Asia/Shanghai")
		case .szse:
			return TimeZone(identifier: "Asia/Shanghai")
		case .tse:
			return TimeZone(identifier: "Asia/Tokyo")
		case .binance:
			return TimeZone(identifier: "GMT")
		case .huobi:
			return TimeZone(identifier: "GMT")
		case .bybit:
			return TimeZone(identifier: "GMT")
		case .bitget:
			return TimeZone(identifier: "GMT")
		case .gateIo:
			return TimeZone(identifier: "GMT")
		}
	}
}
