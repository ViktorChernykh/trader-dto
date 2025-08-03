//
//  WSResponse.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.07.2024.
//

import struct Foundation.Data
import struct Foundation.UUID

/// Websocket response.
public struct WSResponse: Codable, Sendable {

	// MARK: Stored Properties
	/// Unique client's subscriptionId, client <-> server.
	public let id: String
	public let data: Data?

	// MARK: - Init
	public init(
		id: String,
		data: Data?
	) {
		self.id = id
		self.data = data
	}
}
