//
//  WSMessage.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.07.2024.
//

import struct Foundation.Data
import struct Foundation.UUID

/// Websocket message to Trader.
public struct WSMessage: Codable, Sendable {

	// MARK: Stored properties
	/// The ID of the message. It is used to search for the receiver.
	public var id: String
	public let module: ModuleType
	public let controller: ControllerType
	public let function: FunctionType
	/// Request data.
	public let data: Data?

	// MARK: - Init
	public init(
		id: String,
		module: ModuleType,
		controller: ControllerType,
		function: FunctionType,
		data: Data? = nil
	) {
		self.id = id
		self.module = module
		self.controller = controller
		self.function = function
		self.data = data
	}
}
