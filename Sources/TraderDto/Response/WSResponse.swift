//
//  WSResponse.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.07.2024.
//

import struct Foundation.Data

/// Websocket response.
public struct WSResponse: Codable, Sendable {

	// MARK: Stored Properties
	public let title: WSTitle
	/// Unique message id, client <-> server.
	public let id: String
	public let dataType: WSDataType
	public let data: Data?

	// MARK: - Init
	public init(
		title: WSTitle,
		id: String,
		dataType: WSDataType,
		data: Data?
	) {
		self.title = title
		self.id = id
		self.dataType = dataType
		self.data = data
	}
}
