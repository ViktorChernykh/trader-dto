//
//  ChatMessageStatus.swift
//  trader-dto
//
//  Created by Victor Chernykh on 04.10.2024.
//

/// The status of the message.
public enum ChatMessageStatus: Int, Codable, Sendable, CaseIterable, Identifiable {
	public var id: Int { rawValue }

	case notDelivered = 0
	case notRead = 1
	case read = 2
}
