//
//  WeathView.swift
//  weath
//
//  Created by Cesar Ferreira Tavares Neto on 20/01/26.
//

import SwiftUI

struct WeathView: View {
    @StateObject private var viewModel = WeathViewModel()

    var body: some View {
        NavigationView {
            
            // Create search component,
            viewModel.lo
            
            
            if (viewModel.isLoading) // put circular progress
            
                if(viewModel.errorMessage)
                
                if(viewModel.city)
        }
    }
}
