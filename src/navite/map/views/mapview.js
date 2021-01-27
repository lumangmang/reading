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
    ViewPropTypes
} from 'react-native'

import Component from "../component"

export default class Mapview extends Component {

    render() {
        return <NativeMapView {...this.props} />
    }
}

const NativeMapView = requireNativeComponent('BaiduMapView', Mapview)
