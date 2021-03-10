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

import YKMapView from '../../navite/mapKit'
// import { YkMapView, Geolocation, LocationManager } from '../../navite/map'
const style = StyleSheet.create({
    marker: {
        flexDirection: "row",
        backgroundColor: "#f5533d",
        borderRadius: 4,
        padding: 8
    },
    image: {
        width: 20,
        height: 20,
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

const speedColors = []

const speeds = [
    0, 60, 30, 80, 120,
]

const textureIndex = []

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
            {/*<View>*/}
            {/*    <Text style={style.title}>The custom view marker</Text>*/}
            {/*</View>*/}
        </View>
    );

    render() {
        speeds.map(((value, index) => {
            if (0 <= value && value < 30) {
                speedColors.push(colors[0])
            } else if (30 <= value && value < 60) {
                speedColors.push(colors[1])
            } else if (60 <= value && value < 80) {
                speedColors.push(colors[2])
            } else if (80 <= value && value < 100) {
                speedColors.push(colors[3])
            } else {
                speedColors.push(colors[4])
            }
            textureIndex.push(index)
        }))

        return (
            <View style={{flex: 1}}>
                <Text style={{height: 100}}
                      onPress={() => {
                          // this.mapView.zoom(18)
                      }}
                >
                    ssss
                </Text>

                <YKMapView style={{flex: 1}}
                           zoom={12}
                           // mapLine={{colors: speedColors, coordinates, textureIndex, width: 6}}
                           points={[coordinates[0]]}
                           ref={mapView => this.mapView = mapView}
                >
                        <YKMapView.Marker
                            coordinate={coordinates[0]}
                            view={this.renderMarker}
                        />
                </YKMapView>
            </View>
        );
    }
}

