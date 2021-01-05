/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from 'react';
import {ActivityIndicator, Text, StyleSheet, View} from 'react-native';

const LoadingView = () => (
    <View style={styles.loading}>
        <ActivityIndicator size="small" />
    </View>
)

const styles = StyleSheet.create({
    loading: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
    },
});

export default LoadingView;
