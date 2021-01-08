/**
 * reading.
 * Create by Devin on 2021/1/8.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from 'react';
import {
    ViewPropTypes,
    requireNativeComponent,
} from 'react-native';
import PropTypes from 'prop-types'
import {mapEventsPropType, LocationPropType, LatLngPropType} from "../prop-types";
import {Point, Location, LatLng, MapStatus, Region} from "../types";
import Component from "../component";

type Status = {
    center?: LatLng,
    point?: Point,
    region?: Region,
    overlook?: number,
    rotation?: number,
    zoomLevel?: number,
}

type Props = {
    satellite?: boolean,
    trafficEnabled?: boolean,
    baiduHeatMapEnabled?: boolean,
    indoorEnabled?: boolean,
    buildingsDisabled?: boolean,
    minZoomLevel?: number,
    maxZoomLevel?: number,
    compassDisabled?: boolean,
    zoomControlsDisabled?: boolean,
    scaleBarDisabled?: boolean,
    scrollDisabled?: boolean,
    overlookDisabled?: boolean,
    rotateDisabled?: boolean,
    zoomDisabled?: boolean,
    center?: LatLng,
    zoomLevel?: number,
    rotation?: number,
    overlook?: number,
    paused?: boolean,
    locationEnabled?: boolean,
    location?: Location,
    locationMode?: 'normal' | 'follow' | 'compass',
    compassMode?: true,
    onLoad?: () => {},
    onClick?: LatLng => {},
    onLongClick?: LatLng => {},
    onDoubleClick?: LatLng => {},
    onStatusChange?: MapStatus => {},
} & ViewPropTypes

const events = [
    'onLoad',
    'onClick',
    'onLongClick',
    'onDoubleClick',
    'onStatusChange',
]

export default class MapView extends Component<Props> {

    static propTypes = {
        ...ViewPropTypes,
        ...mapEventsPropType(events),
        satellite: PropTypes.bool,
        trafficEnabled: PropTypes.bool,
        baiduHeatMapEnabled: PropTypes.bool,
        indoorEnabled: PropTypes.bool,
        buildingsDisabled: PropTypes.bool,
        minZoomLevel: PropTypes.number,
        maxZoomLevel: PropTypes.number,
        compassDisabled: PropTypes.bool,
        zoomControlsDisabled: PropTypes.bool,
        scaleBarDisabled: PropTypes.bool,
        scrollDisabled: PropTypes.bool,
        overlookDisabled: PropTypes.bool,
        rotateDisabled: PropTypes.bool,
        zoomDisabled: PropTypes.bool,
        center: LatLngPropType,
        zoomLevel: PropTypes.number,
        rotation: PropTypes.number,
        overlook: PropTypes.number,
        locationEnabled: PropTypes.bool,
        location: LocationPropType,
        locationMode: PropTypes.string,
    }

    setStatus(status: Status, duration?: number) {
        this.call('setStatus', [status, duration]);
    }

    nativeComponentName = 'BaiduMapView'
    render() {
        const props = {
            ...this.props,
            ...this.handlers(events)
        }
        return <BaiduMapView {...props}/>
    }
}

const BaiduMapView = requireNativeComponent('BaiduMapView', MapView);
