/**
 * reading.
 * Create by Devin on 2021/1/25.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react'
import { PropTypes } from 'prop-types'
import {
    requireNativeComponent,
    ViewPropTypes,
} from 'react-native'

import { MapTypes } from "../prop-types";

export default class Mapview extends PureComponent {

    static propTypes = {
        ...ViewPropTypes,
        trafficEnabled: PropTypes.bool,
        baiduHeatMapEnabled: PropTypes.bool,
        mapType: PropTypes.number,
        zoom: PropTypes.number,
        showsUserLocation: PropTypes.bool,
        scrollGesturesEnabled: PropTypes.bool,
        zoomGesturesEnabled: PropTypes.bool,
        center: PropTypes.object,
        locationData: PropTypes.object,
        onMapStatusChange: PropTypes.func,
        onMapLoaded: PropTypes.func,
        onMapClick: PropTypes.func,
        onMapDoubleClick: PropTypes.func,
        onMarkerClick: PropTypes.func,
        onMapPoiClick: PropTypes.func,
    }

    static defaultProps = {
        trafficEnabled: false,
        baiduHeatMapEnabled: false,
        mapType: MapTypes.NORMAL,
        center: null,
        zoom: 10,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        showsUserLocation: false
    }

    _onChange(event) {
        if (typeof this.props[event.nativeEvent.type] === 'function') {
            this.props[event.nativeEvent.type](event.nativeEvent.params);
        }
    }

    render() {
        return <NativeMapView {...this.props} onChange={this._onChange.bind(this)}/>
    }
}

const NativeMapView = requireNativeComponent('BaiduMapView', Mapview, {
    nativeOnly: {onChange: true}
})
