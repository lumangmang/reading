/**
 * reading.
 * Create by Devin on 2021/2/6.
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
    findNodeHandle,
    UIManager,
    ColorPropType,
} from 'react-native'

import { LatLngPropType } from './prop-types'

export default class YKMapView extends PureComponent {

    static propTypes = {
        ...ViewPropTypes,
        // 地图类型 `0` - 空白 `1` - 标准 `2` - 卫星
        // 默认标准地图
        mapType: PropTypes.oneOf([0, 1, 2]),
        // 地图中心点经纬度
        center: LatLngPropType,
        // 缩放比例,百度地图支持 4~21, default `12`
        zoom: PropTypes.number,
        // 地图是否打开路况图层
        trafficEnabled: PropTypes.bool,
        // 地图View是否支持用户手势滚动
        scrollGesturesEnabled: PropTypes.bool,
        // 地图View是否支持用户手势缩放
        zoomGesturesEnabled: PropTypes.bool,
        // 所有点适配中心
        points: PropTypes.arrayOf(LatLngPropType),
        // 一组地图标记物(地图原生标记)
        markers: PropTypes.arrayOf(PropTypes.object),
        // 地图轨迹
        mapLine: PropTypes.shape({
            // 颜色数组,必须为16进制颜色 #eeeeee
            colors: PropTypes.arrayOf(ColorPropType),
            // 经纬度数组
            coordinates: PropTypes.arrayOf(LatLngPropType),
            // 颜色索引数组
            textureIndex: PropTypes.arrayOf(PropTypes.number),
            // 线宽
            width: PropTypes.number,
        }),
        // 地图标记点点击事件
        onMarkerClick: PropTypes.func,
        // 画圆
        drawCircle: PropTypes.object,
    }

    static defaultProps = {
        zoom: 12,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
    }

    /**
     * 缩小一级地图
     */
    zoomOut() {
        this.call('zoomOut')
    }

    /**
     * 放大一级地图
     */
    zoomIn() {
        this.call('zoomIn')
    }

    zoom(zoomNum) {
        this.call('zoom', [zoomNum])
    }

    /**
     * 私有方法
     * @param command 原生方法名
     * @param params 传递给原生的参数
     */
    call(command: string, params?: any[]) {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager.getViewManagerConfig('YKMapView').Commands[command],
            params,
        )
    }

    render() {
        return <YKMap {...this.props} onClick={obj => {
            this.props.onMarkerClick(obj.nativeEvent.id);
        }}/>
    }
}

const YKMap = requireNativeComponent('YKMapView', YKMapView)
