<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TypingPassage.aspx.cs" Inherits="TypePro.Pages.TypingPassage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Typing System</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
    <script src="/assets/js/jquery.min.js"></script>

    <script>

        //function limit(who) {
        //      if (who.value.indexOf("  ") >= 0) {
        //          alert("input have more than one space between words !");
        //          //  who.value = '';
        //      }
        //  }
        //  function Scroll()
        //  {
        //      window.scroll(0,200);

        //  }





        function KeyWork(who) {
            if (event.keyCode === 9) {
                var v = who.value, s = who.selectionStart, e = who.selectionEnd;
                who.value = v.substring(0, s) + '\t' + v.substring(e);
                who.selectionStart = who.selectionEnd = s + 1;
                return false;
            }
            return true;
        }
        function Writetext() {
            document.getElementById("txtUserType").disabled = false;
            document.getElementById("txtUserType").focus();
        }
        function AllowAlphabet(e) {
            keyEntry = (e.keyCode) ? e.keyCode : e.which;
            if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || keyEntry == '8' || keyEntry == '9')
                return true;
            else
                return false;
        }
    </script>
</head>
<body>

    <form id="form2" runat="server">
        <div>
            <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
            <asp:Timer ID="timer1" runat="server" Interval="1000" OnTick="timer1_Tick" ViewStateMode="Enabled"></asp:Timer>
            <asp:Timer ID="timer2" runat="server" Interval="100" OnTick="timer2_Tick"></asp:Timer>
        </div>
        <%--<div align="center" id="webtest1" style="display: block;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="border-bottom: 2px solid #354562; padding: 4px" class="titlec">Typing Test System
                    <div style="text-align: right;">

                        <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="New Test" OnClick="Button1_Click1" />
                        <asp:Button ID="Button4" runat="server" class="btn btn-success" Text="Print Results" OnClientClick="window.print();" />

                    </div>
                    </td>
                </tr>
            </table>
        </div>--%>
        <div id="contentPersonal">
            <div class="container content">
                <div class="row magazine-page">
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
                                    <%--<div style="min-height: 24px;"></div>--%>

                                </div>
                            </fieldset>

                        </div>
                        <div class="col-md-4">
                            <fieldset class="scheduler-border">
                                <legend class="scheduler-border">Organizational Information  </legend>
                                <div class="control-group">
                                    <%--<div class="row" style="text-align: center;">

                                        <div class="col-md-12">
                                            <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;"></span></label>

                                        </div>




                                    </div>--%>
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
                                            <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;">Time Remain : </span></label>

                                            <asp:UpdatePanel ID="updPnl" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblTimer" runat="server" Font-Bold="True" Font-Names="Arial"
                                                        Font-Size="X-Large" ForeColor="#6600CC" ViewStateMode="Enabled"></asp:Label>

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="timer1" EventName="Tick" />
                                                    <asp:PostBackTrigger ControlID="timer2" />
                                                    <%-- <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"/>--%>
                                                </Triggers>
                                            </asp:UpdatePanel>



                                        </div>



                                    </div>
                                   <%-- <div style="min-height: 30px;">
                                         <form id="ggg" runat="server">
                                        <asp:Label ID="myID" runat="server"></asp:Label>
                                    </form>
                                    </div>--%>





                                </div>
                            </fieldset>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" >
            <tr id="passive" runat="server" visible="false" style="display: none">
                <td style="border-bottom: 1px dotted #860E36; padding: 4px" class="titlea" background="/assets/img/Lt_Red_Back.gif" width="460">Accurately and precisely 
													evaluate your typing speed 
													and accuracy.</td>

            </tr>
            <tr style="display: none">

                <td style="padding: 4px" class="bodya" colspan="2"></td>

            </tr>
            <tr>
                <td style="padding: 4px" class="bodya" colspan="2">

                    <form name="JobOp">
                        <table border="0" cellpadding="5" width="100%"  style=" border-collapse: separate; border-spacing: 10px;">

                            <tr>
                                <td>
                                    <div class="control-group" id="ppinfo" style="display: none;">


                                        <table width="100%">
                                            <tr>
                                                <td width="30%">
                                                    <img src="/assets/img/1.jpg" height="80px" />
                                                </td>
                                                <td width="70%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>Roll No. :</td>
                                                            <td>
                                                                <asp:Label ID="lblroll1" runat="server" Text="Label"></asp:Label></td>
                                                            <td>Name :-</td>
                                                            <td>
                                                                <asp:Label ID="lblname1" runat="server" Text="Label"></asp:Label></td>

                                                        </tr>
                                                    </table>
                                                </td>

                                            </tr>


                                        </table>

                                        <div style="min-height: 24px;"></div>
                                    </div>
                                    <p style="margin-top: 0; margin-bottom: 0">
                                        <font color="#000000" face="Arial" size="1">
                                            <textarea id="Textarea1" runat="server" disabled  name="typed" cols="53" rows="25" wrap="soft" spellcheck="false" style="width: 100%; border: 1px solid #344270; padding: 2px; font-family: Arial; font-size: 13pt"></textarea></font>
                                    </p>
                                    

                                </td>
                                <%-- </tr>
                        <tr>--%>
                                <td style="font-family: Arial; font-size: 9pt">
                                    <div id="typeArea" style="display: block;">
                                        <table border="0" width="100%" cellspacing="1" style="display : none;">
                                            <tr>
                                                <td style="border: 1px solid #9CA8D1; background-color: #EAECF4">
                                                    <div align="left">
                                                        <table id="stProg" border="0" width="0%" cellspacing="1">
                                                            <tr>
                                                                <td style="border: 1px solid #344270; background-color: #8F9BCB; font-family: Arial; font-size: 8pt; color: #FFFFFF" align="right" background="/assets/img/Blue_Back.gif">
                                                                    <div style="display: none;" id="thisProg">0%</div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>



                                        <p style="margin-top: 0; margin-bottom: 0">
                                            <font color="#000000" face="Arial" size="1">
                                            <textarea id="txtUserType" runat="server"  onkeydown="if (event.keyCode == 9)
                                                   {
                                                    var tabcount=0;
                                                     var v = this.value, s = this.selectionStart, e = this.selectionEnd;
                                                     this.value = v.substring(0, s) + '\t' + v.substring(e);
                                                     this.selectionStart = this.selectionEnd = s + 1;
                                                     return false;
                                                    }; " 
                                                   name="typed" cols="53" rows="25" wrap="soft" spellcheck="false" style="width: 100%; border: 1px solid #344270; padding: 2px; font-family: Arial; font-size: 13pt"   ></textarea></font>
                                        </p>

                                    </div>
                                    <div id="afterAction" style="display: none">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="Trialstart">
                                        <p align="center" style="margin-top: 0; margin-bottom: 2px">

                                            <asp:Button ID="Button2" OnClientClick="Scroll();" runat="server" Text="Start  Typing Test" OnClick="Button1_Click" Style="display: block; border-left: 1px solid #293358; border-right: 2px solid #293358; border-top: 1px solid #293358; border-bottom: 2px solid #293358; width: 20%; background-color: #9BB892; color: #FFFFFF; background-image: url('/assets/img/Green_Back.gif')" />

                                            <asp:Button ID="Button3" runat="server" Text="End  Typing Test" OnClick="Button2_Click" Style="border-left: 1px solid #293358; border-right: 2px solid #293358; border-top: 1px solid #293358; border-bottom: 2px solid #293358; width: 20%; background-color: #F05959; color: #FFFFFF; background-image: url('/assets/img/Red_Back.gif')" />

                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="result" style="">
                                        <table width="100%" style="font-weight: 600;" cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td>Total Strokes :- </td>
                                                <td>
                                                    <div id="divtotalstock" runat="server">Waiting...</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Running Speed :- </td>
                                                <td>
                                                    <div id="divrunningspeed" runat="server">Waiting...</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Mistake :- </td>
                                                <td>
                                                    <div id="divMistake" runat="server">Waiting...</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Net Speed :- </td>
                                                <td>
                                                    <div id="divnetspeed" runat="server">Not Started</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Net Time :- </td>
                                                <td>
                                                    <div id="timemain" runat="server">Not Started</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Accuarcy :- </td>
                                                <td>
                                                    <div id="divaccurecy" runat="server">Waiting...</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Missing :- </td>
                                                <td>
                                                    <div id="divMissing" runat="server">Waiting...</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Extra :- </td>
                                                <td>
                                                    <div id="divExtra" runat="server">Waiting...</div>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div id="divColor" runat="server"></div>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <table style="font-weight: 600;" cellpadding="5" cellspacing="5" width="20%">

                                                        <tr>




                                                            <td colspan="2">
                                                                <b>NOTE :- </b>
                                                            </td>

                                                        </tr>
                                                        <tr>




                                                            <td colspan="2"></td>

                                                        </tr>
                                                        <tr>




                                                            <td>Extra Words Color :-
                                                            </td>
                                                            <td style="background-color: green; width: 20px"></td>

                                                        </tr>
                                                        <tr>




                                                            <td colspan="2">&nbsp;
                                               
                                                            </td>

                                                        </tr>
                                                        <tr>




                                                            <td>Missing Words Color :-
                                                            </td>
                                                            <td style="background-color: blue; width: 20px"></td>
                                                        </tr>

                                                        <tr>
                                                            <tr>


                                                                <td colspan="2">&nbsp;
                                                                </td>

                                                            </tr>


                                                            <td>Mistake Words Color :-
                                                            </td>
                                                            <td style="background-color: red; width: 20px"></td>
                                                        </tr>


                                                    </table>
                                                </td>

                                            </tr>

                                        </table>

                                    </div>
                                    <div style="display: none;">
                                        <table border="0" cellpadding="5" width="100%">
                                            <tr>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Words</font></b></td>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Gross WPM</font></b></td>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Net WPM</font></b></td>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Entry Errors</font></b></td>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Accuracy</font></b></td>
                                                <td align="center" style="border-left: 1px solid #344270; border-right: 2px solid #344270; border-top: 1px solid #344270; border-bottom: 2px solid #344270; padding: 5px; background-color: #CED3E8" background="/assets/img/Blue_Back.gif">
                                                    <b><font face="Arial" size="2" color="#FFFFFF">Elapsed / 
				Remaining</font></b></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><font size="2" face="Arial">
                                            
                                        </font></td>
                                                <td style="border-left: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center"><font size="2" face="Arial">
                                            
                                        </font></td>
                                                <td style="border-left: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center"><font size="2" face="Arial">
                                           
                                        </font></td>
                                                <td style="border-left: 1px dotted #8794C7; border-right: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center">
                                                    <font size="2" face="Arial">
                                                
                                            </font></td>
                                                <td style="border-left-width: 1px; border-right: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center">
                                                    <font size="2" face="Arial">
                                                
                                            </font></td>
                                                <td align="center"><font size="2" face="Arial">
                                            
                                        </font></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            

                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
