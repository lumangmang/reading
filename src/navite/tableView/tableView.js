/**
 * reading.
 * Create by Devin on 2021/1/15.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import {
    requireNativeComponent,
    NativeModules,
} from 'react-native'

const TableView = requireNativeComponent('RNTTableView', NativeTableView)
const RNTTableViewManager = NativeModules.RNTTableViewManager

export default class NativeTableView extends PureComponent {
    static propTypes = {
        color: PropTypes.string,
    }

    static defaultProps = {
        color: 'white'
    }
    render() {

        return (
            <TableView {...this.props} onClick={() => {

            }} />
        )
    }
}
