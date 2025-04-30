# DFConversion

A comprehensive unit conversion library for Delphi applications. The library provides conversion capabilities for various measurement categories including temperature, length, weight, volume, area, speed, time, energy, and pressure.

## Features

- **Multiple Conversion Categories**: Convert between units in 9 different measurement categories
- **Comprehensive Unit Support**: Support for both metric and imperial measurement systems
- **Easy to Use**: Simple and intuitive API with clear method names
- **Type Safety**: Uses enumerated types to prevent invalid conversions
- **Error Handling**: Custom exception class for conversion errors
- **Formatting Utility**: Built-in method to format conversion results as readable strings
- **Zero Dependencies**: No external dependencies required

## Installation

1. Add the `DFConversion.pas` file to your Delphi project
2. Add `DFConversion` to your unit's uses clause
3. Start converting!

## Usage Examples

### Temperature Conversion

```delphi
// Convert from Celsius to Fahrenheit
var 
  TempC, TempF: Double;
begin
  TempC := 25;
  TempF := TDFConverter.ConvertTemperature(TempC, tuCelsius, tuFahrenheit);
  ShowMessage(Format('%.1f°C = %.1f°F', [TempC, TempF]));
  
  // Or use the formatting helper
  ShowMessage(TDFConverter.FormatConversion(
    TempC, TempF,
    TDFConverter.GetTemperatureUnitName(tuCelsius),
    TDFConverter.GetTemperatureUnitName(tuFahrenheit)
  ));
end;
```

### Length Conversion

```delphi
// Convert from meters to feet
var
  Meters, Feet: Double;
begin
  Meters := 10;
  Feet := TDFConverter.ConvertLength(Meters, luMeter, luFoot);
  ShowMessage(Format('%.2f meters = %.2f feet', [Meters, Feet]));
end;
```

### Weight Conversion

```delphi
// Convert from kilograms to pounds
var
  Kg, Lb: Double;
begin
  Kg := 70;
  Lb := TDFConverter.ConvertWeight(Kg, wuKilogram, wuPound);
  ShowMessage(Format('%.2f kg = %.2f lb', [Kg, Lb]));
end;
```

## Available Unit Types

### Temperature Units
- Celsius (°C)
- Fahrenheit (°F)
- Kelvin (K)

### Length Units
- Meter (m)
- Kilometer (km)
- Centimeter (cm)
- Millimeter (mm)
- Mile (mi)
- Yard (yd)
- Foot (ft)
- Inch (in)

### Weight Units
- Kilogram (kg)
- Gram (g)
- Milligram (mg)
- Metric Ton (t)
- Pound (lb)
- Ounce (oz)

### Volume Units
- Liter (L)
- Milliliter (mL)
- Cubic Meter (m³)
- Gallon (US) (gal)
- Quart (US) (qt)
- Pint (US) (pt)
- Cup (US)
- Fluid Ounce (US) (fl oz)

### Area Units
- Square Meter (m²)
- Square Kilometer (km²)
- Hectare (ha)
- Square Foot (ft²)
- Square Yard (yd²)
- Acre
- Square Mile (mi²)

### Speed Units
- Meters per Second (m/s)
- Kilometers per Hour (km/h)
- Miles per Hour (mph)
- Knot (kn)

### Time Units
- Second (s)
- Minute (min)
- Hour (h)
- Day (d)
- Week (w)
- Year (y)

### Energy Units
- Joule (J)
- Kilojoule (kJ)
- Calorie (cal)
- Kilocalorie (kcal)
- Watt Hour (Wh)
- Kilowatt Hour (kWh)

### Pressure Units
- Pascal (Pa)
- Kilopascal (kPa)
- Bar
- PSI (lb/in²)
- Atmosphere (atm)

## Complete Example

Below is a complete example showing how to use the library in a console application:

```delphi
program ConversionExample;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DFConversion;

begin
  try
    // Convert 25°C to Fahrenheit
    var Celsius := 25.0;
    var Fahrenheit := TDFConverter.ConvertTemperature(Celsius, tuCelsius, tuFahrenheit);
    Writeln(Format('%.2f°C = %.2f°F', [Celsius, Fahrenheit]));
    
    // Convert 10 kilometers to miles
    var Kilometers := 10.0;
    var Miles := TDFConverter.ConvertLength(Kilometers * 1000, luMeter, luMile);
    Writeln(Format('%.2f km = %.2f miles', [Kilometers, Miles]));
    
    // Convert 1 gallon to liters
    var Gallons := 1.0;
    var Liters := TDFConverter.ConvertVolume(Gallons, vuGallon, vuLiter);
    Writeln(Format('%.2f gallons = %.2f liters', [Gallons, Liters]));
    
    Writeln('Press Enter to exit...');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
```

## Extending the Library

The library is designed to be easily extensible. To add new unit types or conversion categories:

1. Add the new units to the appropriate enumeration or create a new enumeration
2. Implement the conversion method for the new category
3. Add a unit name retrieval method for the new category

## License

This library is released under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Author

DF Libraries Team
