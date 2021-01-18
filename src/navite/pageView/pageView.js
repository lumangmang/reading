/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */
import React, { PureComponent } from 'react'
import { requireNativeComponent } from 'react-native'
import { PropTypes } from 'prop-types'

const PageView = requireNativeComponent('RNTPageView', NativePageView)

export default class NativePageView extends PureComponent {

    static propTypes = {
        autoScrollTimeInterval: PropTypes.number,
        imageURLStringsGroup: PropTypes.array,
        onSelectImageIndex: PropTypes.func,
    }

    static defaultProps = {
        autoScrollTimeInterval: 3,
    }

    render() {
        return (
            <PageView
                onClick={this.props.onSelectImageIndex || null}
                {...this.props}
            />
        )
    }

}
