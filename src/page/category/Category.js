/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from 'react';
import {
    View,
    Text
} from 'react-native';

import Navigator from "../../utils/Navigator";

export default class Category extends PureComponent {

    constructor(props) {
        super(props);
        this.params = props.route.params
    }

    render() {
        return <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
            <Text
                onPress={() => {
                    Navigator.restRoot({
                        navigation: this.props.navigation,
                    });
                }}
            >sssssss</Text>
        </View>;
    }
}
