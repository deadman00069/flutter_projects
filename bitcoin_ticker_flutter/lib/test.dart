void main()
{
  const url = 'https://rest.coinapi.io/v1/exchangerate';
  const apiKey='?apikey=4D24F4D0-D10C-4262-9D74-BBD31E67D772';
String whtExchange='BTC';
String inWhich='USD';
  print(url+'/'+whtExchange+'/'+inWhich+apiKey);
}