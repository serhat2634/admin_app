
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mailer/flutter_mailer.dart';






var last_qr = "";
String Ders_kodu = "";
String Ders_adi = "";
DateTime now = DateTime.now();
var date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
String Data_table = "";
String mail_admin = "gulfem@gmail.com";

add_table(last_qr){

}
checkdate(last_qr){
  String value = "";
  int flag;
  for(int i = 0; i<= last_qr.length;i++){
    if(last_qr[i]=="/"){
      flag += 1;
    }
    if(flag==2){
            value = last_qr[i+1-i+17];
           }
  }
    flag = 0;

  var date_og = value;
  //if(date_og > date){
  //    add_table(last_qr);
  //};
}


void main() => runApp(MaterialApp(
    home:Login()
));


class Login extends StatefulWidget{
  @override
  _Loginstate createState() => _Loginstate();
}

class _Loginstate extends State<Login>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context){

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Şifre",
          hintStyle: TextStyle(
            color: Colors.red[900],
          ),//
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //login control function
          //redirige vers la page d'accueil
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Menu()
            ),
          );
        },
        child: Text("Giriş",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final RegisterButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //login control function
          //redirige vers la page d'accueil
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Register()
            ),
          );
        },
        child: Text("Kayıt Ol",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
        appBar: AppBar( // formation de la bare de l'application
          title: Text(
            "GSÜ QR ADMIN",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Colors.grey[200],
                fontFamily: 'Signi'
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        child: Image.asset(
                        "assets/gsu_logo1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(height: 15.0,),
                    RegisterButon,

                  ],
                ),
              ),
            ),
    ),
    )

    );
  }
}















// Page d'accueil

class Menu extends StatefulWidget {
  @override

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override

  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final DersKodu = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ders Kodu",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (text){
        Ders_kodu = text;
      },
    );

    final DersAdi = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Ders Adı",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border: OutlineInputBorder(borderRadius:
          BorderRadius.circular(32.0))),
      onChanged: (text){
        Ders_adi = text;
      },
    );

    final Scan_button = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // Direction scan page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                QRViewExample(),
            ),
          );


        },
        child: Text("Scan",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
      appBar: AppBar( // formation de la bare de l'application
        title: Text(
          "GSÜ QR ADMIN",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.grey[200],
              fontFamily: 'Signi'
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
       child: Center(
         child: Container(
            color: Colors.white,
               child: Padding(
                 padding: const EdgeInsets.all(36.0),
                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Container(
                           child: Image.asset(
                             "assets/gsu_logo1.png",
                             height: 262.5,
                             width: 175.0,
                             fit : BoxFit.contain,
                           ),
                         ),
                         SizedBox(height: 45.0),
                         DersKodu,
                         SizedBox(height: 25.0),
                         DersAdi,
                         SizedBox(height: 35.0,),
                         Scan_button,
                         SizedBox(height: 15.0,),
                       ]
                   )
               )
         ),
       ),
      ),
    );
  }
}

















//Register page
class Register extends StatefulWidget {
  @override

  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final GsuMail = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "GSÜ Mail Adresi",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final Sifre = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Şifre",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final SifreTekrar  = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: " Şifre Tekrar",
          hintStyle: TextStyle(
              color : Colors.red[900]
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final Register = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // Retour a la Page login pour rentré dans l'application
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Login()
            ),
          );
        },
        child: Text("Kayıt Ol",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar( // formation de la bare de l'application
        title: Text(
          "Register Admin",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.grey[200],
              fontFamily: 'Signi'
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            "assets/gsu_logo1.png",
                            height: 262.5,
                            width: 175.0,
                            fit : BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        GsuMail,
                        SizedBox(height: 15.0),
                        Sifre,
                        SizedBox(height: 15.0,),
                        SifreTekrar,
                        SizedBox(height: 15.0,),
                        Register,
                      ]
                  )
              )
          ),
        ),
      ),
    );

  }
}







//Page de Scan
const flashOn = 'Flaş Açık';
const flashOff = 'Flaş Kapalı';
const frontCamera = 'Ön Kamera';
const backCamera = 'Arka Kamera';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {

  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( // formation de la bare de l'application
        title: Text(
          "Okunuyor",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.grey[200],
              fontFamily: 'Signi'
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Son öğrenci: $last_qr'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            if (controller != null) {
                              controller.toggleFlash();
                              if (_isFlashOn(flashState)) {
                                setState(() {
                                  flashState = flashOff;
                                });
                              } else {
                                setState(() {
                                  flashState = flashOn;
                                });
                              }
                            }
                          },
                          child:
                          Text(flashState, style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            if (controller != null) {
                              controller.flipCamera();
                              if (_isBackCamera(cameraState)) {
                                setState(() {
                                  cameraState = frontCamera;
                                });
                              } else {
                                setState(() {
                                  cameraState = backCamera;
                                });
                              }
                            }
                          },
                          child:
                          Text(cameraState, style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            controller?.pauseCamera();
                          },
                          child: Text('Dur', style:
                          TextStyle(
                              color: Colors.grey[200],
                              fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            controller?.resumeCamera();
                          },
                          child: Text('Devam',
                              style: TextStyle(
                                color: Colors.grey[200],
                                  fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.red[900],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                TablePage())
                            );
                            },
                          child: Text('Tablo',
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }


  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        last_qr = scanData;
        checkdate(last_qr);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}









//Page du tableau

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => new _TablePageState();
}

class _TablePageState extends State<TablePage> {
  String text = "Initial Text";
  final MailOptions mailOptions = MailOptions(
    body: Data_table,
    subject: Ders_kodu  + Ders_adi  ,
    recipients: [mail_admin],
    isHTML: true,
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color : Colors.red[900]
                ),
                child : Stack(
                  children: <Widget>[
                    Align(
                      alignment : Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: AssetImage('assets/ic_launcher.png'),
                        backgroundColor: Colors.white, ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Doç. Dr. Gülfem Alptekin",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[200],
                            fontFamily: 'Signi'
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0,0.25),
                      child: Text(
                        mail_admin,
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey[200],
                            fontFamily: 'Signi'
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              new Container (
                child: new Column(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.select_all, color: Colors.red[900],),
                          title:Text("Okuyucu", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          subtitle: Text("Scanner",style: TextStyle( fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          trailing: new Icon(Icons.arrow_forward, color: Colors.red[900],),
                          onTap:(){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    QRViewExample())
                            );
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.view_list, color:Colors.red[900]),
                          title:Text("Yoklama Tablosu", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          subtitle: Text("Table",style: TextStyle( fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          trailing: new Icon(Icons.arrow_forward, color: Colors.red[900]),
                          onTap:(){
                            setState((){
                              text = "save pressed";
                              //buraya tabloya girecek değişkenleri ekliyeceğiz

                            });
                            Navigator.pop(context);
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.arrow_back, color:Colors.red[900]),
                          title:Text("Bitir", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          onTap:(){
                            //FlutterMailer.send(mailOptions);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    Menu())
                            );
                          }
                      ),

                    ]
                ),
              )
            ],
          ),
        ),
        appBar: new AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          title: new Text(
            "$Ders_kodu  $Ders_adi  $date",
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200],
                fontFamily: 'Signi'
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: DataTable(
            columns : [
            DataColumn(label: Text('Isim Soyisim',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                  fontFamily: 'Signi'),

            )),
              DataColumn(label: Text('Öğ No',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                  fontFamily: 'Signi'),)),
              DataColumn(label: Text('Imei',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                  fontFamily: 'Signi'),)),
                  ],
            rows: [
              DataRow(cells: [
                DataCell(Text("serhat keleş")),
                DataCell(Text("13401629")),
                DataCell(Text("321635135132163")),
              ]
              ),
              DataRow(cells: [
                DataCell(Text("ömer akköseoğlu ")),
                DataCell(Text("14401696")),
                DataCell(Text("235685451233396",
                    style:TextStyle(color: Colors.red[900],))),
              ]
              ),
              DataRow(cells: [
                DataCell(Text("enes dağ")),
                DataCell(Text("15401232")),
                DataCell(Text("999865775423668")),
              ]
              ),
              DataRow(cells: [
                DataCell(Text("mustafa çörekçi")),
                DataCell(Text("15401235")),
                DataCell(Text("707072457896321")),
              ]
              ),
              DataRow(cells: [
                DataCell(Text("katia merdinoğlu")),
                DataCell(Text("15401696")),
                DataCell(Text("235685451233396",
                style:TextStyle(color: Colors.red[900],))),
              ]
              ),

            ],
          ),

        ),
        );
  }
}