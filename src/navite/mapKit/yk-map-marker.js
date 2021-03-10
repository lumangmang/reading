/**
 * reading.
 * Create by Devin on 2021/3/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { ComponentType, PureComponent } from "react"
import {
    requireNativeComponent,
    ViewPropTypes,
    View,
    StyleSheet
} from 'react-native'

import { PointPropType } from "./prop-types"

const style = StyleSheet.create({
    marker: {
        position: 'absolute',
    },
})

type Props = {
    view?: ComponentType<*>,
}

export default class YKMapMarker extends PureComponent<Props> {
    static propTypes = {
        ...ViewPropTypes,
        coordinate: PointPropType.isRequired,
    }

    renderMarkerView() {
        if (this.props.view) {
            const markerView = <this.props.view/>
            return (
                <View style={style.marker} key="marker">{markerView}</View>
            )
        }
        return null
    }

    render() {
        const props = {
            ...this.props,
            children: [this.props.children, this.renderMarkerView()],
        }
        return <YKMarkerView {...props}/>
    }
}

const YKMarkerView = requireNativeComponent('Marker', YKMapMarker)
