<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="University.PestanasUni.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div class="container-fluid">
    <div class="form-horizontal">
         
    <div class="row">
    <div class="col-xs-6">

         <div class="panel-body">
      <br />

    <h1 class="text-center">UNIVERSITY OF MIAMI</h1>

      <br />
  </div>
       <%-- Image--%>

     <img src="/images/schoolbuilding.jpg" />  

    </div>
        <%--Registration Fields--%>

    <div class="col-xs-6">
    <h3 class="text-center">Register Student </h3>
    <div class="panel panel-default">
    <div class="panel-body">
    <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="Student Id" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control" ></asp:TextBox>    
    </div>
     </div>

     <div class="form-group">
      <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label" Text="Name" ></asp:Label>
      <div class="col-md-10">
       <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ></asp:TextBox>    
       </div>
      </div>

      <div class="form-group">
      <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label" Text="Last Name" ></asp:Label>
      <div class="col-md-10">
      <asp:TextBox ID="txtLastname" runat="server" CssClass="form-control" ></asp:TextBox>    
      </div>
      </div>

         <div class="form-group">
      <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label" Text="Student Username" ></asp:Label>
      <div class="col-md-10">
      <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control" ></asp:TextBox>    
      </div>
      </div>

        <div class="form-group">
      <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label" Text="Student Password" ></asp:Label>
      <div class="col-md-10">
      <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" ></asp:TextBox>    
      </div>
      </div>


      <div class="form-group">
      <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label" Text="Advisor ID" ></asp:Label>
      <div class="col-md-6">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="ddlAdvisor">
      </asp:DropDownList>
      </div> 
      </div>
        <%--Button--%>
      <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
      <asp:Button OnClick="Unnamed_Click"  runat="server" Text="Submit" CssClass="btn btn-primary" />
      </div>
      </div>
      </div>
      </div>
           
  

       <%-- DataGridView With Modifications--%>

    </div>
        <div class="form-Horizontal">
        <asp:GridView runat="server" ID="Student" CssClass="table table-hover table-striped" GridLines="None"
        AutoGenerateColumns="false" OnRowEditing="Student_RowEditing" OnRowCancelingEdit="Student_RowCancelingEdit"  
        OnrowUpdating="Student_RowUpdating" DataKeyNames="Id_Student" OnRowDeleting="Student_RowDeleting">
        <Columns>

       

        <asp:BoundField HeaderText="Student Id" DataField="Id_Student"  ReadOnly="true" />

      <asp:TemplateField HeaderText="Names" Visible="true">
          <ItemTemplate>
              <asp:Label runat="server" ID="lbnombr" Text='<%# Eval("Name") %>'> </asp:Label>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox ID="txtStudentName" runat="server" Text='<%# Eval("Name") %>'> </asp:TextBox>
          </EditItemTemplate>
      </asp:TemplateField>
            <asp:TemplateField HeaderText="LastNames" Visible="true">
         <ItemTemplate>
             <asp:Label runat="server" ID="LastName" Text='<%# Eval("LastName") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox runat="server" ID="txtLastname" Text='<%# Eval("LastName")%>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>
         <asp:TemplateField HeaderText="AdvisorID" Visible="true">
         <ItemTemplate>
             <asp:Label runat="server" ID="AdvisorID" Text='<%# Eval("AdvisorID") %>'></asp:Label>
         </ItemTemplate>
         <EditItemTemplate>
             <asp:TextBox runat="server" ID="ddlAdvisor" Text='<%# Eval("AdvisorID")%>'></asp:TextBox>
         </EditItemTemplate>
     </asp:TemplateField>


            <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="lnkdelete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
           </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton runat="server" ID="lnkModify" Text="Modify" CommandName="Update"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkCancel" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
           </EditItemTemplate>
        </asp:TemplateField>

        </Columns>
      </asp:GridView>
     </div>
    </div>

  </div>
    </div>
</asp:Content>
