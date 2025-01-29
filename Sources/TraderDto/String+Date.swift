//
//  String+Date.swift
//	trader-dto
//
//  Created by Victor Chernykh on 02.08.2024.
//

import Foundation

public extension String {
	var datetimeMoex: Date? {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFormatter.date(from: self)
	}

	var dateMoex: Date? {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
		dateFormatter.dateFormat = "yyyy-MM-dd"
		return dateFormatter.date(from: self)
	}

	// Date UTC from string timeIntervalSince1970
	var datetime: Date? {
		guard let interval: Double = .init(self) else {
			return nil
		}
		return Date(timeIntervalSince1970: interval)
	}
}
