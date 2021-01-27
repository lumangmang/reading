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
import { requireNativeComponent, ViewPropTypes } from 'react-native'

import { mapEventsPropType, LatLngPropType, LocationPropType } from '../prop-types'
import Component from "../component";

const events = [
    'onLoad',
    'onClick',
    'onLongClick',
    'onDoubleClick',
    'onStatusChange',
]

type Status = {
    overlook?: number,
    rotation?: number,
    zoomLevel?: number,
}

export default class Mapview extends Component {

    static propTypes = {
        ...ViewPropTypes,
        ...mapEventsPropType(events),
        // 卫星地图/标准地图
        satellite: PropTypes.bool,
        // 是否禁用路况
        trafficEnabled: PropTypes.bool,
        // 是否禁用城市热力图图层
        baiduHeatMapEnabled: PropTypes.bool,
        // 是否现禁用3D楼块效果
        buildingsDisabled: PropTypes.bool,
        // 地图比例尺级别，在手机上当前可使用的级别为4-21级
        zoomLevel: PropTypes.number,
        // 最大、最小比例尺级别
        minZoomLevel: PropTypes.number,
        maxZoomLevel: PropTypes.number,
        // 是否禁用指南针
        compassDisabled: PropTypes.bool,
        // 是否禁用比例尺 默认true
        scaleBarDisabled: PropTypes.bool,
        // 是否禁用用户移动地图 默认false
        scrollDisabled: PropTypes.bool,
        // 是否禁用地图俯仰角
        overlookDisabled: PropTypes.bool,
        // 是否禁用地图View旋转
        rotateDisabled: PropTypes.bool,
        // 是否禁用地图View支持用户多点缩放(双指)
        zoomDisabled: PropTypes.bool,
        // 地图中心点经纬度
        center: LatLngPropType,
        // 地图旋转角度，在手机上当前可使用的范围为－180～180度
        rotation: PropTypes.number,
        // 俯视角度:[-79~0]
        overlook: PropTypes.number,
        // 是否显示定位图层
        locationEnabled: PropTypes.bool,
        // 用户位置信息
        location: PropTypes.object,
        // 定位模式
        locationMode: PropTypes.string,
        // 暂停用户跟踪
        paused: PropTypes.bool,
    }

    nativeComponentName = 'BaiduMapView'

    setStatus(status: Status, duration?: number) {
        this.call('setStatus', [status, duration])
    }

    render() {
        const props = {
            ...this.props,
            ...this.handlers(events)
        }
        return <NativeMapView {...props} />
    }
}

const NativeMapView = requireNativeComponent('BaiduMapView', Mapview)
