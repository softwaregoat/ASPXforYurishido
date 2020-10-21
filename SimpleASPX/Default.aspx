<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimpleASPX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        input{
            width:100px;
        }
    </style>
    <div class="row">
        <h1>Generate Defect Number</h1>
        <p class="lead" style="color:red;">**PLEASE NOTE THE UNIQUE IDENTIFIER FORMAT HAS CHANGED**</p>
    </div>
    <div class="row">
        <label for="site">Filter:</label>
        <input id="myInput" type="text" placeholder="Search..">
        <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
    </div>
    <div class="row  justify-content-center ">
         <p class="lead" style="color:red;">Add a new Unique ID</p>
        <form class="form" >
            <div class="form-group">
                <label for="site">Site:</label>
                <select id="site" class="form-control"  runat="server"/>
              </div>
              <div class="form-group">
                <label for="program">Program:</label>
                <select id="program" class="form-control"  runat="server"/>
              </div>
              <div class="form-group">
                <label for="subcode">Program Subcode:</label>
                <asp:TextBox ID="subcode" runat="server" class="form-control"></asp:TextBox>
              </div>
              <div class="form-group">
                <label for="reason">Reason for Defect Notification:</label>
                <select id="reason" class="form-control"  runat="server"/>
              </div>
             <div class="form-group">
                <label for="issue">Issue Origin:</label>
                <select id="issue" class="form-control"  runat="server"/>
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
    <script>
        $(document).ready(function(){
              $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                  $("tbody tr").filter(function () {
                      var txt = '';
                      $(this).find('input').each(function (ii, em) {
                          txt += $(em).val();
                      });
                      txt += $(this).text();
                  $(this).toggle(txt.toLowerCase().indexOf(value) > -1)
                });
              });
            $("input.update").click(
                function () {
                    var tr = $(this).closest('tr');
                    var tds = $(tr).find('td');
                    $.ajax
                        ({
                            type: "POST",
                            url: "Table/Edit",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",  
                            data: JSON.stringify({
                                'RecordID': $(tds[0]).text(),
                                'InitiatingReason': $(tds[5]).find('input').val(),
                                'IssueOrigin': $(tds[6]).find('input').val(),
                                'IssueDesc': $(tds[7]).find('input').val()
                            }),
                            success: function (msg) {
                                alert(msg);
                            }
                        });
                }
            );
        });
    </script>
</asp:Content>
