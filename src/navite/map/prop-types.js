/**
 * reading.
 * Create by Devin on 2021/1/25.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import PropTypes from 'prop-types'

export const LatLngPropType = PropTypes.shape({
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,
})

export const LocationPropType = PropTypes.shape({
    accuracy: PropTypes.number,
    direction: PropTypes.number,
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,
})

export function mapEventsPropType(events) {
    return events.reduce((props, event) => {
        props[event.replace(/^on/, 'onBaiduMap')] = PropTypes.func
        return props
    }, {})
}
