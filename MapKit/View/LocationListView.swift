//
//  LocationListView.swift
//  LocationMapKit
//
//  Created by Apple1 on 20/03/2023.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var vm:LocationViewModel
    var body: some View {
        List {
            ForEach(vm.locations){ Location in
                Button {
                    vm.showNextLocation(location: Location)
                } label: {
                    HStack{
                        if let image = Location.imageNames.first {
                            Image(image)
                                .resizable()
                                .frame(width: 45,height: 45)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading){
                            Text(Location.name)
                                .font(.headline)
                            Text(Location.cityName)
                                .font(.subheadline)
                        }
                    }
                    .listRowBackground(Color.clear)
                }

                
            }
        }.listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}
