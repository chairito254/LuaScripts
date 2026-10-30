-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\SocialConst.lua

local SocialConst = {
	PET_PEEK_INTERACT_DISTANCE = 2,
	COCKTAIL_INVITE_TTL_SEC = 30,
	COCKTAIL_INVITE_DISTANCE = 2,
	COCKTAIL_ACTION_ID = 801034,
	PET_INTERACT_GATHER_SPEED_RATE = 2,
	MIN_PET_INTERACT_PERFORM_SEC = 1,
	QUERY_CAN_BREED_PETS = 1,
	SOCIAL_TXN_LOCK_TRADE = 4,
	SOCIAL_TXN_LOCK_VARIANT_INTERACT = 3,
	SOCIAL_TXN_LOCK_BREED = 2,
	SOCIAL_TXN_LOCK_EXCHANGE = 1,
	SOCIAL_TXN_DECISION_ROLLBACK = 2,
	SOCIAL_TXN_DECISION_COMMIT = 1,
	SOCIAL_TXN_DECISION_UNDECIDED = 0,
	SETTLE_STATE_EXECUTE = 3,
	SETTLE_STATE_TRY = 2,
	SETTLE_STATE_CHECK = 1,
	SESSION_DEFAULT_LIFETIME = 600,
	SETTLE_CALLBACK_VALID_TIME = 10,
	INVITE_DEFAULT_VALID_TIME = 10,
	PE_CS_CancelConfirm = 5,
	PE_CS_Quit = 4,
	PE_CS_FinalClick = 3,
	PE_CS_ConfirmPet = 2,
	PE_CS_ChoosePet = 1,
	PB_SC_SendNotice = 104,
	PB_SC_QuitBreed = 103,
	PB_SC_ConfirmBreed = 102,
	PB_SC_ChangeSelectInfo = 101,
	PB_CS_QuitBreed = 3,
	PB_CS_ConfirmBreed = 2,
	PB_CS_ChangeSelectInfo = 1,
	SB_SC_ResumeSocial = 20000,
	SB_CS_ResumeSocial = 10000,
	SOCIAL_PET_VARIANT_INTERACT = 3,
	SOCIAL_PET_EXCHANGE = 2,
	SOCIAL_PET_BREED = 1,
	PVI_SC_Notice = 101,
	PVI_SC_SyncInfo = 102,
	ARK_SCENE_ID = 501,
	CAFE_AREA_ID = 91145204,
	CAFE_INIT_AREA_CHECK_DELAY_SEC = 2,
	PET_INTERACT_DESIGN_PERFORM_SEC = 30,
	PET_INTERACT_CD_GUARD_SEC = 1,
	PET_INTERACT_REWARD_CONTEXT_KEEP_SEC = 10,
	PVI_CS_CancelConfirm = 4,
	PVI_CS_Quit = 3,
	PVI_CS_ConfirmPet = 2,
	PVI_CS_ChoosePet = 1,
	PE_SC_SyncExchangeInfo = 102,
	PE_SC_Notice = 101,
	PET_PEEK_TAG_TTL_SEC = 60
}

SocialConst.SocialQueryDef = {
	[SocialConst.QUERY_CAN_BREED_PETS] = {
		clientRecvReplyFunc = "onQueryCanBreedPetsReply",
		serverSrcHandleFunc = "checkAndParseCanBreedPetsQuery",
		serverDstHandleFunc = "getCanBreedPetsReplyInfo"
	}
}
SocialConst.SocialInviteDef = {
	[SocialConst.SOCIAL_PET_BREED] = {
		clientRecvInviteFunc = "onRecvPetBreedInvite",
		serverSrcPrepareSocialFunc = "preparePetBreedSrcSocialInfo",
		serverDstHandleFunc = "handlePetBreedInvite",
		serverDstPrepareSocialFunc = "preparePetBreedDstSocialInfo",
		serverSrcHandleFunc = "checkAndParsePetBreedInvite",
		clientRecvInviteReplyFunc = "onRecvPetBreedInviteReply"
	},
	[SocialConst.SOCIAL_PET_EXCHANGE] = {
		clientRecvInviteFunc = "onRecvPetExchangeInvite",
		serverSrcPrepareSocialFunc = "preparePetExchangeSrcSocialInfo",
		serverDstRejectSocialFunc = "onClientRejectPetExchange",
		serverDstHandleFunc = "handlePetExchangeInvite",
		serverDstPrepareSocialFunc = "preparePetExchangeDstSocialInfo",
		serverSrcHandleFunc = "checkAndParsePetExchangeInvite",
		clientRecvInviteReplyFunc = "onRecvPetExchangeInviteReply"
	},
	[SocialConst.SOCIAL_PET_VARIANT_INTERACT] = {
		clientRecvInviteFunc = "onRecvPetVariantInteractInvite",
		serverSrcPrepareSocialFunc = "preparePetVariantInteractSrcSocialInfo",
		serverDstHandleFunc = "handlePetVariantInteractInvite",
		serverDstPrepareSocialFunc = "preparePetVariantInteractDstSocialInfo",
		serverSrcHandleFunc = "checkAndParsePetVariantInteractInvite",
		clientRecvInviteReplyFunc = "onRecvPetVariantInteractInviteReply"
	}
}
SocialConst.SocialProcessDef = {
	[SocialConst.SOCIAL_PET_BREED] = {
		clientEndSocialFunc = "onEndPetBreedSocial",
		clientStartSocialFunc = "onStartPetBreedSocial",
		clientNotifyFunc = "onNotifyPetBreedSocial"
	},
	[SocialConst.SOCIAL_PET_EXCHANGE] = {
		serverConfirmPetCheckFunc = "checkPetExchangeConfirm",
		clientEndSocialFunc = "onEndPetExchangeSocial",
		clientNotifyFunc = "onNotifyPetExchangeSocial",
		serverEndSocialFunc = "onEndPetExchangeSocial",
		clientStartSocialFunc = "onStartPetExchangeSocial"
	},
	[SocialConst.SOCIAL_PET_VARIANT_INTERACT] = {
		serverConfirmPetCheckFunc = "checkPetVariantInteractConfirm",
		clientEndSocialFunc = "onEndPetVariantInteractSocial",
		clientNotifyFunc = "onNotifyPetVariantInteractSocial",
		serverEndSocialFunc = "onEndPetVariantInteractSocial",
		clientStartSocialFunc = "onStartPetVariantInteractSocial"
	}
}
SocialConst.SocialSettleDef = {
	[SocialConst.SOCIAL_PET_BREED] = {
		serverCheckSettleFunc = "checkPetBreedSettle",
		serverSettleFunc = "settlePetBreed",
		serverTrySettleFunc = "tryPetBreedSettle"
	},
	[SocialConst.SOCIAL_PET_EXCHANGE] = {
		serverCheckSettleFunc = "checkPetExchangeSettle",
		serverSettleFunc = "settlePetExchange",
		serverTrySettleFunc = "tryPetExchangeSettle"
	},
	[SocialConst.SOCIAL_PET_VARIANT_INTERACT] = {
		serverCheckSettleFunc = "checkPetVariantInteractSettle",
		serverSettleFunc = "settlePetVariantInteract",
		serverTrySettleFunc = "tryPetVariantInteractSettle"
	}
}
SocialConst.SocialType2Class = {
	[SocialConst.SOCIAL_PET_BREED] = "SocialPetBreed",
	[SocialConst.SOCIAL_PET_EXCHANGE] = "SocialPetExchange",
	[SocialConst.SOCIAL_PET_VARIANT_INTERACT] = "SocialPetVariantInteract"
}

return SocialConst
