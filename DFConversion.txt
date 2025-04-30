unit DFConversion;

interface

type
  // Enumerate all supported conversion categories
  TDFConversionCategory = (
    ccTemperature,
    ccLength,
    ccWeight,
    ccVolume,
    ccArea,
    ccSpeed,
    ccTime,
    ccEnergy,
    ccPressure
  );
  
  // Enumerate all supported units grouped by category
  TDFTemperatureUnit = (tuCelsius, tuFahrenheit, tuKelvin);
  TDFLengthUnit = (luMeter, luKilometer, luCentimeter, luMillimeter, luMile, luYard, luFoot, luInch);
  TDFWeightUnit = (wuKilogram, wuGram, wuMilligram, wuTon, wuPound, wuOunce);
  TDFVolumeUnit = (vuLiter, vuMilliliter, vuCubicMeter, vuGallon, vuQuart, vuPint, vuCup, vuFluidOunce);
  TDFAreaUnit = (auSquareMeter, auSquareKilometer, auHectare, auSquareFoot, auSquareYard, auAcre, auSquareMile);
  TDFSpeedUnit = (suMetersPerSecond, suKilometersPerHour, suMilesPerHour, suKnot);
  TDFTimeUnit = (tiSecond, tiMinute, tiHour, tiDay, tiWeek, tiYear);
  TDFEnergyUnit = (euJoule, euKilojoule, euCalorie, euKilocalorie, euWattHour, euKilowattHour);
  TDFPressureUnit = (puPascal, puKilopascal, puBar, puPSI, puAtmosphere);

  // Exception class for conversion errors
  EDFConversionError = class(Exception);

  // Main conversion class
  TDFConverter = class
  public
    // Temperature conversion functions
    class function ConvertTemperature(const Value: Double; FromUnit, ToUnit: TDFTemperatureUnit): Double;
    
    // Length conversion functions
    class function ConvertLength(const Value: Double; FromUnit, ToUnit: TDFLengthUnit): Double;
    
    // Weight conversion functions
    class function ConvertWeight(const Value: Double; FromUnit, ToUnit: TDFWeightUnit): Double;
    
    // Volume conversion functions
    class function ConvertVolume(const Value: Double; FromUnit, ToUnit: TDFVolumeUnit): Double;
    
    // Area conversion functions
    class function ConvertArea(const Value: Double; FromUnit, ToUnit: TDFAreaUnit): Double;
    
    // Speed conversion functions
    class function ConvertSpeed(const Value: Double; FromUnit, ToUnit: TDFSpeedUnit): Double;
    
    // Time conversion functions
    class function ConvertTime(const Value: Double; FromUnit, ToUnit: TDFTimeUnit): Double;
    
    // Energy conversion functions
    class function ConvertEnergy(const Value: Double; FromUnit, ToUnit: TDFEnergyUnit): Double;
    
    // Pressure conversion functions
    class function ConvertPressure(const Value: Double; FromUnit, ToUnit: TDFPressureUnit): Double;
    
    // Format conversion result with unit names
    class function FormatConversion(const Value, Result: Double; 
      const FromUnitName, ToUnitName: string): string;
      
    // Get description/name of units
    class function GetTemperatureUnitName(Unit: TDFTemperatureUnit): string;
    class function GetLengthUnitName(Unit: TDFLengthUnit): string;
    class function GetWeightUnitName(Unit: TDFWeightUnit): string;
    class function GetVolumeUnitName(Unit: TDFVolumeUnit): string;
    class function GetAreaUnitName(Unit: TDFAreaUnit): string;
    class function GetSpeedUnitName(Unit: TDFSpeedUnit): string;
    class function GetTimeUnitName(Unit: TDFTimeUnit): string;
    class function GetEnergyUnitName(Unit: TDFEnergyUnit): string;
    class function GetPressureUnitName(Unit: TDFPressureUnit): string;
  end;

implementation

uses
  System.SysUtils;

{ Temperature Conversion Implementation }

class function TDFConverter.ConvertTemperature(const Value: Double; 
  FromUnit, ToUnit: TDFTemperatureUnit): Double;
var
  Kelvin: Double;
begin
  // First convert to Kelvin (our base unit for temperature)
  case FromUnit of
    tuCelsius:    Kelvin := Value + 273.15;
    tuFahrenheit: Kelvin := (Value + 459.67) * (5/9);
    tuKelvin:     Kelvin := Value;
  end;
  
  // Then convert from Kelvin to target unit
  case ToUnit of
    tuCelsius:    Result := Kelvin - 273.15;
    tuFahrenheit: Result := Kelvin * (9/5) - 459.67;
    tuKelvin:     Result := Kelvin;
  end;
end;

{ Length Conversion Implementation }

class function TDFConverter.ConvertLength(const Value: Double; 
  FromUnit, ToUnit: TDFLengthUnit): Double;
var
  Meters: Double; // Use meter as the base unit
begin
  // Convert from source unit to meters
  case FromUnit of
    luMeter:      Meters := Value;
    luKilometer:  Meters := Value * 1000;
    luCentimeter: Meters := Value * 0.01;
    luMillimeter: Meters := Value * 0.001;
    luMile:       Meters := Value * 1609.344;
    luYard:       Meters := Value * 0.9144;
    luFoot:       Meters := Value * 0.3048;
    luInch:       Meters := Value * 0.0254;
  end;

  // Convert meters to target unit
  case ToUnit of
    luMeter:      Result := Meters;
    luKilometer:  Result := Meters / 1000;
    luCentimeter: Result := Meters * 100;
    luMillimeter: Result := Meters * 1000;
    luMile:       Result := Meters / 1609.344;
    luYard:       Result := Meters / 0.9144;
    luFoot:       Result := Meters / 0.3048;
    luInch:       Result := Meters / 0.0254;
  end;
end;

{ Weight Conversion Implementation }

class function TDFConverter.ConvertWeight(const Value: Double; 
  FromUnit, ToUnit: TDFWeightUnit): Double;
var
  Kilograms: Double; // Use kilogram as the base unit
begin
  // Convert from source unit to kilograms
  case FromUnit of
    wuKilogram:  Kilograms := Value;
    wuGram:      Kilograms := Value * 0.001;
    wuMilligram: Kilograms := Value * 0.000001;
    wuTon:       Kilograms := Value * 1000;
    wuPound:     Kilograms := Value * 0.45359237;
    wuOunce:     Kilograms := Value * 0.0283495231;
  end;

  // Convert kilograms to target unit
  case ToUnit of
    wuKilogram:  Result := Kilograms;
    wuGram:      Result := Kilograms * 1000;
    wuMilligram: Result := Kilograms * 1000000;
    wuTon:       Result := Kilograms / 1000;
    wuPound:     Result := Kilograms / 0.45359237;
    wuOunce:     Result := Kilograms / 0.0283495231;
  end;
end;

{ Volume Conversion Implementation }

class function TDFConverter.ConvertVolume(const Value: Double;
  FromUnit, ToUnit: TDFVolumeUnit): Double;
var
  Liters: Double; // Use liter as the base unit
begin
  // Convert from source unit to liters
  case FromUnit of
    vuLiter:       Liters := Value;
    vuMilliliter:  Liters := Value * 0.001;
    vuCubicMeter:  Liters := Value * 1000;
    vuGallon:      Liters := Value * 3.78541178;
    vuQuart:       Liters := Value * 0.946352946;
    vuPint:        Liters := Value * 0.473176473;
    vuCup:         Liters := Value * 0.2365882365;
    vuFluidOunce:  Liters := Value * 0.0295735296;
  end;

  // Convert liters to target unit
  case ToUnit of
    vuLiter:       Result := Liters;
    vuMilliliter:  Result := Liters * 1000;
    vuCubicMeter:  Result := Liters / 1000;
    vuGallon:      Result := Liters / 3.78541178;
    vuQuart:       Result := Liters / 0.946352946;
    vuPint:        Result := Liters / 0.473176473;
    vuCup:         Result := Liters / 0.2365882365;
    vuFluidOunce:  Result := Liters / 0.0295735296;
  end;
end;

{ Area Conversion Implementation }

class function TDFConverter.ConvertArea(const Value: Double;
  FromUnit, ToUnit: TDFAreaUnit): Double;
var
  SquareMeters: Double; // Use square meter as the base unit
begin
  // Convert from source unit to square meters
  case FromUnit of
    auSquareMeter:      SquareMeters := Value;
    auSquareKilometer:  SquareMeters := Value * 1000000;
    auHectare:          SquareMeters := Value * 10000;
    auSquareFoot:       SquareMeters := Value * 0.09290304;
    auSquareYard:       SquareMeters := Value * 0.83612736;
    auAcre:             SquareMeters := Value * 4046.8564224;
    auSquareMile:       SquareMeters := Value * 2589988.110336;
  end;

  // Convert square meters to target unit
  case ToUnit of
    auSquareMeter:      Result := SquareMeters;
    auSquareKilometer:  Result := SquareMeters / 1000000;
    auHectare:          Result := SquareMeters / 10000;
    auSquareFoot:       Result := SquareMeters / 0.09290304;
    auSquareYard:       Result := SquareMeters / 0.83612736;
    auAcre:             Result := SquareMeters / 4046.8564224;
    auSquareMile:       Result := SquareMeters / 2589988.110336;
  end;
end;

{ Speed Conversion Implementation }

class function TDFConverter.ConvertSpeed(const Value: Double;
  FromUnit, ToUnit: TDFSpeedUnit): Double;
var
  MetersPerSecond: Double; // Use meters per second as the base unit
begin
  // Convert from source unit to meters per second
  case FromUnit of
    suMetersPerSecond:   MetersPerSecond := Value;
    suKilometersPerHour: MetersPerSecond := Value * (1000 / 3600);
    suMilesPerHour:      MetersPerSecond := Value * 0.44704;
    suKnot:              MetersPerSecond := Value * 0.514444;
  end;

  // Convert meters per second to target unit
  case ToUnit of
    suMetersPerSecond:   Result := MetersPerSecond;
    suKilometersPerHour: Result := MetersPerSecond * (3600 / 1000);
    suMilesPerHour:      Result := MetersPerSecond / 0.44704;
    suKnot:              Result := MetersPerSecond / 0.514444;
  end;
end;

{ Time Conversion Implementation }

class function TDFConverter.ConvertTime(const Value: Double;
  FromUnit, ToUnit: TDFTimeUnit): Double;
var
  Seconds: Double; // Use seconds as the base unit
begin
  // Convert from source unit to seconds
  case FromUnit of
    tiSecond: Seconds := Value;
    tiMinute: Seconds := Value * 60;
    tiHour:   Seconds := Value * 3600;
    tiDay:    Seconds := Value * 86400;
    tiWeek:   Seconds := Value * 604800;
    tiYear:   Seconds := Value * 31536000; // Approximation: 365 days
  end;

  // Convert seconds to target unit
  case ToUnit of
    tiSecond: Result := Seconds;
    tiMinute: Result := Seconds / 60;
    tiHour:   Result := Seconds / 3600;
    tiDay:    Result := Seconds / 86400;
    tiWeek:   Result := Seconds / 604800;
    tiYear:   Result := Seconds / 31536000;
  end;
end;

{ Energy Conversion Implementation }

class function TDFConverter.ConvertEnergy(const Value: Double;
  FromUnit, ToUnit: TDFEnergyUnit): Double;
var
  Joules: Double; // Use joules as the base unit
begin
  // Convert from source unit to joules
  case FromUnit of
    euJoule:         Joules := Value;
    euKilojoule:     Joules := Value * 1000;
    euCalorie:       Joules := Value * 4.184;
    euKilocalorie:   Joules := Value * 4184;
    euWattHour:      Joules := Value * 3600;
    euKilowattHour:  Joules := Value * 3600000;
  end;

  // Convert joules to target unit
  case ToUnit of
    euJoule:         Result := Joules;
    euKilojoule:     Result := Joules / 1000;
    euCalorie:       Result := Joules / 4.184;
    euKilocalorie:   Result := Joules / 4184;
    euWattHour:      Result := Joules / 3600;
    euKilowattHour:  Result := Joules / 3600000;
  end;
end;

{ Pressure Conversion Implementation }

class function TDFConverter.ConvertPressure(const Value: Double;
  FromUnit, ToUnit: TDFPressureUnit): Double;
var
  Pascals: Double; // Use pascals as the base unit
begin
  // Convert from source unit to pascals
  case FromUnit of
    puPascal:      Pascals := Value;
    puKilopascal:  Pascals := Value * 1000;
    puBar:         Pascals := Value * 100000;
    puPSI:         Pascals := Value * 6894.76;
    puAtmosphere:  Pascals := Value * 101325;
  end;

  // Convert pascals to target unit
  case ToUnit of
    puPascal:      Result := Pascals;
    puKilopascal:  Result := Pascals / 1000;
    puBar:         Result := Pascals / 100000;
    puPSI:         Result := Pascals / 6894.76;
    puAtmosphere:  Result := Pascals / 101325;
  end;
end;

{ Unit Name Retrieval Functions }

class function TDFConverter.GetTemperatureUnitName(Unit: TDFTemperatureUnit): string;
begin
  case Unit of
    tuCelsius:    Result := 'Celsius';
    tuFahrenheit: Result := 'Fahrenheit';
    tuKelvin:     Result := 'Kelvin';
  end;
end;

class function TDFConverter.GetLengthUnitName(Unit: TDFLengthUnit): string;
begin
  case Unit of
    luMeter:      Result := 'Meter';
    luKilometer:  Result := 'Kilometer';
    luCentimeter: Result := 'Centimeter';
    luMillimeter: Result := 'Millimeter';
    luMile:       Result := 'Mile';
    luYard:       Result := 'Yard';
    luFoot:       Result := 'Foot';
    luInch:       Result := 'Inch';
  end;
end;

class function TDFConverter.GetWeightUnitName(Unit: TDFWeightUnit): string;
begin
  case Unit of
    wuKilogram:  Result := 'Kilogram';
    wuGram:      Result := 'Gram';
    wuMilligram: Result := 'Milligram';
    wuTon:       Result := 'Metric Ton';
    wuPound:     Result := 'Pound';
    wuOunce:     Result := 'Ounce';
  end;
end;

class function TDFConverter.GetVolumeUnitName(Unit: TDFVolumeUnit): string;
begin
  case Unit of
    vuLiter:       Result := 'Liter';
    vuMilliliter:  Result := 'Milliliter';
    vuCubicMeter:  Result := 'Cubic Meter';
    vuGallon:      Result := 'Gallon (US)';
    vuQuart:       Result := 'Quart (US)';
    vuPint:        Result := 'Pint (US)';
    vuCup:         Result := 'Cup (US)';
    vuFluidOunce:  Result := 'Fluid Ounce (US)';
  end;
end;

class function TDFConverter.GetAreaUnitName(Unit: TDFAreaUnit): string;
begin
  case Unit of
    auSquareMeter:      Result := 'Square Meter';
    auSquareKilometer:  Result := 'Square Kilometer';
    auHectare:          Result := 'Hectare';
    auSquareFoot:       Result := 'Square Foot';
    auSquareYard:       Result := 'Square Yard';
    auAcre:             Result := 'Acre';
    auSquareMile:       Result := 'Square Mile';
  end;
end;

class function TDFConverter.GetSpeedUnitName(Unit: TDFSpeedUnit): string;
begin
  case Unit of
    suMetersPerSecond:   Result := 'Meters per Second';
    suKilometersPerHour: Result := 'Kilometers per Hour';
    suMilesPerHour:      Result := 'Miles per Hour';
    suKnot:              Result := 'Knot';
  end;
end;

class function TDFConverter.GetTimeUnitName(Unit: TDFTimeUnit): string;
begin
  case Unit of
    tiSecond: Result := 'Second';
    tiMinute: Result := 'Minute';
    tiHour:   Result := 'Hour';
    tiDay:    Result := 'Day';
    tiWeek:   Result := 'Week';
    tiYear:   Result := 'Year';
  end;
end;

class function TDFConverter.GetEnergyUnitName(Unit: TDFEnergyUnit): string;
begin
  case Unit of
    euJoule:         Result := 'Joule';
    euKilojoule:     Result := 'Kilojoule';
    euCalorie:       Result := 'Calorie';
    euKilocalorie:   Result := 'Kilocalorie';
    euWattHour:      Result := 'Watt Hour';
    euKilowattHour:  Result := 'Kilowatt Hour';
  end;
end;

class function TDFConverter.GetPressureUnitName(Unit: TDFPressureUnit): string;
begin
  case Unit of
    puPascal:      Result := 'Pascal';
    puKilopascal:  Result := 'Kilopascal';
    puBar:         Result := 'Bar';
    puPSI:         Result := 'PSI';
    puAtmosphere:  Result := 'Atmosphere';
  end;
end;

{ Format Conversion Result }

class function TDFConverter.FormatConversion(const Value, Result: Double;
  const FromUnitName, ToUnitName: string): string;
begin
  Exit(Format('%.4g %s = %.4g %s', [Value, FromUnitName, Result, ToUnitName]));
end;

end.
