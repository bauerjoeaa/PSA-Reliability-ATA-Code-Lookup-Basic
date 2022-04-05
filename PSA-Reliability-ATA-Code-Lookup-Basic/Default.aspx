<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PSA_Reliability_ATA_Code_Lookup_Basic.Default" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reliability ATA Lookup</title>
    <link href="css/dist/aacom-core-library.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Default.aspx/getCustomerNames",
                        data: "{'prefixText':'" + document.getElementById('txtAutoComplete').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="row" style="margin-left: 7px; margin-right: 7px">
            <div class="col-md-8">
                <div class="form-group">
                    <h1>ATA: </h1>
                    Enter search term:
                    <asp:TextBox runat="server" ID="txtAutoComplete" CssClass="autosuggest"></asp:TextBox>
                </div>
            </div>
        </div>

    </form>

    <iframe id="hidden" src="https://mypsa.aa.com/atacodes/" style="width: 0; height: -1; border: 0; border: none; display: none;" onload="refresh()"></iframe>
    <iframe id="hidden2" src="https://mypsa.aa.com/atacodes/" style="width: 0; height: -1; border: 0; border: none; display: none;" onload="refresh()"></iframe>
    <script>
        function refresh() {
            setTimeout(refreshCookie, 30000);
            function refreshCookie() {
                document.getElementById('hidden').src = document.getElementById('hidden').src;
                document.getElementById('hidden2').src = document.getElementById('hidden2').src;
                document.getElementById('hidden').contentWindow.location.reload();
            };
        };
    </script>
</body>

</html>
