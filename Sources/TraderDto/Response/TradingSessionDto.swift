//
//  TradingSessionDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 17.12.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

public struct TradingSessionDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: ExchangeType
	public let engine: String
	public let board: String
	/// from hour
	public let fh: Int
	/// from minute
	public let fm: Int
	/// from second
	public let fs: Int
	/// to hour
	public let th: Int
	/// to minute
	public let tm: Int
	/// to second
	public let ts: Int
	public let sessionType: TradingSessionType
	public let tradingMode: TradingMode
	public let dayType: String
	public let note: String

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		board: String,
		fh: Int,
		fm: Int,
		fs: Int,
		th: Int,
		tm: Int,
		ts: Int,
		sessionType: TradingSessionType,
		tradingMode: TradingMode,
		dayType: String,
		note: String
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.board = board
		self.fh = fh
		self.fm = fm
		self.fs = fs
		self.th = th
		self.tm = tm
		self.ts = ts
		self.sessionType = sessionType
		self.tradingMode = tradingMode
		self.dayType = dayType
		self.note = note
	}
}
