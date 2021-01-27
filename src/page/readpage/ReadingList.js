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

import { Mapview, Geolocation } from '../../navite/map'

export default class ReadingList extends PureComponent {

    state = {}

    // componentDidMount() {
    //     this.listener = Geolocation.watchPosition(location => {
    //         console.log(location)
    //         this.setState({
    //             location,
    //         })
    //     }, error => {
    //         console.log(error)
    //     })
    //     Geolocation.start()
    // }
    //
    // componentWillUnmount() {
    //     Geolocation.stop()
    //     Geolocation.clearWatch(this.listener)
    // }

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

