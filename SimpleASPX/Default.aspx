<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimpleASPX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Generate Defect Number</h1>
        <p class="lead" style="color:red;">**PLEASE NOTE THE UNIQUE IDENTIFIER FORMAT HAS CHANGED**</p>
        <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
    </div>

    <div class="row">
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

</asp:Content>
