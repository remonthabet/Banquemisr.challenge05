//
//  AppEnviroment.swift
//  Banquemisr.challenge05
//
//  Created by remon on 11/09/2024.
//

import Foundation

struct AppEnvironment {

//used in build setting to deterimine which enviroment
    static var apiURL : String {

        #if DEVELOPMENT
            return Constants.DEV
        #elseif QA
            return ""
        #elseif Stage
            return ""
        #elseif PRODUCTION
            return ""
        #else
            fatalError("issue !")
        #endif
    }


}
