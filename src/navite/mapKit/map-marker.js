/**
 * reading.
 * Create by Devin on 2021/3/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { ComponentType, PureComponent } from "react"
import PropTypes from 'prop-types'
import {
    requireNativeComponent,
    ViewPropTypes,
    View,
    StyleSheet
} from 'react-native'

import { LatLngPropType } from "./prop-types"

const style = StyleSheet.create({
    marker: {
        position: 'absolute',
    },
})

type Props = {
    view?: ComponentType<*>,
}

export default class Marker extends PureComponent<Props> {
    static propTypes = {
        ...ViewPropTypes,
        coordinate: LatLngPropType.isRequired,
        icon: PropTypes.object,
        title: PropTypes.string,
        showCallout: PropTypes.bool,
        onSelect: PropTypes.func,
    }

    static defaultProps = {
        showCallout: false
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
        return <BaiduMarker onClick={this.props.onSelect}  {...props}/>
    }
}

const BaiduMarker = requireNativeComponent('Marker', Marker)
