<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="SparePartsAd.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.SparePartsAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-box hor-icon mr-2"></i>Spare
                Parts</a></li>
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
                        Spare Parts</h4>
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
                        <%-- <asp:Label ID="lblSparePartID" runat="server" Text="SparePart ID :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSparePartID" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>
                        <asp:Label ID="lblSparePartName" runat="server" Text=" Spare Part Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtSparePartName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <asp:Label ID="lblDescription" runat="server" Text="Description :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlManufacturer" runat="server" class="form-control">
                                <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                                <asp:ListItem Value="1">Kinetic Green</asp:ListItem>
                                <asp:ListItem Value="2">Honda</asp:ListItem>
                                <asp:ListItem Value="3">TVS</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Label ID="lblVehicleType" runat="server" Text="Vehicle Type :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlVehicleType" runat="server" class="form-control">
                                <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                                <asp:ListItem Value="1">Bike</asp:ListItem>
                                <asp:ListItem Value="2">Electric Scooter</asp:ListItem>
                                <asp:ListItem Value="3">Scooter</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="lblYearFrom" runat="server" Text="Year From :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fe fe-calendar hor-icon"></i>
                                </div>
                                <asp:TextBox ID="txtYearFrom" runat="server" class="year form-control"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Label ID="lblYearTo" runat="server" Text="Year To :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fe fe-calendar hor-icon"></i>
                                </div>
                                <asp:TextBox ID="txtYearTo" runat="server" class="year form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="lblPrice" runat="server" Text="Price :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPrice" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary"
                        OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- Message Modal Closed -->

    <!-- GridView Open -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Spare Parts Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvSpareParts" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" OnSelectedIndexChanged="gvSpareParts_SelectedIndexChanged">
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
                                <asp:BoundField DataField="SparePartID" HeaderText="SparePart No." SortExpression="SparePart ID"
                                    HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SpareName" HeaderText="Spare Part Name" SortExpression="Spare Part Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Manufacture" HeaderText="Manufacture" SortExpression="Manufacture">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" SortExpression="VehicleType">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="YearFrom" HeaderText="YearFrom" SortExpression="YearFrom"
                                    DataFormatString="{0:yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="YearTo" HeaderText="YearTo" SortExpression="YearTo" DataFormatString="{0:yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
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

       <!-- GridView Closed -->
</asp:Content>
