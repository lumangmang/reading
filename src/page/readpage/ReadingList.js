/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react';
import {
    View,
    Text
} from 'react-native';

import { Mapview, Geolocation, LocationManager } from '../../navite/map'

export default class ReadingList extends PureComponent {

    state = {}

    componentDidMount() {
        // Geolocation.fetchCurrentLocation(position => {
        //     console.log('-------------', position)
        // }, error => {
        //     console.log('=============', error)
        // })
       this.listener = Geolocation.watchPosition(position => {
            console.log(position)
        }, error => {
            console.log(error)
        })
        Geolocation.start()
    }

    render() {
        return <View style={{flex: 1}}>
            <Mapview
                style={{flex: 1}}
                minZoomLevel={5}
                maxZoomLevel={20}
                zoomLevel={15}
                // compassDisabled={false}
                // trafficEnabled={true}
                // scaleBarDisabled={false}
                // buildingsDisabled={false}
                // scrollDisabled={true}
                // center={{
                //     longitude: 117.12,
                //     latitude: 32.57,
                // }}
                // location={location.location}
                // locationEnabled
                // locationMode={"follow"}
            />
        </View>;
    }
}

