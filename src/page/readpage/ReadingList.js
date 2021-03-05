/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from 'react';
import {
    View,
    Image,
    StyleSheet,
    Text,
} from 'react-native';

import { Mapview } from '../../navite/mapKit'
// import { Mapview, Geolocation, LocationManager } from '../../navite/map'
const style = StyleSheet.create({
    marker: {
        flexDirection: "row",
        backgroundColor: "#f5533d",
        borderRadius: 4,
        padding: 8
    },
    image: {
        width: 42,
        height: 42,
        marginRight: 8
    },
    title: {
        color: "#fff",
        fontSize: 16,
        fontWeight: "600"
    },

    time: {
        color: "#eee",
        fontSize: 12
    }
});

const resolveAssetSource = require('react-native/Libraries/Image/resolveAssetSource');
const image = resolveAssetSource(require('../../resource/map_replay_play.png'))

// const coordinates = [
//     {latitude: 29.695200, longitude: 115.674710, image: image.uri},
//     {latitude: 29.768930, longitude: 115.627420, image: image.uri},
//     {latitude: 29.792960, longitude: 115.640100, image: image.uri},
//     {latitude: 29.323610, longitude: 115.933300, image: image.uri},
//     {latitude: 29.374330, longitude: 115.973470, image: image.uri},
// ];
const coordinates = [
    {latitude: 29.695200, longitude: 115.674710},
    {latitude: 29.768930, longitude: 115.627420},
    {latitude: 29.792960, longitude: 115.640100},
    {latitude: 29.323610, longitude: 115.933300},
    {latitude: 29.374330, longitude: 115.973470},
];

const colors = [
    '#ffba25',
    '#ff8400',
    '#3eb6ad',
    '#02b9f2',
    '#9176bd',
]

const textureIndex = [
    1, 2, 2, 3, 1
]

export default class ReadingList extends PureComponent {

    componentDidMount() {
        // 单次定位
        // Geolocation.fetchCurrentLocation(position => {
        //
        //     console.log(position.location)
        //     this.setState({
        //         location: position.location,
        //         center: position.location,
        //     })
        //
        // }, error => {
        //     console.log(error)
        // })

        // 连续定位
        // this.listener = Geolocation.watchPosition(position => {
        //     // console.log(position)
        //     this.setState({
        //                 location: position.location,
        //             })
        // }, error => {
        //     console.log(error)
        // })
        // Geolocation.start()
        // this.timer = setInterval(() => this.setState({ time: new Date() }), 1000);
    }

    renderMarker = () => (
        <View style={style.marker}>
            <Image
                style={style.image}
                source={{
                    uri: "https://avatars0.githubusercontent.com/u/1709072?s=100&v=4"
                }}
            />
            <View>
                <Text style={style.title}>The custom view marker</Text>
            </View>
        </View>
    );

    render() {

        return (
            <View style={{flex: 1}}>
                <Text style={{height: 100}}
                      onPress={() => {
                          this.mapView.startAnimation()
                      }}
                >
                    ssss
                </Text>

                <Mapview style={{flex: 1}}
                         zoom={12}
                         mapLine={{colors, coordinates, textureIndex, width: 6}}
                         ref={mapView => this.mapView = mapView}
                >

                </Mapview>
            </View>
        );
    }
}

