<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PSA_Reliability_ATA_Code_Lookup_Basic.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reliability ATA Lookup</title>
    <link href="css/dist/aacom-core-library.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
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
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <H1>ATA: </H1>

                    <asp:TextBox runat="server" ID="txtAutoComplete" CssClass="autosuggest"></asp:TextBox>
                </div>
            </div>
        </div>

    </form>
</body>

</html>
