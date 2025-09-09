//
//  TradingSessionMoexLoadDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 17.12.2024.
//

import Foundation

public struct TradingSessionMoexLoadDto {

	// MARK: Stored properties
	public let sessions: [TradingSessionDto]

	// MARK: - Init
	public init(sessions: [TradingSessionDto]) {
		self.sessions = sessions
	}
}

extension TradingSessionMoexLoadDto {
	public init(_ csv: String) throws {
		let rows: [String] = csv.components(separatedBy: "\n")
		var sessions: [TradingSessionDto] = .init()

		for row in rows {
			let values: [String] = row.components(separatedBy: ";")

			guard values.count == 6 else {
				throw "TradingSessionMoexLoadDto CSV Decoder not enough items."
			}

			// Begin
			let components1: [String] = values[0].components(separatedBy: ":")
			guard
				components1.count > 2,
				var fh: Int = .init(components1[0]),
				let fm: Int = .init(components1[1]),
				let fs: Int = .init(components1[2]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time from."
			}

			// End
			let components2: [String] = values[1].components(separatedBy: ":")
			guard
				components2.count > 2,
				var th: Int = .init(components2[0]),
				let tm: Int = .init(components2[1]),
				let ts: Int = .init(components2[2]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time to."
			}

			// TradingType
			let tradingType: TradingType? = switch values[2] {
			case "аукцион открытия":
					.preMarket
			case "торговый период":
					.trading
			case "аукцион закрытия":
					.postMarket
			default:
				nil
			}
			guard let tradingType else {
				throw "TradingSessionMoexLoadDto CSV Decoder tradingType: TradingType error."
			}

			// TradingSessionType
			let sessionType: TradingSessionType = if fh < 9 {
				.morning
			} else if fh < 19 {
				.main
			} else {
				.evening
			}

			let engine: String = switch values[3] {
			case "TQBR":
				"stock"
			case "RFUD":
				"futures"
			default:
				""
			}

			sessions.append(
				TradingSessionDto(
					id: UUID(),
					exchange: .moex,
					engine: engine,
					board: values[3],
					fh: fh,
					fm: fm,
					fs: fs,
					th: th,
					tm: tm,
					ts: ts,
					sessionType: sessionType,
					tradingType: tradingType,
					dayType: values[5],
					note: values[4]
				)
			)
		}
		self.init(sessions: sessions)
	}
}
