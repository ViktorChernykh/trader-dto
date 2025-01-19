//
//  ChatMessageDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 04.10.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// Client send new message.
public struct ChatMessageDto: Sendable {

	// MARK: Stored properties
	public let id: UUID
	public let senderId: UUID
	public let receiverId: UUID
	public let text: String
	public let attachments: String
	public let status: Int
	public let createdAt: Date

	// MARK: - Init
	public init(
		id: UUID,
		senderId: UUID,
		receiverId: UUID,
		text: String,
		attachments: String,
		status: Int,
		createdAt: Date
	) {
		self.id = id
		self.senderId = senderId
		self.receiverId = receiverId
		self.text = text
		self.attachments = attachments
		self.status = status
		self.createdAt = createdAt
	}
}

extension ChatMessageDto {
	public var csv: String {
		"\(id.uuidString)\t\(senderId.uuidString)\t\(receiverId.uuidString)\t\(text.replacingOccurrences(of: "\t", with: "  "))\t\(attachments)\t\(status)\t\(createdAt.timestamp)"
	}
}

extension ChatMessageDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 7,
			let id: UUID = .init(uuidString: values[0]),
			let senderId: UUID = .init(uuidString: values[1]),
			let receiverId: UUID = .init(uuidString: values[2]),
			let status: Int = .init(values[5]),
			let createdAt: Date = values[6].datetime
		else {
			throw "ChatMessageDto CSV Decoder error."
		}

		self.init(
			id: id,
			senderId: senderId,
			receiverId: receiverId,
			text: values[3],
			attachments: values[4],
			status: status,
			createdAt: createdAt
		)
	}
}
