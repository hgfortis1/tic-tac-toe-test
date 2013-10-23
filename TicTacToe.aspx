<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TicTacToe.aspx.cs" Inherits="TicTacToe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

 

HTML

<table width="150px">

            <tr>

                <td>

                    <input type="button" id="1" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="2" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="3" onclick="return Tic(this);" />

                </td>

            </tr>

            <tr>

                <td>

                    <input type="button" id="4" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="5" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="6" onclick="return Tic(this);" />

                </td>

            </tr>

            <tr>

                <td>

                    <input type="button" id="7" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="8" onclick="return Tic(this);" />

                </td>

                <td>

                    <input type="button" id="9" onclick="return Tic(this);" />

                </td>

            </tr>

        </table>

        <br />

 

        <input type="button" id="btnPlay" onclick="return Play();" value="Play" 

                  style="width:100px; height: 30px; font: verdana 12pt;" />

        <asp:HiddenField ID="hfGameOver" runat="server" Value="No" />

        <asp:HiddenField ID="hfValue" runat="server" Value="X" />

 

Script

 

<script type="text/javascript" language="javascript">



    var ID = [1, 2, 3, 4, 5, 6, 7, 8, 9];



    // Possible Solution Array 2D

    var SolArr = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],

                     [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]];



    // For Play Again

    function Play() {

        for (var i = 0; i < 9; i++) {

            var btn = document.getElementById(ID[i]);

            btn.value = "";

            btn.className = "";

            document.getElementById('<%= hfGameOver.ClientID  %>').value = "No";

        }

    }



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

            

    </script>
    </form>
</body>
</html>
