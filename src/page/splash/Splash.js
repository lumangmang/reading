/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

// 开屏广告页
import SplashScreen from "react-native-splash-screen";
import store from 'react-native-simple-store';

import React, {PureComponent} from 'react';
import {
    Animated,
    Dimensions,
} from 'react-native';

import Navigator from "../../utils/Navigator";
const maxHeight = Dimensions.get('window').height;
const maxWidth = Dimensions.get('window').width;
const splashImg = require('../../resource/splash.png');

export default class Splash extends PureComponent {

    constructor(props) {
        super(props);
        Navigator.navigation = props.navigation;
        this.state = {
            bounceValue: new Animated.Value(1),
        }
    }

    componentDidMount() {
        Animated.timing(this.state.bounceValue, {
            toValue: 1.2,
            duration: 1000,
            useNativeDriver: true,
        }).start();
        SplashScreen.hide();
        this.timer = setTimeout(() => {
            store.get('isInit').then(isInit => {
                if (isInit) {
                    Navigator.goPage({
                        isFirst: true,
                    }, 'Category')
                } else {
                    Navigator.restRoot({
                        navigation: this.props.navigation,
                    })
                }
            })
        }, 1000);
    }

    componentWillUnmount() {
        this.timer && clearTimeout(this.timer);
    }

    render() {
        return (
            <Animated.Image
                style={{
                    width: maxWidth,
                    height: maxHeight,
                    transform: [{scale: this.state.bounceValue}]
                }}
                source={splashImg}
            />
        );
    }
}
