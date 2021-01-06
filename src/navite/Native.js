/**
 * reading.
 * Create by Devin on 2021/1/6.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */
import PropTypes from "prop-types";
import React, { PureComponent } from "react";
import { requireNativeComponent, View, findNodeHandle, UIManager } from "react-native";

const NativeView = requireNativeComponent("NativeView");
export default class Native extends PureComponent {
    static propTypes = {
        ...View.PropTypes,
        title: PropTypes.string,
        onClick: PropTypes.func,
    };

    nativeFunc = (obj) => {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager.getViewManagerConfig("NativeView").Commands.nativeFunc,
            [
                obj,
            ],
        );
    };

    render() {
        return <NativeView {...this.props} />;
    }
}
