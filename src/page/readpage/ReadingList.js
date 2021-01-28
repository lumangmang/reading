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
export default class ReadingList extends PureComponent {
    state = {
        location: {},
        center: {latitude: 39.914884, longitude: 116.403883},
    }

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

    componentWillUnmount() {
        // 移除连续定位
        // Geolocation.stop()
        // Geolocation.clearWatch(this.listener)

        // clearInterval(this.timer);
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
                <Text style={style.time}>{this.state.time.toLocaleString()}</Text>
            </View>
        </View>
    );

    render() {
        const {
            location,
            center
        } = this.state;
        console.log(location)
        return <View style={{flex: 1}}>
            <Mapview style={{flex: 1}}
                     zoom={14}
                     // showsUserLocation={true}
                     // userTrackingMode={'follow'}
                     // mapType={'standard'}
                     // locationData={location}
            >
                {/*<Mapview.Marker*/}

                {/*    // custom*/}
                {/*    // ref={ref => (this.marker = ref)}*/}
                {/*    // title="This is a custom view"*/}
                {/*    // view={this.renderMarker}*/}
                {/*    // coordinate={{ latitude: 39.914884, longitude: 116.403883 }}*/}

                {/*    // onPress={() => console.log("You pressed the marker!")}*/}
                {/*    // title="This is a marker"*/}
                {/*    // color="red"*/}
                {/*    // draggable*/}
                {/*    // onDrag={() => console.log('----------')}*/}
                {/*    // onCalloutPress={() => console.log("You pressed the callout!")}*/}
                {/*    // coordinate={location}*/}

                {/*    // selected*/}
                {/*    // draggable*/}
                {/*    // title="This is a draggable marker"*/}
                {/*    // onDragEnd={coordinate =>*/}
                {/*    //     console.log(`${coordinate.latitude}, ${coordinate.longitude}`)*/}
                {/*    // }*/}
                {/*    // // flat={true}*/}
                {/*    // coordinate={{ latitude: 39.914884, longitude: 116.403883 }}*/}
                {/*/>*/}
            </Mapview>
        </View>;
    }
}

