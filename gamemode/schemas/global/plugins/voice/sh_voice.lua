CAKE.Voices = { } -- I hear voices D:>
CAKE.VoiceGroups = {}

function CAKE.CanVoice( ply, soundgroup )
	if !CAKE.ConVars[ "AllowVoices" ] then return false end
	if !soundgroup then return false end
	if !CAKE.VoiceGroups[soundgroup] then return false end
	if CAKE.VoiceGroups[soundgroup] then
		if !CAKE.VoiceGroups[soundgroup].CanVoice then
			return true 
		else
			return CAKE.VoiceGroups[soundgroup].CanVoice(ply)
		end
	end
end

function CAKE.AddVoiceGroup( soundgroup, callback ) --The callback is there so you can test whether someone can use a voicegroup or not.
	CAKE.VoiceGroups[soundgroup] = {}
	CAKE.VoiceGroups[soundgroup].CanVoice = callback
	if !CAKE.VoiceGroups[soundgroup].CanVoice then
		CAKE.VoiceGroups[soundgroup].CanVoice = function() return true end
	end
end

function CAKE.AddVoice( id, path, soundgroup, name, fa, category)
	CAKE.Voices[id] = {}
	CAKE.Voices[id].MalePath = path
	CAKE.Voices[id].FemalePath = fa or path
	CAKE.Voices[id].Name = name
	CAKE.Voices[id].Group = soundgroup
	CAKE.Voices[id].Category = category or "Unspecified"
end


-- OLD TIRAMISU VOICE PISH
-- Human Voices
CAKE.AddVoiceGroup( "Citizen" )

--Taunts
CAKE.AddVoice("fantastic", "vo/npc/male01/fantastic01.wav", "Citizen", "Fantastic!", "vo/npc/female01/fantastic.wav", "Cries")
CAKE.AddVoice("doingsomething", "vo/npc/male01/doingsomething.wav", "Citizen", "Shouldn't we..", "vo/npc/female01/doingsomething.wav", "Cries")
CAKE.AddVoice("gotone2", "vo/npc/male01/gotone02.wav", "Citizen", "Hahah! I got one!", "vo/npc/female01/.wav", "Cries")
CAKE.AddVoice("heregoesnothing", "vo/npc/male01/squad_affirm06.wav", "Citizen", "Here goes nothing.", "vo/npc/female01/squad_affirm06.wav", "Cries")
CAKE.AddVoice("yougotit", "vo/npc/male01/yougotit02.wav", "Citizen", "You got it!", "vo/npc/female01/yougotit.wav", "Cries")
CAKE.AddVoice("finally", "vo/npc/male01/finally.wav", "Citizen", "Finally.", "vo/npc/female01/finally.wav", "Cries")
CAKE.AddVoice("donicely", "vo/npc/male01/thislldonicely01.wav", "Citizen", "This'll do nicely!", "vo/npc/female01/thislldonicely01.wav", "Cries")
CAKE.AddVoice("waitingsomebody", "vo/npc/male01/waitingsomebody.wav", "Citizen", "You waiting for somebody?", "vo/npc/female01/waitingsomebody.wav", "Cries")
CAKE.AddVoice("gotone1", "vo/npc/male01/gotone01.wav", "Citizen", "Got one!", "vo/npc/female01/gotone01.wav", "Cries")

--Cries
CAKE.AddVoice("combine", "vo/npc/male01/combine01.wav", "Citizen", "Combine!", "vo/npc/female01/combine01.wav", "Cries")
CAKE.AddVoice("gethellout", "vo/npc/male01/gethellout.wav", "Citizen", "Get the hell out of here!", "vo/npc/female01/gethellout.wav", "Cries")
CAKE.AddVoice("goodgod", "vo/npc/male01/goodgod.wav", "Citizen", "Good god!", "vo/npc/female01/goodgod.wav", "Cries")
CAKE.AddVoice("noscream1", "vo/npc/male01/no01.wav", "Citizen", "No! NO!", "vo/npc/female01/no01.wav", "Cries")
CAKE.AddVoice("noscream2", "vo/npc/male01/no02.wav", "Citizen", "Noooooo!", "vo/npc/female01/no02.wav", "Cries")
CAKE.AddVoice("runforyourlife", "vo/npc/male01/runforyourlife01.wav", "Citizen", "Run for your life!", "vo/npc/female01/runforyourlife.wav", "Cries")
CAKE.AddVoice("run", "vo/npc/male01/strider_run.wav", "Citizen", "Ruuuuun!", "vo/npc/female01/strider_run.wav", "Cries")
CAKE.AddVoice("help", "vo/npc/male01/help01.wav", "Citizen", "HELP!", "vo/npc/female01/help01.wav", "Cries")

--Chatter
CAKE.AddVoice("excuseme", "vo/npc/male01/excuseme01.wav", "Citizen", "Excuse me.", "vo/npc/female01/excuseme01.wav", "Chatter")
CAKE.AddVoice("hi", "vo/npc/male01/hi01.wav", "Citizen", "Hi.", "vo/npc/female01/hi01.wav", "Chatter")
CAKE.AddVoice("illstayhere", "vo/npc/male01/illstayhere01.wav", "Citizen", "I'll stay here.", "vo/npc/female01/illstayhere01.wav", "Chatter")
CAKE.AddVoice("letsgo", "vo/npc/male01/letsgo01.wav", "Citizen", "Let's go!", "vo/npc/female01/letsgo01.wav", "Chatter")
CAKE.AddVoice("imready", "vo/npc/male01/okimready01.wav", "Citizen", "Ok, I'm ready.", "vo/npc/female01/okimready01.wav", "Chatter")
CAKE.AddVoice("overhere", "vo/npc/male01/overhere01.wav", "Citizen", "Hey, over here!", "vo/npc/female01/overhere01.wav", "Chatter")
CAKE.AddVoice("sorry", "vo/npc/male01/sorry01.wav", "Citizen", "Sorry.", "vo/npc/female01/sorry01.wav", "Chatter")
CAKE.AddVoice("whoops", "vo/npc/male01/whoops01.wav", "Citizen", "Whoops.", "vo/npc/female01/whoops01.wav", "Chatter")
CAKE.AddVoice("yeah", "vo/npc/male01/yeah02.wav", "Citizen", "Yeah!", "vo/npc/female01/yeah02.wav", "Chatter")


-- Combine
CAKE.AddVoiceGroup( "Combine" )

--Orders
CAKE.AddVoice("administer", "npc/metropolice/vo/administer.wav", "Combine", "Administer.", false, "Orders")
CAKE.AddVoice("apply", "npc/metropolice/vo/apply.wav", "Combine", "Apply.", false, "Orders")
CAKE.AddVoice("movein", "npc/metropolice/vo/allunitsmovein.wav", "Combine", "All units, move in.", false, "Orders")
CAKE.AddVoice("amputate", "npc/metropolice/vo/amputate.wav", "Combine", "Amputate.", false, "Orders")
CAKE.AddVoice("cauterize", "npc/metropolice/vo/cauterize.wav", "Combine", "Cauterize.", false, "Orders")
CAKE.AddVoice("miscount", "npc/metropolice/vo/checkformiscount.wav", "Combine", "Check for miscount.", false, "Orders")
CAKE.AddVoice("destroythatcover", "npc/metropolice/vo/destroythatcover.wav", "Combine", "Destroy that cover!", false, "Orders")
CAKE.AddVoice("document", "npc/metropolice/vo/document.wav", "Combine", "Document.", false, "Orders")
CAKE.AddVoice("investigate", "npc/metropolice/vo/investigate.wav", "Combine", "Investigate.", false, "Orders")
CAKE.AddVoice("prosecute", "npc/metropolice/vo/prosecute.wav", "Combine", "Prosecute.", false, "Orders")
CAKE.AddVoice("isolate", "npc/metropolice/vo/isolate.wav", "Combine", "Isolate.", false, "Orders")

--Taunts
CAKE.AddVoice("verdictadministered", "npc/metropolice/vo/finalverdictadministered.wav", "Combine", "Final verdict administered.", false, "Taunts")
CAKE.AddVoice("finalwarning", "npc/metropolice/vo/finalwarning.wav", "Combine", "Final warning.", false, "Taunts")
CAKE.AddVoice("firstwarningmove", "npc/metropolice/vo/firstwarningmove.wav", "Combine", "First warning. Move away.", false, "Taunts")
CAKE.AddVoice("getoutofhere", "npc/metropolice/vo/getoutofhere.wav", "Combine", "Get out of here.", false, "Taunts")
CAKE.AddVoice("nowgetoutofhere", "npc/metropolice/vo/nowgetoutofhere.wav", "Combine", "Now get out of here.", false, "Taunts")
CAKE.AddVoice("vacatecitizen", "npc/metropolice/vo/vacatecitizen.wav", "Combine", "Vacate, citizen.", false, "Taunts")
CAKE.AddVoice("malcompliance", "npc/metropolice/vo/youwantamalcomplianceverdict.wav", "Combine", "Malcompliance verdict", false, "Taunts")
CAKE.AddVoice("control100percent", "npc/metropolice/vo/control100percent.wav", "Combine", "Control is 100 %", false, "Taunts")
CAKE.AddVoice("movealong", "npc/metropolice/vo/isaidmovealong.wav", "Combine", "I said move along.", false, "Taunts")
CAKE.AddVoice("keepmoving", "npc/metropolice/vo/keepmoving.wav", "Combine", "Keep moving.", false, "Taunts")

--Cries
CAKE.AddVoice("1199", "npc/metropolice/vo/11-99officerneedsassistance.wav", "Combine", "11-99, officer needs assistance!", false, "Cries")
CAKE.AddVoice("holdit", "npc/metropolice/vo/holdit.wav", "Combine", "Hold it!", false, "Cries")
CAKE.AddVoice("dontmove", "npc/metropolice/vo/dontmove.wav", "Combine", "Don't move!", false, "Cries")
CAKE.AddVoice("getdown", "npc/metropolice/vo/getdown.wav", "Combine", "Get down!", false, "Cries")
CAKE.AddVoice("grenade", "npc/metropolice/vo/grenade.wav", "Combine", "Grenade!", false, "Cries")
CAKE.AddVoice("help", "npc/metropolice/vo/help.wav", "Combine", "Help!", false, "Cries")
CAKE.AddVoice("coverme", "npc/metropolice/vo/covermegoingin.wav", "Combine", "Cover me, I'm going in!", false, "Cries")
CAKE.AddVoice("hesrunning", "npc/metropolice/vo/hesrunning.wav", "Combine", "He's running!", false, "Cries")
CAKE.AddVoice("officerneedshelp", "npc/metropolice/vo/officerneedshelp.wav", "Combine", "Officer needs help!", false, "Cries")
CAKE.AddVoice("thereheis", "npc/metropolice/vo/thereheis.wav", "Combine", "There he is!", false, "Cries")
CAKE.AddVoice("shit", "npc/metropolice/vo/shit.wav", "Combine", "Shit!", false, "Cries")

--Chatter
CAKE.AddVoice("youcango", "npc/metropolice/vo/allrightyoucango.wav", "Combine", "All right. You can go.", false, "Chatter")
CAKE.AddVoice("anticitizen", "npc/metropolice/vo/anticitizen.wav", "Combine", "Anticitizen.", false, "Chatter")
CAKE.AddVoice("chuckle", "npc/metropolice/vo/chuckle.wav", "Combine", "Chuckle", false, "Chatter")
CAKE.AddVoice("citizen", "npc/metropolice/vo/citizen.wav", "Combine", "Citizen.", false, "Chatter")
CAKE.AddVoice("converging", "npc/metropolice/vo/converging.wav", "Combine", "Converging.", false, "Chatter")
CAKE.AddVoice("copy", "npc/metropolice/vo/copy.wav", "Combine", "Copy.", false, "Chatter")
CAKE.AddVoice("trespass", "npc/metropolice/vo/criminaltrespass63.wav", "Combine", "6-3 Criminal Trespass.", false, "Chatter")
CAKE.AddVoice("introuble", "npc/metropolice/vo/dispatchineed10-78.wav", "Combine", "Dispatch, I need 10-78", false, "Chatter")
CAKE.AddVoice("investigating", "npc/metropolice/vo/investigating10-103.wav", "Combine", "Investigating 10-103.", false, "Chatter")
CAKE.AddVoice("location", "npc/metropolice/vo/location.wav", "Combine", "Location.", false, "Chatter")
CAKE.AddVoice("responding", "npc/metropolice/vo/responding.wav", "Combine", "Responding.", false, "Chatter")
CAKE.AddVoice("rodgerthat", "npc/metropolice/vo/rodgerthat.wav", "Combine", "Roger that.", false, "Chatter")
CAKE.AddVoice("searchingforsuspect", "npc/metropolice/vo/searchingforsuspect.wav", "Combine", "Searching for suspect.", false, "Chatter")
CAKE.AddVoice("sweepingforsuspect", "npc/metropolice/vo/sweepingforsuspect.wav", "Combine", "Sweeping for suspect.", false, "Chatter")
CAKE.AddVoice("unlawfulentry", "npc/metropolice/vo/unlawfulentry603.wav", "Combine", "603, unlawful entry.", false, "Chatter")


-- Vortigaunt
CAKE.AddVoiceGroup( "Vortigaunt" )

--Proverbs
CAKE.AddVoice("hopeless", "vo/npc/vortigaunt/hopeless.wav", "Vortigaunt", "Our cause seems hopeless.", false, "Proverbs")
CAKE.AddVoice("livetoserve", "vo/npc/vortigaunt/livetoserve.wav", "Vortigaunt", "We live to serve.", false, "Proverbs")
CAKE.AddVoice("persevere", "vo/npc/vortigaunt/persevere.wav", "Vortigaunt", "This is more than anyone can bear. But we will persevere.", false, "Proverbs")
CAKE.AddVoice("poet", "vo/npc/vortigaunt/poet.wav", "Vortigaunt", "Our finest poet describes it thus. Galum bala gilamar!", false, "Proverbs")
CAKE.AddVoice("prevail", "vo/npc/vortigaunt/prevail.wav", "Vortigaunt", "We shall prevail.", false, "Proverbs")
CAKE.AddVoice("whereto", "vo/npc/vortigaunt/whereto.wav", "Vortigaunt", "Where to now, and to what end?", false, "Proverbs")

--Taunts
CAKE.AddVoice("accompany", "vo/npc/vortigaunt/accompany.wav", "Vortigaunt", "Gladly we accompany.", false, "Taunts")
CAKE.AddVoice("allowme", "vo/npc/vortigaunt/allowme.wav", "Vortigaunt", "Allow me.", false, "Taunts")
CAKE.AddVoice("asyouwish", "vo/npc/vortigaunt/asyouwish.wav", "Vortigaunt", "As you wish.", false, "Taunts")
CAKE.AddVoice("beofservice", "vo/npc/vortigaunt/beofservice.wav", "Vortigaunt", "Can we be of service?", false, "Taunts")
CAKE.AddVoice("calm", "vo/npc/vortigaunt/calm.wav", "Vortigaunt", "Calm yourself.", false, "Taunts")
CAKE.AddVoice("canconvice", "vo/npc/vortigaunt/canconvice.wav", "Vortigaunt", "Can we not convince you otherwise?", false, "Taunts")
CAKE.AddVoice("forfreedom", "vo/npc/vortigaunt/forfreedom.wav", "Vortigaunt", "For freedom!", false, "Taunts")

--Chatter
CAKE.AddVoice("forward", "vo/npc/vortigaunt/forward.wav", "Vortigaunt", "Forward.", false, "Taunts")
CAKE.AddVoice("halt", "vo/npc/vortigaunt/halt.wav", "Vortigaunt", "Halt.", false, "Taunts")
CAKE.AddVoice("caution", "vo/npc/vortigaunt/caution.wav", "Vortigaunt", "Caution!", false, "Taunts")
CAKE.AddVoice("certainly", "vo/npc/vortigaunt/certainly.wav", "Vortigaunt", "Certainly.", false, "Taunts")
CAKE.AddVoice("done", "vo/npc/vortigaunt/done.wav", "Vortigaunt", "Done.", false, "Taunts")
CAKE.AddVoice("yes", "vo/npc/vortigaunt/yes.wav", "Vortigaunt", "Yes!", false, "Taunts")

-- END OF OLD TIRAMISU VOICE SHIT

--[[ And the start of my much, much nicer voice functions ]]--


-- A function to add a voice.
function CAKE.AddVoice(faction, command, phrase, sound, female, menu)
		CAKE.voices[#CAKE.voices + 1] = {
		faction = faction,
		command = command,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

-- A function to add a dispatch voice.
function CAKE.AddDispatchVoice(command, phrase, sound)
		CAKE.dispatchvoices[#CAKE.dispatchvoices + 1] = {
		command = command,
		phrase = phrase,
		sound = sound
	};
end;

// DUDE I AM TABLING VOICES SO HARD RIGHT NOW (R.I.P Old DeathByKittens, September 2012)
CAKE.voices = {};
CAKE.menuVoices = {};
CAKE.dispatchvoices = {};

CAKE.AddDispatchVoice("Anti-Citizen", "Attention ground units. Anti-citizen reported in this community. Code: LOCK, CAUTERIZE, STABILIZE.", "npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav");
CAKE.AddDispatchVoice("Anti-Civil", "Protection team alert. Evidence of anti-civil activity in this community. Code: ASSEMBLE, PLAN, CONTAIN.", "npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav");
CAKE.AddDispatchVoice("Person Interest", "Attention please. Unidentified person of interest confirm your civil status with local protection team immediately.", "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav");
CAKE.AddDispatchVoice("Citizen Inaction", "Citizen reminder. Inaction is conspiracy. Report counter behaviour to a Civil Protection team immediately.", "npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav");
CAKE.AddDispatchVoice("Unrest Structure", "Alert community ground protection units, local unrest structure detected. ASSEMBLE, ADMINISTER, PACIFY.", "npc/overwatch/cityvoice/f_localunrest_spkr.wav");
CAKE.AddDispatchVoice("Status Evasion", "Attention protection team. Status evasion in progress in this community. RESPOND, ISOLATE, ENQUIRE.", "npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav");
CAKE.AddDispatchVoice("Lockdown", "Attention all ground protection teams. Judgment waiver now in effect. Capital prosecution is discretionary.", "npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav");
CAKE.AddDispatchVoice("Rations Deducted", "Attention occupants. Your block is now charged with permissive inactive cohesion. Five ration units deducted.", "npc/overwatch/cityvoice/f_rationunitsdeduct_3_spkr.wav");
CAKE.AddDispatchVoice("Inspection", "Citizen notice. Priority identification check in progress. Please assemble in your designated inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav");
CAKE.AddDispatchVoice("Inspection 2", "Attention please. All citizens in local residential block, assume your inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assumepositions_spkr.wav");
CAKE.AddDispatchVoice("Miscount Detected", "Attention resident. Miscount detected in your block. Co-operation with your Civil Protection team permit full ration reward.", "npc/overwatch/cityvoice/f_trainstation_cooperation_spkr.wav");
CAKE.AddDispatchVoice("Infection", "Attention resident. This block contains potential civil infection. INFORM, CO-OPERATE, ASSEMBLE.", "npc/overwatch/cityvoice/f_trainstation_inform_spkr.wav");
CAKE.AddDispatchVoice("Relocation", "Citizen notice. Failure to co-operate will result in permanent off-world relocation.", "npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav");
CAKE.AddDispatchVoice("Unrest Code", "Attention community. Unrest procedure code is now in effect. INOCULATE, SHIELD, PACIFY. Code: PRESSURE, SWORD, STERILIZE.", "npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav");
CAKE.AddDispatchVoice("Evasion", "Attention please. Evasion behaviour consistent with mal-compliant defendant. Ground protection team, alert. Code: ISOLATE, EXPOSE, ADMINISTER.", "npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav");
CAKE.AddDispatchVoice("Individual", "Individual. You are charged with social endangerment, level one. Protection unit, prosecution code: DUTY, SWORD, MIDNIGHT.", "npc/overwatch/cityvoice/f_sociolevel1_4_spkr.wav");
CAKE.AddDispatchVoice("Autonomous", "Attention all ground protection teams. Autonomous judgement is now in effect, sentencing is now discretionary. Code: AMPUTATE, ZERO, CONFIRM.", "npc/overwatch/cityvoice/f_protectionresponse_4_spkr.wav");
CAKE.AddDispatchVoice("Citizenship", "Individual. You are convicted of multi anti-civil violations. Implicit citizenship revoked. Status: MALIGNANT.", "npc/overwatch/cityvoice/f_citizenshiprevoked_6_spkr.wav");
CAKE.AddDispatchVoice("Malcompliance", "Individual. You are charged with capital malcompliance, anti-citizen status approved.", "npc/overwatch/cityvoice/f_capitalmalcompliance_spkr.wav");
CAKE.AddDispatchVoice("Exogen", "Overwatch acknowledges critical exogen breach, AirWatch augmentation force dispatched and inbound. Hold for reinforcements.", "npc/overwatch/cityvoice/fprison_airwatchdispatched.wav");
CAKE.AddDispatchVoice("Failure", "Attention ground units. Mission failure will result in permanent off-world assignment. Code reminder: SACRIFICE, COAGULATE, PLAN.", "npc/overwatch/cityvoice/fprison_missionfailurereminder.wav");
CAKE.AddDispatchVoice("Rations", "Attention, citizens. Rations are now available from the union designated distribution terminal.", "hl2rp/dispatch/rationDispatch.mp3");
CAKE.AddDispatchVoice("CWU", "Citizen reminder: The Civil Workers Union provides stabilized employment and benefit schemes for all registered individuals.", "hl2rp/dispatch/cwuDispatch.mp3");

CAKE.AddVoice("Combine", "Sweeping", "Sweeping for suspect.", "npc/metropolice/hiding02.wav");
CAKE.AddVoice("Combine", "Get In", "Get in!", "vo/trainyard/ba_getin.wav");
CAKE.AddVoice("Combine", "I Said Move", "I said move!", "vo/trainyard/ba_move01.wav");
CAKE.AddVoice("Combine", "In Here", "Get in here!", "vo/trainyard/ba_inhere01.wav");
CAKE.AddVoice("Combine", "11-6", "Suspect 11-6, my 10-20 is", "npc/metropolice/vo/suspect11-6my1020is.wav");
CAKE.AddVoice("Combine", "Getting 647E", "Still getting that 647E from local survallience.", "npc/metropolice/vo/stillgetting647e.wav");
CAKE.AddVoice("Combine", "Off-World", "Permanent off-world service assignment.", "npc/overwatch/radiovoice/permanentoffworld.wav");
CAKE.AddVoice("Combine", "10-15", "Prepare for 10-15.", "npc/metropolice/vo/preparefor1015.wav");
CAKE.AddVoice("Combine", "Judge 10-107", "Preparing to judge a 10-107, be advised.", "npc/metropolice/vo/preparingtojudge10-107.wav");
CAKE.AddVoice("Combine", "Sundown", "GRID Sundown 4-6.", "npc/combine_soldier/vo/gridsundown46.wav");
CAKE.AddVoice("Combine", "Need Help", "Officer needs help!", "npc/metropolice/vo/officerneedshelp.wav");
CAKE.AddVoice("Combine", "Under Fire", "Officer under fire, taking cover!", "npc/metropolice/vo/officerunderfiretakingcover.wav");
CAKE.AddVoice("Combine", "Possible 647E", "Possible 647E here, requesting AirWatch to tag!", "npc/metropolice/vo/possible647erequestairwatch.wav");
CAKE.AddVoice("Combine", "Aquiring Visual", "Aquiring a visual.", "npc/metropolice/vo/acquiringonvisual.wav");
CAKE.AddVoice("Combine", "10-78", "Dispatch, I need 10-78, officer in trouble!", "npc/metropolice/vo/dispatchIneed10-78.wav");
CAKE.AddVoice("Combine", "11-44", "Get that 11-44 inbound, we're cleaning up now.", "npc/metropolice/vo/get11-44inboundcleaningup.wav");
CAKE.AddVoice("Combine", "Classify", "Classify subject name as DB.  This block ready for cleanup.", "npc/metropolice/vo/classifyasdbthisblockready.wav");
CAKE.AddVoice("Combine", "Firing Expose", "Firing to expose target.", "npc/metropolice/vo/firingtoexposetarget.wav");
CAKE.AddVoice("Combine", "Restricted Incursion", "Restricted incustion in progress.", "npc/overwatch/radiovoice/restrictedincursioninprogress.wav");
CAKE.AddVoice("Combine", "10-103M", "10-103M Disturbance by mentally unfit.", "npc/overwatch/radiovoice/disturbancemental10-103m.wav");
CAKE.AddVoice("Combine", "Memory Replacement", "Reminder: memory replacement is the first step to rank privleges.", "npc/overwatch/radiovoice/remindermemoryreplacement.wav");
CAKE.AddVoice("Combine", "10-107", "Got a 10-107 here, send AirWatch for tag.", "npc/metropolice/vo/gota10-107sendairwatch.wav");
CAKE.AddVoice("Combine", "Close on Suspect", "All units close on suspect.", "npc/metropolice/vo/allunitscloseonsuspect.wav");
CAKE.AddVoice("Combine", "Control Section", "Control section!", "npc/metropolice/vo/controlsection.wav");
CAKE.AddVoice("Combine", "Report", "Local civil protection team, report status.", "npc/metropolice/vo/localcptreportstatus.wav");
CAKE.AddVoice("Combine", "Loyalty Failure", "Control, I have a failure to comply with loyalty check tags, possible 10-103M.", "npc/metropolice/vo/loyaltycheckfailure.wav");
CAKE.AddVoice("Combine", "Arrest", "All units, move to arrest positions.", "npc/metropolice/vo/movetoarrestpositions.wav");
CAKE.AddVoice("Combine", "External", "External jurisdiction.", "npc/metropolice/vo/externaljurisdiction.wav");
CAKE.AddVoice("Combine", "Ready Judge", "Ready to judge!", "npc/metropolice/vo/readytojudge.wav");
CAKE.AddVoice("Combine", "Running Low", "Running low on verdicts!  Taking cover!", "npc/metropolice/vo/runninglowonverdicts.wav");
CAKE.AddVoice("Combine", "Malcompliant", "Malcompliant 10-107 my 10-20.  Preparing to prosecute.", "npc/metropolice/vo/malcompliant10107my1020.wav");
CAKE.AddVoice("Combine", "Isolate", "Isolate!", "npc/metropolice/hiding05.wav");
CAKE.AddVoice("Combine", "Guilty", "You are judged guilty by civil protection team!", "npc/overwatch/radiovoice/youarejudgedguilty.wav");
CAKE.AddVoice("Combine", "Team Deployed", "Team is deployed and scanning!", "npc/combine_soldier/vo/teamdeployedandscanning.wav");
CAKE.AddVoice("Combine", "Come With", "You, citizen.  Come with me!", "vo/trainyard/ba_youcomewith.wav");
CAKE.AddVoice("Combine", "I'm Good", "No, I'm good.", "vo/trainyard/ba_noimgood.wav");
CAKE.AddVoice("Combine", "Need Privacy", "Yeah, I'm gunna need me some privacy for this.", "vo/trainyard/ba_privacy.wav");
CAKE.AddVoice("Combine", "Socioside", "Socioside!", "npc/metropolice/vo/sociocide.wav");
CAKE.AddVoice("Combine", "Non-Patrol", "Non-patrol region!", "npc/metropolice/vo/nonpatrolregion.wav");
CAKE.AddVoice("Combine", "Investigate", "Investigate!", "npc/metropolice/vo/investigate.wav");
CAKE.AddVoice("Combine", "Investigate Report", "Investigate and Report!", "npc/overwatch/radiovoice/investigateandreport.wav");
CAKE.AddVoice("Combine", "Prosecute Final", "Ready to prosecute malcompliant citizen, final warning issued.", "npc/metropolice/vo/readytoprosecutefinalwarning.wav");
CAKE.AddVoice("Combine", "Position Advance", "Team in position, advance.", "npc/metropolice/vo/teaminpositionadvance.wav");
CAKE.AddVoice("Combine", "10-2", "10-2.", "npc/metropolice/vo/ten2.wav");
CAKE.AddVoice("Combine", "10-4", "10-4.", "npc/metropolice/vo/ten4.wav");
CAKE.AddVoice("Combine", "10-97", "10-97.", "npc/metropolice/vo/ten97.wav");
CAKE.AddVoice("Combine", "10-99", "Officer down!  I am 10-99, repeat, I am 10-99!", "npc/metropolice/vo/officerdownIam10-99.wav");
CAKE.AddVoice("Combine", "10-65", "Unit is 10-65.", "npc/metropolice/vo/unitis10-65.wav");
CAKE.AddVoice("Combine", "Sociostable", "We are sociostable this location.", "npc/metropolice/vo/wearesociostablethislocation.wav");
CAKE.AddVoice("Combine", "10-8", "Unit is on duty.  10-8.", "npc/metropolice/vo/unitisonduty10-8.wav");
CAKE.AddVoice("Combine", "Standing By", "10-8.  Standing by.", "npc/metropolice/vo/ten8standingby.wav");
CAKE.AddVoice("Combine", "10-0 Viscerator", "10-0!  10-0!  Viscerator is hunting!", "npc/metropolice/vo/tenzerovisceratorishunting.wav");
CAKE.AddVoice("Combine", "Need Any Help", "Need any help with this one?", "npc/metropolice/vo/needanyhelpwiththisone.wav");
CAKE.AddVoice("Combine", "Uniform", "Uniform!", "npc/combine_soldier/vo/uniform.wav");
CAKE.AddVoice("Combine", "Medical", "Request Medical!", "npc/combine_soldier/vo/requestmedical.wav");
CAKE.AddVoice("Combine", "Stim", "Request stim-dose!", "npc/combine_soldier/vo/requeststimdose.wav");
CAKE.AddVoice("Combine", "Sector Not Secure", "Sector is not secure!", "npc/combine_soldier/vo/sectorisnotsecure.wav");
CAKE.AddVoice("Combine", "Sector Secure", "Sector is secure, no viscon!", "npc/combine_soldier/vo/sectorissecurenovison.wav");
CAKE.AddVoice("Combine", "You Can Go", "Alright, you can go.", "npc/metropolice/vo/allrightyoucango.wav");
CAKE.AddVoice("Combine", "Need Assistance", "Eleven-ninety-nine, officer needs assistance!", "npc/metropolice/vo/11-99officerneedsassistance.wav");
CAKE.AddVoice("Combine", "Point Secure", "Assault point secure, advance!", "npc/metropolice/vo/assaultpointsecureadvance.wav");
CAKE.AddVoice("Combine", "Control 100 Percent", "Control is 100 percent this location, no sign of that 647E.", "npc/metropolice/vo/control100percent.wav");
CAKE.AddVoice("Combine", "Overrun", "CP is overrun, we have no containment.", "npc/metropolice/vo/cpisoverrunwehavenocontainment.wav");
CAKE.AddVoice("Combine", "Target", "Target my radial!", "npc/combine_soldier/vo/targetmyradial.wav");
CAKE.AddVoice("Combine", "Perimeter", "CP, we need to establish a perimeter at", "npc/metropolice/vo/cpweneedtoestablishaperimeterat.wav");
CAKE.AddVoice("Combine", "All Units", "CP requests, all units, location, report in!", "npc/metropolice/vo/cprequestsallunitsreportin.wav");
CAKE.AddVoice("Combine", "BOL", "CP, we need airwatch to BOL for that 243.", "npc/metropolice/vo/cpbolforthat243.wav");
CAKE.AddVoice("Combine", "Administer", "Administer.", "npc/metropolice/vo/administer.wav");
CAKE.AddVoice("Combine", "Affirmative", "Affirmative.", "npc/metropolice/vo/affirmative.wav");
CAKE.AddVoice("Combine", "All Units Move In", "All units move in!", "npc/metropolice/vo/allunitsmovein.wav");
CAKE.AddVoice("Combine", "Amputate", "Amputate.", "npc/metropolice/vo/amputate.wav");
CAKE.AddVoice("Combine", "Anti-Citizen", "Anti-citizen.", "npc/metropolice/vo/anticitizen.wav");
CAKE.AddVoice("Combine", "Clear 100", "Clear and Code 100.", "npc/metropolice/vo/clearandcode100.wav");
CAKE.AddVoice("Combine", "Code 100", "Code 100.", "npc/metropolice/vo/code100.wav");
CAKE.AddVoice("Combine", "Citizen", "Citizen.", "npc/metropolice/vo/citizen.wav");
CAKE.AddVoice("Combine", "Copy", "Copy.", "npc/metropolice/vo/copy.wav");
CAKE.AddVoice("Combine", "Cover Me", "Cover me, I'm going in!", "npc/metropolice/vo/covermegoingin.wav");
CAKE.AddVoice("Combine", "Assist Trespass", "Assist for a criminal trespass!", "npc/metropolice/vo/criminaltrespass63.wav");
CAKE.AddVoice("Combine", "Destroy Cover", "Destroy that cover!", "npc/metropolice/vo/destroythatcover.wav");
CAKE.AddVoice("Combine", "Don't Move", "Don't move!", "npc/metropolice/vo/dontmove.wav");
CAKE.AddVoice("Combine", "Final Verdict", "Final verdict administered.", "npc/metropolice/vo/finalverdictadministered.wav");
CAKE.AddVoice("Combine", "Final Warning", "Final warning!", "npc/metropolice/vo/finalwarning.wav");
CAKE.AddVoice("Combine", "First Warning", "First warning, move away!", "npc/metropolice/vo/firstwarningmove.wav");
CAKE.AddVoice("Combine", "Get Down", "Get down!", "npc/metropolice/vo/getdown.wav");
CAKE.AddVoice("Combine", "Get Out", "Get out of here!", "npc/metropolice/vo/getoutofhere.wav");
CAKE.AddVoice("Combine", "Suspect One", "I got suspect one here.", "npc/metropolice/vo/gotsuspect1here.wav");
CAKE.AddVoice("Combine", "Help", "Help!", "npc/metropolice/vo/help.wav");
CAKE.AddVoice("Combine", "Running", "He's running!", "npc/metropolice/vo/hesrunning.wav");
CAKE.AddVoice("Combine", "Hold It", "Hold it right there!", "npc/metropolice/vo/holditrightthere.wav");
CAKE.AddVoice("Combine", "Move Along Repeat", "I said move along.", "npc/metropolice/vo/isaidmovealong.wav");
CAKE.AddVoice("Combine", "Malcompliance", "Issuing malcompliance citation.", "npc/metropolice/vo/issuingmalcompliantcitation.wav");
CAKE.AddVoice("Combine", "Keep Moving", "Keep moving!", "npc/metropolice/vo/keepmoving.wav");
CAKE.AddVoice("Combine", "Lock Position", "All units, lock your position!", "npc/metropolice/vo/lockyourposition.wav");
CAKE.AddVoice("Combine", "Trouble", "Lookin' for trouble?", "npc/metropolice/vo/lookingfortrouble.wav");
CAKE.AddVoice("Combine", "Look Out", "Look out!", "npc/metropolice/vo/lookout.wav");
CAKE.AddVoice("Combine", "Minor Hits", "Minor hits, continuing prosecution.", "npc/metropolice/vo/minorhitscontinuing.wav");
CAKE.AddVoice("Combine", "Move", "Move!", "npc/metropolice/vo/move.wav");
CAKE.AddVoice("Combine", "Move Along", "Move along!", "npc/metropolice/vo/movealong3.wav");
CAKE.AddVoice("Combine", "Move Back", "Move back, right now!", "npc/metropolice/vo/movebackrightnow.wav");
CAKE.AddVoice("Combine", "Move It", "Move it!", "npc/metropolice/vo/moveit2.wav");
CAKE.AddVoice("Combine", "Hardpoint", "Moving to hardpoint.", "npc/metropolice/vo/movingtohardpoint.wav");
CAKE.AddVoice("Combine", "Officer Help", "Officer needs help!", "npc/metropolice/vo/officerneedshelp.wav");
CAKE.AddVoice("Combine", "Privacy", "Possible level three civil privacy violator here!", "npc/metropolice/vo/possiblelevel3civilprivacyviolator.wav");
CAKE.AddVoice("Combine", "Judgement", "Suspect prepare to receive civil judgement!", "npc/metropolice/vo/prepareforjudgement.wav");
CAKE.AddVoice("Combine", "Priority Two", "I have a priority two anti-citizen here!", "npc/metropolice/vo/priority2anticitizenhere.wav");
CAKE.AddVoice("Combine", "Prosecute", "Prosecute!", "npc/metropolice/vo/prosecute.wav");
CAKE.AddVoice("Combine", "Amputate Ready", "Ready to amputate!", "npc/metropolice/vo/readytoamputate.wav");
CAKE.AddVoice("Combine", "Rodger That", "Rodger that!", "npc/metropolice/vo/rodgerthat.wav");
CAKE.AddVoice("Combine", "Search", "Search!", "npc/metropolice/vo/search.wav");
CAKE.AddVoice("Combine", "Shit", "Shit!", "npc/metropolice/vo/shit.wav");
CAKE.AddVoice("Combine", "Sentence Delivered", "Sentence delivered.", "npc/metropolice/vo/sentencedelivered.wav");
CAKE.AddVoice("Combine", "Sterilize", "Sterilize!", "npc/metropolice/vo/sterilize.wav");
CAKE.AddVoice("Combine", "Take Cover", "Take cover!", "npc/metropolice/vo/takecover.wav");
CAKE.AddVoice("Combine", "Restrict", "Restrict!", "npc/metropolice/vo/restrict.wav");
CAKE.AddVoice("Combine", "Restricted", "Restricted block.", "npc/metropolice/vo/restrictedblock.wav");
CAKE.AddVoice("Combine", "Second Warning", "This is your second warning!", "npc/metropolice/vo/thisisyoursecondwarning.wav");
CAKE.AddVoice("Combine", "Verdict", "You want a non-compliance verdict?", "npc/metropolice/vo/youwantamalcomplianceverdict.wav");
CAKE.AddVoice("Combine", "Backup", "Backup!", "npc/metropolice/vo/backup.wav");
CAKE.AddVoice("Combine", "Apply", "Apply.", "npc/metropolice/vo/apply.wav");
CAKE.AddVoice("Combine", "Restriction", "Terminal restriction zone.", "npc/metropolice/vo/terminalrestrictionzone.wav");
CAKE.AddVoice("Combine", "Complete", "Protection complete.", "npc/metropolice/vo/protectioncomplete.wav");
CAKE.AddVoice("Combine", "Location Unknown", "Suspect location unknown.", "npc/metropolice/vo/suspectlocationunknown.wav");
CAKE.AddVoice("Combine", "Can 1", "Pick up that can.", "npc/metropolice/vo/pickupthecan1.wav");
CAKE.AddVoice("Combine", "Can 2", "Pick... up... the can.", "npc/metropolice/vo/pickupthecan2.wav");
CAKE.AddVoice("Combine", "Wrap It", "That's it, wrap it up.", "npc/combine_soldier/vo/thatsitwrapitup.wav");
CAKE.AddVoice("Combine", "Can 3", "I said pickup the can!", "npc/metropolice/vo/pickupthecan3.wav");
CAKE.AddVoice("Combine", "Can 4", "Now, put it in the trash can.", "npc/metropolice/vo/putitinthetrash1.wav");
CAKE.AddVoice("Combine", "Can 5", "I said put it in the trash can!", "npc/metropolice/vo/putitinthetrash2.wav");
CAKE.AddVoice("Combine", "Now Get Out", "Now get out of here!", "npc/metropolice/vo/nowgetoutofhere.wav");
CAKE.AddVoice("Combine", "Haha", "Haha.", "npc/metropolice/vo/chuckle.wav");
CAKE.AddVoice("Combine", "X-Ray", "X-Ray!", "npc/metropolice/vo/xray.wav");
CAKE.AddVoice("Combine", "Patrol", "Patrol!", "npc/metropolice/vo/patrol.wav");
CAKE.AddVoice("Combine", "Serve", "Serve.", "npc/metropolice/vo/serve.wav");
CAKE.AddVoice("Combine", "Knocked Over", "You knocked it over, pick it up!", "npc/metropolice/vo/youknockeditover.wav");
CAKE.AddVoice("Combine", "Watch It", "Watch it!", "npc/metropolice/vo/watchit.wav");
CAKE.AddVoice("Combine", "Restricted Canals", "Suspect is using restricted canals at...", "npc/metropolice/vo/suspectusingrestrictedcanals.wav");
CAKE.AddVoice("Combine", "505", "Subject is five-oh-five!", "npc/metropolice/vo/subjectis505.wav");
CAKE.AddVoice("Combine", "404", "Possible four-zero-oh here!", "npc/metropolice/vo/possible404here.wav");
CAKE.AddVoice("Combine", "Vacate", "Vacate citizen!", "npc/metropolice/vo/vacatecitizen.wav");
CAKE.AddVoice("Combine", "Escapee", "Priority two escapee.", "npc/combine_soldier/vo/prioritytwoescapee.wav");
CAKE.AddVoice("Combine", "Objective", "Priority one objective.", "npc/combine_soldier/vo/priority1objective.wav");
CAKE.AddVoice("Combine", "Payback", "Payback.", "npc/combine_soldier/vo/payback.wav");
CAKE.AddVoice("Combine", "Got Him Now", "Affirmative, we got him now.", "npc/combine_soldier/vo/affirmativewegothimnow.wav");
CAKE.AddVoice("Combine", "Antiseptic", "Antiseptic.", "npc/combine_soldier/vo/antiseptic.wav");
CAKE.AddVoice("Combine", "Cleaned", "Cleaned.", "npc/combine_soldier/vo/cleaned.wav");
CAKE.AddVoice("Combine", "Engaged Cleanup", "Engaged in cleanup.", "npc/combine_soldier/vo/engagedincleanup.wav");
CAKE.AddVoice("Combine", "Engaging", "Engaging.", "npc/combine_soldier/vo/engaging.wav");
CAKE.AddVoice("Combine", "Full Response", "Executing full response.", "npc/combine_soldier/vo/executingfullresponse.wav");
CAKE.AddVoice("Combine", "Heavy Resistance", "Overwatch advise, we have heavy resistance.", "npc/combine_soldier/vo/heavyresistance.wav");
CAKE.AddVoice("Combine", "Inbound", "Inbound.", "npc/combine_soldier/vo/inbound.wav");
CAKE.AddVoice("Combine", "Lost Contact", "Lost contact!", "npc/combine_soldier/vo/lostcontact.wav");
CAKE.AddVoice("Combine", "Move In", "Move in!", "npc/combine_soldier/vo/movein.wav");
CAKE.AddVoice("Combine", "Harden Position", "Harden that position!", "npc/combine_soldier/vo/hardenthatposition.wav");
CAKE.AddVoice("Combine", "Go Sharp", "Go sharp, go sharp!", "npc/combine_soldier/vo/gosharpgosharp.wav");
CAKE.AddVoice("Combine", "Delivered", "Delivered.", "npc/combine_soldier/vo/delivered.wav");
CAKE.AddVoice("Combine", "Necrotics Inbound", "Necrotics, inbound!", "npc/combine_soldier/vo/necroticsinbound.wav");
CAKE.AddVoice("Combine", "Necrotics", "Necrotics.", "npc/combine_soldier/vo/necrotics.wav");
CAKE.AddVoice("Combine", "Outbreak", "Outbreak!", "npc/combine_soldier/vo/outbreak.wav");
CAKE.AddVoice("Combine", "Copy That", "Copy that.", "npc/combine_soldier/vo/copythat.wav");
CAKE.AddVoice("Combine", "Outbreak Status", "Outbreak status is code.", "npc/combine_soldier/vo/outbreakstatusiscode.wav");
CAKE.AddVoice("Combine", "Overwatch", "Overwatch!", "npc/combine_soldier/vo/overwatch.wav");
CAKE.AddVoice("Combine", "Preserve", "Preserve!", "npc/metropolice/vo/preserve.wav");
CAKE.AddVoice("Combine", "Pressure", "Pressure!", "npc/metropolice/vo/pressure.wav");
CAKE.AddVoice("Combine", "Phantom", "Phantom!", "npc/combine_soldier/vo/phantom.wav");
CAKE.AddVoice("Combine", "Stinger", "Stinger!", "npc/combine_soldier/vo/stinger.wav");
CAKE.AddVoice("Combine", "Shadow", "Shadow!", "npc/combine_soldier/vo/shadow.wav");
CAKE.AddVoice("Combine", "Savage", "Savage!", "npc/combine_soldier/vo/savage.wav");
CAKE.AddVoice("Combine", "Reaper", "Reaper!", "npc/combine_soldier/vo/reaper.wav");
CAKE.AddVoice("Combine", "Victor", "Victor!", "npc/metropolice/vo/victor.wav");
CAKE.AddVoice("Combine", "Sector", "Sector!", "npc/metropolice/vo/sector.wav");
CAKE.AddVoice("Combine", "Inject", "Inject!", "npc/metropolice/vo/inject.wav");
CAKE.AddVoice("Combine", "Dagger", "Dagger!", "npc/combine_soldier/vo/dagger.wav");
CAKE.AddVoice("Combine", "Blade", "Blade!", "npc/combine_soldier/vo/blade.wav");
CAKE.AddVoice("Combine", "Razor", "Razor!", "npc/combine_soldier/vo/razor.wav");
CAKE.AddVoice("Combine", "Nomad", "Nomad!", "npc/combine_soldier/vo/nomad.wav");
CAKE.AddVoice("Combine", "Judge", "Judge!", "npc/combine_soldier/vo/judge.wav");
CAKE.AddVoice("Combine", "Ghost", "Ghost!", "npc/combine_soldier/vo/ghost.wav");
CAKE.AddVoice("Combine", "Sword", "Sword!", "npc/combine_soldier/vo/sword.wav");
CAKE.AddVoice("Combine", "Union", "Union!", "npc/metropolice/vo/union.wav");
CAKE.AddVoice("Combine", "Helix", "Helix!", "npc/combine_soldier/vo/helix.wav");
CAKE.AddVoice("Combine", "Storm", "Storm!", "npc/combine_soldier/vo/storm.wav");
CAKE.AddVoice("Combine", "Spear", "Spear!", "npc/combine_soldier/vo/spear.wav");
CAKE.AddVoice("Combine", "Vamp", "Vamp!", "npc/combine_soldier/vo/vamp.wav");
CAKE.AddVoice("Combine", "Nova", "Nova!", "npc/combine_soldier/vo/nova.wav");
CAKE.AddVoice("Combine", "Mace", "Mace!", "npc/combine_soldier/vo/mace.wav");
CAKE.AddVoice("Combine", "Grid", "Grid!", "npc/combine_soldier/vo/grid.wav");
CAKE.AddVoice("Combine", "Kilo", "Kilo!", "npc/combine_soldier/vo/kilo.wav");
CAKE.AddVoice("Combine", "Echo", "Echo!", "npc/combine_soldier/vo/echo.wav");
CAKE.AddVoice("Combine", "Dash", "Dash!", "npc/combine_soldier/vo/dash.wav");
CAKE.AddVoice("Combine", "Apex", "Apex!", "npc/combine_soldier/vo/apex.wav");
CAKE.AddVoice("Combine", "Jury", "Jury!", "npc/metropolice/vo/jury.wav");
CAKE.AddVoice("Combine", "King", "King!", "npc/metropolice/vo/king.wav");
CAKE.AddVoice("Combine", "Lock", "Lock!", "npc/metropolice/vo/lock.wav");
CAKE.AddVoice("Combine", "Vice", "Vice!", "npc/metropolice/vo/vice.wav");
CAKE.AddVoice("Combine", "Zero", "Zero!", "npc/metropolice/vo/zero.wav");
CAKE.AddVoice("Combine", "Zone", "Zone!", "npc/metropolice/vo/zone.wav");
CAKE.AddVoice("Combine", "There he is", "There he is.", "npc/metropolice/vo/thereheis.wav");
CAKE.AddVoice("Combine", "3", "Three.", "npc/metropolice/vo/three.wav");
CAKE.AddVoice("Combine", "Transit", "Transit Block.", "npc/metropolice/vo/transitblock.wav");
CAKE.AddVoice("Combine", "2", "Two.", "npc/metropolice/vo/two.wav");
CAKE.AddVoice("Combine", "UPI", "UPI.", "npc/metropolice/vo/upi.wav");
CAKE.AddVoice("Combine", "Vacate", "Vacate Citizen.", "npc/metropolice/vo/vacatecitizen.wav");
CAKE.AddVoice("Combine", "Viscerator", "Viscerator Deployed.", "npc/metropolice/vo/visceratordeployed.wav");
CAKE.AddVoice("Combine", "Viscerator is OC", "Watch it, Viscerator Is OC!", "npc/metropolice/vo/visceratorisoc.wav");
CAKE.AddVoice("Combine", "Vi Off Grid", "Viscerator is off grid.", "npc/metropolice/vo/visceratorisoffgrid.wav");
CAKE.AddVoice("Combine", "Waste River", "Waste River.", "npc/metropolice/vo/wasteriver.wav");
CAKE.AddVoice("Combine", "Socialstable", "We are socialstable on this location.", "npc/metropolice/vo/wearesocialstablethislocation.wav");
CAKE.AddVoice("Combine", "10-108", "We have 10-108", "npc/metropolice/vo/wehave10-108.wav");
CAKE.AddVoice("Combine", "Work Force", "Work force intake.", "npc/metropolice/vo/workforceintake.wav");
CAKE.AddVoice("Combine", "Yellow", "Yellow.", "npc/metropolice/vo/yellow.wav");
CAKE.AddVoice("Combine", "On visial", "Acquiring on visual.", "npc/metropolice/vo/acquiringonvisual.wav");
CAKE.AddVoice("Combine", "BOL 2", "All units, BOL, we have 34 hits at", "npc/metropolice/vo/allunitsbol34sat.wav");
CAKE.AddVoice("Combine", "Close on Suspect", "All units, close on suspect.", "npc/metropolice/vo/allunitscloseonsuspect.wav");
CAKE.AddVoice("Combine", "647E", "Anyone pick up uuhh.. 647E?", "npc/metropolice/vo/anyonepickup647e.wav");
CAKE.AddVoice("Combine", "At Checkpoint", "At checkpoint.", "npc/metropolice/vo/atcheckpoint.wav");
CAKE.AddVoice("Combine", "Back Me Up", "Back me up, im out!.", "npc/metropolice/vo/backmeupImout.wav");
CAKE.AddVoice("Combine", "Break Cover", "Break his cover!.", "npc/metropolice/vo/breakhiscover.wav");
CAKE.AddVoice("Combine", "Bugs", "Bugs.", "npc/metropolice/vo/bugs.wav");
CAKE.AddVoice("Combine", "Miscount", "Check for... Miscount.", "npc/metropolice/vo/checkformiscount.wav");
CAKE.AddVoice("Combine", "Code 7", "Code seven.", "npc/metropolice/vo/code7.wav");
CAKE.AddVoice("Combine", "Condemned", "Condemned Zone.", "npc/metropolice/vo/condemnedzone.wav");
CAKE.AddVoice("Combine", "Contact With", "Contact with priority two.", "npc/metropolice/vo/contactwithpriority2.wav");
CAKE.AddVoice("Combine", "Converging", "Converging!", "npc/metropolice/vo/converging.wav");
CAKE.AddVoice("Combine", "Compromised", "CP is compromised, We have stablished.", "npc/metropolice/vo/cpiscompromised.wav");
CAKE.AddVoice("Combine", "Overrun", "CP is overrun, We have no containment!", "npc/metropolice/vo/cpisoverrunwehavenocontainment.wav");
CAKE.AddVoice("Combine", "Perimeter", "CP We need to establish a Perimeter at...", "npc/metropolice/vo/cpweneedtoestablishaperimeterat.wav");
CAKE.AddVoice("Combine", "Defender", "Defender!", "npc/metropolice/vo/defender.wav");
CAKE.AddVoice("Combine", "Deserviced", "Deserviced Area.", "npc/metropolice/vo/deservicedarea.wav");
CAKE.AddVoice("Combine", "Document", "Document.", "npc/metropolice/vo/document.wav");
CAKE.AddVoice("Combine", "8", "Eight.", "npc/metropolice/vo/eight.wav");
CAKE.AddVoice("Combine", "10", "Ten.", "npc/metropolice/vo/ten.wav");
CAKE.AddVoice("Combine", "Examine", "Examine.", "npc/metropolice/vo/examine.wav");
CAKE.AddVoice("Combine", "Expired", "Expired.", "npc/metropolice/vo/expired.wav");
CAKE.AddVoice("Combine", "5", "Five.", "npc/metropolice/vo/five.wav");
CAKE.AddVoice("Combine", "4", "Four.", "npc/metropolice/vo/four.wav");
CAKE.AddVoice("Combine", "Take a look", "Going to take a look.", "npc/metropolice/vo/goingtotakealook.wav");
CAKE.AddVoice("Combine", "Grenade", "Grenade!", "npc/metropolice/vo/grenade.wav");
CAKE.AddVoice("Combine", "Hardpoint Scan", "Hardpoint Scanning.", "npc/metropolice/vo/hardpointscanning.wav");
CAKE.AddVoice("Combine", "Hero", "Hero.", "npc/metropolice/vo/hero.wav");
CAKE.AddVoice("Combine", "Up There", "Hes up there.", "npc/metropolice/vo/hesupthere.wav");
CAKE.AddVoice("Combine", "High Priority", "High Priority Region.", "npc/metropolice/vo/highpriorityregion.wav");
CAKE.AddVoice("Combine", "Infection", "Infection.", "npc/metropolice/vo/infection.wav");
CAKE.AddVoice("Combine", "Industrial Zone", "Industrial Zone.", "npc/metropolice/vo/industrialzone.wav");
CAKE.AddVoice("Combine", "Interlock", "Interlock.", "npc/metropolice/vo/interlock.wav");
CAKE.AddVoice("Combine", "Is at hardpoint", "At hardpoint, ready to prosecute.", "npc/metropolice/vo/isathardpointreadytoprosecute.wav");
CAKE.AddVoice("Combine", "Down", "Is down!.", "npc/metropolice/vo/isdown.wav");
CAKE.AddVoice("Combine", "Is go", "Is go.", "npc/metropolice/vo/isgo.wav");
CAKE.AddVoice("Combine", "Is moving in", "Is moving in.", "npc/metropolice/vo/ismovingin.wav");
CAKE.AddVoice("Combine", "Passive", "Is passive.", "npc/metropolice/vo/ispassive.wav");
CAKE.AddVoice("Combine", "Is ready go", "Is ready to go.", "npc/metropolice/vo/isreadytogo.wav");
CAKE.AddVoice("Combine", "Line", "Line.", "npc/metropolice/vo/line.wav");
CAKE.AddVoice("Combine", "Location", "Location.", "npc/metropolice/vo/location.wav");
CAKE.AddVoice("Combine", "Look out", "Look out!", "npc/metropolice/vo/lookout.wav");
CAKE.AddVoice("Combine", "Malignant", "Malignant.", "npc/metropolice/vo/malignant.wav");
CAKE.AddVoice("Combine", "Meters", "Meters.", "npc/metropolice/vo/meters.wav");
CAKE.AddVoice("Combine", "9", "Nine.", "npc/metropolice/vo/nine.wav");
CAKE.AddVoice("Combine", "1", "One.", "npc/metropolice/vo/one.wav");
CAKE.AddVoice("Combine", "Pacifying", "Pacifying.", "npc/metropolice/vo/pacifying.wav");
CAKE.AddVoice("Combine", "Production Block", "Production Block.", "npc/metropolice/vo/productionblock.wav");
CAKE.AddVoice("Combine", "PT", "PT Go again.", "npc/metropolice/vo/ptgoagain.wav");
CAKE.AddVoice("Combine", "Quick", "Quick!", "npc/metropolice/vo/quick.wav");
CAKE.AddVoice("Combine", "Ready judge", "Ready to judge!", "npc/metropolice/vo/readytojudge.wav");
CAKE.AddVoice("Combine", "Ready prosecute", "Ready to prosecute!", "npc/metropolice/vo/readytoprosecute.wav");
CAKE.AddVoice("Combine", "Repurposed", "Repurposed Area.", "npc/metropolice/vo/repurposedarea.wav");
CAKE.AddVoice("Combine", "Responding", "Responding.", "npc/metropolice/vo/responding.wav");
CAKE.AddVoice("Combine", "Roller", "Roller!", "npc/metropolice/vo/roller.wav");
CAKE.AddVoice("Combine", "7", "Seven.", "npc/metropolice/vo/seven.wav");
CAKE.AddVoice("Combine", "6", "Six.", "npc/metropolice/vo/six.wav");
CAKE.AddVoice("Combine", "Stick", "Stick.", "npc/metropolice/vo/stick.wav");
CAKE.AddVoice("Combine", "Storm system", "Storm System.", "npc/metropolice/vo/stormsystem.wav");
CAKE.AddVoice("Combine", "Subject high speed", "All Units be adviced, Subject is now high speed.", "npc/metropolice/vo/subjectisnowhighspeed.wav");
CAKE.AddVoice("Combine", "Subject Moved to", "Subject has Moved now to...", "npc/metropolice/vo/subjecthasmovednowto.wav");
CAKE.AddVoice("Combine", "Suspend", "Suspend.", "npc/metropolice/vo/suspend.wav");
CAKE.AddVoice("Combine", "Tag Biotic", "Tag one Biotic.", "npc/metropolice/vo/tagonebiotic.wav");
CAKE.AddVoice("Combine", "Tap", "Tap.", "npc/metropolice/vo/tap.wav");
CAKE.AddVoice("Combine", "Team Position", "Team in position, advance.", "npc/metropolice/vo/teaminpositionadvance.wav");
CAKE.AddVoice("Combine", "Grenade 2", "Thats a grenade!", "npc/metropolice/vo/thatsagrenade.wav");
CAKE.AddVoice("Combine", "Hammer", "Hammer.", "npc/combine_soldier/vo/hammer.wav");
CAKE.AddVoice("Combine", "Hunter", "Hunter.", "npc/combine_soldier/vo/hunter.wav");
CAKE.AddVoice("Combine", "Ice", "Ice.", "npc/combine_soldier/vo/ice.wav");
CAKE.AddVoice("Combine", "Jet", "Jet.", "npc/combine_soldier/vo/jet.wav");
CAKE.AddVoice("Combine", "One down", "One down!", "npc/combine_soldier/vo/onedown.wav");
CAKE.AddVoice("Combine", "Overwatch reinforcement", "Overwatch request reinforcement.", "npc/combine_soldier/vo/overwatchrequestreinforcement.wav");
CAKE.AddVoice("Combine", "Overwatch team down", "Overwatch team is down, Sector is not in control.", "npc/combine_soldier/vo/overwatchteamisdown.wav");
CAKE.AddVoice("Combine", "Ranger", "Ranger.", "npc/combine_soldier/vo/ranger.wav");
CAKE.AddVoice("Combine", "Ready weapons", "Ready weapons.", "npc/combine_soldier/vo/readyweapons.wav");
CAKE.AddVoice("Combine", "Scar", "Scar.", "npc/combine_soldier/vo/scar.wav");
CAKE.AddVoice("Combine", "Secure", "Secure", "npc/combine_soldier/vo/secure.wav");
CAKE.AddVoice("Combine", "Stab", "Stab.", "npc/combine_soldier/vo/stab.wav");
CAKE.AddVoice("Combine", "Slam", "Slam.", "npc/combine_soldier/vo/slam.wav");
CAKE.AddVoice("Combine", "Slash", "Slash.", "npc/combine_soldier/vo/slash.wav");
CAKE.AddVoice("Combine", "Star", "Star", "npc/combine_soldier/vo/star.wav");
CAKE.AddVoice("Combine", "Target at", "Target is at", "npc/combine_soldier/vo/targetisat.wav");
CAKE.AddVoice("Combine", "Target one", "Target one.", "npc/combine_soldier/vo/targetone.wav");
CAKE.AddVoice("Combine", "Viscon", "Viscon.", "npc/combine_soldier/vo/viscon.wav");
CAKE.AddVoice("Combine", "Uniform", "Uniform.", "npc/combine_soldier/vo/uniform.wav");
CAKE.AddVoice("Combine", "Closing", "Closing.", "npc/combine_soldier/vo/closing.wav");
CAKE.AddVoice("Combine", "Degrees", "Degrees.", "npc/combine_soldier/vo/degrees.wav");
CAKE.AddVoice("Combine", "Flush", "Flush.", "npc/combine_soldier/vo/flush.wav");
CAKE.AddVoice("Combine", "Fist", "Fist.", "npc/combine_soldier/vo/fist.wav");
CAKE.AddVoice("Combine", "Leader", "Leader.", "npc/combine_soldier/vo/leader.wav");
CAKE.AddVoice("Combine", "Sharp zone", "Sharp Zone.", "npc/combine_soldier/vo/sharpzone.wav");
CAKE.AddVoice("Combine", "Striker", "Striker.", "npc/combine_soldier/vo/striker.wav");
CAKE.AddVoice("Combine", "Unit closing", "Unit is closing.", "npc/combine_soldier/vo/unitisclosing.wav");
CAKE.AddVoice("Combine", "Unit moving in", "Unit is moving in.", "npc/combine_soldier/vo/unitismovingin.wav");
CAKE.AddVoice("Combine", "Unit inbound", "Unit is inbound.", "npc/combine_soldier/vo/unitisinbound.wav");

CAKE.AddVoice("Human", "Hi", "Hi.","vo/npc/male01/hi01.wav", "vo/npc/female01/hi01.wav");
CAKE.AddVoice("Human", "I'll Stay Here", "I'll stay here.","vo/npc/male01/illstayhere01.wav", "vo/npc/female01/illstayhere01.wav");
CAKE.AddVoice("Human", "I'm Hurt", "I'm hurt!","vo/npc/male01/imhurt02.wav", "vo/npc/female01/imhurt02.wav");
CAKE.AddVoice("Human", "Manhack", "It's a manhack!","vo/npc/male01/itsamanhack02.wav", "vo/npc/female01/itsamanhack02.wav");
CAKE.AddVoice("Human", "Lead the Way", "You lead the way!","vo/npc/male01/leadtheway01.wav", "vo/npc/female01/leadtheway01.wav");
CAKE.AddVoice("Human", "Let's Go", "Let's go!","vo/npc/male01/letsgo02.wav", "vo/npc/female01/letsgo02.wav");
CAKE.AddVoice("Human", "Like That", "Haha! Like that?","vo/npc/male01/likethat.wav", "vo/npc/female01/likethat.wav");
CAKE.AddVoice("Human", "My Arm", "Gah, my arm!","vo/npc/male01/myarm01.wav", "vo/npc/female01/myarm01.wav");
CAKE.AddVoice("Human", "My Gut", "Uhh ah! My gut!","vo/npc/male01/mygut02.wav", "vo/npc/female01/mygut02.wav");
CAKE.AddVoice("Human", "My Leg", "Ah! My leg!","vo/npc/male01/myleg01.wav", "vo/npc/female01/myleg01.wav");
CAKE.AddVoice("Human", "No No", "No... no!","vo/npc/male01/no01.wav", "vo/npc/female01/no01.wav");
CAKE.AddVoice("Human", "No", "Noooo!","vo/npc/male01/no02.wav", "vo/npc/female01/no02.wav");
CAKE.AddVoice("Human", "Oh No", "Oh no!","vo/npc/male01/ohno.wav", "vo/npc/female01/ohno.wav");
CAKE.AddVoice("Human", "Okay", "Okay.","vo/npc/male01/ok01.wav", "vo/npc/female01/ok01.wav");
CAKE.AddVoice("Human", "I'm Ready", "Okay, I'm ready.","vo/npc/male01/okimready02.wav", "vo/npc/female01/okimready02.wav");
CAKE.AddVoice("Human", "Over Here", "Hey over here!","vo/npc/male01/overhere01.wav", "vo/npc/female01/overhere01.wav");
CAKE.AddVoice("Human", "All Over", "When this is all over... ah, who am I kidding?","vo/npc/male01/question04.wav", "vo/npc/female01/question04.wav");
CAKE.AddVoice("Human", "Cheese", "Sometimes, I dream about cheese.","vo/npc/male01/question06.wav", "vo/npc/female01/question06.wav");
CAKE.AddVoice("Human", "Freedom", "You smell that? It's freedom.","vo/npc/male01/question07.wav", "vo/npc/female01/question07.wav");
CAKE.AddVoice("Human", "I Could Eat", "Uhh, I could eat a horse...hooves and all.","vo/npc/male01/question09.wav", "vo/npc/female01/question09.wav");
CAKE.AddVoice("Human", "Getting Worse", "Looks to me, things are getting worse, not better.","vo/npc/male01/question12.wav", "vo/npc/male01/question12.wav");
CAKE.AddVoice("Human", "Reminds", "I'm not even gonna tell you what that reminds me of.","vo/npc/male01/question14.wav", "vo/npc/female01/question14.wav");
CAKE.AddVoice("Human", "Over Again", "If I could live my life over again...","vo/npc/male01/question13.wav", "vo/npc/female01/question13.wav");
CAKE.AddVoice("Human", "Stalker", "They never, gonna make a stalker out of me.","vo/npc/male01/question15.wav", "vo/npc/female01/question15.wav");
CAKE.AddVoice("Human", "Bad Memory", "Someday... this all will be a bad memory.","vo/npc/male01/question20.wav", "vo/npc/female01/question20.wav");
CAKE.AddVoice("Human", "This Tune", "I can't get this tune out of my head. *whistles*","vo/npc/male01/question23.wav", "vo/npc/female01/question23.wav");
CAKE.AddVoice("Human", "Sorry", "Sorry!","vo/npc/male01/sorry03.wav", "vo/npc/female01/sorry03.wav");
CAKE.AddVoice("Human", "Huh", "Huh!?","vo/npc/male01/startle01.wav", "vo/npc/female01/startle01.wav");
CAKE.AddVoice("Human", "Run", "Ruuun!","vo/npc/male01/strider_run.wav", "vo/npc/female01/strider_run.wav");
CAKE.AddVoice("Human", "Take Cover", "Take cover!","vo/npc/male01/takecover02.wav", "vo/npc/female01/takecover02.wav");
CAKE.AddVoice("Human", "Trusted You", "We trusted you!","vo/npc/male01/wetrustedyou01.wav", "vo/npc/female01/wetrustedyou01.wav");
CAKE.AddVoice("Human", "Medkit", "Take this medkit!","vo/npc/male01/health03.wav", "vo/npc/female01/health03.wav");
CAKE.AddVoice("Human", "Help", "Help!","vo/npc/male01/help01.wav", "vo/npc/female01/help01.wav");
CAKE.AddVoice("Human", "Here They Come", "Here they come!","vo/npc/male01/heretheycome01.wav", "vo/npc/female01/heretheycome01.wav");
CAKE.AddVoice("Human", "Finally", "Finally!","vo/npc/male01/finally.wav", "vo/npc/female01/finally.wav");
CAKE.AddVoice("Human", "Hell Outta Here", "Get the hell outta here!","vo/npc/male01/gethellout.wav", "vo/npc/female01/gethellout.wav");
CAKE.AddVoice("Human", "Please No", "Please... no...","vo/npc/male01/gordead_ans06.wav", "vo/npc/female01/gordead_ans06.wav");
CAKE.AddVoice("Human", "Gotta Hurt", "If you dare say: That's gotta hurt, I'll kill you.","vo/npc/male01/gordead_ans07.wav", "vo/npc/female01/gordead_ans07.wav");
CAKE.AddVoice("Human", "Get Down", "Get down!","vo/npc/male01/getdown02.wav", "vo/npc/female01/getdown02.wav");
CAKE.AddVoice("Human", "Combine", "Combine!","vo/npc/male01/combine01.wav", "vo/npc/female01/combine01.wav");
CAKE.AddVoice("Human", "Look He's Dead", "Look! He's dead!","vo/npc/male01/gordead_ques07.wav", "vo/npc/female01/gordead_ques07.wav");
CAKE.AddVoice("Human", "Dead", "He's dead.","vo/npc/male01/gordead_ques01.wav", "vo/npc/female01/gordead_ques01.wav");
CAKE.AddVoice("Human", "Like This", "It's not supposed to end like this!","vo/npc/male01/gordead_ques14.wav", "vo/npc/female01/gordead_ques14.wav");