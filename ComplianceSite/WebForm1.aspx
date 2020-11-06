<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ComplianceSite.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Without Master page</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <style>
        td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align:center;
        }
        th{
            text-align:center;
        }
    </style>
    <div class="container">
        <div class="row">
            <h1>Generate Defect Number</h1>
            <p class="lead" style="color:red;">**PLEASE NOTE THE UNIQUE IDENTIFIER FORMAT HAS CHANGED**</p>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="site" >Filter:</label>
                <input id="myInput" type="text" placeholder="Search.." />
                <span>Count : </span>
                <span id="count">0</span>
            </div>
            <div class="col-md-2">
                <label for="filter_site">Site:</label>
                <select id="filter_site" runat="server" />
            </div>
            
            <div class="col-md-5">
                <label for="filter_subcode">Program Subcode:</label>
                <select id="filter_subcode" runat="server"/>
            </div>
            
        </div>
        <div class="row">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        </div>
        <div class="row">
            <div class="col-md-4">
                    <p class="lead" style="color:red;">Add a new Unique ID</p>
                    <form class="form" runat="server">
                        <div class="form-group">
                                <label for="site">Site:</label>
                                <select id="site" class="form-control" runat="server" />
                              </div>
                          <div class="form-group">
                                <label for="program">Program:</label>
                                <select id="program" class="form-control" runat="server" />
                              </div>
                          <div class="form-group">
                                <label for="subcode">Program Subcode:</label>
                            <asp:TextBox ID="subcode" runat="server" class="form-control"></asp:TextBox>
                             
                        </div>
                          <div class="form-group">
                                <label for="reason">Reason for Defect Notification:</label>
                                <select id="reason" class="form-control" runat="server" />
                              </div>
                        <div class="form-group">
                                <label for="issue">Issue Origin:</label>
                                <select id="issue" class="form-control" runat="server" />
                              </div>
                        <div class="form-group">
                                <label for="description">Description:</label>
                            <textarea id="description" cols="20" rows="2" class="form-control" runat="server"></textarea>
                              </div>
                        <div class="form-group">
                                <label for="defect">Original Defect #:</label>
                            <asp:TextBox ID="defect" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click"  class="form-control btn btn-primary"/>
                        </div>
                    </form>
                </div>
            <div class="col-md-8">
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#filter_site").val("Site1");
                filter();
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    var count = 0;
                    $("tbody tr").filter(function () {
                        var flag = false;
                        var txt = '';
                        $(this).find('input').each(function (ii, em) {
                            txt += $(em).val();
                        });
                        txt += $(this).text();
                        if (txt.toLowerCase().indexOf(value) > -1) {
                            flag = true;
                            count++;
                        }
                        $(this).toggle(flag);
                    });
                    $('#count').text(count);
                });
                $("#filter_site, #filter_subcode").on("change", function () {
                    filter();
                });
                $("input.update").click(
                    function () {
                        var tr = $(this).closest('tr');
                        var tds = $(tr).find('td');
                        $.ajax({
                            type: "POST",
                            url: "WebForm1.aspx/UpdateRow",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                'RecordID': $(tds[0]).text(),
                                'InitiatingReason': $(tds[5]).find('select').val(),
                                'IssueOrigin': $(tds[6]).find('select').val(),
                                'IssueDesc': $(tds[7]).find('textarea').val()
                            }),
                            success: function (msg) {
                                alert(msg.d);
                            }
                        });
                    }
                );

                $('th').click(function () {
                    $('th').each(function () {
                        $(this).css('color', 'black');
                    });
                    $(this).css('color', 'red');
                    var table = $(this).parents('table').eq(0)
                    var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
                    this.asc = !this.asc
                    if (!this.asc) { rows = rows.reverse() }
                    for (var i = 0; i < rows.length; i++) { table.append(rows[i]) }
                })
                function comparer(index) {
                    return function (a, b) {
                        var valA = getCellValue(a, index), valB = getCellValue(b, index)
                        return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB)
                    }
                }
                function getCellValue(row, index) { return $(row).children('td').eq(index).text() }
                function filter() {
                    var count = 0;
                    var site = $('#filter_site').val();
                    var subcode = $('#filter_subcode').val();
                    $("tbody tr").filter(function () {
                        if (site == '' && subcode == '') {
                            $(this).toggle(true);
                            return;
                        }
                        var site_txt = $(this).find('td:nth-child(11)').text();
                        var subcode_txt = $(this).find('td:nth-child(5)').text();
                        var flag = false;
                        if (site == '') {
                            if (subcode_txt == subcode) {
                                flag = true;
                            }
                        }
                        else if (subcode == '') {
                            if (site_txt == site) {
                                flag = true;
                            }
                        } else {
                            if (site_txt == site &&
                                subcode_txt == subcode) {
                                flag = true;
                            }
                        }

                        $(this).toggle(flag);
                    });
                    count = $('tbody tr:visible').length;
                    $('#count').text(count);
                }
            });
        </script>
    </div>
</body>

</html>