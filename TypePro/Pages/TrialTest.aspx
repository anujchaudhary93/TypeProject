<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrialTest.aspx.cs" Inherits="TypePro.Pages.TrialTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head runat="server">
    <title>Typing System</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>

<head id="Head1" runat="server">
    <title>Typing System</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <script language="JavaScript">
        //Holds whether or not we have already started the first typing test or now
        //	True = The test has already started
        //	False = The test hasn't started yet
        var hasStarted = false;

        //strToTest is an array object that holds various strings to be used as the base typing test
        //	- If you update the array, be sure to update the intToTestCnt with the number of ACTIVE testing strings
        var intToTestCnt = 1;
        var strToTest = new Array("Are you looking for an interactive and innovative website for your company? Are you looking for a reliable web designing company? Are you a start-up who has an incredible concept to launch but first you want a technical partner to create it for you? Your search ends here. We started our business as an Offshore Outsourcing company focused on Business Process Automation including Business Process Networking, IT Solutions, IT consultancy Services, and Project Management support. It includes management consulting, High End Technology like solutions, project & process management, tools & technology solutions and on-site & off-site services. We provide best in the market. Our training programs are customized keeping market trend in mind there by we are developing talent in the professionals so that they can fit in the market roles available. We believe in providing quality IT training, which focuses on practical’s and hence we are able to satisfy our customers by placing them in 500 fortune companies. We do market analysis and we keep tailoring and updating our IT courses. Search Engine Optimization is a modern technique for optimizing website in an efficient way in order to improve the visibility of that website on all major search engines. We carry out a meticulous analysis of our client's website by reviewing the web content as well as structure. We offer technical advice on certain technical barriers to like error pages or redirects or the use of JavaScript . We set up a list of pertinent keywords after thorough research on our client's site, their competitor's site using diverse keyword suggestion resources and tools. We specialize in promoting client's website on Geo-centered keywords by focusing on the target audience significant for our client's business. We are business people too, and like you we understand that every investment must produce results for your company.")
        var strToTestType = "";

        var checkStatusInt;

        //General functions to allow for left and right trimming / selection of a string
        function Left(str, n) {
            if (n <= 0)
                return "";
            else if (n > String(str).length)
                return str;
            else
                return String(str).substring(0, n);
        }
        function Right(str, n) {
            if (n <= 0)
                return "";
            else if (n > String(str).length)
                return str;
            else {
                var iLen = String(str).length;
                return String(str).substring(iLen, iLen - n);
            }
        }

        //beginTest Function/Sub initializes the test and starts the timers to determine the WPM and Accuracy
        function beginTest() {
            //We're starting the test, so set the variable to true
            hasStarted = true;

            //Generate a date value for the current time as a baseline
            day = new Date();

            //Count the number of valid words in the testing baseline string
            cnt = strToTestType.split(" ").length;

            //Set the total word count to the number of valid words that need to be typed
            word = cnt;

            //Set the exact time of day that the testing has started
            startType = day.getTime();

            //Disable the printing button (if used, in this download it's not included)
            document.getElementById("printB").disabled = true;

            calcStat();

            //Initialize the testing objects by setting the values of the buttons, what to type, and what is typed
            document.JobOp.start.value = "-- Trial Typing Test Started --";
            document.JobOp.start.disabled = true;
            document.JobOp.given.value = strToTestType;
            document.JobOp.typed.value = "";

            //Apply focus to the text box the user will type the test into
            document.JobOp.typed.focus();
            document.JobOp.typed.select();
        }

        //User to deter from Copy and Paste, also acting as a testing protection system
        //	Is fired when the user attempts to click or apply focus to the text box containing what needs to be typed
        function deterCPProtect() {
            document.JobOp.typed.focus();
        }

        //The final call to end the test -- used when the user has completed their assignment
        //	This function/sub is responsible for calculating the accuracy, and setting post-test variables
        function endTest() {
            //Clear the timer that tracks the progress of the test, since it's complete
            clearTimeout(checkStatusInt);

            //Initialize an object with the current date/time so we can calculate the difference	
            eDay = new Date();
            endType = eDay.getTime();
            totalTime = ((endType - startType) / 1000)

            //Calculate the typing speed by taking the number of valid words typed by the total time taken and multiplying it by one minute in seconds (60)
            //***** 1A *************************************************************************************************************************** 1A *****
            //We also want to disregard if they used a double-space after a period, if we didn't then it would throw everything after the space off
            //Since we are using the space as the seperator for words; it's the difference between "Hey.  This is me." versus "Hey. This is me." and
            //Having the last three words reporting as wrong/errors due to the double space after the first period, see?
            //*********************************************************************************************************************************************
            wpmType = Math.round(((document.JobOp.typed.value.replace(/  /g, " ").split(" ").length) / totalTime) * 60)

            //Set the start test button label and enabled state
            document.JobOp.start.value = ">> Re-Start Trial Typing Test <<";
            document.JobOp.start.disabled = false;

            //Flip the starting and stopping buttons around since the test is complete
            document.JobOp.stop.style.display = "none";
            document.JobOp.start.style.display = "block";

            //Declare an array of valid words for what NEEDED to be typed and what WAS typed
            //Again, refer to the above statement on removing the double spaces globally (1A)	
            var typedValues = document.JobOp.typed.value.replace(/  /g, " ");
            var neededValues = Left(document.JobOp.given.value, typedValues.length).replace(/  /g, " ").split(" ");
            typedValues = typedValues.split(" ");

            //Disable the area where the user types the test input
            document.JobOp.typed.disabled = true;

            //Declare variable references to various statistical layers
            var tErr = document.getElementById("stat_errors");
            var tscore = document.getElementById("stat_score");
            var tStat = document.getElementById("stat_wpm");
            var tStat1 = document.getElementById("stat_wpm1");
            var tStat2 = document.getElementById("stat_wpm2");

            var tTT = document.getElementById("stat_timeleft");

            var tArea = document.getElementById("TypeArea");
            var aArea = document.getElementById("AfterAction");
            var eArea = document.getElementById("expectedArea");

            //Initialize the counting variables for the good valid words and the bad valid words
            var goodWords = 0;
            var badWords = 0;
            var badWords1 = 0;

            //Declare a variable to hold the error words we found and also a detailed after action report
            var errWords = "";
            var aftReport = "<b>Detailed Summary:</b><br><font color=\"DarkGreen\">";

            //Enable the printing button
            document.getElementById("printB").disabled = false;

            //Loop through the valid words that were possible (those in the test baseline of needing to be typed)
            var str;
            var i = 0;
            for (var i = 0; i < word; i++) {
                //If there is a word the user typed that is in the spot of the expected word, process it
                if (typedValues.length > i) {
                    //Declare the word we expect, and the word we recieved
                    var neededWord = neededValues[i];
                    var typedWord = typedValues[i];

                    //Determine if the user typed the correct word or incorrect
                    if (typedWord != neededWord) {
                        //They typed it incorrectly, so increment the bad words counter
                        badWords = badWords + 1;
                        badWords1 = badWords / 5
                        errWords += typedWord + " = " + neededWord + "\n";
                        //aftReport += "<font color=\"Red\"><u>" + neededWord + "</u></font> ";
                        aftReport += neededWord;
                    }
                    else {
                        //They typed it correctly, so increment the good words counter
                        goodWords = goodWords + 1;
                        aftReport += neededWord + " ";
                    }
                }
                else {
                    //They didn't even type this word, so increment the bad words counter
                    //Update: We don't want to apply this penalty because they may have chosen to end the test
                    //		  and we only want to track what they DID type and score off of it.
                    //badWords = badWords + 1;
                }
            }

            //Finalize the after action report variable with the typing summary at the beginning (now that we have the final good and bad word counts)
            aftReport += "</font>";
            aftReport = "<b>Typing Summary:</b><br>You typed " + (document.JobOp.typed.value.replace(/  /g, " ").split(" ").length) + " words in " + totalTime + " seconds, a speed of about " + wpmType + " words per minute.\n\nYou also had " + badWords + " errors, and " + goodWords + " correct words, giving scoring of " + ((goodWords / (goodWords + badWords)) * 100).toFixed(2) + "%.<br><br>" + aftReport;

            //Set the statistical label variables with what we found (errors, words per minute, time taken, etc)	
            tErr.innerText = badWords + " Errors";
            tStat1.innerText = wpmType1;
            tStat2.innerText = wpmType + " WPM";
            tStat.innerText = (wpmType - badWords1) + " WPM ";
            //wpmType1 + " / " + (wpmType - badWords) + " WPM / " + wpmType + " WPM";
            tTT.innerText = totalTime.toFixed(2) + " sec. elapsed";

            //Calculate the accuracy score based on good words typed versus total expected words -- and only show the percentage as ###.##
            tscore.innerText = ((goodWords / (goodWords + badWords)) * 100).toFixed(2) + "%";

            //Flip the display of the typing area and the expected area with the after action display area
            aArea.style.display = "block";
            tArea.style.display = "none";
            eArea.style.display = "none";

            //Set the after action details report to the summary as we found; and in case there are more words found than typed
            //Set the undefined areas of the report to a space, otherwise we may get un-needed word holders
            aArea.innerHTML = aftReport.replace(/undefined/g, " ");

            //Notify the user of their testing status via a JavaScript Alert
            //Update: There isn't any need in showing this popup now that we are hiding the typing area and showing a scoring area
            //alert("You typed " + (document.JobOp.typed.value.split(" ").length) + " words in " + totalTime + " seconds, a speed of about " + wpmType + " words per minute.\n\nYou also had " + badWords + " errors, and " + goodWords + " correct words, giving scoring of " + ((goodWords / (goodWords+badWords)) * 100).toFixed(2) + "%.");
        }

        //calcStat is a function called as the user types to dynamically update the statistical information
        function calcStat() {
            //If something goes wrong, we don't want to cancel the test -- so fallback error proection (in a way, just standard error handling)
            try {
                //Reset the timer to fire the statistical update function again in 250ms
                //We do this here so that if the test has ended (below) we can cancel and stop it
                checkStatusInt = setTimeout('calcStat();', 250);

                //Declare reference variables to the statistical information labels
                var tStat = document.getElementById("stat_wpm");
                var tTT = document.getElementById("stat_timeleft");

                var tProg = document.getElementById("stProg");
                var tProgt = document.getElementById("thisProg");

                var tArea = document.getElementById("TypeArea");
                var aArea = document.getElementById("AfterAction");
                var eArea = document.getElementById("expectedArea");

                //Refer to 1A (above) for details on why we are removing the double space
                var thisTyped = document.JobOp.typed.value.replace(/  /g, " ");

                //Create a temp variable with the current time of day to calculate the WPM
                eDay = new Date();
                endType = eDay.getTime();
                totalTime = ((endType - startType) / 1000)

                //Calculate the typing speed by taking the number of valid words typed by the total time taken and multiplying it by one minute in seconds (60)
                wpmType = Math.round(((thisTyped.split(" ").length) / totalTime) * 60)
                wpmType1 = Math.round(thisTyped.split(" ").length);
                //Set the words per minute variable on the statistical information block
                tStat.innerText = wpmType + " WPM";

                //The test has started apparantly, so disable the stop button
                document.JobOp.stop.disabled = false;

                //Flip the stop and start button display status
                document.JobOp.stop.style.display = "block";
                document.JobOp.start.style.display = "none";

                //Calculate and show the time taken to reach this point of the test and also the remaining time left in the test
                //Colorize it based on the time left (red if less than 5 seconds, orange if less than 15)
                if (Number(120 - totalTime) < 5) {
                    tTT.innerHTML = "<font color=\"Red\">" + String(totalTime.toFixed(2)) + " sec. / " + String(Number(120 - totalTime).toFixed(2)) + " sec.</font>";
                }
                else {
                    if (Number(120 - totalTime) < 15) {
                        tTT.innerHTML = "<font color=\"Orange\">" + String(totalTime.toFixed(2)) + " sec. / " + String(Number(120 - totalTime).toFixed(2)) + " sec.</font>";
                    }
                    else {
                        tTT.innerHTML = String(totalTime.toFixed(2)) + " sec. / " + String(Number(120 - totalTime).toFixed(2)) + " sec.";
                    }
                }

                //Determine if the user has typed all of the words expected
                if ((((thisTyped.split(" ").length) / word) * 100).toFixed(2) >= 100) {
                    tProg.width = "100%";

                    tProgt.innerText = "100%";
                }
                else {
                    //Set the progress bar with the exact percentage of the test completed
                    tProg.width = String((((thisTyped.split(" ").length) / word) * 100).toFixed(2)) + "%";

                    tProgt.innerText = tProg.width;
                }

                //Determine if the test is complete based on them having typed everything exactly as expected
                if (thisTyped.value == document.JobOp.given.value) {
                    endTest();
                }

                //Determine if the test is complete based on whether or not they have typed exactly or exceeded the number of valid words (determined by a space)
                if (word <= (thisTyped.split(" ").length)) {
                    endTest();
                }

                //Check the timer; stop the test if we are at or exceeded 60 seconds
                if (totalTime >= 120) {
                    endTest();
                }

                //Our handy error handling
            } catch (e) { };
        }

        //Simply does a check on focus to determine if the test has started
        function doCheck() {
            if (hasStarted == false) {
                //The test has not started, but the user is typing already -- maybe we should start?
                beginTest(); //Yes, we should -- consider it done!
            }
        }
    </script>
</head>
<body>




    <div align="center">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="border-bottom: 2px solid #354562; padding: 4px" class="titlec">
                    <form runat="server" id="butoon">
                        <div class="container content1">
                            <div class="row magazine-page">
                                <div class="row">
                                    <div class="col-md-8">Typing Test System</div>
                                    <div class="col-md-2" style="vertical-align: central; padding-top: 0px;">
                                        <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Start Test With Passage" OnClick="Button2_Click" /></div>
                                    <div class="col-md-2" style="vertical-align: central; padding-top: 0px;">
                                        <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Start Test Without Passage" OnClick="Button1_Click" /></div>
                                </div>
                            </div>
                        </div>

                    </form>

                    <div style="display: none;">
                        <input disabled id="printB" onclick="window.print();" type="button" value="Print Results" name="printB" style="float: right; font-size: 8pt; font-family: Arial;"><input onclick="    document.getElementById('AfterAction').style.display = 'none'; document.getElementById('expectedArea').style.display = 'block'; document.getElementById('typeArea').style.display = 'block'; document.JobOp.typed.value = ''; document.JobOp.typed.disabled = false; randNum = Math.floor((Math.random() * 10)) % intToTestCnt; strToTestType = strToTest[randNum]; document.JobOp.given.value = strToTestType;" type="button" value="New Test" name="newtest" style="float: right; font-size: 8pt; font-family: Arial">
                    </div>
                </td>
            </tr>
        </table>
    </div>
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
                            <div style="min-height: 24px;"></div>

                        </div>
                    </fieldset>

                </div>
                <div class="col-md-4">
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Organizational Information  </legend>
                        <div class="control-group">
                            <div class="row" style="text-align: center;">

                                <div class="col-md-12">
                                    <label><span class="color-black" style="padding: 10px; padding-top: 10px; font-weight: bold; font-size: 15px;"></span></label>

                                </div>




                            </div>
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
                                    <div id="stat_timeleft">2</div>


                                </div>


                            </div>
                            <div style="min-height: 30px;"></div>

                        </div>
                    </fieldset>
                </div>

            </div>
        </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr id="passive" runat="server" visible="false">
            <td style="border-bottom: 1px dotted #860E36; padding: 4px" class="titlea" background="/assets/img/Lt_Red_Back.gif" width="460">Accurately and precisely 
													evaluate your typing speed 
													and accuracy.</td>

        </tr>
        <tr>

            <td style="padding: 4px" class="bodya" colspan="2"></td>

        </tr>
        <tr>
            <td style="padding: 4px" class="bodya" colspan="2">

                <form name="JobOp">
                    <table border="0" cellpadding="5" width="100%">
                        <tr>
                            <td>
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
                                            <div id="stat_wpm1">Waiting...</div>
                                        </font></td>
                                            <td style="border-left: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center"><font size="2" face="Arial">
                                            <div id="stat_wpm2">Waiting...</div>
                                        </font></td>
                                            <td style="border-left: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center"><font size="2" face="Arial">
                                            <div id="stat_wpm">Not Started</div>
                                        </font></td>
                                            <td style="border-left: 1px dotted #8794C7; border-right: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center">
                                                <font size="2" face="Arial">
                                                <div id="stat_errors">Waiting...</div>
                                            </font></td>
                                            <td style="border-left-width: 1px; border-right: 1px dotted #8794C7; border-top-width: 1px; border-bottom-width: 1px" align="center">
                                                <font size="2" face="Arial">
                                                <div id="stat_score">Waiting...</div>
                                            </font></td>
                                            <td align="center"><font size="2" face="Arial">
                                            
                                        </font></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align="center" style="margin-top: 0; margin-bottom: 2px">
                                    <input type="button" value="&gt;&gt; Start Trial Typing Test &lt;&lt;" name="start" onclick="beginTest()" style="display: block; border-left: 1px solid #293358; border-right: 2px solid #293358; border-top: 1px solid #293358; border-bottom: 2px solid #293358; width: 20%; background-color: #9BB892; color: #FFFFFF; background-image: url('/assets/img/Green_Back.gif')">
                                    <p align="center" style="margin-top: 0; margin-bottom: 0">
                                        <input disabled type="button" value="&gt;&gt; End Trial Typing Test &lt;&lt;" name="stop" onclick="endTest()" style="display: none; border-left: 1px solid #293358; border-right: 2px solid #293358; border-top: 1px solid #293358; border-bottom: 2px solid #293358; width: 20%; background-color: #F05959; color: #FFFFFF; background-image: url('/assets/img/Red_Back.gif')">
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: Arial; font-size: 9pt">
                                <div id="typeArea" style="display: block;">
                                    <table border="0" width="100%" cellspacing="1">
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
                                        <font color="#7A88C0" face="Arial" size="1">
                                            <textarea onkeypress="doCheck();" onkeydown="//calcStat()" name="typed" cols="53" rows="10" wrap="on" spellcheck="false" style="width: 100%; border: 1px solid #344270; padding: 2px; font-family: Arial; font-size: 9pt"></textarea></font>
                                </div>
                                <div id="afterAction" style="display: none">
                                </div>
                            </td>
                        </tr>

                        <tr id="typedare" runat="server" visible="true">
                            <td style="border-left-width: 1px; border-right-width: 1px; border-top: 0px solid #344270; border-bottom-width: 1px">
                                <div id="expectedArea" style="display: block">
                                    <p style="margin-top: 0; margin-bottom: 0">
                                        <font color="#7A88C0" face="Arial" size="1">
                                            <textarea name="given" cols="53" rows="20" wrap="on" onfocus="deterCPProtect();" style="width: 100%; visibility:hidden; border: 1px solid #344270; padding: 2px; font-family: Arial; font-size: 9pt" >Click on the button below to start the typing test.  What you will be expected to type will appear here.</textarea></font>
                                </div>
                            </td>

                        </tr>
                        <script>
                            randNum = Math.floor((Math.random() * 10)) % intToTestCnt;
                            strToTestType = strToTest[randNum];

                            document.JobOp.given.value = strToTestType;
                            document.JobOp.typed.focus();
                        </script>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
