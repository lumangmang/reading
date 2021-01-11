/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from "react";
import {
    View,
} from "react-native";

import Navigator from "../../utils/Navigator";
import HocNavigationView from "../../components/HocNavigationView";
import ViewHelper from "../../utils/ViewExtension";
import NavigationBar from "../../components/NavigationBar";

import {MapView} from '../../navite/map';
import NativeScrollerView from "../../navite/scrollerView";

const Container = (props) => (
    <View style={{flex: 1}}>
        <NavigationBar
            title={"This Page"}
            leftButton={ViewHelper.leftBarButtonItem(() => props.onBack())}
        />
        <NativeScrollerView style={{height: 300}}
                            autoScrollTimeInterval={3}
                            imageURLStringsGroup={['http://photocdn.sohu.com/20111207/Img328215620.jpg',
                                'http://a.hiphotos.baidu.com/lvpics/h=800/sign=2d496375d739b60052ce02b7d9513526/a6efce1b9d16fdfa97d6a678b68f8c5495ee7be9.jpg']}
                            autoScroll={true}
                            onSelectImageIndex={(index) => {
                                alert(index);
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


