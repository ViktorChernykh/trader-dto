//
//  Attachment.swift
//  trader-dto
//
//  Created by Victor Chernykh on 05.10.2024.
//

import struct Foundation.UUID

/// Attachment model (file or image).
public struct Attachment: Sendable {

	// MARK: Stored properties
	/// Attachment ID.
	public let id: UUID

	/// File name.
	public let name: String

	/// The MIME type of the file (e.g. "image/jpeg" or "application/pdf").
	public let mimeType: String

	// MARK: - Init
	public init(
		id: UUID,
		name: String,
		mimeType: String
	) {
		self.id = id
		self.name = name
		self.mimeType = mimeType
	}
}

extension Attachment {
	public var csv: String {
		"\(id.uuidString)\t\(name)\t\(mimeType)"
	}
}

extension Attachment {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 3,
			let id: UUID = UUID(uuidString: values[0])
		else {
			throw "Attachment CSV Decoder error."
		}

		self.init(
			id: id,
			name: values[1],
			mimeType: values[2]
		)
	}
}
