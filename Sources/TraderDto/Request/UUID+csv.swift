//
//  UUID+csv.swift
//	trader-dto
//
//  Created by Victor Chernykh on 26.08.2024.
//

import struct Foundation.UUID

extension UUID {
	public var csv: String {
		self.uuidString
	}

	public init?(_ csv: String) {
		guard let id: UUID = UUID(uuidString: csv) else {
			return nil
		}
		self = id
	}
}
