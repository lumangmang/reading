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
    Text
} from 'react-native';

import { Mapview, Geolocation, LocationManager } from '../../navite/map'
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

const points = [
    {
        latitude: 39.806901,
        longitude: 116.397972
    },
    {
        latitude: 39.806901,
        longitude: 116.297972
    },
    {
        latitude: 39.906901,
        longitude: 116.397972
    }
];

export default class ReadingList extends PureComponent {
    // state = {
    //     location: {},
    //     center: {latitude: 39.914884, longitude: 116.403883},
    // }

    // state = { time: new Date() };

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

    coordinates = new Array(200).fill(0).map(() => ({
        latitude: 39.5 + Math.random(),
        longitude: 116 + Math.random(),
        intensity: Math.random()
    }));

    render() {

        return <View style={{flex: 1}}>
            <Mapview style={{flex: 1}}
            >
                <Mapview.Marker
                    ref={ref => (this.marker = ref)}
                    // title="This is a custom view"
                    coordinate={{
                        latitude: 39.806901,
                        longitude: 116.397972
                    }}
                    image={'map_replay_startPoint'}
                />
                <Mapview.Marker
                    ref={ref => (this.marker = ref)}
                    // title="This is a custom view"
                    coordinate={{
                        latitude: 39.706901,
                        longitude: 116.397972
                    }}
                    image={'map_replay_startPoint'}
                />
                <Mapview.Marker
                    ref={ref => (this.marker = ref)}
                    // title="This is a custom view"
                    coordinate={{
                        latitude: 39.606901,
                        longitude: 116.397972
                    }}
                    image={'map_replay_startPoint'}
                />
                <Mapview.Polyline
                    points={[
                        {
                            latitude: 39.806901,
                            longitude: 116.397972
                        },
                        {
                            latitude: 39.706901,
                            longitude: 116.397972
                        },
                        {
                            latitude: 39.606901,
                            longitude: 116.397972
                        }
                    ]}
                />
                <Mapview.Polygon
                    points={points}
                    strokeWidth={2}
                    strokeColor="rgba(0, 0, 255, 0.5)"
                    fillColor="rgba(255, 0, 0, 0.5)"
                />
                <Mapview.Circle
                    center={{ latitude: 39.914884, longitude: 116.403883 }}
                    radius={10000}
                    strokeWidth={2}
                    strokeColor="rgba(0, 0, 255, 0.5)"
                    fillColor="rgba(255, 0, 0, 0.5)"
                />
                <Mapview.HeatMap points={this.coordinates} radius={50} opacity={0.5} />
            </Mapview>
        </View>;
    }
}

