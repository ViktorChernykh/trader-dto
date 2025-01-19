//
//  ExchangeType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 03.01.2025.
//

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
	case sse = "SSE"
	case szse = "SZSE"
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
		case .sse:
			"Shanghai Stock Exchange"
		case .szse:
			"Shenzhen Stock Exchange"
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

	public var timeZone: Int {
		switch self {
		case .moex:
			3
		case .spb:
			3
		case .nise:
			-5
		case .nasdaq:
			-5
		case .lse:
			0
		case .fwb:
			1
		case .hkse:
			8
		case .sse:
			8
		case .szse:
			8
		case .binance:
			0
		case .huobi:
			0
		case .bybit:
			0
		case .bitget:
			0
		case .gateIo:
			0
		}
	}
}
