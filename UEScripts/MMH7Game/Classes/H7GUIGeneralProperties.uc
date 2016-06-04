class H7GUIGeneralProperties extends Object
	native
	config(game)
	dependson(H7GraphicsController)
	hideCategories(Object);

enum ETextureQuality
{
	TEXQ_LOWEST,
	TEXQ_LOW,
	TEXQ_MEDIUM,
	TEXQ_HIGH,
	TEXQ_ULTRA
};

enum ELanguageExt
{
	LANG_INT,
	LANG_DEU,
	LANG_FRA,
	LANG_POL,
	LANG_HUN,
	LANG_CHT,
	LANG_CHN,
	LANG_ITA,
	LANG_ESN,
	LANG_CZE,
	LANG_KOR,
	LANG_PTB,
	LANG_RUS,
	LANG_RUM,
};

enum EAudioLanguageExt
{
	AUDIOLANG_INT,
	AUDIOLANG_DEU,
	AUDIOLANG_FRA,
	AUDIOLANG_POL,
	AUDIOLANG_CHN,
	AUDIOLANG_RUS,
};

struct native H7MinimapOption
{
	var string mCategoryID;
	var bool mVisible;
};

// hidden options (ini file only)
var() config bool mDevHardwareCursor;
var() config bool mReleaseHardwareCursor;
var() config bool mFlashMouse;
var() config bool mCanvasMouse;
var() config bool mSmartOverlayUpdate;
var() config float mFCTDuration,mFCTFadeDelay;
var() config int mFCTEndAlpha,mFCTHeight;
var() config bool mDamageTooltipEffects;
var() config bool mClickedTutorial;
var() config bool mClickedLostTales;
var() config bool mClickedLostTales2;
var() config bool mCombatGridVisible;
// hidden options (accessible through cheat menu)
var() config bool mUnlimitedMovement;
var() config bool mUnlimitedMana;
var() config bool mUnlimitedBuilding;
// hidden options (accessible through minimap menu)
var() config array<H7MinimapOption> mMinimapOptions;
// option in other tabs, but in this class because the other class (playercontroller) does not work
var() config bool mGameplayWaitsForAnim;
var() config bool mRightMouseRotatingEnabled;

// in GUI options
////////////////////////////////////////////
/* Default values go into DefaultGame.ini */
/*  (actual values are in MMH7Game.ini)   */
////////////////////////////////////////////
var() config bool mAutogeneratedTooltipExtension;
var() config bool mAmbientOcclusion;
var() config bool mLogState;
var() config bool mWeeklyEffectPopup;
var() config float mSideBarLiveTime;
var() config float mSideBarCollapseTime;
var() config float mTooltipDelayTime;
var() config float mTooltipCooldownTime;
var() config bool mShowBuildTreeAll;
var() config bool mHoverDecalEnabled;
var() config bool mAutoPlayDialogs;
var() config bool mNoteBarStatus;
var() config bool mTurnOverPopupEnabled;
var() config bool mAutosaveEnabled;
var() config bool mColorCodeModels;
// in gui debug options, but hidden if mDebugOptions is false
var() config bool mQALogState;
var() config bool mShowHiddenBuffs; 
var() config bool mShowHiddenBuffsLog;
var() config bool mShowHiddenEffects;
var() config bool mSkipTactics;
var() config bool mDebugCheats;
var() config bool mDebugWindow;
var() config bool mDebugOptions;
var() config bool mDebugControls;
var() config bool mDemoDuels;
var() config bool mShowLocaKeys;
var() config bool mCampaignsEnabled;
var() config bool mSkirmishEnabled;
var() config bool mDuelEnabled;
var() config bool mChatEnabled;

//Changes which needs to saved until the restart sets them into the engine. Is needed for proper GUI Feedback after adjustments
var protected string mCurrentLanguageExt;
var protected string mCurrentAudioLanguageExt;

// Chance for the coolcam to be played when an action requires a coolcam
var( CoolCam ) config int mCoolCamChance<DisplayName=Cool camera chance|ClampMin=0|ClampMax=100>;
// Game speed of the cool camera
var( CoolCam ) config float mCoolCamGameSpeed<DisplayName=Cool camera game speed|ClampMin=0.3|ClampMax=2.0>;
// Enable Combat Camera Actions, like PresentArmy or IntroduceHero
var( CoolCam ) config bool mCoolCamCombatActionAllowed<DisplayName=Enable combat camera actions>;

///////////////////
// MODDING MAPPINGS
///////////////////
var(Icons) H7MagicSchoolIcons   mMagicSchoolIcons<DisplyName=Magic School Icons>;
var(Icons) H7StatIcons          mStatIcons<DisplayName=Stat Icons>;
var(Icons) H7StatIcons          mStatIconsInText<DisplayName=Stat Icons In Text>;
var(Icons) H7CouncilMapping     mCouncilMapping<DisplayName=Councilor Icons>;
var(Icons) H7ButtonIcons        mButtonIcons<DisplayName=Button Icons>;
var(Messages) H7MessageMapping  mMessageMapping<DisplayName=Messages>;
var(Colors) H7APRColorMapping   mAPRColorMapping<DisplayName=Threat Level Colors>;
var(Colors) H7TextColors        mTextColors<DisplayName=Text Colors>;
///////////////////
// TEMP FAKE HACK // TODO remove when CCU does spell and skill scanner
var(SpellData) H7CheatData mCheatData<DisplayName=Cheat Data>;

var(FortificationIcons) Texture2D mIconWall;
var(FortificationIcons) Texture2D mIconTower;
var(FortificationIcons) Texture2D mIconGate;

static function H7GUIGeneralProperties GetInstance() { return class'H7PlayerController'.static.GetPlayerController().GetHud().GetProperties(); };

// Getter & Setter
function bool GetOptionFlashCursor() { return mFlashMouse; }
function bool GetOptionCanvasCursor() { return mCanvasMouse; }
function bool GetOptionTurnOverPopup() { return mTurnOverPopupEnabled; }
function bool GetOptionWeeklyPopup() { return mWeeklyEffectPopup; }
function bool GetOptionHiddenBuffs() { return mShowHiddenBuffs; }
function bool GetOptionHiddenBuffsLog() { return mShowHiddenBuffsLog; }
function bool GetOptionHiddenEffects() { return mShowHiddenEffects; }
function float GetOptionSideBarLiveTime() { return mSideBarLiveTime; }
function float GetOptionTooltipCooldownime() { return mTooltipCooldownTime; }
function int   GetCoolCamChance()            { return mCoolCamChance; }
function float GetCoolCamChanceFloat()       { return float(mCoolCamChance)/100.f; }
function float GetCoolCamGameSpeed()         { return mCoolCamGameSpeed; }
function bool  GetCoolCamCombatActionAllowed()   { return mCoolCamCombatActionAllowed; }
function bool GetOptionBuildTreeShowAll()        { return mShowBuildTreeAll; }
function H7CheatData GetCheatData()              { return mCheatData; }
function bool GetOptionAutoPlayDialogs()        { return mAutoPlayDialogs; }
function String GetIconWallPath()       { return "img://" $ Pathname( mIconWall );}
function String GetIconGatePath()       { return "img://" $ Pathname( mIconGate );}
function String GetIconTowerPath()       { return "img://" $ Pathname( mIconTower );}

function bool GetDebugCheats()        { return mDebugCheats || class'H7GameUtility'.static.IsCheatsForced(); }
function bool GetDebugWindow()        { return mDebugWindow || class'H7GameUtility'.static.IsCheatsForced(); }
function bool GetDebugOptions()        { return mDebugOptions || class'H7GameUtility'.static.IsCheatsForced(); }
function bool GetDebugControls()        { return mDebugControls || class'H7GameUtility'.static.IsCheatsForced(); }

function SetOptionFlashCursor(bool val) { mFlashMouse = val; }
function SetOptionCanvasCursor(bool val) { mCanvasMouse = val; }
function SetOptionTurnOverPopup(bool val) { mTurnOverPopupEnabled = val; }
function SetOptionWeeklyPopup(bool val) { mWeeklyEffectPopup = val; }
function SetOptionHiddenBuffs(bool val) { mShowHiddenBuffs = val; }
function SetOptionHiddenBuffsLog(bool val) { mShowHiddenBuffsLog = val; }
function SetOptionHiddenEffects(bool val) { mShowHiddenEffects = val; }
function SetOptionSideBarLiveTime(float val) { mSideBarLiveTime = val; }
function SetOptionTooltipCooldownTime(float val) { mTooltipCooldownTime = val; }
function SetOptionBuildTreeShowAll(bool val) { mShowBuildTreeAll = val; }
function SetCoolCamChance( int newChance )		    { mCoolCamChance = newChance;    }
function SetCoolCamChanceFloat( float newChance )   { mCoolCamChance = newChance*100;}
function SetCoolCamGameSpeed( float newSpeed )      { mCoolCamGameSpeed = newSpeed;  }
function SetCoolCamCombatActionAllowed(bool val)        { mCoolCamCombatActionAllowed = val; }
function SetOptionAutoPlayDialogs(bool val)         { mAutoPlayDialogs = val; }
function SetDebugCheats(bool val)         { mDebugCheats = val; }
function SetDebugWindow(bool val)         { mDebugWindow = val; }
function SetDebugOptions(bool val)         { mDebugOptions = val; }
function SetDebugControls(bool val)         { mDebugControls = val; }

function float GetOptionTooltipDelayTime() { return mTooltipDelayTime; }
function SetOptionTooltipDelayTime(float val) { mTooltipDelayTime = val; }

function bool GetOptionShowLocaKeys()        { return mShowLocaKeys; }
function SetOptionShowLocaKeys(bool val)     { mShowLocaKeys = val; }

function bool GetOptionCampaignsEnabled()        { return mCampaignsEnabled; }
function SetOptionCampaignsEnabled(bool val)     { mCampaignsEnabled = val; }

function bool GetOptionSkirmishEnabled()        { return mSkirmishEnabled; }
function SetOptionSkirmishEnabled(bool val)     { mSkirmishEnabled = val; }

function bool GetOptionDuelEnabled()        { return mDuelEnabled; }
function SetOptionDuelEnabled(bool val)     { mDuelEnabled = val; }

function bool GetOptionChatEnabled()      { return mChatEnabled && class'WorldInfo'.static.GetWorldInfo().GRI.IsMultiplayerGame(); }
function SetOptionChatEnabled(bool val)     { mChatEnabled = val; }

function bool GetOptionDamageTooltipEffectsEnabled()        { return mDamageTooltipEffects; }
function SetOptionDamageTooltipEffectsEnabled(bool val)     { mDamageTooltipEffects = val; }

function bool GetDemoDuels()            { return mDemoDuels; }
function SetDemoDuels(bool val)         { mDemoDuels = val; }

function bool GetOptionAutosaveEnabled()        { return mAutosaveEnabled; }
function SetOptionAutosaveEnabled(bool val)     { mAutosaveEnabled = val; class'H7ReplicationInfo'.static.GetInstance().SetAutoSaveEnabled(mAutosaveEnabled);}

function bool GetGameplayWaitsForAnim() { return mGameplayWaitsForAnim; }
function SetGameplayWaitsForAnim(bool val) { mGameplayWaitsForAnim = val; } 

function bool GetOptionColorCodeModels()            { return mColorCodeModels; }
function SetOptionColorCodeModels(bool val)         { mColorCodeModels = val; }
function bool IsUsingModelColoring()               
{
	// if campaign we forbid it:
	if(class'H7AdventureController'.static.GetInstance() != none && class'H7AdventureController'.static.GetInstance().GetCampaign() != none)
	{
		return false;
	}
	// if not we use the user's preference
	return class'H7GUIGeneralProperties'.static.GetInstance().GetOptionColorCodeModels(); 
}

function bool GetRightMouseRotatingEnabled() { return mRightMouseRotatingEnabled; }
function SetRightMouseRotatingEnabled(bool val) { mRightMouseRotatingEnabled = val; } 

function vector2d GetSideBarAliveConstraints()
{
	local vector2d c;
	c.X = 0.5;
	c.Y = 5;
	return c;
}

function vector2d GetSideBarCollapseConstraints()
{
	local vector2d c;
	c.X = 0;
	c.Y = 10;
	return c;
}

function vector2d GetTooltipCooldownTimeConstraints()
{
	local vector2d c;
	c.X = 0.0;
	c.Y = 2.0;
	return c;
}

function bool GetHoverDecalEnabled() { return mHoverDecalEnabled; }
function SetHoverDecalEnabled(bool val) { mHoverDecalEnabled = val; }

function bool GetLogStatus() { return mLogState; }
function SetLogStatus(bool val) 
{ 
	local H7GFxLog log;
	;

	log = class'H7PlayerController'.static.GetPlayerController().GetHud().GetLogCntl().GetLog();
	if(log != none)
	{
		log.SetStatus(val);
		mLogState = val;
	}
}
function bool GetQALogStatus() { return mQALogState; }
function SetQALogStatus(bool val) 
{ 
	class'H7PlayerController'.static.GetPlayerController().GetHud().GetLogCntl().GetQALog().SetStatus(val); 
	mQALogState = val;
}
function bool GetAutoTooltipState() { return mAutogeneratedTooltipExtension; }
function SetAutoTooltipState(bool val) { mAutogeneratedTooltipExtension = val; }

function bool GetSkipTactics() { return mSkipTactics; }
function SetSkipTactics(bool val) { mSkipTactics = val; }

function float GetOptionSideBarCollapseTime() { return mSideBarCollapseTime; }
function SetOptionSideBarCollapseTime(float val) { mSideBarCollapseTime = val; }

function bool GetNoteBarStatus() { return mNoteBarStatus; }
function SetNoteBarStatus(bool val) 
{ 
	class'H7AdventureHudCntl'.static.GetInstance().GetNoteBar().SetState(val); 
	mNoteBarStatus = val;
}

function bool GetUnlimitedMovement() 
{ 
	return class'H7OptionsManager'.static.GetInstance().GetSettingBool("SHOW_DEBUG_CHEATS") && mUnlimitedMovement; 
}
function SetUnlimitedMovement(bool val) { mUnlimitedMovement = val; }

function bool GetUnlimitedMana() 
{ 
	return class'H7OptionsManager'.static.GetInstance().GetSettingBool("SHOW_DEBUG_CHEATS") && mUnlimitedMana; 
}
function SetUnlimitedMana(bool val) { mUnlimitedMana = val; }

function bool IsUnlimitedBuilding() 
{ 
	return class'H7OptionsManager'.static.GetInstance().GetSettingBool("SHOW_DEBUG_CHEATS") && mUnlimitedBuilding; 
}
function SetUnlimitedBuilding(bool val) { mUnlimitedBuilding = val; }

function int GetResolution()
{
	return GetResolutionIndexInList();
}
function int GetResolutionIndexInList(int windowMode=INDEX_NONE) // returns index of the current resolution in the list
{
	local Vector2d res;
	local int i;
	local array<FullscreenResolution> resolutions;
	local FullscreenResolution resolution;
	local bool success;

	success = GetAvailableAndCurrentResolutions(resolutions,windowMode);

	// the real resolution from viewport:
	res = class'H7PlayerController'.static.GetPlayerController().GetScreenResolution();
	if(success)
	{
		foreach resolutions(resolution,i)
		{
			if(res.X == resolution.Width && res.Y == resolution.Height)
			{
				return i;
			}
		}
	}

	;
	
	return INDEX_NONE;
}
function SetResolution(int resIndex)
{
	local int x,y;
	local array<FullscreenResolution> resolutions;
	local FullscreenResolution resolution;
	local bool success;

	success = GetAvailableAndCurrentResolutions(resolutions,
		class'H7OptionsMenuCntl'.static.GetInstance().GetCurrentResolutionListWindowMode(),
		class'H7OptionsMenuCntl'.static.GetInstance().GetCurrentResolutionListIncludeCurrent()
	);

	if(success)
	{
		resolution = resolutions[resIndex];
	}

	if(resIndex == INDEX_NONE || !success) 
	{
		class'H7MessageSystem'.static.GetInstance().CreateAndSendMessage( class'H7Loca'.static.LocalizeSave("MSG_ERROR_SET_RESOLUSTION","H7Message"),MD_SIDE_BAR);
		return;
	}

	// set new resolution
	x = resolution.Width;
	y = resolution.Height;
	
	class'H7PlayerController'.static.GetPlayerController().SetBufferedCommand_Resolution(x,y);
}
function SetGraphicsCard(int i)
{
	// you can not
}
function int GetGraphicsCard()
{
	return 0; // always the only one
}
function array<String> GetGraphicsCardList()
{
	local string adapterName;
	local array<String> list;
	class'H7GraphicsController'.static.GetAdapterName(adapterName);
	list.AddItem(adapterName);
	return list;
}
function string GetAspectRatio(FullscreenResolution resolution)
{
	if(float(resolution.Width) / float(resolution.Height) == 16.f / 9.f)
	{
		return "16:9";
	}
	else if(float(resolution.Width) / float(resolution.Height) == 4.f / 3.f)
	{
		return "4:3";
	}
	else
	{
		return "";
	}
}
function array<String> GetResolutionList()
{
	return GetResolutionListForWindowMode(); // for current window mode
}
function array<String> GetResolutionListForWindowMode(int windowMode=INDEX_NONE,bool includeCurrentResolution=true)
{
	local array<String> list;
	local array<FullscreenResolution> resolutions;
	local FullscreenResolution resolution;
	local bool success;

	success = GetAvailableAndCurrentResolutions(resolutions,windowMode,includeCurrentResolution);
	//list.AddItem("CUSTOM_RESOLUTION");
	if(success)
	{
		foreach resolutions(resolution)
		{
			list.AddItem(resolution.Width $ "x" $ resolution.Height @ GetAspectRatio(resolution));
		}
	}
	else
	{
		list.AddItem("UNSUPPORTED");
	}
	return list;
}
function bool GetAvailableAndCurrentResolutions(out array<FullscreenResolution> resolutions,int windowMode=INDEX_NONE,bool includeCurrentResolution=true)
{
	local bool success;
	local bool currentResInList;
	local Vector2D currentRes;
	local FullscreenResolution currentResStruct,resolution;
	local int i;

	currentRes = class'H7PlayerController'.static.GetPlayerController().GetScreenResolution();

	if(windowMode == INDEX_NONE)
	{
		windowMode = class'H7PlayerController'.static.GetPlayerController().GetWindowMode();
	}

	if(windowMode == WM_WINDOW)
	{
		success = class'H7GraphicsController'.static.GetAvailableWindowedResolutions(resolutions);
	}
	else if(windowMode == WM_BORDERLESS_WINDOW)
	{
		success = class'H7GraphicsController'.static.GetAvailableBorderlessResolutions(resolutions);
	}
	else if(windowMode == WM_FULLSCREEN)
	{
		success = class'H7GraphicsController'.static.GetAvailableFullscreenResolutions(resolutions);
		
		//debug
		foreach resolutions(resolution,i)
		{
			;
		}
	}

	if(success)
	{
		foreach resolutions(resolution,i)
		{
			if(currentRes.X == resolution.Width && currentRes.Y == resolution.Height)
			{
				currentResInList = true;
				break;
			}
		}

		if(!currentResInList && includeCurrentResolution)
		{
			currentResStruct.Width = currentRes.X;
			currentResStruct.Height = currentRes.Y;
			resolutions.AddItem(currentResStruct);
		}
	}
	return success;
}

// find the index of current language in the current language list
function int GetLanguageExt()
{
	local int i;
	local String rawName;
	local array<string> languages;
	
	languages = GetLanguageList();
	rawName = GetLanguage();
	i = languages.Find(rawName);

	;

	if(mCurrentLanguageExt != "")
	{
		i = languages.Find(mCurrentLanguageExt);
	}

	if(i == INDEX_NONE) return languages.Find("INT"); // if we are here, it's a language not available, let's default to english then

	return i;
}

function SetLanguageExt(int langListIndex)
{
	local string rawName;
	local string popUpMessage;
	local array<string> languages;
	
	languages = GetLanguageList();
	rawName = languages[langListIndex];

	mCurrentLanguageExt = rawName;
	
	class'H7EngineUtility'.static.SetGameLanguageExt(rawName);
	popUpMessage = class'H7Loca'.static.LocalizeSave("PU_RESTART_GAME","H7PopUp");
	class'H7PlayerController'.static.GetPlayerController().GetHud().GetRequestPopupCntl().GetRequestPopup().YesNoPopup( popUpMessage, class'H7Loca'.static.LocalizeSave("PU_RESTART","H7PopUp"), class'H7Loca'.static.LocalizeSave("PU_LATER","H7PopUp"), QuitGameConfirm, Resume  );
}

native function array<String> GetLanguageList();

function SetAudioLanguageExt(int langListIndex)
{
	local String rawName;
	local string popUpMessage;
	local array<string> languages;
	
	languages = GetAudioLanguageList();
	rawName = languages[langListIndex];
	mCurrentAudioLanguageExt = rawName;

	class'H7EngineUtility'.static.SetGameAudioLanguageExt(rawName);
	popUpMessage = class'H7Loca'.static.LocalizeSave("PU_RESTART_GAME","H7PopUp");
	class'H7PlayerController'.static.GetPlayerController().GetHud().GetRequestPopupCntl().GetRequestPopup().YesNoPopup( popUpMessage, class'H7Loca'.static.LocalizeSave("PU_RESTART","H7PopUp"), class'H7Loca'.static.LocalizeSave("PU_LATER","H7PopUp"), QuitGameConfirm, Resume  );
}

function int GetAudioLanguageExt()
{
	local int i;
	local String rawName;
	local array<string> languages;
	
	languages = GetAudioLanguageList();
	rawName = class'H7EngineUtility'.static.GetGameAudioLanguageExt();
	i = languages.Find(rawName);

	;
	if(mCurrentAudioLanguageExt != "")
	{
		i = languages.Find(mCurrentAudioLanguageExt);
	}

	if(i == INDEX_NONE) return languages.Find("INT"); // if we are here, it's a language without audio available, let's default to english then
	return i;
}

native function array<String> GetAudioLanguageList();

function bool GetSubtitelEnabled()
{
	return class'H7EngineUtility'.static.GetGameSubtitleEnabled();
}

function SetSubtitelEnabled(bool val)
{
	class'H7EngineUtility'.static.SetGameSubtitleEnabled( val );
}


function Resume(){}

function QuitGameConfirm()
{
	//ToDo INITALIZE GAME QUIT
	class'H7OptionsManager'.static.GetInstance().SaveAllConfigs();
	class'H7SoundController'.static.GetInstance().UpdateMusicGameStateSwitch("STOP_ALL_MUSIC");
	class'H7EngineUtility'.static.QuitGame();
}

native function int GetTextureQuality();
event SetTextureQuality(int texq)
{
	local ETextureQuality newTexQ;

	newTexQ = ETextureQuality(texq);
	if (newTexQ == TEXQ_LOWEST)
	{
		class'H7PlayerController'.static.GetPlayerController().ConsoleCommand("Scale Bucket Bucket1");
	}
	else if (newTexQ == TEXQ_LOW)
	{
		class'H7PlayerController'.static.GetPlayerController().ConsoleCommand("Scale Bucket Bucket2");
	}
	else if (newTexQ == TEXQ_MEDIUM)
	{
		class'H7PlayerController'.static.GetPlayerController().ConsoleCommand("Scale Bucket Bucket3");
	}
	else if (newTexQ == TEXQ_HIGH)
	{
		class'H7PlayerController'.static.GetPlayerController().ConsoleCommand("Scale Bucket Bucket4");
	}
	else if (newTexQ == TEXQ_ULTRA)
	{
		class'H7PlayerController'.static.GetPlayerController().ConsoleCommand("Scale Bucket Bucket5");
	}
}
function array<String> GetTextureQualityList()
{
	local array<String> list;
	local int i;
	local Name enumName;
	for(i=0;i<ETextureQuality.TEXQ_MAX;i++)
	{
		enumName = GetEnum(Enum'ETextureQuality', i);
		list.AddItem(Mid(String(enumName),5,999));
	}
	return list;
}

function GameViewportClient GetViewport()
{
	local LocalPlayer LP;
	LP = class'H7PlayerController'.static.GetLocalPlayer();
	if (LP != none)
	{
		if (LP.ViewportClient != none)
		{
			return LP.ViewportClient;
		}
	}
	return none;
}
function bool GetAmbientOcclusion()
{
	local GameViewportClient Viewport;
	Viewport = GetViewport();
	if (Viewport != none)
	{
		return GetAmbientOcclusionNative(Viewport);
	}
	return false;
}
native function bool GetAmbientOcclusionNative(GameViewportClient viewport);
function SetAmbientOcclusion(bool bVal)
{
	local GameViewportClient Viewport;

	mAmbientOcclusion = bVal;

	Viewport = GetViewport();
	if (Viewport != none)
	{
		SetAmbientOcclusionNative(Viewport, bVal);
	}
}
native function SetAmbientOcclusionNative(GameViewportClient viewport, bool bVal);

function string GetCurrencyIconHTML()
{
	if(class'H7AdventureController'.static.GetInstance() != none)
	{
		return GetIconHTMLByPath(class'H7AdventureController'.static.GetInstance().GetLocalPlayer().GetResourceSet().GetCurrencyResourceType().GetIconPath());
	}
	else
	{
		// TODO resources in DUEL mode?
		return "?";
	}
}

static function string GetIconPath(Texture2D icon)
{
	return "img://" $ PathName(icon);
}

static function string GetIconHTMLByPath(string iconPath)
{
	return "<img src='" $ iconPath $ "' width='#TT_POINT#' height='#TT_POINT#'>";
}

static function string GetIconHTMLByIcon(Texture2D icon)
{
	return GetIconHTMLByPath(GetIconPath(icon));
}

// if the option is not yet saved, it will be added with the defaultVisible
function bool GetMinimapOption(string categoryID, bool defaultVisible)
{
	local H7MinimapOption option;

	foreach mMinimapOptions(option)
	{
		if(option.mCategoryID == categoryID)
		{
			return option.mVisible;
		}
	}

	option.mCategoryID = categoryID;
	option.mVisible = defaultVisible;
	mMinimapOptions.AddItem(option);

	SaveConfig();

	return defaultVisible;
}

function SetMinimapOption(string categoryID, bool value)
{
	local int i;

	for(i=0;i<mMinimapOptions.Length;i++)
	{
		if(mMinimapOptions[i].mCategoryID == categoryID)
		{
			mMinimapOptions[i].mVisible = value;
			SaveConfig();
			return;
		}
	}

	;
}

function ResetOptions()
{
	SetAmbientOcclusion(true);
	SetTextureQuality(TEXQ_MEDIUM);
	
	mDevHardwareCursor=False;
	mReleaseHardwareCursor=False;
	mFlashMouse=False;
	mCanvasMouse=False;
	mSmartOverlayUpdate=True;
	mTurnOverPopupEnabled=False;
	mAutogeneratedTooltipExtension=False;
	mAmbientOcclusion=True;
	mLogState=True;
	mNoteBarStatus=True;
	mQALogState=True;
	mWeeklyEffectPopup=True;
	mFCTDuration=3.000000;
	mFCTFadeDelay=2.000000;
	mFCTEndAlpha=0;
	mFCTHeight=200;
	mCoolCamChance=100;
	mCoolCamGameSpeed=1.000000;
	mCoolCamCombatActionAllowed=True;
	mSideBarLiveTime=5.000000;
	mSideBarCollapseTime=5.000000;
	mTooltipCooldownTime=0.5;
	mTooltipDelayTime=0.5;
	mShowBuildTreeAll=True;
	mSkipTactics=False;
	mHoverDecalEnabled=True;
	mAutoPlayDialogs=True;
	mGameplayWaitsForAnim=True;
	mCombatGridVisible=True;
	mMinimapOptions.Length = 0;
	mAutosaveEnabled = true;

	// special
	// class'H7PlayerController'.static.GetPlayerController().SetBufferedCommand_Resolution(800,600);

	/*ResX=1280
ResY=720*/
	/*
	mDebugOptions=True;
	mDebugWindow=True;
	mDebugCheats=True;
	mDebugControls=True;
	mCampaignsEnabled=True;
	mSkirmishEnabled=True;
	mDuelEnabled=True;
	mChatEnabled=True;
	mDemoDuels=False;
	*/
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
