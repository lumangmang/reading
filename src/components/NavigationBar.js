/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from "react";
import {ViewPropTypes, Text, StatusBar, StyleSheet, View, Platform, DeviceInfo} from "react-native";
import {PropTypes} from "prop-types";

const NAV_BAR_HEIGHT_IOS = 44;//导航栏在iOS中的高度
const NAV_BAR_HEIGHT_ANDROID = 50;//导航栏在Android中的高度
const NAV_BAR_HEIGHT = Platform.OS === "ios" ? NAV_BAR_HEIGHT_IOS : NAV_BAR_HEIGHT_ANDROID;
const STATUS_BAR_HEIGHT = (Platform.OS !== "ios" || DeviceInfo.isIPhoneX_deprecated) ? 0 : 20;//状态栏的高度
const StatusBarShape = {//设置状态栏所接受的属性
    barStyle: PropTypes.oneOf(["light-content", "default", "dark-content"]),
    hidden: PropTypes.bool,
    backgroundColor: PropTypes.string,
};
export const NAVIGATION_BAR_HEIGHT = NAV_BAR_HEIGHT + STATUS_BAR_HEIGHT;
export default class NavigationBar extends PureComponent {
    //提供属性的类型检查
    static propTypes = {
        style: ViewPropTypes.style,
        title: PropTypes.string,
        titleColor: PropTypes.string,
        titleView: PropTypes.element,
        titleLayoutStyle: ViewPropTypes.style,
        hide: PropTypes.bool,
        statusBar: PropTypes.shape(StatusBarShape),
        rightButton: PropTypes.element,
        leftButton: PropTypes.element,
    };
    //设置默认属性
    static defaultProps = {
        statusBar: {
            barStyle: "dark-content",
            hidden: false,
        },
    };

    render() {
        let statusBar = !this.props.statusBar.hidden ?
            <View style={styles.statusBar}>
                <StatusBar {...this.props.statusBar} />
            </View> : null;

        let titleView = this.props.titleView ? this.props.titleView :
            <Text ellipsizeMode="head" numberOfLines={1}
                  style={[styles.title, {color: this.props.titleColor}]
                  }>
                {this.props.title}
            </Text>;

        let content = this.props.hide ? null :
            <View style={styles.navBar}>
                {this.getButtonElement(this.props.leftButton)}
                <View style={[styles.navBarTitleContainer, this.props.titleLayoutStyle]}>
                    {titleView}
                </View>
                {this.getButtonElement(this.props.rightButton)}
            </View>;
        return (
            <View style={[styles.container, this.props.style]}>
                {statusBar}
                {content}
            </View>
        );
    }

    getButtonElement(data) {
        return (
            <View style={styles.navBarButton}>
                {data ? data : null}
            </View>
        );

    }
}
const styles = StyleSheet.create({
    container: {
        backgroundColor: "white",
    },
    navBarButton: {
        alignItems: "center",
    },
    navBar: {
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
        height: NAV_BAR_HEIGHT,
    },
    navBarTitleContainer: {
        alignItems: "center",
        justifyContent: "center",
        position: "absolute",
        left: 40,
        right: 40,
        top: 0,
        bottom: 0,
    },
    title: {
        fontSize: 18,
        fontWeight: 'bold'
    },
    statusBar: {
        height: STATUS_BAR_HEIGHT,
    },
});
