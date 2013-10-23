<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" 
src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.1.min.js"></script> 
  <script type="text/javascript">

      var ID = [1, 2, 3, 4, 5, 6, 7, 8, 9];



      // Possible Solution Array 2D

      var SolArr = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],

                     [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]];
      // For Tic

      function Tic(obj) {

          var val;

          var TicValue = document.getElementById('<%=  hfValue.ClientID  %>').value;

          if (document.getElementById('<%= hfGameOver.ClientID  %>').value == "Yes") {

              alert("Game Over");

              return false;

          }

          if (document.getElementById('<%= txtName.ClientID  %>').value == "") {

              alert("Name invalid");

              return false;

          }

          if (document.getElementById('<%= txtGame.ClientID  %>').value == "") {

              alert("Name invalid");

              return false;

          }

          // alert(document.getElementById('<%=  hfPlayerTurn.ClientID  %>').value);
          if (document.getElementById('<%=  hfPlayed.ClientID  %>').value == "yes") {
              if (document.getElementById('<%=  hfPlayerTurn.ClientID  %>').value != document.getElementById('<%=  txtName.ClientID  %>').value) {
                  alert(document.getElementById('<%=  hfPlayerTurn.ClientID  %>').value);
                  alert(document.getElementById('<%=  txtName.ClientID  %>').value);
                  alert("You cant play twice");
                  return false;
              }
          }

          if (obj.value != "") {

              alert("Input Selected Already");
              alert(obj.value);
              return false;

          }
          //alert(TicValue);
          if (TicValue == "X") {

              obj.value = "O";// TicValue;
              document.getElementById('<%=  hfValue.ClientID  %>').value = "O";
              val = "O";

          }

          else {

              obj.value = "X";// TicValue;
              document.getElementById('<%=  hfValue.ClientID  %>').value = "X";
              val = "X";

          }



          //CheckForResult();
         // alert(val);
          //document.getElementById('<%=  hfValue.ClientID  %>').value = val;

          return true;

      }

      // For Checking Result.

      function CheckForResult() {

          var TicValue = document.getElementById('<%=  hfValue.ClientID  %>').value;

          for (var i = 0; i < 8; i++) {



              var Id1 = SolArr[i][0], Id2 = SolArr[i][1], Id3 = SolArr[i][2];



              var txt1 = document.getElementById(Id1);

              var txt2 = document.getElementById(Id2);

              var txt3 = document.getElementById(Id3);



              if ((txt1.value != "") && (txt1.value == txt2.value) &&

                    (txt2.value == txt3.value)) {

                  txt1.className = "winner";

                  txt2.className = "winner";

                  txt3.className = "winner";



                  document.getElementById('<%= hfGameOver.ClientID  %>').value = "Yes";

                  alert(TicValue + " is Winner.");

                  return false;

              }



          }

      }


      $(document).ready(function () {

          setInterval(GetLatest, 3000);

          $("#1").click(function () {

              var response = Tic(document.getElementById('1'));
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 1,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#2").click(function () {

              var response = Tic(document.getElementById('2'));
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 2,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });



          $("#3").click(function () {

              var response = Tic(document.getElementById('3'));
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 3,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          $("#4").click(function () {

              var response = Tic(document.getElementById('4')); ;
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 4,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          $("#5").click(function () {

              var response = Tic(document.getElementById('5')); ;
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 5,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          $("#6").click(function () {

              var response = Tic(document.getElementById('6')); ;
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 6,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          $("#7").click(function () {

              var response = Tic(document.getElementById('7')); ;
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 7,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          // alert('Service call failed1');
                      } // When Service call fails
                  });


              }

          });

          $("#8").click(function () {

              var response = Tic(document.getElementById('8'));
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 8,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          $("#9").click(function () {

              var response = Tic(document.getElementById('9'));
              if (response == true) {

                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value, 'sPoint': 9,
                          'sValue': document.getElementById('<%=  hfValue.ClientID  %>').value
                      }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function () {//On Successfull service call
                          document.getElementById('<%=  hfPlayed.ClientID  %>').value = "yes";
                          CheckForResult();
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails
                  });

              }

          });

          function GetLatest() {
              if (document.getElementById('<%= hfGameOver.ClientID  %>').value != "Yes") {
                  $.ajax({
                      type: "GET", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/GetLatestMove", // Location of the service
                      data: { 'sName': document.getElementById('<%=  txtName.ClientID  %>').value, 'sGame': document.getElementById('<%=  txtGame.ClientID  %>').value }, //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: true, //True or False
                      success: function (result) {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          //TODO:Map Play to input

                          if (result != null) {
                              if (result.GetLatestMoveResult.PlayerTurn != "") {
                                  document.getElementById('<%=  hfPlayerTurn.ClientID  %>').value = result.GetLatestMoveResult.PlayerTurn
                              }
                              if (result.GetLatestMoveResult.LastPlayed != "") {
                                  //alert(result.GetLatestMoveResult.LastPlayed);
                                  document.getElementById('<%=  hfValue.ClientID  %>').value = result.GetLatestMoveResult.LastPlayed

                              }
                              if (result.GetLatestMoveResult.Plays != null) {
                                  for (var i = 0; i < result.GetLatestMoveResult.Plays.length; i++) {

                                      if (result.GetLatestMoveResult.Plays[i].Position == 1) {

                                          document.getElementById('1').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 2) {

                                          document.getElementById('2').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 3) {

                                          document.getElementById('3').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 4) {

                                          document.getElementById('4').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 5) {

                                          document.getElementById('5').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 6) {

                                          document.getElementById('6').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 7) {

                                          document.getElementById('7').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 8) {

                                          document.getElementById('8').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }
                                      else if (result.GetLatestMoveResult.Plays[i].Position == 9) {

                                          document.getElementById('9').value = result.GetLatestMoveResult.Plays[i].PositionValue;
                                      }

                                  }
                              }

                          }
                          CheckForResult();
                          //  alert('called')
                          //alert(result.GetLatestMoveResult.NameOfGame);


                          // alert('called');
                      },
                      error: function () {
                          alert('Service call failed1');
                      } // When Service call fails

                  });
              }

          };
      }
    );

      
    </script>
   
    <style type="text/css">
        input
        {
            width: 50px;
            height: 50px;
        }
        
        .winner
        {
            background-color: #FF69B4;
        }
    </style>
    <h2>
        Hello Tic-Tac-Toe
    </h2>
    <div style="float: left">
        <table>
            <tr>
                <td>
                Name
                </td>
                <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength = "200" Width = "100px" Height="20px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                Game
                </td>
                <td>
                <asp:TextBox ID="txtGame" runat="server" MaxLength = "100" Width = "100px" Height="20px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table width="150px">
            <tr>
                <td>
                    <input type="button" id="1"/>
                </td>
                <td>
                    <input type="button" id="2"/>
                </td>
                <td>
                    <input type="button" id="3" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="4"  />
                </td>
                <td>
                    <input type="button" id="5"  />
                </td>
                <td>
                    <input type="button" id="6"  />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="7"  />
                </td>
                <td>
                    <input type="button" id="8" />
                </td>
                <td>
                    <input type="button" id="9"  />
                </td>
            </tr>
        </table>
        <br />
        <%--<input type="button" id="btnPlay" onclick="return Play();" value="Play" style="width: 100px;
            height: 30px; font: verdana 12pt;" /><asp:Button ID="Button1" runat="server" Text="Refresh" style="width: 100px;
            height: 30px; font: verdana 12pt;" />--%>
        <asp:HiddenField ID="hfGameOver" runat="server" Value="No" />
          <asp:HiddenField ID="hfPlayerTurn" runat="server" Value="" />
                <asp:HiddenField ID="hfPlayed" runat="server" Value="No" />
        <asp:HiddenField ID="hfValue" runat="server" Value="O" />
    </div>

  
   
</asp:Content>
