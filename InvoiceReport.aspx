<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="InvoiceReport.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.InvoiceReport1" %>

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
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-file-text hor-icon mr-2"></i>Invoice Report
               </a></li>
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
                        Invoice Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                   <%-- <div class="col-sm-12 col-md-6">--%>

                    <div id="example_filter" class="dataTables_filter">

                        <asp:Label ID="lblSearch" runat="server" Text="Search :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control form-control-sm" AutoPostBack="True"
                        
                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                        </div>
                   
                   
                    </div>
                    <br />
                    <br />

                        <asp:GridView ID="gvInvoice" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" 
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" AutoPostBack="true"  >
                              
                            
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

                                <asp:BoundField DataField="InvoiceID" HeaderText="Invoice No." 
                                    SortExpression="Invoice ID" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="bg-primary">
            <ItemTemplate>
                <asp:Label ID="CusName" runat="server" Text='<%# Eval("CusName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>



        <asp:TemplateField HeaderText="Vehicle Name" HeaderStyle-CssClass="bg-primary">
            <ItemTemplate>
                <asp:Label ID="vehicleName" runat="server" Text='<%# Eval("VehicleName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>



        <asp:BoundField DataField="InvoiceDate" HeaderText="Invoice Date" 
                                    SortExpression="Invoice Date" DataFormatString="{0:dd-MM-yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>


                                <asp:BoundField DataField="SalesPrice" HeaderText="Sales Price" 
                                    SortExpression="Sales Price" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="CGST" HeaderText="CGST" 
                                    SortExpression="CGST" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                
                                <asp:BoundField DataField="SGST" HeaderText="SGST" 
                                    SortExpression="CGST" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" 
                                    SortExpression="Total Price" DataFormatString="{0:C2}">
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

        <CR:CrystalReportViewer ID="rptvewInvocie" runat="server" AutoDataBind="true" />

    </div>
      
    
    </div>
        
    
    </div>




            </div>
        </div>
    </div>


        <!-- GridView Closed -->



</asp:Content>
