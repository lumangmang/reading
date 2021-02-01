/**
 * reading.
 * Create by Devin on 2021/1/28.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { ComponentType } from "react"
import PropTypes from 'prop-types'
import {
    requireNativeComponent,
    ViewPropTypes,
    View,
    StyleSheet
} from 'react-native'

import { LatLngPropType, mapEventsPropType } from "../prop-types"
import Component from "./component";

/**
 * onPress - 点击标注回调
 * onCalloutPress - 点击标注气泡调用
 * onDrag - 拖动annotation view时，若view的状态发生变化，会调用
 * @type {string[]}
 */
const events = ['onPress', 'onCalloutPress', 'onDrag', 'onDragStart', 'onDragEnd']

const style = StyleSheet.create({
    marker: {
        position: 'absolute',
    },
})

type Props = {
    view?: ComponentType<*>,
}

export default class Marker extends Component<Props> {
    static propTypes = {
        ...ViewPropTypes,
        ...mapEventsPropType(events),
        coordinate: LatLngPropType.isRequired,
        image: PropTypes.string,
        title: PropTypes.string,
        selected: PropTypes.bool,
        draggable: PropTypes.bool,
        flat: PropTypes.bool,
    }

    nativeComponentName = 'MapviewMarker'

    select() {
        this.call('select')
    }

    renderMarkerView() {
        if (this.props.view) {
            const markerView = <this.props.view />
            return (
                <View style={style.marker} key="marker">{markerView}</View>
            )
        }
        return null
    }

    render() {
        const props = {
            ...this.props,
            ...this.handlers(events),
            children: [this.props.children, this.renderMarkerView()],
        }
        return <BaiduMapMarker {...props}/>
    }
}

const BaiduMapMarker = requireNativeComponent('MapviewMarker', Marker)
