<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="SparePartsReport.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.SparePartsReport1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-box hor-icon mr-2"></i>Spare
                Parts Report</a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        
    </div>
<!--page-header closed-->


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

                     <div id="example_filter" class="dataTables_filter">

                        <asp:Label ID="lblSearch" runat="server" Text="Search :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control form-control-sm" AutoPostBack="True"
                        
                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                        </div>
                        </div>

                        <br />
                        <br />
                        <asp:GridView ID="gvSpareParts" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" >
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
                               <%-- <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>


                 <div class="card-footer">
    <div class="mb-0">
    <div class ="pull-right">

   

        <asp:Button ID="btnPrint" runat="server" Text="Print" 
            class="btn btn-primary m-b-5 m-t-5" onclick="btnPrint_Click" />
        <CR:CrystalReportViewer ID="rptvewSpareParts" runat="server" AutoDataBind="true" />

         </div>
      
    
    </div>
        
    
    </div>




            </div>
        </div>
    </div>


        <!-- GridView Closed -->
</asp:Content>
