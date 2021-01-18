/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react';
import NativeScrollerView from "../../navite/scrollerView";
import NativePageView from "../../navite/pageView";
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
                style={{height: 200, backgroundColor: 'red'}}
                imageURLStringsGroup={[
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3468842248,1928586949&fm=26&gp=0.jpg',
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1136631939,606206356&fm=26&gp=0.jpg',
                    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1980625098,3267059552&fm=26&gp=0.jpg'
                ]}
                onSelectImageIndex={(index) => {
                    alert(index)
                }}
                ref={ref => this.scrollView = ref}
            />
            <NativePageView
                style={{height: 200, backgroundColor: 'red'}}
                imageURLStringsGroup={[
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3468842248,1928586949&fm=26&gp=0.jpg',
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1136631939,606206356&fm=26&gp=0.jpg',
                    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1980625098,3267059552&fm=26&gp=0.jpg'
                ]}
                onSelectImageIndex={(event) => {
                    alert(event.nativeEvent.index)
                }}
            />
        </View>;
    }
}

