//
//  LIstViewItem.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import SwiftUI

struct LIstViewItem: View {
    let title : String
    
    
 
    
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){

            HStack(alignment: .firstTextBaseline){
                Text(title).font(.headline)
            }
            .frame(maxWidth:
                    .infinity,alignment:
                    .leading).padding()
                .foregroundStyle(.primary)
            
//            Divider().background(.secondary)
        }
    }
}

#Preview {
    LIstViewItem(title: "item").preferredColorScheme(.light)
}

