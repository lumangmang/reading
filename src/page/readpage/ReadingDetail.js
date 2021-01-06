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
} from 'react-native';

import Navigator from "../../utils/Navigator";
import HocNavigationView from "../../components/HocNavigationView";
import ViewHelper from "../../utils/ViewExtension";
import NavigationBar from "../../components/NavigationBar";


const Container = (props) => (
    <View style={{flex: 1}}>
        <NavigationBar
            title={'This Page'}
            leftButton={ViewHelper.leftBarButtonItem(() => props.onBack())}
        />
    </View>
)

@HocNavigationView({})
class ReadingDetail extends PureComponent {
    onBack() {
        Navigator.goBack(this.props.navigation);
    }

    render() {
        return (
            <Container onBack={() => this.onBack()} {...this.props} />
        )
    }
}

export default ReadingDetail;


