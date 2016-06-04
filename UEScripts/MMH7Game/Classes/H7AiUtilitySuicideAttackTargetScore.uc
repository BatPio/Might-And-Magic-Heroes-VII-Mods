//=============================================================================
// H7AiUtilitySuicideAttackTargetScore
//=============================================================================
// 
//=============================================================================
// Copyright 2013-2015 Limbic Entertainment All Rights Reserved.
//=============================================================================
class H7AiUtilitySuicideAttackTargetScore extends H7AiUtilityCombiner;

var H7AiUtilitySuicideGeneralEffort    mInUGeneralEffort;
var H7AiUtilityTargetInterest   mInUTargetInterest;

var String dbgString;

var float   mMovementEffortBias;
var float   mFightingEffortBias;

/// overrides ...

function UpdateInput()
{
	local array<float> generalEffort;
	local array<float> targetInterest;
	local float util;

//	`LOG_AI("Utility.SuicideAttackTargetScore");

	if( mInUGeneralEffort == None ) { mInUGeneralEffort = new class 'H7AiUtilitySuicideGeneralEffort'; }
    if( mInUTargetInterest == None ) { mInUTargetInterest = new class 'H7AiUtilityTargetInterest'; }

	mInValues.Remove(0,mInValues.Length);

	mInUGeneralEffort.mMovementEffortBias=mMovementEffortBias;
	mInUGeneralEffort.mFightingEffortBias=mFightingEffortBias;

	mInUGeneralEffort.UpdateInput();
	mInUGeneralEffort.UpdateOutput();
	generalEffort = mInUGeneralEffort.GetOutValues();

	mInUTargetInterest.UpdateInput();
	mInUTargetInterest.UpdateOutput();
	targetInterest = mInUTargetInterest.GetOutValues();

	// make sure the arrays contain the same number of out-values
	if( generalEffort.Length != 0 && generalEffort.Length == targetInterest.Length )
	{
		util = generalEffort[0]*targetInterest[0];
		mInValues.AddItem( util );

		dbgString = "SuicideAttackTargetScore(" $ util $ ";GE(" $ generalEffort[0] $ ");TI(" $ targetInterest[0] $ ")) " $ mInUGeneralEffort.dbgString;
		//`LOG_AI("  >>> SCORE >>>" @ util @ "(G" @ generalEffort[0] @ ",I" @ targetInterest[0] @ ")" );
	}
}

function UpdateOutput()
{
	ApplyFunction();
	ApplyOutputWeigth();
}

/// functions
