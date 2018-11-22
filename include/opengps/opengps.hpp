/*
 * opengps.hpp
 *
 *  Created on: Nov 21, 2018
 *      Author: chorm
 */

#ifndef __INCLUDE_OPENGPS_HPP__2018_11_21_23_59_47
#define __INCLUDE_OPENGPS_HPP__2018_11_21_23_59_47

#include <lclib/Config.hpp>
#include <cstdint>
#include <lclib/Vector.hpp>

struct GPSCoord{
	uint8_t degrees;
	uint8_t minutes;
	double seconds;
};

Vec2<std::uint64_t> fromGPSCoords(Vec2<GPSCoord>);
Vec2<GPSCoord> toGPSCoords(Vec2<std::int64_t>);




#endif /* __INCLUDE_OPENGPS_HPP__2018_11_21_23_59_47 */
