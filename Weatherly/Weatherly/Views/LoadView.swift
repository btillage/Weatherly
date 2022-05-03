//
//  LoadView.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import SwiftUI

struct LoadView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
