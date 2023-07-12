class CurrentCityDataModel {
  String? _cityname;
  var _lon;
  var _lat;
  String? _main;
  String? _description;
  var _temp;
  var _temp_min;
  var _temp_max;
  var _pressure;
  var _humidity;
  var _windSpeed;
  var _dataTime;
  String? _country;
  var _sunrise;
  var _sunset;

  CurrentCityDataModel(
      this._cityname,
      this._lon,
      this._lat,
      this._main,
      this._description,
      this._temp,
      this._temp_min,
      this._temp_max,
      this._pressure,
      this._humidity,
      this._windSpeed,
      this._dataTime,
      this._country,
      this._sunrise,
      this._sunset);

  String get cityname => _cityname!;
  get lon => _lon;
  get lat => _lat;
  String get main => _main!;
  String get description => _description!;
  get temp => _temp;
  get temp_min => _temp_min;
  get temp_max => _temp_max;
  get pressure => _pressure;
  get humidity => _humidity;
  get windSpeed => _windSpeed;
  get dataTime => _dataTime;
  String get country => _country!;
  get sunrise => _sunrise;
  get sunset => _sunset;
}
