/**
 * reading.
 * Create by Devin on 2021/1/11.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react';
import { requireNativeComponent, NativeModules, UIManager, findNodeHandle } from 'react-native';
import PropTypes from 'prop-types';

const ScrollerView = requireNativeComponent('RNTScrollView', NativeScrollerView);

export default class NativeScrollerView extends PureComponent {
    static propTypes = {
        autoScrollTimeInterval: PropTypes.number,
        imageURLStringsGroup: PropTypes.array,
        autoScroll: PropTypes.bool,
        onSelectImageIndex: PropTypes.func
    };

    static defaultProps = {
        autoScrollTimeInterval: 2
    }

    setStatus = (params) => {
        console.log(params)
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager.getViewManagerConfig('RNTScrollView').Commands.setStatus,
            params,
        )
    }

    render() {
        return (
            <ScrollerView {...this.props} onClick={obj => {
                this.props.onSelectImageIndex(obj.nativeEvent.index);
            }}/>
        )
    }
}


