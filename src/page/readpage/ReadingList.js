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
import LoadingView from "../../components/LoadingView";

export default class ReadingList extends PureComponent {

    // componentDidMount() {
    //     const {readActions} = this.props;
    //     readActions.requestArticleList('29', 1);
    // }

    render() {

        // const {read: {isLoading, projectModels, error}} = this.props;

        // return <LoadingView />

        return <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
            <Text
                onPress={() => {
                    Navigator.goPage({}, 'ReadingDetail');
                }}
            >
                Detain
            </Text>
        </View>;
    }
}

