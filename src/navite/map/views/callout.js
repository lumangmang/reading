/**
 * reading.
 * Create by Devin on 2021/2/1.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from 'react'
import { requireNativeComponent, StyleSheet, ViewPropTypes } from 'react-native'
import Component from './component'

const style = StyleSheet.create({
    callout: {
        position: 'absolute',
    },
})

type Props = {
    onPress: () => {},
} & ViewPropTypes

export default class Callout extends Component<Props> {
    static propTypes = ViewPropTypes

    nativeComponentName = 'MapCallout'
    render() {
        const props = {
            ...this.props,
            ...this.handlers(['onPress']),
            style: [style.callout, this.props.style],
        }
        return <BaiduMapCallout {...props} />
    }
}

const BaiduMapCallout = requireNativeComponent('MapCallout', Callout)
