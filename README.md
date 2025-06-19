# SunCalc

Swift package to calculate the Sun and Moon positions

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FTimac%2FSunCalc%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Timac/SunCalc)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FTimac%2FSunCalc%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Timac/SunCalc)

# Description

SunCalc is a Swift package to calculate the sun position, sunlight phases (times for sunrise, sunset, dusk, etc.), moon position and lunar phase for the given location and time.

Most calculations are based on the formulas given in the excellent Astronomy Answers articles
about [position of the sun](http://aa.quae.nl/en/reken/zonpositie.html)
and [the planets](http://aa.quae.nl/en/reken/hemelpositie.html).
You can read about different twilight phases calculated by SunCalc
in the [Twilight article on Wikipedia](http://en.wikipedia.org/wiki/Twilight).


# Usage


```swift
// get today's sunlight times for London

let date = Date()

let sunCalc = SunCalc.getTimes(date: date, latitude: 51.5, longitude: -0.1)
if let sunrise = sunCalc.sunrise {
	debugPrint("sunrise: \(sunrise.formatted())")
}

if let sunset = sunCalc.sunset {
	debugPrint("sunset: \(sunset.formatted())")
}

let sunPos = SunCalc.getSunPosition(timeAndDate: date, latitude: 51.5, longitude: -0.1)
let sunriseAzimuth = sunPos.azimuth * 180 / Constants.PI()
debugPrint("sunriseAzimuth: \(sunriseAzimuth)")
```

# Reference

## Sunlight times

```javascript
SunCalc.getTimes(/*Date*/ date, /*Number*/ latitude, /*Number*/ longitude, /*Number (default=0)*/ height)
```

Returns an object with the following properties (each is a `Date` object):

| Property        | Description                                                              |
| --------------- | ------------------------------------------------------------------------ |
| `sunrise`       | sunrise (top edge of the sun appears on the horizon)                     |
| `sunriseEnd`    | sunrise ends (bottom edge of the sun touches the horizon)                |
| `goldenHourEnd` | morning golden hour (soft light, best time for photography) ends         |
| `solarNoon`     | solar noon (sun is in the highest position)                              |
| `goldenHour`    | evening golden hour starts                                               |
| `sunsetStart`   | sunset starts (bottom edge of the sun touches the horizon)               |
| `sunset`        | sunset (sun disappears below the horizon, evening civil twilight starts) |
| `dusk`          | dusk (evening nautical twilight starts)                                  |
| `nauticalDusk`  | nautical dusk (evening astronomical twilight starts)                     |
| `night`         | night starts (dark enough for astronomical observations)                 |
| `nadir`         | nadir (darkest moment of the night, sun is in the lowest position)       |
| `nightEnd`      | night ends (morning astronomical twilight starts)                        |
| `nauticalDawn`  | nautical dawn (morning nautical twilight starts)                         |
| `dawn`          | dawn (morning nautical twilight ends, morning civil twilight starts)     |

```javascript
SunCalc.addTime(/*Number*/ angleInDegrees, /*String*/ morningName, /*String*/ eveningName)
```

Adds a custom time when the sun reaches the given angle to results returned by `SunCalc.getTimes`.

`SunCalc.times` property contains all currently defined times.


## Sun position

```javascript
SunCalc.getPosition(/*Date*/ timeAndDate, /*Number*/ latitude, /*Number*/ longitude)
```

Returns an object with the following properties:

 * `altitude`: sun altitude above the horizon in radians,
 e.g. `0` at the horizon and `PI/2` at the zenith (straight over your head)
 * `azimuth`: sun azimuth in radians (direction along the horizon, measured from south to west),
 e.g. `0` is south and `Math.PI * 3/4` is northwest


## Moon position

```javascript
SunCalc.getMoonPosition(/*Date*/ timeAndDate, /*Number*/ latitude, /*Number*/ longitude)
```

Returns an object with the following properties:

 * `altitude`: moon altitude above the horizon in radians
 * `azimuth`: moon azimuth in radians
 * `distance`: distance to moon in kilometers
 * `parallacticAngle`: parallactic angle of the moon in radians


## Moon illumination

```javascript
SunCalc.getMoonIllumination(/*Date*/ timeAndDate)
```

Returns an object with the following properties:

 * `fraction`: illuminated fraction of the moon; varies from `0.0` (new moon) to `1.0` (full moon)
 * `phase`: moon phase; varies from `0.0` to `1.0`, described below
 * `angle`: midpoint angle in radians of the illuminated limb of the moon reckoned eastward from the north point of the disk;
 the moon is waxing if the angle is negative, and waning if positive

Moon phase value should be interpreted like this:

| Phase | Name            |
| -----:| --------------- |
| 0     | New Moon        |
|       | Waxing Crescent |
| 0.25  | First Quarter   |
|       | Waxing Gibbous  |
| 0.5   | Full Moon       |
|       | Waning Gibbous  |
| 0.75  | Last Quarter    |
|       | Waning Crescent |

By subtracting the `parallacticAngle` from the `angle` one can get the zenith angle of the moons bright limb (anticlockwise).
The zenith angle can be used do draw the moon shape from the observers perspective (e.g. moon lying on its back).

## Moon rise and set times

```js
SunCalc.getMoonTimes(/*Date*/ date, /*Number*/ latitude, /*Number*/ longitude[, inUTC])
```

Returns an object with the following properties:

 * `rise`: moonrise time as `Date`
 * `set`: moonset time as `Date`
 * `alwaysUp`: `true` if the moon never rises/sets and is always _above_ the horizon during the day
 * `alwaysDown`: `true` if the moon is always _below_ the horizon

By default, it will search for moon rise and set during local user's day (from 0 to 24 hours).
If `inUTC` is set to true, it will instead search the specified date from 0 to 24 UTC hours.


# License

This project is based on the source code [https://github.com/shanus/suncalc-swift](https://github.com/shanus/suncalc-swift) written by Shaun Meredith, which is based on the original Javascript suncalc by Vladimir Agafonkin ("mourner") available at [https://github.com/mourner/suncalc](https://github.com/mourner/suncalc)

