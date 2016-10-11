<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="University.PestanasUni.Teachers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div class="row">
        <br />
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="IdStuden" Visible="false"></asp:TextBox>
            <h3>Register Teacher</h3>         
       </div>
        <div class="col-md-4">
            <div class="col-md-4 col-md-offset-4">
                <asp:Label runat="server" ID="lbShow" ></asp:Label>
                <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Exit" OnClick="Unnamed_Click1" />
            </div>
        </div>
    </div>
    
   
    
    <div class="row">
  <div class="col-xs-6">
    <div class="container-fluid">
    <div class="form-horizontal">
    <div class="panel panel-default">
        <br />
        <%--Registration field of the Teachers--%>

    <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="ID" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>    
    </div>
     </div>
   
     <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="Name" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtNameT" runat="server" CssClass="form-control" placeholder="Name" ></asp:TextBox>    
    </div>
     </div>

      <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="Last Name" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtLastnameT" runat="server" CssClass="form-control" placeholder="Last Name" ></asp:TextBox>    
    </div>
     </div>

     <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="Email" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtEmailT" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>    
    </div>
     </div>

      <div class="form-group">
    <asp:Label runat="server" for="inputEmail"  CssClass="col-md-2 control-label" Text="Contact" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtContactT" runat="server" CssClass="form-control" placeholder="Contact" ></asp:TextBox>    
    </div>
     </div>

      <%--  Button--%>

         <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
      <asp:Button OnClick="Unnamed_Click" runat="server" Text="Submit" CssClass="btn btn-primary" />
      </div>
      </div>

</div>
</div>
</div>
      
      </div>

       <%-- DataGrid Teachers Modification--%>

        <div class="form-Horizontal">
        <asp:GridView runat="server" ID="TeacherGv" CssClass="table table-hover table-striped" GridLines="None"
        AutoGenerateColumns="false"  OnRowEditing="TeachersGv_RowEditing" OnRowCancelingEdit="TeachersGV_RowCancelingEdit"
        OnrowUpdating="TeachersGV_RowUpdating" DataKeyNames="Teacher_ID" OnRowDeleting="TeachersGV_RowDeleting">
            <Columns>


         <asp:BoundField HeaderText="Teacher_ID" DataField="Teacher_ID" ReadOnly="true" />

        <asp:TemplateField HeaderText="Name" Visible="true">
            <ItemTemplate>
                <asp:Label runat="server" ID="name" Text='<%# Eval("Name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTeacherName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

                <asp:TemplateField HeaderText="LastName" Visible="true">
            <ItemTemplate>
                <asp:Label runat="server" ID="LastName" Text='<%# Eval("LastName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTeacherLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
         
                <asp:TemplateField HeaderText="Email" Visible="true">
            <ItemTemplate>
                <asp:Label runat="server" ID="Email" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTeacherEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact" Visible="true">
            <ItemTemplate>
                <asp:Label runat="server" ID="Contact" Text='<%# Eval("Contact") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTeacherContact" runat="server" Text='<%# Eval("Contact") %>'></asp:TextBox>
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

    
           
  


   
</asp:Content>
