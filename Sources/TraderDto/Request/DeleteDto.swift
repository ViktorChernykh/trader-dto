//
//  DeleteDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 26.08.2024.
//

import struct Foundation.UUID

/// Object for delete lines.
public struct DeleteDto: Codable, Sendable {

	// MARK: Stored properties
	public let ids: [UUID]

	// MARK: - Init
	public init(ids: [UUID]) {
		self.ids = ids
	}
}

extension DeleteDto {
	public var csv: String {
		"\(ids.map { $0.uuidString }.joined(separator: "\t"))"
	}

	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		self.init(
			ids: values.compactMap { UUID(uuidString: $0) }
		)
	}
}
