//
//  PaginateDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 09.06.2024.
//

public struct PaginateDto: Codable, Sendable {

	// MARK: Stored properties
	public let page: Int?
	public let per: Int?

	// MARK: - Init
	public init(
		page: Int?,
		per: Int?
	) {
		self.page = page
		self.per = per
	}
}
