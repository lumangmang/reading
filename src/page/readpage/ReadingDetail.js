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
    Button,
    Text,
} from "react-native";

import Navigator from "../../utils/Navigator";
import HocNavigationView from "../../components/HocNavigationView";
import ViewHelper from "../../utils/ViewExtension";
import NavigationBar from "../../components/NavigationBar";

import Native from "../../navite/Native";

const Container = (props) => (
    <View style={{ flex: 1 }}>
        <NavigationBar
            title={"This Page"}
            leftButton={ViewHelper.leftBarButtonItem(() => props.onBack())}
        />

        <Button
            onPress={() => {
                this.TestNativeViewRefs && this.TestNativeViewRefs.nativeFunc({ name: "111" });
            }}
            title="我是按钮"
        >
        </Button>

        <Native
            ref={ref => this.TestNativeViewRefs = ref}
            title={"这是一个原生组件"}
            onClick={(event) => {
                console.warn(event.nativeEvent.msg);
            }}
            style={{ width: 500, height: 500 }} />
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


