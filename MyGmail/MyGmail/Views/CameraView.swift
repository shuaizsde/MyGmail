//
//  Camera View.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        //TODO: Now it's just a image
        Image("cameraView")
            .resizable()
            .scaledToFill()
            .frame(
                width: 250,
                height: 350
            )
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
