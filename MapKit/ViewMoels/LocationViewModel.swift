//
//  LocationViewModel.swift
//  MapKit
//
//  Created by Apple1 on 20/03/2023.
//

import Foundation
import MapKit
import SwiftUI 
class LocationViewModel:ObservableObject {
//     All loaded Location
    @Published var locations:[Location]
//    Current Location On Map
    @Published var maplocation:Location {
        didSet {
            updateRegion(location: maplocation)
        }
    }
    @Published var mapRegion:MKCoordinateRegion=MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//     Show list of Location
    @Published var showList:Bool=false
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.maplocation=locations.first!
        self.updateRegion(location: locations.first!)
    }
    func updateRegion(location:Location) {
        withAnimation (.easeInOut){
            mapRegion=MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
     func toggleLoation(){
        withAnimation (.easeInOut){
            showList = !showList
        }
    }
    func showNextLocation(location:Location){
        maplocation=location
        showList=false
    }
}
