//
//  ChatRequestDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 06.10.2024.
//

import struct Foundation.UUID
import struct Foundation.Date

/// Chat list request.
public struct ChatRequestDto: Sendable {

	// MARK: Stored properties
	public let userId: UUID
	/// Get chat from time.
	public let date: Date

	// MARK: - Init
	public init(
		userId: UUID,
		date: Date
	) {
		self.userId = userId
		self.date = date
	}
}

extension ChatRequestDto {
	public var csv: String {
		"\(userId.uuidString)\t\(date.timestamp)"
	}
}

extension ChatRequestDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard values.count == 2,
			let userId: UUID = .init(uuidString: values[0]),
			let date: Date = values[1].datetime
		else {
			throw "ChatRequestDto csv decoder error."
		}

		self.init(
			userId: userId,
			date: date
		)
	}
}
