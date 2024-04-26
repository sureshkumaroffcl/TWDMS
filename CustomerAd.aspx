<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="CustomerAd.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.CustomerAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-user hor-icon mr-2"></i>Customer
               </a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        
    </div>
<!--page-header closed-->

 <!-- Card Modal open -->
    <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Customer</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- Card Modal Closed -->

    <!-- Message Modal Open-->
    <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="example-Modal3">
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                    <div class="form-group row">
                        <%-- <asp:Label ID="lblCusID" runat="server" Text="Customer ID :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtCusID" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>

                    <asp:Label ID="lblCusName" runat="server" Text=" Customer Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtCusName" runat="server" class="form-control"></asp:TextBox>

                        </div>

                         <asp:Label ID="lblGender" runat="server" Text="Gender :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                         <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        </div>

                        <div class="form-group row">

                        <asp:Label ID="lblDOB" runat="server" Text="Date of Birth :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDOB" runat="server" class="form-control" name="date"  TextMode="Date"></asp:TextBox>
                    </div>

                    <asp:Label ID="lblPhoneNo" runat="server" Text="Phone No:" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtPhoneNo" runat="server" class="form-control" TextMode="Phone" ></asp:TextBox>
                        </div>
                        </div>

                        <div class="form-group row">


                        <asp:Label ID="lblAadharNo" runat="server" Text="Aadhar No:" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtAadharNo" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <asp:Label ID="lblDrivingLicenseNo" runat="server" Text="Driving License No:" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDrivingLicenseNo" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        </div>

                         <div class="form-group row">

                        <asp:Label ID="lblAddress" runat="server" Text="Address :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                             <asp:TextBox ID="txtAddress" runat="server"  class="form-control"  TextMode="MultiLine"></asp:TextBox>
                             </div>

                             <asp:Label ID="lblCusImg" runat="server" Text="Customer Image :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                  
                        <asp:FileUpload ID="fuCusImg" runat="server" class="form-control"/>

                        </div>
                        </div>

                         </form>
                </div>
                        <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
        </div>
       
        <!-- Message Modal closed -->

        <!-- GridView Open -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Customer Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" AutoPostBack="true"
                            onselectedindexchanged="gvCustomer_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        S.No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:TemplateField>


                                <asp:BoundField DataField="CusID" HeaderText="Customer No." 
                                    SortExpression="Customer ID" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="CusName" HeaderText="Customer Name" 
                                    SortExpression="Customer Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                                    SortExpression="Gender">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" 
                                    SortExpression="Date of Birth" DataFormatString="{0:dd-MM-yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." 
                                    SortExpression="Phone No" DataFormatString="{0:(###) ###-####}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="AadharNo" HeaderText="Aadhar No." 
                                    SortExpression="Phone No" DataFormatString="{0:#### #### ####}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="DrivingLicenseNo" HeaderText="Driving License No." 
                                    SortExpression="Driving License No" DataFormatString="{0:AA#-###-##-####}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Customer Image" HeaderStyle-CssClass="bg-primary">
                                    <ItemTemplate>
                                        <asp:Image ID="ImgCus" runat="server" ImageUrl='<%# (string) FormatImageUrl( (string) Eval("CusImage"))%>'
                                            Height="80px" Width="100px" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
