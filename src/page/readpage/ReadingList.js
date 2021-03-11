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
// import { Mapview, Geolocation, LocationManager } from '../../navite/map'
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

const coordinates = [
    {latitude: 29.695200, longitude: 115.674710, image: image.uri, id: 3},
    {latitude: 29.768930, longitude: 115.627420, image: image.uri, id: 4},
    {latitude: 29.792960, longitude: 115.640100, image: image.uri, id: 1},
    {latitude: 29.323610, longitude: 115.933300, image: image.uri, id: 5},
    {latitude: 29.374330, longitude: 115.973470, image: image.uri, id: 2},
];
// const coordinates = [
//     {latitude: 29.695200, longitude: 115.674710},
//     {latitude: 29.768930, longitude: 115.627420},
//     {latitude: 29.792960, longitude: 115.640100},
//     {latitude: 29.323610, longitude: 115.933300},
//     {latitude: 29.374330, longitude: 115.973470},
// ];

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
        <View  style={style.marker}>
            <Image
                style={style.image}
                source={{
                    uri: "https://avatars0.githubusercontent.com/u/1709072?s=100&v=4"
                }}
            />
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
                          // 设定地图缩放比例
                          this.mapView.zoom(18)
                          // 地图放大一级
                          // this.mapView.zoomIn()
                          // 地图缩小一级
                          // this.mapView.zoomOut()
                      }}
                >
                    ssss
                </Text>

                <YKMapView style={{flex: 1}}
                           // 缩放比例
                           zoom={12}
                           // 画圆
                           drawCircle={{
                               latitude: 29.792960,
                               longitude: 115.640100,
                               radius: 10000,
                               color: '#ff8400',
                               strokeWidth: 2.0,
                               strokeColor: '#9176bd'
                           }}
                           // 点标记点击事件 id回调点标记的唯一标识
                           onMarkerClick={(id) => {
                               console.log(id)
                           }}
                           // 画轨迹
                           mapLine={{colors: speedColors, coordinates, textureIndex, width: 6}}
                           // 系统点标记
                           markers={coordinates}
                           // 所有点适配
                           points={coordinates}
                           ref={mapView => this.mapView = mapView}
                >
                    {coordinates.map((item, index) => {
                        return (
                            <YKMapView.Marker
                                // 自定义点标记
                                // point - 点的经纬度坐标
                                point={item}
                                // 自定义视图
                                view={this.renderMarker}
                                key={index}
                            />
                        )
                    })}
                </YKMapView>
            </View>
        );
    }
}

