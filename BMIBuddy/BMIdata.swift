//
//  data.swift
//  BMIBuddy
//
//  Created by Vanessa on 02/05/24.
//

import Foundation
import SwiftData

@Model
class BMIdata: Identifiable {
    var id: UUID
    var timestamp: Date // Tambahkan properti untuk menyimpan timestamp
    var bmrResult: Double
    var bmiResult: String
    var idealWeight: String
    var bmiDescriptionValue: String
    var selectedOption: String?
    var gender: String
    

    init(id: UUID = UUID(), timestamp: Date = Date(), bmrResult: Double, bmiResult: String, idealWeight: String, bmiDescriptionValue: String, selectedOption: String?, gender: String) {
        self.id = id
        self.timestamp = timestamp // Inisialisasi timestamp dengan waktu saat ini
        self.bmrResult = bmrResult
        self.bmiResult = bmiResult
        self.idealWeight = idealWeight
        self.bmiDescriptionValue = bmiDescriptionValue
        self.selectedOption = selectedOption
        self.gender = gender
    }
}

//    func resetData() {
//            self.bmrResult = 0.0
//            self.bmiResult = ""
//            self.idealWeight = ""
//            self.bmiDescriptionValue = ""
//            self.selectedOption = nil
//            self.gender = ""
//        }
