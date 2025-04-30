program DFConversionExample;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DFConversion in 'DFConversion.pas';

procedure ShowTemperatureExample;
var
  Celsius, Fahrenheit, Kelvin: Double;
begin
  Writeln('--- Temperature Conversion Examples ---');
  
  // Convert 25°C to Fahrenheit
  Celsius := 25;
  Fahrenheit := TDFConverter.ConvertTemperature(Celsius, tuCelsius, tuFahrenheit);
  Writeln(TDFConverter.FormatConversion(
    Celsius, Fahrenheit, 
    TDFConverter.GetTemperatureUnitName(tuCelsius),
    TDFConverter.GetTemperatureUnitName(tuFahrenheit)
  ));
  
  // Convert 98.6°F to Celsius
  Fahrenheit := 98.6;
  Celsius := TDFConverter.ConvertTemperature(Fahrenheit, tuFahrenheit, tuCelsius);
  Writeln(TDFConverter.FormatConversion(
    Fahrenheit, Celsius,
    TDFConverter.GetTemperatureUnitName(tuFahrenheit),
    TDFConverter.GetTemperatureUnitName(tuCelsius)
  ));
  
  // Convert 0°C to Kelvin
  Celsius := 0;
  Kelvin := TDFConverter.ConvertTemperature(Celsius, tuCelsius, tuKelvin);
  Writeln(TDFConverter.FormatConversion(
    Celsius, Kelvin,
    TDFConverter.GetTemperatureUnitName(tuCelsius),
    TDFConverter.GetTemperatureUnitName(tuKelvin)
  ));
  
  Writeln;
end;

procedure ShowLengthExample;
var
  Meters, Miles, Feet: Double;
begin
  Writeln('--- Length Conversion Examples ---');
  
  // Convert 5 kilometers to miles
  Meters := 5000; // 5 km in meters
  Miles := TDFConverter.ConvertLength(Meters, luMeter, luMile);
  Writeln(TDFConverter.FormatConversion(
    5, Miles,
    'Kilometers',
    TDFConverter.GetLengthUnitName(luMile)
  ));
  
  // Convert 100 feet to meters
  Feet := 100;
  Meters := TDFConverter.ConvertLength(Feet, luFoot, luMeter);
  Writeln(TDFConverter.FormatConversion(
    Feet, Meters,
    TDFConverter.GetLengthUnitName(luFoot),
    TDFConverter.GetLengthUnitName(luMeter)
  ));
  
  Writeln;
end;

procedure ShowWeightExample;
var
  Kg, Pounds: Double;
begin
  Writeln('--- Weight Conversion Examples ---');
  
  // Convert 70 kilograms to pounds
  Kg := 70;
  Pounds := TDFConverter.ConvertWeight(Kg, wuKilogram, wuPound);
  Writeln(TDFConverter.FormatConversion(
    Kg, Pounds,
    TDFConverter.GetWeightUnitName(wuKilogram),
    TDFConverter.GetWeightUnitName(wuPound)
  ));
  
  // Convert 5 pounds to grams
  Pounds := 5;
  Kg := TDFConverter.ConvertWeight(Pounds, wuPound, wuGram);
  Writeln(TDFConverter.FormatConversion(
    Pounds, Kg,
    TDFConverter.GetWeightUnitName(wuPound),
    TDFConverter.GetWeightUnitName(wuGram)
  ));
  
  Writeln;
end;

procedure ShowVolumeExample;
var
  Liters, Gallons: Double;
begin
  Writeln('--- Volume Conversion Examples ---');
  
  // Convert 10 liters to gallons
  Liters := 10;
  Gallons := TDFConverter.ConvertVolume(Liters, vuLiter, vuGallon);
  Writeln(TDFConverter.FormatConversion(
    Liters, Gallons,
    TDFConverter.GetVolumeUnitName(vuLiter),
    TDFConverter.GetVolumeUnitName(vuGallon)
  ));
  
  Writeln;
end;

procedure ShowAreaExample;
var
  SquareMeters, Acres: Double;
begin
  Writeln('--- Area Conversion Examples ---');
  
  // Convert 10000 square meters to acres
  SquareMeters := 10000;
  Acres := TDFConverter.ConvertArea(SquareMeters, auSquareMeter, auAcre);
  Writeln(TDFConverter.FormatConversion(
    SquareMeters, Acres,
    TDFConverter.GetAreaUnitName(auSquareMeter),
    TDFConverter.GetAreaUnitName(auAcre)
  ));
  
  Writeln;
end;

procedure ShowSpeedExample;
var
  KmPerHour, MilesPerHour: Double;
begin
  Writeln('--- Speed Conversion Examples ---');
  
  // Convert 100 km/h to mph
  KmPerHour := 100;
  MilesPerHour := TDFConverter.ConvertSpeed(KmPerHour, suKilometersPerHour, suMilesPerHour);
  Writeln(TDFConverter.FormatConversion(
    KmPerHour, MilesPerHour,
    TDFConverter.GetSpeedUnitName(suKilometersPerHour),
    TDFConverter.GetSpeedUnitName(suMilesPerHour)
  ));
  
  Writeln;
end;

begin
  try
    Writeln('DFConversion Example Program');
    Writeln('============================');
    Writeln;
    
    ShowTemperatureExample;
    ShowLengthExample;
    ShowWeightExample;
    ShowVolumeExample;
    ShowAreaExample;
    ShowSpeedExample;
    
    Writeln('Press Enter to exit...');
    Readln;
  except
    on E: EDFConversionError do
      Writeln('Conversion Error: ', E.Message);
    on E: Exception do
      Writeln('Error: ', E.Message);
  end;
end.
