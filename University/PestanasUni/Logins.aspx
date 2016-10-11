<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logins.aspx.cs" Inherits="University.PestanasUni.Logins" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
         <div class="row margin-20">
              <br />
              <br />
                <asp:Label runat="server" ID="lblsesion" ></asp:Label>
                    <div class="col-md-6 col-md-offset-3">
                                      
                   <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1defaut" data-toggle="tab">Students</a></li>
                            <li><a href="#tab2defaut" data-toggle="tab">Advisors</a></li>
                            
                           
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1defaut">
                             <div class="col-md-6 col-md-offset-3">
                                 <div class="form-group">
                                     <asp:label runat="server" AssociatedControlID="Txtuser" CssClass="control-label" Text="Username"></asp:label>
                                     <%-- <input name="txtcontr" type="password" id="txtcontr" class="form-control" autocomplete="off" />--%>
                                 <asp:TextBox ID="Txtuser" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                      </div>
                           <div class="form-group">
                                <asp:label runat="server" AssociatedControlID="txtpass" CssClass="control-label" Text="Password"></asp:label>
                              <%--  <input runat="server" type="text" id="txtcontraseñ" class="form-control" autocomplete="off" />--%>
                               <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                           </div> 
                                                    
                             <asp:Button runat="server" OnClick="Unnamed_Click1" CssClass="btn btn-primary" Text="Submit" />
                         
                         </div>

                        </div>
                        <div class="tab-pane fade" id="tab2defaut">
                           <div class="col-md-6 col-md-offset-3">
                             <div class="form-group">
                                
                                     <asp:label runat="server" AssociatedControlID="txtUserAdvisor" id="lblUsuarioAut" CssClass="control-label" Text="UserName"></asp:label>
                                      <%--<input name="txtUsuarioAut" type="email" id="txtUsuarioAut" class="form-control" autocomplete="off" />--%>
                                       <asp:TextBox ID="txtUserAdvisor" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                           </div>

                            <div class="form-group">
                                  <asp:label runat="server" AssociatedControlID="txtpasswordAdvisor" id="lblcontraseAut" CssClass="control-label" Text="Password"></asp:label>
                                <%--<input name="txtcontraseñaAut" type="password" id="txtcontraseñaAut" class="form-control" autocomplete="off" />--%>
                                  <asp:TextBox ID="txtpasswordAdvisor" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>                  
                            </div>

                                <asp:Button runat="server" OnClick="Unnamed_Click" CssClass="btn btn-primary" Text="Submit" />

                               </div>
                         
                        </div>
                      
                        
                    </div>
                </div>
            </div>
                  <asp:Label ID="Message" runat="server" ForeColor="Red"></asp:Label>         

                    </div>           
</div>

    </div> 


</asp:Content>
