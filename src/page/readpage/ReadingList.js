/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from 'react';
import NativeScrollerView from "../../navite/scrollerView";
import {
    View,
    Text
} from 'react-native';

import Navigator from "../../utils/Navigator";
import LoadingView from "../../components/LoadingView";

export default class ReadingList extends PureComponent {

    // componentDidMount() {
    //     const {readActions} = this.props;
    //     readActions.requestArticleList('29', 1);
    // }

    render() {

        // const {read: {isLoading, projectModels, error}} = this.props;

        // return <LoadingView />

        return <View style={{flex: 1}}>
            <Text
                style={{height: 200}}
                onPress={() => {
                    // Navigator.goPage({}, 'ReadingDetail');
                    this.scrollView.setStatus([{}, 2])
                }}
            >
                Detail
            </Text>
            <NativeScrollerView
                style={{height: 200}}
                imageURLStringsGroup={[]}
                ref={ref => this.scrollView = ref}
            />
        </View>;
    }
}

