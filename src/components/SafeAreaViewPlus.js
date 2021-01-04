/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from "react";
import { DeviceInfo, SafeAreaView, StyleSheet, View, ViewPropTypes } from "react-native";
import { PropTypes } from "prop-types";

export default class SafeAreaViewPlus extends PureComponent {
    static propTypes = {
        ...ViewPropTypes,
        topColor: PropTypes.string,
        bottomColor: PropTypes.string,
        enablePlus: PropTypes.bool,
        topInset: PropTypes.bool,
        bottomInset: PropTypes.bool,
    };

    static defaultProps = {
        topColor: "transparent",
        bottomColor: "#f8f8f8",
        enablePlus: true,
        topInset: true,
        bottomInset: false,
    };

    safeAreaViewPlus() {
        const { children, topColor, bottomColor, topInset, bottomInset } = this.props;
        return (
            <View style={[styles.container, this.props.style]}>
                {this.topArea(topColor, topInset)}
                {children}
                {this.bottomArea(bottomColor, bottomInset)}
            </View>
        );
    }

    safeArea() {
        return <SafeAreaView style={[styles.container, this.props.style]} {...this.props}>
            {this.props.children}
        </SafeAreaView>;
    }

    topArea(topColor, topInset) {
        return !DeviceInfo.isIPhoneX_deprecated || !topInset ? null
            : <View style={[styles.topArea, { backgroundColor: topColor }]} />;
    }

    bottomArea(bottomColor, bottomInset) {
        return !DeviceInfo.isIPhoneX_deprecated || !bottomInset ? null
            : <View style={[styles.bottomArea, { backgroundColor: bottomColor }]} />;
    }

    render() {
        const { enablePlus } = this.props;
        return enablePlus ? this.safeAreaViewPlus() : this.safeArea();
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    topArea: {
        height: 44,
    },
    bottomArea: {
        height: 34,
    },
});
