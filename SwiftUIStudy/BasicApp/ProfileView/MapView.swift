//
//  MapView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI
import MapKit
//    37.517268    126.721514 갈산역 lat lng

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.517268, longitude: 126.721514),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
