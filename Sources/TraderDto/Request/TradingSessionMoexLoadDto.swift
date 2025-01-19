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

			guard values.count == 5 else {
				throw "TradingSessionMoexLoadDto CSV Decoder not enough items."
			}

			// Begin
			let components1: [String] = values[0].components(separatedBy: ":")
			guard
				components1.count > 2,
				var fh: Int = .init(components1[0]),
				let fm: Int = .init(components1[1]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time from."
			}
			let comp1: [String] = components1[2].components(separatedBy: " ")
			guard
				comp1.count > 1,
				let fs: Int = .init(comp1[0]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time from."
			}
			if values[0].hasSuffix("PM") {
				fh += 12
			}

			// End
			let components2: [String] = values[1].components(separatedBy: ":")
			guard
				components2.count > 2,
				var th: Int = .init(components2[0]),
				let tm: Int = .init(components2[1]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time to."
			}
			let comp2: [String] = components2[2].components(separatedBy: " ")
			guard
				comp2.count > 1,
				let ts: Int = .init(comp2[0]) else {
				throw "TradingSessionMoexLoadDto CSV invalid time from."
			}
			if values[1].hasSuffix("PM") {
				th += 12
			}

			// TradingMode
			let tradingMode: TradingMode? = switch values[2] {
			case "аукцион открытия":
					.preMarket
			case "торговый период":
					.trading
			case "аукцион закрытия":
					.postMarket
			default:
				nil
			}
			guard let tradingMode else {
				throw "TradingSessionMoexLoadDto CSV Decoder tradingMode: TradingMode error."
			}

			// TradingSessionType
			let sessionType: TradingSessionType = if fh < 9 {
				.morning
			} else if fh < 18 {
				.main
			} else {
				.evening
			}

			sessions.append(
				TradingSessionDto(
					id: UUID(),
					exchange: .moex,
					engine: "",
					board: values[3],
					fh: fh,
					fm: fm,
					fs: fs,
					th: th,
					tm: tm,
					ts: ts,
					timeZone: 3,
					sessionType: sessionType,
					tradingMode: tradingMode,
					note: values[4]
				)
			)
		}
		self.init(sessions: sessions)
	}
}
