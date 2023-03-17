//
//  HealthModel.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import Foundation

struct HealthModel{
    let title: String
    let image: String
    let url: String
}

extension HealthModel {
    static func getMock() -> [HealthModel]{
        return  [
            HealthModel(title: "Certified Professional in Healthcare Quality (CPHQ)", image: "CPHQ_Seal_Logo_GOLD-copy-removebg-preview", url: "https://nahq.org/products/cphq-review-course-online/"),
            HealthModel(title: "Certified Healthcare Facility Manager (CHFM)", image: "647927bc-b2bd-49eb-a2db-8424fdee66df-151215125404-thumbnail-removebg-preview", url: "https://www.ashe.org/chfm"),
            HealthModel(title: "Certified in Public Health (CPH)", image: "NBPHE_500x500 (1)", url: "https://www.nbphe.org/apply-now/"),
            HealthModel(title: "Medical Technologist (MT)", image: "mt_badge_logo_medical_technologist_laboratory_classic_round_sticker-ra924e3e114b94c39873b47b6d4e712a2_0ugmp_8byvr_736-removebg-preview", url: "https://www.medicaltechnologyschools.com/medical-lab-technician/medical-technologist-amt-certification"),
            HealthModel(title: "Certified Clinical Research Associate(CCRA)", image: "CCRA", url: "https://acrpnet.org/certifications/cra-certification/")
        ]
        
    }
}
