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
    Text,
    StyleSheet
} from 'react-native';

import { Mapview, Geolocation, LocationManager } from '../../navite/map'

export default class ReadingList extends PureComponent {

    componentDidMount() {
        // 单次定位
        // Geolocation.fetchCurrentLocation(position => {
        // }, error => {
        // })

        // 连续定位
        this.listener = Geolocation.watchPosition(position => {
            console.log(position)
        }, error => {
            console.log(error)
        })
        Geolocation.start()
    }

    componentWillUnmount() {
        // 移除连续定位
        Geolocation.stop()
        Geolocation.clearWatch(this.listener)
    }

    render() {
        return <View style={{flex: 1}}>
            <Mapview style={StyleSheet.absoluteFill}>
            </Mapview>
        </View>;
    }
}

