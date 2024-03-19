//
//  SecuritiesUpdateDto.swift
//
//
//  Created by Victor Chernykh on 23/02/2024.
//

/// 
public struct SecuritiesUpdateDto: Codable {
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
