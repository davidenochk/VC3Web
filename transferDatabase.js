var sql = require('mssql');
var Firebase = require('firebase')
var Util = require('./js/Utils')


var file = './tmp/data.json'
var config = {
    user: 'vc3web',
    password: 'Wkq0m10_',
    server: '198.71.226.2', // You can use 'localhost\\instance' to connect to named instance
    database: 'VC3WebData',

    options: {
        encrypt: true // Use this if you're on Windows Azure
    }
}

var fire_SermonsURL = "https://demovc3.firebaseio.com/sermons";
var sermons = new Firebase(fire_SermonsURL);
var fire_SeriesURL = "https://demovc3.firebaseio.com/series";
var series = new Firebase(fire_SeriesURL);
var fire_SpeakersURL = "https://demovc3.firebaseio.com/speakers";
var speakers = new Firebase(fire_SpeakersURL);

var connection = new sql.Connection(config, function(err) {
    // ... error checks

    // Query

    var request = new sql.Request(connection); // or: var request = connection.request();
    request.query('select * from c3victory.tblsermons', function(err, recordset) {
      for(var i=0;i<recordset.length;i++){
        sermons.push(Util.CreateSermon(recordset[i]));
      }
        // ... error checks
      console.log('Sermons Count ' + recordset.length )
      //jsonfile.writeFile(file, recordset, function (err) {
  		//console.error(err)
	    //})
    });

    request.query('select * from c3victory.tblseries', function(err, recordset) {
      for(var i=0;i<recordset.length;i++){
        series.push(Util.CreateSeries(recordset[i]));
      }
        // ... error checks
      console.log('Series Count' + recordset.length )
      //jsonfile.writeFile(file, recordset, function (err) {
  		//console.error(err)
	    //})
    });

    request.query('select * from c3victory.tblspeakers', function(err, recordset) {
      for(var i=0;i<recordset.length;i++){
        speakers.push(Util.CreateSpeaker(recordset[i]));
      }
        // ... error checks
      console.log('Speakers Count ' + recordset.length )
      //jsonfile.writeFile(file, recordset, function (err) {
  		//console.error(err)
	    //})
    });

    // Stored Procedure

    //var request = new sql.Request(connection);
    //request.input('input_parameter', sql.Int, 10);
    //request.output('output_parameter', sql.VarChar(50));
    //request.execute('procedure_name', function(err, recordsets, returnValue) {
    //    // ... error checks

    //    console.dir(recordsets);
    //});
});
connection.on('error', function(err) {
    // ... error handler
});
