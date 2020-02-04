//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Nikolay Alexeyev on 04.02.2020.
//  Copyright © 2020 kolyosick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
//	var dateClosedRange: ClosedRange<Date> {
//		let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
//		let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
//		return min...max
//	}
	@State private var phone = ""
	@State private var email = ""
	@State private var name = ""
	@State private var birthDate = Date()
	@State private var password = ""
	
	@State private var phoneValid: Bool?
	@State private var emailValid: Bool?
	@State private var nameValid: Bool?
	@State private var passwordValid: Bool?
	
    var body: some View {
        Form {
			TextField("Телефон", text: $phone)
				.keyboardType(.phonePad)
				.background(
					phoneValid == nil ? Color.clear : phoneValid == true ? Color.green : Color.red
				)
            TextField("E-mail", text: $email)
				.keyboardType(.emailAddress)
				.background(
					emailValid == nil ? Color.clear : emailValid == true ? Color.green : Color.red
				)
			TextField("ФИО", text: $name)
				.background(
					nameValid == nil ? Color.clear : nameValid == true ? Color.green : Color.red
				)
			DatePicker("Дата рождения",
					   selection: $birthDate,
					   in: ...Date(),
					   displayedComponents: [.date])
			SecureField("Пароль", text: $password)
				.background(
					passwordValid == nil ? Color.clear : passwordValid == true ? Color.green : Color.red
				)
			Button(action: {
				self.save()
			}, label: {
				Text("Сохранить")
			})
		}
    }
	
	private func save() {
		if phone.isEmpty {
			phoneValid = false
		} else {
			phoneValid = phone.isValidPhone()
		}
		if email.isEmpty {
			emailValid = nil
		} else {
			emailValid = email.isValidEmail()
		}
		
		nameValid = !name.isEmpty
		
		if password.isEmpty {
			passwordValid = false
		} else {
			passwordValid = password.count >= 8
		}
		UIApplication.shared.windows.forEach{$0.endEditing(true)}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
