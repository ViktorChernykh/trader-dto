//
//  StopUpdateDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 16.11.2024.
//

import struct Foundation.UUID

public struct StopUpdateDto {

	// MARK: Stored properties
	public let id: UUID
	public let status: Int16

	// MARK: - Init
	public init(
		id: UUID,
		status: Int16
	) {
		self.id = id
		self.status = status
	}
}

extension StopUpdateDto {
	public var csv: String {
		"\(id.uuidString)\t\(status)"
	}
}

extension StopUpdateDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 2,
			let id: UUID = .init(uuidString: values[0]),
			let status: Int16 = .init(values[1])
		else {
			throw "StopUpdateDto csv decoder error."
		}

		self.init(
			id: id,
			status: status
		)
	}
}
