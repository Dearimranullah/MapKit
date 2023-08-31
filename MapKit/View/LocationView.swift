//
//  LocationView.swift
//  MapKit
//
//  Created by Apple1 on 20/03/2023.
//

import SwiftUI
import MapKit
struct LocationView: View {
    @EnvironmentObject var vm:LocationViewModel
    var body: some View {
        ZStack{
        Map(
            coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapMarker(coordinate: location.coordinates , tint: .blue)
            })
//            Map(coordinateRegion: $vm.mapRegion)
//                .edgesIgnoringSafeArea(.all)
            VStack{
              header
                .padding()
                Spacer()
            }
        }.ignoresSafeArea(.all)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
extension LocationView {
    private var header:some View {
        VStack{
            Button {
                vm.toggleLoation()
            } label: {
                Text(vm.maplocation.name + "," + vm.maplocation.cityName)
                    .font(.title2)
                    .bold()
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.maplocation)
                    .overlay(alignment: .leading) {
                        Image(systemName:"arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .rotationEffect(Angle(
                                degrees: vm.showList ? 180:0))
                            .padding()
            }
// This is Development comment
           
                }
            if (vm.showList){
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}
