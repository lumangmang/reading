/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from "react";
import {
    View,
} from "react-native";

import Navigator from "../../utils/Navigator";
import HocNavigationView from "../../components/HocNavigationView";
import ViewHelper from "../../utils/ViewExtension";
import NavigationBar from "../../components/NavigationBar";
import NativeScrollerView from "../../navite/scrollerView";
import NativeTableView from "../../navite/tableView";

const Container = (props) => (
    <View style={{flex: 1}}>
        <NavigationBar
            title={"This Page"}
            leftButton={ViewHelper.leftBarButtonItem(() => props.onBack())}
        />
        <NativeScrollerView
            style={{height: 300}}
            imageURLStringsGroup={['https://', 'https://']}
            onSelectImageIndex={index => {
                console.log(index)
            }}
        />
        <NativeTableView
            style={{height: 300}}
            color={'red'}
            onColor={(value) => {
                console.log(value)
            }}
        />
    </View>
);

@HocNavigationView({})
class ReadingDetail extends PureComponent {
    onBack() {
        Navigator.goBack(this.props.navigation);
    }

    render() {
        return (
            <Container onBack={() => this.onBack()} {...this.props} />
        );
    }
}

export default ReadingDetail;


