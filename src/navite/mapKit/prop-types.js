
/**
 * reading.
 * Create by Devin on 2021/2/6.
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

/**
 * 地图点标记
 * latitude longitude 经纬度必传
 * id 点的标识,做点击使用
 */
export const PointPropType = PropTypes.shape({
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,
    id: PropTypes.number,
})
