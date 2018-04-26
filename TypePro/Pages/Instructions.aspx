<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructions.aspx.cs" Inherits="TypePro.Pages.Instructions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Typing System</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
    <script src="/assets/js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div><br /></div>    
    <div class="breadcrumbs">
        <div class="container">
            <h1 style="text-align : center;">TYPING SYSTEM </h1>
        </div>
    </div>
    <div><br /></div>
    <div class="container content">
        <div class="row magazine-page">
            <div class="col-lg-12 border">
                <div class="row">
                    <div class="col-md-4">
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Personal Information </legend>
                            <div class="control-group">
                                <div class="row">
                                    <div class="col-md-5">
                                        <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;">Roll No. :-</span></label>

                                    </div>

                                    <div class="col-md-7" style="font-weight: bold; font-size: 15px;">

                                        <asp:Label ID="lblrollno" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5">
                                        <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;">Name :-</span></label>

                                    </div>

                                    <div class="col-md-7" style="font-weight: bold; font-size: 15px;">

                                        <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                    </div>
                    <div class="col-md-4">
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Organizational Information  </legend>
                            <div class="control-group">
                                <div class="row" style="text-align: center;">

                                    <div class="col-md-12">
                                        <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;">Typing Test for recruitment to post of LDCs and Stenographers</span></label>

                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-md-4">
                        <fieldset class="scheduler-border">
                            <legend class="scheduler-border">Time Remain Information </legend>
                            <div class="control-group">
                                <div class="row" style="text-align: center;">

                                    <div class="col-md-12">
                                        <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;">Time Remains : </span></label>

                                    </div>
                                    <div class="col-md-12" style="font-weight: bold; font-size: 15px;">
                                        <asp:Label ID="lbltime" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="row" style="padding-top: 20px;">
                    <div class="col-md-8" style="box-shadow: 0px 2px 25px rgba(0, 0, 0, .25); padding-bottom: 60px;">
                        <div class="col-md-12" style="padding-left: 20px; padding-right: 20px; font-size: 18px; padding: 15px; border-bottom: 2px dotted;">
                            INSTRUCTIONS
                        </div>
                        <div class="col-md-12" style="padding-left: 20px; padding-right: 20px; font-size: 13px;">                           
                                <h4><u></u></h4>
                                <ol>
                                    <li>
                                        <p>The Test is for <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> Minutes, starting from whenever you click the <b>START TEST</b> button.</p>
                                    </li>
                                    <li>
                                        <p>DO not give extra Space between words.</p>
                                    </li>
                                    <li>
                                        <p>
                                            The passage given should be typed only once. if you finish the typing before the time finishes, click save button.
                                        </p>
                                    </li>
                                    <li>
                                        <p>
                                            Remember,once you click save,you will not be able to edit you typed text.                   
                                        </p>
                                    </li>
                                    <li>
                                        <p>
                                            If the time finishes before you complete the passage the typed text will automatically be saved.                    
                                        </p>
                                    </li>
                                    <li>
                                        <p>Click Print Results button and then take a print out.</p>
                                    </li>                                                
                                </ol>

                        </div>
                    </div>

                    <div class="col-md-4" style="vertical-align: central; padding-top: 50px;">
                        <div class="row">
                            <div class="col-md-12"><label> Select Templete </label></div>
                            <div class="col-md-6 col-xs-6"><label id="selectTemplet1" style="padding : 2px; border : 1px solid #ccc; background-color : #6495ed;" onclick="selectTempletType(1);">
                                <img src="/assets/img/part1.png"  style="width : 100px; height : 60px;"  onclick="selectTempletType(1);" />
                                <asp:Label ID="lbltemp1" runat="server" Text="1" Visible="false"></asp:Label>
                            </label></div>
                            <div class="col-md-6 col-xs-6"><label id="selectTemplet2" style="padding : 2px; border : 1px solid #ccc; background-color : #fff;" onclick="selectTempletType(2);">
                                <img src="/assets/img/part2.png"  style="width : 100px; height : 60px;" onclick="selectTempletType(2);" />
                                <asp:Label ID="lbltemp2" runat="server" Text="2" Visible="false"></asp:Label>
                            </label></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12"><label>Select Type</label></div>
                            <div class="col-md-12">
                            <asp:DropDownList ID="ddltime" runat="server" CssClass="form-control" >
                                <asp:ListItem Text="With Passage" Value="1">With Passage</asp:ListItem>
                                <asp:ListItem Text="Without Passage" Value="2">Without Passage</asp:ListItem>
                            </asp:DropDownList></div>
                        </div>
                        <div class="col-md-12" style="vertical-align: top; padding-top: 50px;"><div class="col-md-12">
                            <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Start Test" OnClick="Button1_Click" /></div>
                        </div>
                    </div>
                    
                <br />                
            </div><br />
        </div>
    </div>
    </div>
    <div>
        <footer>
            <label style="text-align: center; background-color: #ccc; width: 100%; border: 1px solid #bbb; padding: 5px; margin: 5px 0px 5px 0px;">&copy;2018 MG Group
            </label>
        </footer>
    </div>
    </form>
    <script>
        function selectTempletType(x) {
            var labelId = $("#selectTemplet" + x);
            labelId.attr("style", "padding : 2px; border : 1px solid #ccc; background-color : #6495ed;");
            if (x == 1) {
                $("#selectTemplet2").attr("style", "padding : 2px; border : 1px solid #ccc; background-color : #fff;");
            }
            else {
                $("#selectTemplet1").attr("style", "padding : 2px; border : 1px solid #ccc; background-color : #fff;");
            }
        }
    </script>
</body>
</html>

