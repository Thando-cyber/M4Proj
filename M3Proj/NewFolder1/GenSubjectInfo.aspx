﻿<%@ Page Title="Subject Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenSubjectInfo.aspx.cs" Inherits="M3Proj.GenSubjectInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-xxl position-relative p-0">        
        <div class="container-xxl bg-primary page-header">
            <div class="container text-center">
                <h1 class="text-white animated zoomIn mb-3">General Subject Information</h1>   
            </div>
        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="subject_ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="854px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="subject_name" HeaderText="Subject" SortExpression="subject_name" />
            <asp:BoundField DataField="subject_ID" HeaderText="Code" ReadOnly="True" SortExpression="subject_ID" />
            <asp:BoundField DataField="subjDetails" HeaderText="Details" SortExpression="subjDetails" />
            <asp:BoundField DataField="Divis" HeaderText="Division" SortExpression="Divis" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupPmb2ConnectionString %>" DeleteCommand="DELETE FROM [subjects] WHERE [subject_ID] = @original_subject_ID AND [subject_name] = @original_subject_name AND [subjDetails] = @original_subjDetails AND [Divis] = @original_Divis" InsertCommand="INSERT INTO [subjects] ([subject_ID], [subject_name], [subjDetails], [Divis]) VALUES (@subject_ID, @subject_name, @subjDetails, @Divis)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [subjects] ORDER BY [subject_name], [subject_ID]" UpdateCommand="UPDATE [subjects] SET [subject_name] = @subject_name, [subjDetails] = @subjDetails, [Divis] = @Divis WHERE [subject_ID] = @original_subject_ID AND [subject_name] = @original_subject_name AND [subjDetails] = @original_subjDetails AND [Divis] = @original_Divis">
        <DeleteParameters>
            <asp:Parameter Name="original_subject_ID" Type="String" />
            <asp:Parameter Name="original_subject_name" Type="String" />
            <asp:Parameter Name="original_subjDetails" Type="String" />
            <asp:Parameter Name="original_Divis" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="subject_name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" Name="subject_ID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox3" Name="subjDetails" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBox4" Name="Divis" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="subject_name" Type="String" />
            <asp:Parameter Name="subjDetails" Type="String" />
            <asp:Parameter Name="Divis" Type="String" />
            <asp:Parameter Name="original_subject_ID" Type="String" />
            <asp:Parameter Name="original_subject_name" Type="String" />
            <asp:Parameter Name="original_subjDetails" Type="String" />
            <asp:Parameter Name="original_Divis" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div style="text-align:center;">
        <asp:Label ID="name" runat="server" Text="Subject Name: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="code" runat="server" Text="Subject Code: "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="details" runat="server" Text="Subject Details: "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="div" runat="server" Text="Division associated with subject: "></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Add Subject" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
