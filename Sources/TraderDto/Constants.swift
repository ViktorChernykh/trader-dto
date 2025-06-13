//
//  Constants.swift
//  trader-dto
//
//  Created by Victor Chernykh on 25.05.2025.
//

import Foundation

enum Constants {
	@inline(__always)
	static let moexDatetimeFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		// "en_US_POSIX" guarantees the format's independence from user settings
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFormatter
	}()

	@inline(__always)
	static let moexDateFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		// "en_US_POSIX" guarantees the format's independence from user settings
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.dateFormat = "yyyy-MM-dd"
		return dateFormatter
	}()

	@inline(__always)
	static let moscowDatetimeFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		// Formatting is independent of user settings thanks to "en_US_POSIX"
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")!
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZZ"
		return dateFormatter
	}()

	@inline(__always)
	static let moexMinuteDateFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.dateFormat = "mm"
		return dateFormatter
	}()

	@inline(__always)
	static let moexDayDateFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.dateFormat = "dd"
		return dateFormatter
	}()

	@inline(__always)
	static let moexMonthDateFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.dateFormat = "MMMM"
		return dateFormatter
	}()

	@inline(__always)
	static let moexYearDateFormatter: DateFormatter = {
		let dateFormatter: DateFormatter = .init()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
		dateFormatter.dateFormat = "yyyy"
		return dateFormatter
	}()
}
