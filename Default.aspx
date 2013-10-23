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

      // For Tic

      function Tic(obj) {

          var val;

          var TicValue = document.getElementById('<%=  hfValue.ClientID  %>').value;

          if (document.getElementById('<%= hfGameOver.ClientID  %>').value == "Yes") {

              alert("Game Over");

              return false;

          }

          if (obj.value != "") {

              alert("You can't change value");

              return false;

          }

          if (TicValue == "X") {

              obj.value = TicValue;

              val = "O";

          }

          else {

              obj.value = TicValue;

              val = "X";

          }



          CheckForResult();

          document.getElementById('<%=  hfValue.ClientID  %>').value = val;

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

          // setTimeout(GetLatest, 5000);

          $("#1").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {
                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#2").click(function () {

              var response = Tic($(document.getElementById('2')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#2").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#3").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#4").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#5").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#6").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#7").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };

              }

          });

          $("#8").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          $("#9").click(function () {

              var response = Tic($(document.getElementById('1')));
              if (response == true) {

                  $.ajax({
                      type: "POST", //GET or POST or PUT or DELETE verb
                      url: "Service.svc/Play", // Location of the service
                      data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value +
                    ", sPoint=1, sValue=" + document.getElementById('<%=  hfValue.ClientID  %>').value + " }", //Data sent to server
                      contentType: "application/json",
                      dataType: "json",
                      processdata: false, //True or False
                      success: function () {//On Successfull service call
                          //  ServiceSucceeded(msg);
                          alert('called');
                      },
                      error: ServiceFailed// When Service call fails
                  });
                  function ServiceFailed(result) {
                      alert('Service call failed');

                  };
              }

          });

          function GetLatest() {
              $.ajax({
                  type: "POST", //GET or POST or PUT or DELETE verb
                  url: "Service.svc/GetLatestMove", // Location of the service
                  data: "{sName=" + document.getElementById('<%=  txtName.ClientID  %>').value + ", sGame=" + document.getElementById('<%=  txtGame.ClientID  %>').value + " }", //Data sent to server
                  contentType: "application/json",
                  dataType: "json",
                  processdata: false, //True or False
                  success: function () {//On Successfull service call
                      //  ServiceSucceeded(msg);
                      //TODO:Map Play to input

                      alert('called');
                  },
                  error: ServiceFailed// When Service call fails
              });
              function ServiceFailed(result) {
                  alert('Service call failed');

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
        <input type="button" id="btnPlay" onclick="return Play();" value="Play" style="width: 100px;
            height: 30px; font: verdana 12pt;" /><asp:Button ID="Button1" runat="server" Text="Refresh" style="width: 100px;
            height: 30px; font: verdana 12pt;" />
        <asp:HiddenField ID="hfGameOver" runat="server" Value="No" />
        <asp:HiddenField ID="hfValue" runat="server" Value="X" />
    </div>

  
   
</asp:Content>
