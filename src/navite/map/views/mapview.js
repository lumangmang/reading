/**
 * reading.
 * Create by Devin on 2021/1/25.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from 'react'
import { PropTypes } from 'prop-types'
import {
    requireNativeComponent,
    ViewPropTypes,
} from 'react-native'

import { mapEventsPropType, LatLngPropType } from '../prop-types'
import Component from "./component";

const events = [
    'onLoad',
    'onClick',
    'onLongClick',
    'onDoubleClick',
    'onStatusChange',
]

type Status = {
    center?: PropTypes.object,
    overlook?: number,
    rotation?: number,
    zoomLevel?: number,
}

export default class Mapview extends Component {

    static propTypes = {
        ...ViewPropTypes,
        ...mapEventsPropType(events),
        trafficEnabled: PropTypes.bool,
        baiduHeatMapEnabled: PropTypes.bool,
        // 地图类型 `none` - 空白 `standard` - 标准 `satellite` - 卫星
        // 默认标准地图
        mapType: PropTypes.oneOf(['none', 'standard', 'satellite']),
        zoom: PropTypes.number,
        showsUserLocation: PropTypes.bool,
        scrollGesturesEnabled: PropTypes.bool,
        zoomGesturesEnabled: PropTypes.bool,
        center: LatLngPropType,
        locationData: LatLngPropType,
        userTrackingMode: PropTypes.oneOf(['normal', 'compass', 'follow']),
    }

    static defaultProps = {
        trafficEnabled: false,
        baiduHeatMapEnabled: false,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        showsUserLocation: true
    }

    nativeComponentName = 'BaiduMapView'

    setStatus(status: Status, duration?: number) {
        this.call('setStatus', [status, duration])
    }

    render() {
        const props = {
            ...this.props,
            ...this.handlers(events),
        }
        return <NativeMapView {...props}/>
    }
}

const NativeMapView = requireNativeComponent('BaiduMapView', Mapview)
