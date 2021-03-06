/**
 * reading.
 * Create by Devin on 2021/1/27.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */
import PropTypes from 'prop-types'

export const LatLngPropType = PropTypes.shape({
    latitude: PropTypes.number,
    longitude: PropTypes.number,
})

export const PointPropType = PropTypes.shape({
    x: PropTypes.number.isRequired,
    y: PropTypes.number.isRequired,
})


export function mapEventsPropType(events) {
    return events.reduce((props, event) => {
        props[event.replace(/^on/, 'onBaiduMap')] = PropTypes.func
        return props
    }, {})
}
