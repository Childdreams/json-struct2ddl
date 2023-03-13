package main

import (
	"app/databases/clickhouse"
	"context"
	"encoding/json"
	"fmt"
	"log"
	"time"
)

type TT struct{
	Cursor int `json:"cursor"`
	GlobalDoodleConfig string `json:"global_doodle_config"`
	HasMore int `json:"has_more"`
	LogPb string `json:"log_pb"`
	SearchNilInfo string `json:"search_nil_info"`
	StatusCode int `json:"status_code"`
	ExtraFatalItemIds string `json:"extra__fatal_item_ids"`
	ExtraLogid string `json:"extra__logid"`
	ExtraNow int `json:"extra__now"`
	ExtraSearchRequestId string `json:"extra__search_request_id"`
	AwemeListItemAdAwemeSource int `json:"aweme_list__item__ad_aweme_source"`
	AwemeListItemAncestorInfo string `json:"aweme_list__item__ancestor_info"`
	AwemeListItemAnchors string `json:"aweme_list__item__anchors"`
	AwemeListItemAuthenticationToken string `json:"aweme_list__item__authentication_token"`
	AwemeListItemAuthorMaskTag int `json:"aweme_list__item__author_mask_tag"`
	AwemeListItemAuthorUserId int `json:"aweme_list__item__author_user_id"`
	AwemeListItemAwemeId string `json:"aweme_list__item__aweme_id"`
	AwemeListItemAwemeType int `json:"aweme_list__item__aweme_type"`
	AwemeListItemBodydanceScore int `json:"aweme_list__item__bodydance_score"`
	AwemeListItemBookBar string `json:"aweme_list__item__book_bar"`
	AwemeListItemCategoryDa int `json:"aweme_list__item__category_da"`
	AwemeListItemChaList string `json:"aweme_list__item__cha_list"`
	AwemeListItemChallengePosition string `json:"aweme_list__item__challenge_position"`
	AwemeListItemChapterList string `json:"aweme_list__item__chapter_list"`
	AwemeListItemCity string `json:"aweme_list__item__city"`
	AwemeListItemCmtSwt bool `json:"aweme_list__item__cmt_swt"`
	AwemeListItemCollectStat int `json:"aweme_list__item__collect_stat"`
	AwemeListItemCollectionCornerMark int `json:"aweme_list__item__collection_corner_mark"`
	AwemeListItemCommentGid int `json:"aweme_list__item__comment_gid"`
	AwemeListItemCommentList string `json:"aweme_list__item__comment_list"`
	AwemeListItemCommentPermissionInfo string `json:"aweme_list__item__comment_permission_info"`
	AwemeListItemCommerceConfigData string `json:"aweme_list__item__commerce_config_data"`
	AwemeListItemCommerceInfo string `json:"aweme_list__item__commerce_info"`
	AwemeListItemCommonBarInfo string `json:"aweme_list__item__common_bar_info"`
	AwemeListItemComponentInfoV2 string `json:"aweme_list__item__component_info_v2"`
	AwemeListItemCooperationInfo string `json:"aweme_list__item__cooperation_info"`
	AwemeListItemCoverLabels string `json:"aweme_list__item__cover_labels"`
	AwemeListItemCreateTime int `json:"aweme_list__item__create_time"`
	AwemeListItemCreateTimeConfig string `json:"aweme_list__item__create_time_config"`
	AwemeListItemDanmakuControl string `json:"aweme_list__item__danmaku_control"`
	AwemeListItemDesc string `json:"aweme_list__item__desc"`
	AwemeListItemDescLanguage string `json:"aweme_list__item__desc_language"`
	AwemeListItemDescendants string `json:"aweme_list__item__descendants"`
	AwemeListItemDiggLottie string `json:"aweme_list__item__digg_lottie"`
	AwemeListItemDisableRelationBar int `json:"aweme_list__item__disable_relation_bar"`
	AwemeListItemDislikeDimensionList string `json:"aweme_list__item__dislike_dimension_list"`
	AwemeListItemDistance string `json:"aweme_list__item__distance"`
	AwemeListItemDistributeType int `json:"aweme_list__item__distribute_type"`
	AwemeListItemDuetAggregateInMusicTab bool `json:"aweme_list__item__duet_aggregate_in_music_tab"`
	AwemeListItemDuetOriginItemId string `json:"aweme_list__item__duet_origin_item_id"`
	AwemeListItemDuration int `json:"aweme_list__item__duration"`
	AwemeListItemGameInfo string `json:"aweme_list__item__game_info"`
	AwemeListItemGeofencing string `json:"aweme_list__item__geofencing"`
	AwemeListItemGeofencingRegions string `json:"aweme_list__item__geofencing_regions"`
	AwemeListItemGroupId string `json:"aweme_list__item__group_id"`
	AwemeListItemGuideBtnType int `json:"aweme_list__item__guide_btn_type"`
	AwemeListItemHasVsEntry bool `json:"aweme_list__item__has_vs_entry"`
	AwemeListItemHaveDashboard bool `json:"aweme_list__item__have_dashboard"`
	AwemeListItemHorizontalType int `json:"aweme_list__item__horizontal_type"`
	AwemeListItemHybridLabel string `json:"aweme_list__item__hybrid_label"`
	AwemeListItemImageAlbumMusicInfo string `json:"aweme_list__item__image_album_music_info"`
	AwemeListItemImageComment string `json:"aweme_list__item__image_comment"`
	AwemeListItemImageInfos string `json:"aweme_list__item__image_infos"`
	AwemeListItemImageList string `json:"aweme_list__item__image_list"`
	AwemeListItemImages string `json:"aweme_list__item__images"`
	AwemeListItemImgBitrate string `json:"aweme_list__item__img_bitrate"`
	AwemeListItemInteractionStickers string `json:"aweme_list__item__interaction_stickers"`
	AwemeListItemIsCollectsSelected int `json:"aweme_list__item__is_collects_selected"`
	AwemeListItemIsDuetSing bool `json:"aweme_list__item__is_duet_sing"`
	AwemeListItemIsFantasy bool `json:"aweme_list__item__is_fantasy"`
	AwemeListItemIsFirstVideo bool `json:"aweme_list__item__is_first_video"`
	AwemeListItemIsHashTag int `json:"aweme_list__item__is_hash_tag"`
	AwemeListItemIsImageBeat bool `json:"aweme_list__item__is_image_beat"`
	AwemeListItemIsInScope bool `json:"aweme_list__item__is_in_scope"`
	AwemeListItemIsKaraoke bool `json:"aweme_list__item__is_karaoke"`
	AwemeListItemIsLifeItem bool `json:"aweme_list__item__is_life_item"`
	AwemeListItemIsMultiContent int `json:"aweme_list__item__is_multi_content"`
	AwemeListItemIsPgcshow bool `json:"aweme_list__item__is_pgcshow"`
	AwemeListItemIsPreview int `json:"aweme_list__item__is_preview"`
	AwemeListItemIsRelieve bool `json:"aweme_list__item__is_relieve"`
	AwemeListItemIsSharePost bool `json:"aweme_list__item__is_share_post"`
	AwemeListItemIsStory int `json:"aweme_list__item__is_story"`
	AwemeListItemIsTop int `json:"aweme_list__item__is_top"`
	AwemeListItemIsVr bool `json:"aweme_list__item__is_vr"`
	AwemeListItemItemCommentSettings int `json:"aweme_list__item__item_comment_settings"`
	AwemeListItemItemDuet int `json:"aweme_list__item__item_duet"`
	AwemeListItemItemReact int `json:"aweme_list__item__item_react"`
	AwemeListItemItemShare int `json:"aweme_list__item__item_share"`
	AwemeListItemItemStitch int `json:"aweme_list__item__item_stitch"`
	AwemeListItemItemWarnNotification string `json:"aweme_list__item__item_warn_notification"`
	AwemeListItemLabelTop string `json:"aweme_list__item__label_top"`
	AwemeListItemLabelTopText string `json:"aweme_list__item__label_top_text"`
	AwemeListItemLinkAdData string `json:"aweme_list__item__link_ad_data"`
	AwemeListItemLiveId int `json:"aweme_list__item__live_id"`
	AwemeListItemLiveType string `json:"aweme_list__item__live_type"`
	AwemeListItemLongVideo string `json:"aweme_list__item__long_video"`
	AwemeListItemMiscInfo string `json:"aweme_list__item__misc_info"`
	AwemeListItemNearbyLevel int `json:"aweme_list__item__nearby_level"`
	AwemeListItemNeedVsEntry bool `json:"aweme_list__item__need_vs_entry"`
	AwemeListItemNicknamePosition string `json:"aweme_list__item__nickname_position"`
	AwemeListItemOriginCommentIds string `json:"aweme_list__item__origin_comment_ids"`
	AwemeListItemOriginTextExtra string `json:"aweme_list__item__origin_text_extra"`
	AwemeListItemOriginalImages string `json:"aweme_list__item__original_images"`
	AwemeListItemPackedClips string `json:"aweme_list__item__packed_clips"`
	AwemeListItemPhotoSearchEntrance string `json:"aweme_list__item__photo_search_entrance"`
	AwemeListItemPoiBiz string `json:"aweme_list__item__poi_biz"`
	AwemeListItemPoiPatchInfo string `json:"aweme_list__item__poi_patch_info"`
	AwemeListItemPosition string `json:"aweme_list__item__position"`
	AwemeListItemPreventDownload bool `json:"aweme_list__item__prevent_download"`
	AwemeListItemPreviewTitle string `json:"aweme_list__item__preview_title"`
	AwemeListItemPreviewVideoStatus int `json:"aweme_list__item__preview_video_status"`
	AwemeListItemPromotions string `json:"aweme_list__item__promotions"`
	AwemeListItemRate int `json:"aweme_list__item__rate"`
	AwemeListItemRefTtsIdList string `json:"aweme_list__item__ref_tts_id_list"`
	AwemeListItemRefVoiceModifyIdList string `json:"aweme_list__item__ref_voice_modify_id_list"`
	AwemeListItemRegion string `json:"aweme_list__item__region"`
	AwemeListItemRelationLabels string `json:"aweme_list__item__relation_labels"`
	AwemeListItemReportAction bool `json:"aweme_list__item__report_action"`
	AwemeListItemSearchImpr string `json:"aweme_list__item__search_impr"`
	AwemeListItemSeoInfo string `json:"aweme_list__item__seo_info"`
	AwemeListItemSeriesPaidInfo string `json:"aweme_list__item__series_paid_info"`
	AwemeListItemShareFrom string `json:"aweme_list__item__share_from"`
	AwemeListItemShareUrl string `json:"aweme_list__item__share_url"`
	AwemeListItemShouldOpenAdReport bool `json:"aweme_list__item__should_open_ad_report"`
	AwemeListItemShowFollowButton string `json:"aweme_list__item__show_follow_button"`
	AwemeListItemSocialTagList string `json:"aweme_list__item__social_tag_list"`
	AwemeListItemSortLabel string `json:"aweme_list__item__sort_label"`
	AwemeListItemSpecialMode int `json:"aweme_list__item__special_mode"`
	AwemeListItemStandardBarInfoList string `json:"aweme_list__item__standard_bar_info_list"`
	AwemeListItemStarAtlasInfo string `json:"aweme_list__item__star_atlas_info"`
	AwemeListItemStickerDetail string `json:"aweme_list__item__sticker_detail"`
	AwemeListItemStickers string `json:"aweme_list__item__stickers"`
	AwemeListItemStorySourceType int `json:"aweme_list__item__story_source_type"`
	AwemeListItemStoryTtl int `json:"aweme_list__item__story_ttl"`
	AwemeListItemTextExtra string `json:"aweme_list__item__text_extra"`
	AwemeListItemToolBar string `json:"aweme_list__item__tool_bar"`
	AwemeListItemTtsIdList string `json:"aweme_list__item__tts_id_list"`
	AwemeListItemUniqidPosition string `json:"aweme_list__item__uniqid_position"`
	AwemeListItemUserDigged int `json:"aweme_list__item__user_digged"`
	AwemeListItemUserRecommendStatus int `json:"aweme_list__item__user_recommend_status"`
	AwemeListItemVideoLabels string `json:"aweme_list__item__video_labels"`
	AwemeListItemVideoReplyInfo string `json:"aweme_list__item__video_reply_info"`
	AwemeListItemVideoTag string `json:"aweme_list__item__video_tag"`
	AwemeListItemVideoText string `json:"aweme_list__item__video_text"`
	AwemeListItemVoiceModifyIdList string `json:"aweme_list__item__voice_modify_id_list"`
	AwemeListItemVrType int `json:"aweme_list__item__vr_type"`
	AwemeListItemWithPromotionalMusic bool `json:"aweme_list__item__with_promotional_music"`
	AwemeListItemWithoutWatermark bool `json:"aweme_list__item__without_watermark"`
	AwemeListItemXiguaTask string `json:"aweme_list__item__xigua_task"`
	AwemeListItemRiskInfosContent string `json:"aweme_list__item__risk_infos__content"`
	AwemeListItemRiskInfosIconUrl string `json:"aweme_list__item__risk_infos__icon_url"`
	AwemeListItemRiskInfosRiskSink bool `json:"aweme_list__item__risk_infos__risk_sink"`
	AwemeListItemRiskInfosType int `json:"aweme_list__item__risk_infos__type"`
	AwemeListItemRiskInfosUrl string `json:"aweme_list__item__risk_infos__url"`
	AwemeListItemRiskInfosVote bool `json:"aweme_list__item__risk_infos__vote"`
	AwemeListItemRiskInfosWarn bool `json:"aweme_list__item__risk_infos__warn"`
	AwemeListItemRiskInfosWarnLevel int `json:"aweme_list__item__risk_infos__warn_level"`
	AwemeListItemMicroAppInfoAppId string `json:"aweme_list__item__micro_app_info__app_id"`
	AwemeListItemMicroAppInfoAppName string `json:"aweme_list__item__micro_app_info__app_name"`
	AwemeListItemMicroAppInfoDescription string `json:"aweme_list__item__micro_app_info__description"`
	AwemeListItemMicroAppInfoIcon string `json:"aweme_list__item__micro_app_info__icon"`
	AwemeListItemMicroAppInfoOrientation int `json:"aweme_list__item__micro_app_info__orientation"`
	AwemeListItemMicroAppInfoSchema string `json:"aweme_list__item__micro_app_info__schema"`
	AwemeListItemMicroAppInfoState int `json:"aweme_list__item__micro_app_info__state"`
	AwemeListItemMicroAppInfoSummary string `json:"aweme_list__item__micro_app_info__summary"`
	AwemeListItemMicroAppInfoTitle string `json:"aweme_list__item__micro_app_info__title"`
	AwemeListItemMicroAppInfoType int `json:"aweme_list__item__micro_app_info__type"`
	AwemeListItemHotListExtra string `json:"aweme_list__item__hot_list__extra"`
	AwemeListItemHotListFooter string `json:"aweme_list__item__hot_list__footer"`
	AwemeListItemHotListGroupId string `json:"aweme_list__item__hot_list__group_id"`
	AwemeListItemHotListHeader string `json:"aweme_list__item__hot_list__header"`
	AwemeListItemHotListHotScore int `json:"aweme_list__item__hot_list__hot_score"`
	AwemeListItemHotListI18nTitle string `json:"aweme_list__item__hot_list__i18n_title"`
	AwemeListItemHotListImageUrl string `json:"aweme_list__item__hot_list__image_url"`
	AwemeListItemHotListPatternType int `json:"aweme_list__item__hot_list__pattern_type"`
	AwemeListItemHotListRank int `json:"aweme_list__item__hot_list__rank"`
	AwemeListItemHotListSchema string `json:"aweme_list__item__hot_list__schema"`
	AwemeListItemHotListSentence string `json:"aweme_list__item__hot_list__sentence"`
	AwemeListItemHotListSentenceId int `json:"aweme_list__item__hot_list__sentence_id"`
	AwemeListItemHotListTitle string `json:"aweme_list__item__hot_list__title"`
	AwemeListItemHotListType int `json:"aweme_list__item__hot_list__type"`
	AwemeListItemHotListViewCount int `json:"aweme_list__item__hot_list__view_count"`
	AwemeListItemAnchorInfoContent string `json:"aweme_list__item__anchor_info__content"`
	AwemeListItemAnchorInfoDisplayInfo string `json:"aweme_list__item__anchor_info__display_info"`
	AwemeListItemAnchorInfoExtra string `json:"aweme_list__item__anchor_info__extra"`
	AwemeListItemAnchorInfoIcon string `json:"aweme_list__item__anchor_info__icon"`
	AwemeListItemAnchorInfoId string `json:"aweme_list__item__anchor_info__id"`
	AwemeListItemAnchorInfoLogExtra string `json:"aweme_list__item__anchor_info__log_extra"`
	AwemeListItemAnchorInfoMpUrl string `json:"aweme_list__item__anchor_info__mp_url"`
	AwemeListItemAnchorInfoOpenUrl string `json:"aweme_list__item__anchor_info__open_url"`
	AwemeListItemAnchorInfoStyleInfo string `json:"aweme_list__item__anchor_info__style_info"`
	AwemeListItemAnchorInfoTitle string `json:"aweme_list__item__anchor_info__title"`
	AwemeListItemAnchorInfoTitleTag string `json:"aweme_list__item__anchor_info__title_tag"`
	AwemeListItemAnchorInfoType int `json:"aweme_list__item__anchor_info__type"`
	AwemeListItemAnchorInfoWebUrl string `json:"aweme_list__item__anchor_info__web_url"`
	AwemeListItemVideoAnimatedCover string `json:"aweme_list__item__video__animated_cover"`
	AwemeListItemVideoBigThumbs string `json:"aweme_list__item__video__big_thumbs"`
	AwemeListItemVideoBitRate string `json:"aweme_list__item__video__bit_rate"`
	AwemeListItemVideoCdnUrlExpired int `json:"aweme_list__item__video__cdn_url_expired"`
	AwemeListItemVideoCover string `json:"aweme_list__item__video__cover"`
	AwemeListItemVideoDownloadAddr string `json:"aweme_list__item__video__download_addr"`
	AwemeListItemVideoDownloadSuffixLogoAddr string `json:"aweme_list__item__video__download_suffix_logo_addr"`
	AwemeListItemVideoDuration int `json:"aweme_list__item__video__duration"`
	AwemeListItemVideoDynamicCover string `json:"aweme_list__item__video__dynamic_cover"`
	AwemeListItemVideoHasDownloadSuffixLogoAddr bool `json:"aweme_list__item__video__has_download_suffix_logo_addr"`
	AwemeListItemVideoHasWatermark bool `json:"aweme_list__item__video__has_watermark"`
	AwemeListItemVideoHeight int `json:"aweme_list__item__video__height"`
	AwemeListItemVideoHorizontalType int `json:"aweme_list__item__video__horizontal_type"`
	AwemeListItemVideoIsBytevc1 int `json:"aweme_list__item__video__is_bytevc1"`
	AwemeListItemVideoIsCallback bool `json:"aweme_list__item__video__is_callback"`
	AwemeListItemVideoIsH265 int `json:"aweme_list__item__video__is_h265"`
	AwemeListItemVideoIsLongVideo int `json:"aweme_list__item__video__is_long_video"`
	AwemeListItemVideoIsSourceHDR int `json:"aweme_list__item__video__is_source_HDR"`
	AwemeListItemVideoMeta string `json:"aweme_list__item__video__meta"`
	AwemeListItemVideoMiscDownloadAddrs string `json:"aweme_list__item__video__misc_download_addrs"`
	AwemeListItemVideoNeedSetToken bool `json:"aweme_list__item__video__need_set_token"`
	AwemeListItemVideoOptimizedCover string `json:"aweme_list__item__video__optimized_cover"`
	AwemeListItemVideoOriginCover string `json:"aweme_list__item__video__origin_cover"`
	AwemeListItemVideoPlayAddr string `json:"aweme_list__item__video__play_addr"`
	AwemeListItemVideoPlayAddr265 string `json:"aweme_list__item__video__play_addr_265"`
	AwemeListItemVideoPlayAddrH264 string `json:"aweme_list__item__video__play_addr_h264"`
	AwemeListItemVideoPlayAddrLowbr string `json:"aweme_list__item__video__play_addr_lowbr"`
	AwemeListItemVideoRatio string `json:"aweme_list__item__video__ratio"`
	AwemeListItemVideoTags string `json:"aweme_list__item__video__tags"`
	AwemeListItemVideoUseStaticCover bool `json:"aweme_list__item__video__use_static_cover"`
	AwemeListItemVideoVideoModel string `json:"aweme_list__item__video__video_model"`
	AwemeListItemVideoWidth int `json:"aweme_list__item__video__width"`
	AwemeListItemVideoControlAllowDouplus bool `json:"aweme_list__item__video_control__allow_douplus"`
	AwemeListItemVideoControlAllowDownload bool `json:"aweme_list__item__video_control__allow_download"`
	AwemeListItemVideoControlAllowDuet bool `json:"aweme_list__item__video_control__allow_duet"`
	AwemeListItemVideoControlAllowDynamicWallpaper bool `json:"aweme_list__item__video_control__allow_dynamic_wallpaper"`
	AwemeListItemVideoControlAllowMusic bool `json:"aweme_list__item__video_control__allow_music"`
	AwemeListItemVideoControlAllowReact bool `json:"aweme_list__item__video_control__allow_react"`
	AwemeListItemVideoControlAllowShare bool `json:"aweme_list__item__video_control__allow_share"`
	AwemeListItemVideoControlAllowStitch bool `json:"aweme_list__item__video_control__allow_stitch"`
	AwemeListItemVideoControlDownloadIgnoreVisibility bool `json:"aweme_list__item__video_control__download_ignore_visibility"`
	AwemeListItemVideoControlDownloadInfo string `json:"aweme_list__item__video_control__download_info"`
	AwemeListItemVideoControlDraftProgressBar int `json:"aweme_list__item__video_control__draft_progress_bar"`
	AwemeListItemVideoControlDuetIgnoreVisibility bool `json:"aweme_list__item__video_control__duet_ignore_visibility"`
	AwemeListItemVideoControlDuetInfo string `json:"aweme_list__item__video_control__duet_info"`
	AwemeListItemVideoControlPreventDownloadType int `json:"aweme_list__item__video_control__prevent_download_type"`
	AwemeListItemVideoControlShareGrayed bool `json:"aweme_list__item__video_control__share_grayed"`
	AwemeListItemVideoControlShareIgnoreVisibility bool `json:"aweme_list__item__video_control__share_ignore_visibility"`
	AwemeListItemVideoControlShareType int `json:"aweme_list__item__video_control__share_type"`
	AwemeListItemVideoControlShowProgressBar int `json:"aweme_list__item__video_control__show_progress_bar"`
	AwemeListItemVideoControlTimerStatus int `json:"aweme_list__item__video_control__timer_status"`
	AwemeListItemStatisticsAdmireCount int `json:"aweme_list__item__statistics__admire_count"`
	AwemeListItemStatisticsAwemeId string `json:"aweme_list__item__statistics__aweme_id"`
	AwemeListItemStatisticsCollectCount int `json:"aweme_list__item__statistics__collect_count"`
	AwemeListItemStatisticsCommentCount int `json:"aweme_list__item__statistics__comment_count"`
	AwemeListItemStatisticsDigest string `json:"aweme_list__item__statistics__digest"`
	AwemeListItemStatisticsDiggCount int `json:"aweme_list__item__statistics__digg_count"`
	AwemeListItemStatisticsDownloadCount int `json:"aweme_list__item__statistics__download_count"`
	AwemeListItemStatisticsExposureCount int `json:"aweme_list__item__statistics__exposure_count"`
	AwemeListItemStatisticsForwardCount int `json:"aweme_list__item__statistics__forward_count"`
	AwemeListItemStatisticsLiveWatchCount int `json:"aweme_list__item__statistics__live_watch_count"`
	AwemeListItemStatisticsLoseCommentCount int `json:"aweme_list__item__statistics__lose_comment_count"`
	AwemeListItemStatisticsLoseCount int `json:"aweme_list__item__statistics__lose_count"`
	AwemeListItemStatisticsPlayCount int `json:"aweme_list__item__statistics__play_count"`
	AwemeListItemStatisticsShareCount int `json:"aweme_list__item__statistics__share_count"`
	AwemeListItemStatisticsWhatsappShareCount int `json:"aweme_list__item__statistics__whatsapp_share_count"`
	AwemeListItemShareInfoBoolPersist int `json:"aweme_list__item__share_info__bool_persist"`
	AwemeListItemShareInfoShareDesc string `json:"aweme_list__item__share_info__share_desc"`
	AwemeListItemShareInfoShareDescInfo string `json:"aweme_list__item__share_info__share_desc_info"`
	AwemeListItemShareInfoShareLinkDesc string `json:"aweme_list__item__share_info__share_link_desc"`
	AwemeListItemShareInfoShareQuote string `json:"aweme_list__item__share_info__share_quote"`
	AwemeListItemShareInfoShareSignatureDesc string `json:"aweme_list__item__share_info__share_signature_desc"`
	AwemeListItemShareInfoShareSignatureUrl string `json:"aweme_list__item__share_info__share_signature_url"`
	AwemeListItemShareInfoShareTitle string `json:"aweme_list__item__share_info__share_title"`
	AwemeListItemShareInfoShareTitleMyself string `json:"aweme_list__item__share_info__share_title_myself"`
	AwemeListItemShareInfoShareTitleOther string `json:"aweme_list__item__share_info__share_title_other"`
	AwemeListItemShareInfoShareUrl string `json:"aweme_list__item__share_info__share_url"`
	AwemeListItemShareInfoShareWeiboDesc string `json:"aweme_list__item__share_info__share_weibo_desc"`
	AwemeListItemPoiInfoCollectStat int `json:"aweme_list__item__poi_info__collect_stat"`
	AwemeListItemPoiInfoCollectedCount string `json:"aweme_list__item__poi_info__collected_count"`
	AwemeListItemPoiInfoCoverHd string `json:"aweme_list__item__poi_info__cover_hd"`
	AwemeListItemPoiInfoCoverLarge string `json:"aweme_list__item__poi_info__cover_large"`
	AwemeListItemPoiInfoCoverMedium string `json:"aweme_list__item__poi_info__cover_medium"`
	AwemeListItemPoiInfoCoverThumb string `json:"aweme_list__item__poi_info__cover_thumb"`
	AwemeListItemPoiInfoDistance string `json:"aweme_list__item__poi_info__distance"`
	AwemeListItemPoiInfoEffectIds string `json:"aweme_list__item__poi_info__effect_ids"`
	AwemeListItemPoiInfoExpandType int `json:"aweme_list__item__poi_info__expand_type"`
	AwemeListItemPoiInfoExtJson string `json:"aweme_list__item__poi_info__ext_json"`
	AwemeListItemPoiInfoFulfillTaskList string `json:"aweme_list__item__poi_info__fulfill_task_list"`
	AwemeListItemPoiInfoIconOnEntry string `json:"aweme_list__item__poi_info__icon_on_entry"`
	AwemeListItemPoiInfoIconOnInfo string `json:"aweme_list__item__poi_info__icon_on_info"`
	AwemeListItemPoiInfoIconOnMap string `json:"aweme_list__item__poi_info__icon_on_map"`
	AwemeListItemPoiInfoIconServiceTypeList string `json:"aweme_list__item__poi_info__icon_service_type_list"`
	AwemeListItemPoiInfoIconType int `json:"aweme_list__item__poi_info__icon_type"`
	AwemeListItemPoiInfoIsAdminArea bool `json:"aweme_list__item__poi_info__is_admin_area"`
	AwemeListItemPoiInfoIsAtCallBackCollect bool `json:"aweme_list__item__poi_info__is_at_call_back_collect"`
	AwemeListItemPoiInfoIsFoodGroupBuy bool `json:"aweme_list__item__poi_info__is_food_group_buy"`
	AwemeListItemPoiInfoItemCount int `json:"aweme_list__item__poi_info__item_count"`
	AwemeListItemPoiInfoPoi3classType string `json:"aweme_list__item__poi_info__poi_3class_type"`
	AwemeListItemPoiInfoPoiBackendType string `json:"aweme_list__item__poi_info__poi_backend_type"`
	AwemeListItemPoiInfoPoiDetailTags string `json:"aweme_list__item__poi_info__poi_detail_tags"`
	AwemeListItemPoiInfoPoiFrontendType string `json:"aweme_list__item__poi_info__poi_frontend_type"`
	AwemeListItemPoiInfoPoiId string `json:"aweme_list__item__poi_info__poi_id"`
	AwemeListItemPoiInfoPoiLatitude float64 `json:"aweme_list__item__poi_info__poi_latitude"`
	AwemeListItemPoiInfoPoiLongitude float64 `json:"aweme_list__item__poi_info__poi_longitude"`
	AwemeListItemPoiInfoPoiName string `json:"aweme_list__item__poi_info__poi_name"`
	AwemeListItemPoiInfoPoiRanks string `json:"aweme_list__item__poi_info__poi_ranks"`
	AwemeListItemPoiInfoPoiSubtitle string `json:"aweme_list__item__poi_info__poi_subtitle"`
	AwemeListItemPoiInfoPoiSubtitleType int `json:"aweme_list__item__poi_info__poi_subtitle_type"`
	AwemeListItemPoiInfoPopularity string `json:"aweme_list__item__poi_info__popularity"`
	AwemeListItemPoiInfoServiceTypeList string `json:"aweme_list__item__poi_info__service_type_list"`
	AwemeListItemPoiInfoShareInfo string `json:"aweme_list__item__poi_info__share_info"`
	AwemeListItemPoiInfoShowType int `json:"aweme_list__item__poi_info__show_type"`
	AwemeListItemPoiInfoSpSource string `json:"aweme_list__item__poi_info__sp_source"`
	AwemeListItemPoiInfoTypeCode string `json:"aweme_list__item__poi_info__type_code"`
	AwemeListItemPoiInfoUserCount int `json:"aweme_list__item__poi_info__user_count"`
	AwemeListItemPoiInfoViewCount string `json:"aweme_list__item__poi_info__view_count"`
	AwemeListItemPoiInfoVoucherReleaseAreas string `json:"aweme_list__item__poi_info__voucher_release_areas"`
	AwemeListItemPoiInfoAddressInfoAdCodeV2 string `json:"aweme_list__item__poi_info__address_info__ad_code_v2"`
	AwemeListItemPoiInfoAddressInfoAddress string `json:"aweme_list__item__poi_info__address_info__address"`
	AwemeListItemPoiInfoAddressInfoCity string `json:"aweme_list__item__poi_info__address_info__city"`
	AwemeListItemPoiInfoAddressInfoCityCode string `json:"aweme_list__item__poi_info__address_info__city_code"`
	AwemeListItemPoiInfoAddressInfoCityCodeV2 string `json:"aweme_list__item__poi_info__address_info__city_code_v2"`
	AwemeListItemPoiInfoAddressInfoCountry string `json:"aweme_list__item__poi_info__address_info__country"`
	AwemeListItemPoiInfoAddressInfoCountryCode string `json:"aweme_list__item__poi_info__address_info__country_code"`
	AwemeListItemPoiInfoAddressInfoDistrict string `json:"aweme_list__item__poi_info__address_info__district"`
	AwemeListItemPoiInfoAddressInfoProvince string `json:"aweme_list__item__poi_info__address_info__province"`
	AwemeListItemPoiInfoAddressInfoSimpleAddr string `json:"aweme_list__item__poi_info__address_info__simple_addr"`
	AwemeListItemImpressionDataGroupIdListA string `json:"aweme_list__item__impression_data__group_id_list_a"`
	AwemeListItemImpressionDataGroupIdListB string `json:"aweme_list__item__impression_data__group_id_list_b"`
	AwemeListItemImpressionDataGroupIdListC string `json:"aweme_list__item__impression_data__group_id_list_c"`
	AwemeListItemImpressionDataSimilarIdListA string `json:"aweme_list__item__impression_data__similar_id_list_a"`
	AwemeListItemImpressionDataSimilarIdListB string `json:"aweme_list__item__impression_data__similar_id_list_b"`
	AwemeListItemDuetOriginItemAdAwemeSource int `json:"aweme_list__item__duet_origin_item__ad_aweme_source"`
	AwemeListItemDuetOriginItemAnchors string `json:"aweme_list__item__duet_origin_item__anchors"`
	AwemeListItemDuetOriginItemAuthenticationToken string `json:"aweme_list__item__duet_origin_item__authentication_token"`
	AwemeListItemDuetOriginItemAuthorMaskTag int `json:"aweme_list__item__duet_origin_item__author_mask_tag"`
	AwemeListItemDuetOriginItemAuthorUserId int `json:"aweme_list__item__duet_origin_item__author_user_id"`
	AwemeListItemDuetOriginItemAwemeId string `json:"aweme_list__item__duet_origin_item__aweme_id"`
	AwemeListItemDuetOriginItemAwemeType int `json:"aweme_list__item__duet_origin_item__aweme_type"`
	AwemeListItemDuetOriginItemBodydanceScore int `json:"aweme_list__item__duet_origin_item__bodydance_score"`
	AwemeListItemDuetOriginItemChaList string `json:"aweme_list__item__duet_origin_item__cha_list"`
	AwemeListItemDuetOriginItemChallengePosition string `json:"aweme_list__item__duet_origin_item__challenge_position"`
	AwemeListItemDuetOriginItemChapterList string `json:"aweme_list__item__duet_origin_item__chapter_list"`
	AwemeListItemDuetOriginItemCity string `json:"aweme_list__item__duet_origin_item__city"`
	AwemeListItemDuetOriginItemCmtSwt bool `json:"aweme_list__item__duet_origin_item__cmt_swt"`
	AwemeListItemDuetOriginItemCollectStat int `json:"aweme_list__item__duet_origin_item__collect_stat"`
	AwemeListItemDuetOriginItemCollectionCornerMark int `json:"aweme_list__item__duet_origin_item__collection_corner_mark"`
	AwemeListItemDuetOriginItemCommentGid int `json:"aweme_list__item__duet_origin_item__comment_gid"`
	AwemeListItemDuetOriginItemCommentList string `json:"aweme_list__item__duet_origin_item__comment_list"`
	AwemeListItemDuetOriginItemCommerceConfigData string `json:"aweme_list__item__duet_origin_item__commerce_config_data"`
	AwemeListItemDuetOriginItemCommonBarInfo string `json:"aweme_list__item__duet_origin_item__common_bar_info"`
	AwemeListItemDuetOriginItemComponentInfoV2 string `json:"aweme_list__item__duet_origin_item__component_info_v2"`
	AwemeListItemDuetOriginItemCoverLabels string `json:"aweme_list__item__duet_origin_item__cover_labels"`
	AwemeListItemDuetOriginItemCreateTime int `json:"aweme_list__item__duet_origin_item__create_time"`
	AwemeListItemDuetOriginItemDesc string `json:"aweme_list__item__duet_origin_item__desc"`
	AwemeListItemDuetOriginItemDescLanguage string `json:"aweme_list__item__duet_origin_item__desc_language"`
	AwemeListItemDuetOriginItemDisableRelationBar int `json:"aweme_list__item__duet_origin_item__disable_relation_bar"`
	AwemeListItemDuetOriginItemDislikeDimensionList string `json:"aweme_list__item__duet_origin_item__dislike_dimension_list"`
	AwemeListItemDuetOriginItemDistance string `json:"aweme_list__item__duet_origin_item__distance"`
	AwemeListItemDuetOriginItemDistributeType int `json:"aweme_list__item__duet_origin_item__distribute_type"`
	AwemeListItemDuetOriginItemDuetAggregateInMusicTab bool `json:"aweme_list__item__duet_origin_item__duet_aggregate_in_music_tab"`
	AwemeListItemDuetOriginItemDuration int `json:"aweme_list__item__duet_origin_item__duration"`
	AwemeListItemDuetOriginItemGeofencing string `json:"aweme_list__item__duet_origin_item__geofencing"`
	AwemeListItemDuetOriginItemGeofencingRegions string `json:"aweme_list__item__duet_origin_item__geofencing_regions"`
	AwemeListItemDuetOriginItemGroupId string `json:"aweme_list__item__duet_origin_item__group_id"`
	AwemeListItemDuetOriginItemGuideBtnType int `json:"aweme_list__item__duet_origin_item__guide_btn_type"`
	AwemeListItemDuetOriginItemHasVsEntry bool `json:"aweme_list__item__duet_origin_item__has_vs_entry"`
	AwemeListItemDuetOriginItemHaveDashboard bool `json:"aweme_list__item__duet_origin_item__have_dashboard"`
	AwemeListItemDuetOriginItemHorizontalType int `json:"aweme_list__item__duet_origin_item__horizontal_type"`
	AwemeListItemDuetOriginItemHybridLabel string `json:"aweme_list__item__duet_origin_item__hybrid_label"`
	AwemeListItemDuetOriginItemImageAlbumMusicInfo string `json:"aweme_list__item__duet_origin_item__image_album_music_info"`
	AwemeListItemDuetOriginItemImageComment string `json:"aweme_list__item__duet_origin_item__image_comment"`
	AwemeListItemDuetOriginItemImageInfos string `json:"aweme_list__item__duet_origin_item__image_infos"`
	AwemeListItemDuetOriginItemImageList string `json:"aweme_list__item__duet_origin_item__image_list"`
	AwemeListItemDuetOriginItemImages string `json:"aweme_list__item__duet_origin_item__images"`
	AwemeListItemDuetOriginItemImgBitrate string `json:"aweme_list__item__duet_origin_item__img_bitrate"`
	AwemeListItemDuetOriginItemInteractionStickers string `json:"aweme_list__item__duet_origin_item__interaction_stickers"`
	AwemeListItemDuetOriginItemIsCollectsSelected int `json:"aweme_list__item__duet_origin_item__is_collects_selected"`
	AwemeListItemDuetOriginItemIsDuetSing bool `json:"aweme_list__item__duet_origin_item__is_duet_sing"`
	AwemeListItemDuetOriginItemIsFantasy bool `json:"aweme_list__item__duet_origin_item__is_fantasy"`
	AwemeListItemDuetOriginItemIsFirstVideo bool `json:"aweme_list__item__duet_origin_item__is_first_video"`
	AwemeListItemDuetOriginItemIsHashTag int `json:"aweme_list__item__duet_origin_item__is_hash_tag"`
	AwemeListItemDuetOriginItemIsImageBeat bool `json:"aweme_list__item__duet_origin_item__is_image_beat"`
	AwemeListItemDuetOriginItemIsInScope bool `json:"aweme_list__item__duet_origin_item__is_in_scope"`
	AwemeListItemDuetOriginItemIsKaraoke bool `json:"aweme_list__item__duet_origin_item__is_karaoke"`
	AwemeListItemDuetOriginItemIsLifeItem bool `json:"aweme_list__item__duet_origin_item__is_life_item"`
	AwemeListItemDuetOriginItemIsPgcshow bool `json:"aweme_list__item__duet_origin_item__is_pgcshow"`
	AwemeListItemDuetOriginItemIsPreview int `json:"aweme_list__item__duet_origin_item__is_preview"`
	AwemeListItemDuetOriginItemIsRelieve bool `json:"aweme_list__item__duet_origin_item__is_relieve"`
	AwemeListItemDuetOriginItemIsSharePost bool `json:"aweme_list__item__duet_origin_item__is_share_post"`
	AwemeListItemDuetOriginItemIsStory int `json:"aweme_list__item__duet_origin_item__is_story"`
	AwemeListItemDuetOriginItemIsTop int `json:"aweme_list__item__duet_origin_item__is_top"`
	AwemeListItemDuetOriginItemIsVr bool `json:"aweme_list__item__duet_origin_item__is_vr"`
	AwemeListItemDuetOriginItemItemCommentSettings int `json:"aweme_list__item__duet_origin_item__item_comment_settings"`
	AwemeListItemDuetOriginItemItemDuet int `json:"aweme_list__item__duet_origin_item__item_duet"`
	AwemeListItemDuetOriginItemItemReact int `json:"aweme_list__item__duet_origin_item__item_react"`
	AwemeListItemDuetOriginItemItemShare int `json:"aweme_list__item__duet_origin_item__item_share"`
	AwemeListItemDuetOriginItemItemStitch int `json:"aweme_list__item__duet_origin_item__item_stitch"`
	AwemeListItemDuetOriginItemLabelTopText string `json:"aweme_list__item__duet_origin_item__label_top_text"`
	AwemeListItemDuetOriginItemLongVideo string `json:"aweme_list__item__duet_origin_item__long_video"`
	AwemeListItemDuetOriginItemMiscInfo string `json:"aweme_list__item__duet_origin_item__misc_info"`
	AwemeListItemDuetOriginItemNearbyLevel int `json:"aweme_list__item__duet_origin_item__nearby_level"`
	AwemeListItemDuetOriginItemNeedVsEntry bool `json:"aweme_list__item__duet_origin_item__need_vs_entry"`
	AwemeListItemDuetOriginItemNicknamePosition string `json:"aweme_list__item__duet_origin_item__nickname_position"`
	AwemeListItemDuetOriginItemOriginCommentIds string `json:"aweme_list__item__duet_origin_item__origin_comment_ids"`
	AwemeListItemDuetOriginItemOriginTextExtra string `json:"aweme_list__item__duet_origin_item__origin_text_extra"`
	AwemeListItemDuetOriginItemOriginalImages string `json:"aweme_list__item__duet_origin_item__original_images"`
	AwemeListItemDuetOriginItemPackedClips string `json:"aweme_list__item__duet_origin_item__packed_clips"`
	AwemeListItemDuetOriginItemPhotoSearchEntrance string `json:"aweme_list__item__duet_origin_item__photo_search_entrance"`
	AwemeListItemDuetOriginItemPoiBiz string `json:"aweme_list__item__duet_origin_item__poi_biz"`
	AwemeListItemDuetOriginItemPoiPatchInfo string `json:"aweme_list__item__duet_origin_item__poi_patch_info"`
	AwemeListItemDuetOriginItemPosition string `json:"aweme_list__item__duet_origin_item__position"`
	AwemeListItemDuetOriginItemPreventDownload bool `json:"aweme_list__item__duet_origin_item__prevent_download"`
	AwemeListItemDuetOriginItemPreviewTitle string `json:"aweme_list__item__duet_origin_item__preview_title"`
	AwemeListItemDuetOriginItemPreviewVideoStatus int `json:"aweme_list__item__duet_origin_item__preview_video_status"`
	AwemeListItemDuetOriginItemPromotions string `json:"aweme_list__item__duet_origin_item__promotions"`
	AwemeListItemDuetOriginItemRate int `json:"aweme_list__item__duet_origin_item__rate"`
	AwemeListItemDuetOriginItemRefTtsIdList string `json:"aweme_list__item__duet_origin_item__ref_tts_id_list"`
	AwemeListItemDuetOriginItemRefVoiceModifyIdList string `json:"aweme_list__item__duet_origin_item__ref_voice_modify_id_list"`
	AwemeListItemDuetOriginItemRegion string `json:"aweme_list__item__duet_origin_item__region"`
	AwemeListItemDuetOriginItemRelationLabels string `json:"aweme_list__item__duet_origin_item__relation_labels"`
	AwemeListItemDuetOriginItemReportAction bool `json:"aweme_list__item__duet_origin_item__report_action"`
	AwemeListItemDuetOriginItemSearchImpr string `json:"aweme_list__item__duet_origin_item__search_impr"`
	AwemeListItemDuetOriginItemSeoInfo string `json:"aweme_list__item__duet_origin_item__seo_info"`
	AwemeListItemDuetOriginItemSeriesPaidInfo string `json:"aweme_list__item__duet_origin_item__series_paid_info"`
	AwemeListItemDuetOriginItemShouldOpenAdReport bool `json:"aweme_list__item__duet_origin_item__should_open_ad_report"`
	AwemeListItemDuetOriginItemShowFollowButton string `json:"aweme_list__item__duet_origin_item__show_follow_button"`
	AwemeListItemDuetOriginItemSocialTagList string `json:"aweme_list__item__duet_origin_item__social_tag_list"`
	AwemeListItemDuetOriginItemSortLabel string `json:"aweme_list__item__duet_origin_item__sort_label"`
	AwemeListItemDuetOriginItemStandardBarInfoList string `json:"aweme_list__item__duet_origin_item__standard_bar_info_list"`
	AwemeListItemDuetOriginItemStoryTtl int `json:"aweme_list__item__duet_origin_item__story_ttl"`
	AwemeListItemDuetOriginItemTextExtra string `json:"aweme_list__item__duet_origin_item__text_extra"`
	AwemeListItemDuetOriginItemToolBar string `json:"aweme_list__item__duet_origin_item__tool_bar"`
	AwemeListItemDuetOriginItemTtsIdList string `json:"aweme_list__item__duet_origin_item__tts_id_list"`
	AwemeListItemDuetOriginItemUniqidPosition string `json:"aweme_list__item__duet_origin_item__uniqid_position"`
	AwemeListItemDuetOriginItemUserDigged int `json:"aweme_list__item__duet_origin_item__user_digged"`
	AwemeListItemDuetOriginItemUserRecommendStatus int `json:"aweme_list__item__duet_origin_item__user_recommend_status"`
	AwemeListItemDuetOriginItemVideoLabels string `json:"aweme_list__item__duet_origin_item__video_labels"`
	AwemeListItemDuetOriginItemVideoTag string `json:"aweme_list__item__duet_origin_item__video_tag"`
	AwemeListItemDuetOriginItemVideoText string `json:"aweme_list__item__duet_origin_item__video_text"`
	AwemeListItemDuetOriginItemVoiceModifyIdList string `json:"aweme_list__item__duet_origin_item__voice_modify_id_list"`
	AwemeListItemDuetOriginItemVrType int `json:"aweme_list__item__duet_origin_item__vr_type"`
	AwemeListItemDuetOriginItemWithPromotionalMusic bool `json:"aweme_list__item__duet_origin_item__with_promotional_music"`
	AwemeListItemDuetOriginItemWithoutWatermark bool `json:"aweme_list__item__duet_origin_item__without_watermark"`
	AwemeListItemDuetOriginItemXiguaTask string `json:"aweme_list__item__duet_origin_item__xigua_task"`
	AwemeListItemDuetOriginItemVideoControlAllowDouplus bool `json:"aweme_list__item__duet_origin_item__video_control__allow_douplus"`
	AwemeListItemDuetOriginItemVideoControlAllowDownload bool `json:"aweme_list__item__duet_origin_item__video_control__allow_download"`
	AwemeListItemDuetOriginItemVideoControlAllowDuet bool `json:"aweme_list__item__duet_origin_item__video_control__allow_duet"`
	AwemeListItemDuetOriginItemVideoControlAllowDynamicWallpaper bool `json:"aweme_list__item__duet_origin_item__video_control__allow_dynamic_wallpaper"`
	AwemeListItemDuetOriginItemVideoControlAllowMusic bool `json:"aweme_list__item__duet_origin_item__video_control__allow_music"`
	AwemeListItemDuetOriginItemVideoControlAllowReact bool `json:"aweme_list__item__duet_origin_item__video_control__allow_react"`
	AwemeListItemDuetOriginItemVideoControlAllowShare bool `json:"aweme_list__item__duet_origin_item__video_control__allow_share"`
	AwemeListItemDuetOriginItemVideoControlAllowStitch bool `json:"aweme_list__item__duet_origin_item__video_control__allow_stitch"`
	AwemeListItemDuetOriginItemVideoControlDownloadIgnoreVisibility bool `json:"aweme_list__item__duet_origin_item__video_control__download_ignore_visibility"`
	AwemeListItemDuetOriginItemVideoControlDownloadInfo string `json:"aweme_list__item__duet_origin_item__video_control__download_info"`
	AwemeListItemDuetOriginItemVideoControlDraftProgressBar int `json:"aweme_list__item__duet_origin_item__video_control__draft_progress_bar"`
	AwemeListItemDuetOriginItemVideoControlDuetIgnoreVisibility bool `json:"aweme_list__item__duet_origin_item__video_control__duet_ignore_visibility"`
	AwemeListItemDuetOriginItemVideoControlDuetInfo string `json:"aweme_list__item__duet_origin_item__video_control__duet_info"`
	AwemeListItemDuetOriginItemVideoControlPreventDownloadType int `json:"aweme_list__item__duet_origin_item__video_control__prevent_download_type"`
	AwemeListItemDuetOriginItemVideoControlShareGrayed bool `json:"aweme_list__item__duet_origin_item__video_control__share_grayed"`
	AwemeListItemDuetOriginItemVideoControlShareIgnoreVisibility bool `json:"aweme_list__item__duet_origin_item__video_control__share_ignore_visibility"`
	AwemeListItemDuetOriginItemVideoControlShareType int `json:"aweme_list__item__duet_origin_item__video_control__share_type"`
	AwemeListItemDuetOriginItemVideoControlShowProgressBar int `json:"aweme_list__item__duet_origin_item__video_control__show_progress_bar"`
	AwemeListItemDuetOriginItemVideoControlTimerStatus int `json:"aweme_list__item__duet_origin_item__video_control__timer_status"`
	AwemeListItemDuetOriginItemStatusAllowComment bool `json:"aweme_list__item__duet_origin_item__status__allow_comment"`
	AwemeListItemDuetOriginItemStatusAllowShare bool `json:"aweme_list__item__duet_origin_item__status__allow_share"`
	AwemeListItemDuetOriginItemStatusAwemeEditInfo string `json:"aweme_list__item__duet_origin_item__status__aweme_edit_info"`
	AwemeListItemDuetOriginItemStatusAwemeId string `json:"aweme_list__item__duet_origin_item__status__aweme_id"`
	AwemeListItemDuetOriginItemStatusDontShareStatus int `json:"aweme_list__item__duet_origin_item__status__dont_share_status"`
	AwemeListItemDuetOriginItemStatusDownloadStatus int `json:"aweme_list__item__duet_origin_item__status__download_status"`
	AwemeListItemDuetOriginItemStatusInReviewing bool `json:"aweme_list__item__duet_origin_item__status__in_reviewing"`
	AwemeListItemDuetOriginItemStatusIsDelete bool `json:"aweme_list__item__duet_origin_item__status__is_delete"`
	AwemeListItemDuetOriginItemStatusIsPrivate bool `json:"aweme_list__item__duet_origin_item__status__is_private"`
	AwemeListItemDuetOriginItemStatusIsProhibited bool `json:"aweme_list__item__duet_origin_item__status__is_prohibited"`
	AwemeListItemDuetOriginItemStatusListenVideoStatus int `json:"aweme_list__item__duet_origin_item__status__listen_video_status"`
	AwemeListItemDuetOriginItemStatusPartSee int `json:"aweme_list__item__duet_origin_item__status__part_see"`
	AwemeListItemDuetOriginItemStatusPrivateStatus int `json:"aweme_list__item__duet_origin_item__status__private_status"`
	AwemeListItemDuetOriginItemStatusReviewResult string `json:"aweme_list__item__duet_origin_item__status__review_result"`
	AwemeListItemDuetOriginItemStatusReviewed int `json:"aweme_list__item__duet_origin_item__status__reviewed"`
	AwemeListItemDuetOriginItemStatusSelfSee bool `json:"aweme_list__item__duet_origin_item__status__self_see"`
	AwemeListItemDuetOriginItemStatusVideoHideSearch int `json:"aweme_list__item__duet_origin_item__status__video_hide_search"`
	AwemeListItemDuetOriginItemStatusWithFusionGoods bool `json:"aweme_list__item__duet_origin_item__status__with_fusion_goods"`
	AwemeListItemDuetOriginItemStatusWithGoods bool `json:"aweme_list__item__duet_origin_item__status__with_goods"`
	AwemeListItemDuetOriginItemStatisticsAdmireCount int `json:"aweme_list__item__duet_origin_item__statistics__admire_count"`
	AwemeListItemDuetOriginItemStatisticsAwemeId string `json:"aweme_list__item__duet_origin_item__statistics__aweme_id"`
	AwemeListItemDuetOriginItemStatisticsCollectCount int `json:"aweme_list__item__duet_origin_item__statistics__collect_count"`
	AwemeListItemDuetOriginItemStatisticsCommentCount int `json:"aweme_list__item__duet_origin_item__statistics__comment_count"`
	AwemeListItemDuetOriginItemStatisticsDigest string `json:"aweme_list__item__duet_origin_item__statistics__digest"`
	AwemeListItemDuetOriginItemStatisticsDiggCount int `json:"aweme_list__item__duet_origin_item__statistics__digg_count"`
	AwemeListItemDuetOriginItemStatisticsDownloadCount int `json:"aweme_list__item__duet_origin_item__statistics__download_count"`
	AwemeListItemDuetOriginItemStatisticsExposureCount int `json:"aweme_list__item__duet_origin_item__statistics__exposure_count"`
	AwemeListItemDuetOriginItemStatisticsForwardCount int `json:"aweme_list__item__duet_origin_item__statistics__forward_count"`
	AwemeListItemDuetOriginItemStatisticsLiveWatchCount int `json:"aweme_list__item__duet_origin_item__statistics__live_watch_count"`
	AwemeListItemDuetOriginItemStatisticsLoseCommentCount int `json:"aweme_list__item__duet_origin_item__statistics__lose_comment_count"`
	AwemeListItemDuetOriginItemStatisticsLoseCount int `json:"aweme_list__item__duet_origin_item__statistics__lose_count"`
	AwemeListItemDuetOriginItemStatisticsPlayCount int `json:"aweme_list__item__duet_origin_item__statistics__play_count"`
	AwemeListItemDuetOriginItemStatisticsShareCount int `json:"aweme_list__item__duet_origin_item__statistics__share_count"`
	AwemeListItemDuetOriginItemStatisticsWhatsappShareCount int `json:"aweme_list__item__duet_origin_item__statistics__whatsapp_share_count"`
	AwemeListItemDuetOriginItemMusicAlbum string `json:"aweme_list__item__duet_origin_item__music__album"`
	AwemeListItemDuetOriginItemMusicArtistUserInfos string `json:"aweme_list__item__duet_origin_item__music__artist_user_infos"`
	AwemeListItemDuetOriginItemMusicArtists string `json:"aweme_list__item__duet_origin_item__music__artists"`
	AwemeListItemDuetOriginItemMusicAuditionDuration int `json:"aweme_list__item__duet_origin_item__music__audition_duration"`
	AwemeListItemDuetOriginItemMusicAuthor string `json:"aweme_list__item__duet_origin_item__music__author"`
	AwemeListItemDuetOriginItemMusicAuthorDeleted bool `json:"aweme_list__item__duet_origin_item__music__author_deleted"`
	AwemeListItemDuetOriginItemMusicAuthorPosition string `json:"aweme_list__item__duet_origin_item__music__author_position"`
	AwemeListItemDuetOriginItemMusicAuthorStatus int `json:"aweme_list__item__duet_origin_item__music__author_status"`
	AwemeListItemDuetOriginItemMusicAvatarLarge string `json:"aweme_list__item__duet_origin_item__music__avatar_large"`
	AwemeListItemDuetOriginItemMusicAvatarMedium string `json:"aweme_list__item__duet_origin_item__music__avatar_medium"`
	AwemeListItemDuetOriginItemMusicAvatarThumb string `json:"aweme_list__item__duet_origin_item__music__avatar_thumb"`
	AwemeListItemDuetOriginItemMusicBindedChallengeId int `json:"aweme_list__item__duet_origin_item__music__binded_challenge_id"`
	AwemeListItemDuetOriginItemMusicCanBackgroundPlay bool `json:"aweme_list__item__duet_origin_item__music__can_background_play"`
	AwemeListItemDuetOriginItemMusicClimax string `json:"aweme_list__item__duet_origin_item__music__climax"`
	AwemeListItemDuetOriginItemMusicCollectStat int `json:"aweme_list__item__duet_origin_item__music__collect_stat"`
	AwemeListItemDuetOriginItemMusicCoverColorHsv string `json:"aweme_list__item__duet_origin_item__music__cover_color_hsv"`
	AwemeListItemDuetOriginItemMusicCoverHd string `json:"aweme_list__item__duet_origin_item__music__cover_hd"`
	AwemeListItemDuetOriginItemMusicCoverLarge string `json:"aweme_list__item__duet_origin_item__music__cover_large"`
	AwemeListItemDuetOriginItemMusicCoverMedium string `json:"aweme_list__item__duet_origin_item__music__cover_medium"`
	AwemeListItemDuetOriginItemMusicCoverThumb string `json:"aweme_list__item__duet_origin_item__music__cover_thumb"`
	AwemeListItemDuetOriginItemMusicDmvAutoShow bool `json:"aweme_list__item__duet_origin_item__music__dmv_auto_show"`
	AwemeListItemDuetOriginItemMusicDspStatus int `json:"aweme_list__item__duet_origin_item__music__dsp_status"`
	AwemeListItemDuetOriginItemMusicDuration int `json:"aweme_list__item__duet_origin_item__music__duration"`
	AwemeListItemDuetOriginItemMusicEndTime int `json:"aweme_list__item__duet_origin_item__music__end_time"`
	AwemeListItemDuetOriginItemMusicExternalSongInfo string `json:"aweme_list__item__duet_origin_item__music__external_song_info"`
	AwemeListItemDuetOriginItemMusicExtra string `json:"aweme_list__item__duet_origin_item__music__extra"`
	AwemeListItemDuetOriginItemMusicId int `json:"aweme_list__item__duet_origin_item__music__id"`
	AwemeListItemDuetOriginItemMusicIdStr string `json:"aweme_list__item__duet_origin_item__music__id_str"`
	AwemeListItemDuetOriginItemMusicIsAudioUrlWithCookie bool `json:"aweme_list__item__duet_origin_item__music__is_audio_url_with_cookie"`
	AwemeListItemDuetOriginItemMusicIsCommerceMusic bool `json:"aweme_list__item__duet_origin_item__music__is_commerce_music"`
	AwemeListItemDuetOriginItemMusicIsDelVideo bool `json:"aweme_list__item__duet_origin_item__music__is_del_video"`
	AwemeListItemDuetOriginItemMusicIsMatchedMetadata bool `json:"aweme_list__item__duet_origin_item__music__is_matched_metadata"`
	AwemeListItemDuetOriginItemMusicIsOriginal bool `json:"aweme_list__item__duet_origin_item__music__is_original"`
	AwemeListItemDuetOriginItemMusicIsOriginalSound bool `json:"aweme_list__item__duet_origin_item__music__is_original_sound"`
	AwemeListItemDuetOriginItemMusicIsPgc bool `json:"aweme_list__item__duet_origin_item__music__is_pgc"`
	AwemeListItemDuetOriginItemMusicIsRestricted bool `json:"aweme_list__item__duet_origin_item__music__is_restricted"`
	AwemeListItemDuetOriginItemMusicIsVideoSelfSee bool `json:"aweme_list__item__duet_origin_item__music__is_video_self_see"`
	AwemeListItemDuetOriginItemMusicLunaInfo string `json:"aweme_list__item__duet_origin_item__music__luna_info"`
	AwemeListItemDuetOriginItemMusicLyricShortPosition string `json:"aweme_list__item__duet_origin_item__music__lyric_short_position"`
	AwemeListItemDuetOriginItemMusicMatchedPgcSound string `json:"aweme_list__item__duet_origin_item__music__matched_pgc_sound"`
	AwemeListItemDuetOriginItemMusicMid string `json:"aweme_list__item__duet_origin_item__music__mid"`
	AwemeListItemDuetOriginItemMusicMusicChartRanks string `json:"aweme_list__item__duet_origin_item__music__music_chart_ranks"`
	AwemeListItemDuetOriginItemMusicMusicStatus int `json:"aweme_list__item__duet_origin_item__music__music_status"`
	AwemeListItemDuetOriginItemMusicMusicianUserInfos string `json:"aweme_list__item__duet_origin_item__music__musician_user_infos"`
	AwemeListItemDuetOriginItemMusicMuteShare bool `json:"aweme_list__item__duet_origin_item__music__mute_share"`
	AwemeListItemDuetOriginItemMusicOfflineDesc string `json:"aweme_list__item__duet_origin_item__music__offline_desc"`
	AwemeListItemDuetOriginItemMusicOwnerHandle string `json:"aweme_list__item__duet_origin_item__music__owner_handle"`
	AwemeListItemDuetOriginItemMusicOwnerId string `json:"aweme_list__item__duet_origin_item__music__owner_id"`
	AwemeListItemDuetOriginItemMusicOwnerNickname string `json:"aweme_list__item__duet_origin_item__music__owner_nickname"`
	AwemeListItemDuetOriginItemMusicPgcMusicType int `json:"aweme_list__item__duet_origin_item__music__pgc_music_type"`
	AwemeListItemDuetOriginItemMusicPlayUrl string `json:"aweme_list__item__duet_origin_item__music__play_url"`
	AwemeListItemDuetOriginItemMusicPosition string `json:"aweme_list__item__duet_origin_item__music__position"`
	AwemeListItemDuetOriginItemMusicPreventDownload bool `json:"aweme_list__item__duet_origin_item__music__prevent_download"`
	AwemeListItemDuetOriginItemMusicPreventItemDownloadStatus int `json:"aweme_list__item__duet_origin_item__music__prevent_item_download_status"`
	AwemeListItemDuetOriginItemMusicPreviewEndTime int `json:"aweme_list__item__duet_origin_item__music__preview_end_time"`
	AwemeListItemDuetOriginItemMusicPreviewStartTime float64 `json:"aweme_list__item__duet_origin_item__music__preview_start_time"`
	AwemeListItemDuetOriginItemMusicReasonType int `json:"aweme_list__item__duet_origin_item__music__reason_type"`
	AwemeListItemDuetOriginItemMusicRedirect bool `json:"aweme_list__item__duet_origin_item__music__redirect"`
	AwemeListItemDuetOriginItemMusicSchemaUrl string `json:"aweme_list__item__duet_origin_item__music__schema_url"`
	AwemeListItemDuetOriginItemMusicSearchImpr string `json:"aweme_list__item__duet_origin_item__music__search_impr"`
	AwemeListItemDuetOriginItemMusicSecUid string `json:"aweme_list__item__duet_origin_item__music__sec_uid"`
	AwemeListItemDuetOriginItemMusicShootDuration int `json:"aweme_list__item__duet_origin_item__music__shoot_duration"`
	AwemeListItemDuetOriginItemMusicSourcePlatform int `json:"aweme_list__item__duet_origin_item__music__source_platform"`
	AwemeListItemDuetOriginItemMusicStartTime int `json:"aweme_list__item__duet_origin_item__music__start_time"`
	AwemeListItemDuetOriginItemMusicStatus int `json:"aweme_list__item__duet_origin_item__music__status"`
	AwemeListItemDuetOriginItemMusicStrongBeatUrl string `json:"aweme_list__item__duet_origin_item__music__strong_beat_url"`
	AwemeListItemDuetOriginItemMusicTagList string `json:"aweme_list__item__duet_origin_item__music__tag_list"`
	AwemeListItemDuetOriginItemMusicTitle string `json:"aweme_list__item__duet_origin_item__music__title"`
	AwemeListItemDuetOriginItemMusicUnshelveCountries string `json:"aweme_list__item__duet_origin_item__music__unshelve_countries"`
	AwemeListItemDuetOriginItemMusicUserCount int `json:"aweme_list__item__duet_origin_item__music__user_count"`
	AwemeListItemDuetOriginItemMusicVideoDuration int `json:"aweme_list__item__duet_origin_item__music__video_duration"`
	AwemeListItemDuetOriginItemMusicSongArtists string `json:"aweme_list__item__duet_origin_item__music__song__artists"`
	AwemeListItemDuetOriginItemMusicSongChorus string `json:"aweme_list__item__duet_origin_item__music__song__chorus"`
	AwemeListItemDuetOriginItemMusicSongChorusV3Infos string `json:"aweme_list__item__duet_origin_item__music__song__chorus_v3_infos"`
	AwemeListItemDuetOriginItemMusicSongId int `json:"aweme_list__item__duet_origin_item__music__song__id"`
	AwemeListItemDuetOriginItemMusicSongIdStr string `json:"aweme_list__item__duet_origin_item__music__song__id_str"`
	AwemeListItemDuetOriginItemMusicSongTitle string `json:"aweme_list__item__duet_origin_item__music__song__title"`
	AwemeListItemDuetOriginItemDescendantsNotifyMsg string `json:"aweme_list__item__duet_origin_item__descendants__notify_msg"`
	AwemeListItemDuetOriginItemDescendantsPlatforms string `json:"aweme_list__item__duet_origin_item__descendants__platforms"`
	AwemeListItemDuetOriginItemCommerceInfoAdAuthStatus int `json:"aweme_list__item__duet_origin_item__commerce_info__ad_auth_status"`
	AwemeListItemDuetOriginItemCommerceInfoAdAuthTargetType int `json:"aweme_list__item__duet_origin_item__commerce_info__ad_auth_target_type"`
	AwemeListItemDuetOriginItemCommerceInfoAdBanMask int `json:"aweme_list__item__duet_origin_item__commerce_info__ad_ban_mask"`
	AwemeListItemDuetOriginItemCommerceInfoAdSource int `json:"aweme_list__item__duet_origin_item__commerce_info__ad_source"`
	AwemeListItemDuetOriginItemCommerceInfoAdType int `json:"aweme_list__item__duet_origin_item__commerce_info__ad_type"`
	AwemeListItemDuetOriginItemCommerceInfoIsAd bool `json:"aweme_list__item__duet_origin_item__commerce_info__is_ad"`
	AwemeListItemDuetOriginItemAwemeControlCanComment bool `json:"aweme_list__item__duet_origin_item__aweme_control__can_comment"`
	AwemeListItemDuetOriginItemAwemeControlCanForward bool `json:"aweme_list__item__duet_origin_item__aweme_control__can_forward"`
	AwemeListItemDuetOriginItemAwemeControlCanShare bool `json:"aweme_list__item__duet_origin_item__aweme_control__can_share"`
	AwemeListItemDuetOriginItemAwemeControlCanShowComment bool `json:"aweme_list__item__duet_origin_item__aweme_control__can_show_comment"`
	AwemeListItemDuetOriginItemVideoAnimatedCover string `json:"aweme_list__item__duet_origin_item__video__animated_cover"`
	AwemeListItemDuetOriginItemVideoBigThumbs string `json:"aweme_list__item__duet_origin_item__video__big_thumbs"`
	AwemeListItemDuetOriginItemVideoBitRate string `json:"aweme_list__item__duet_origin_item__video__bit_rate"`
	AwemeListItemDuetOriginItemVideoCdnUrlExpired int `json:"aweme_list__item__duet_origin_item__video__cdn_url_expired"`
	AwemeListItemDuetOriginItemVideoCover string `json:"aweme_list__item__duet_origin_item__video__cover"`
	AwemeListItemDuetOriginItemVideoDownloadAddr string `json:"aweme_list__item__duet_origin_item__video__download_addr"`
	AwemeListItemDuetOriginItemVideoDownloadSuffixLogoAddr string `json:"aweme_list__item__duet_origin_item__video__download_suffix_logo_addr"`
	AwemeListItemDuetOriginItemVideoDuration int `json:"aweme_list__item__duet_origin_item__video__duration"`
	AwemeListItemDuetOriginItemVideoDynamicCover string `json:"aweme_list__item__duet_origin_item__video__dynamic_cover"`
	AwemeListItemDuetOriginItemVideoHasDownloadSuffixLogoAddr bool `json:"aweme_list__item__duet_origin_item__video__has_download_suffix_logo_addr"`
	AwemeListItemDuetOriginItemVideoHasWatermark bool `json:"aweme_list__item__duet_origin_item__video__has_watermark"`
	AwemeListItemDuetOriginItemVideoHeight int `json:"aweme_list__item__duet_origin_item__video__height"`
	AwemeListItemDuetOriginItemVideoHorizontalType int `json:"aweme_list__item__duet_origin_item__video__horizontal_type"`
	AwemeListItemDuetOriginItemVideoIsBytevc1 int `json:"aweme_list__item__duet_origin_item__video__is_bytevc1"`
	AwemeListItemDuetOriginItemVideoIsCallback bool `json:"aweme_list__item__duet_origin_item__video__is_callback"`
	AwemeListItemDuetOriginItemVideoIsH265 int `json:"aweme_list__item__duet_origin_item__video__is_h265"`
	AwemeListItemDuetOriginItemVideoIsLongVideo int `json:"aweme_list__item__duet_origin_item__video__is_long_video"`
	AwemeListItemDuetOriginItemVideoIsSourceHDR int `json:"aweme_list__item__duet_origin_item__video__is_source_HDR"`
	AwemeListItemDuetOriginItemVideoMeta string `json:"aweme_list__item__duet_origin_item__video__meta"`
	AwemeListItemDuetOriginItemVideoMiscDownloadAddrs string `json:"aweme_list__item__duet_origin_item__video__misc_download_addrs"`
	AwemeListItemDuetOriginItemVideoNeedSetToken bool `json:"aweme_list__item__duet_origin_item__video__need_set_token"`
	AwemeListItemDuetOriginItemVideoOptimizedCover string `json:"aweme_list__item__duet_origin_item__video__optimized_cover"`
	AwemeListItemDuetOriginItemVideoOriginCover string `json:"aweme_list__item__duet_origin_item__video__origin_cover"`
	AwemeListItemDuetOriginItemVideoPlayAddr string `json:"aweme_list__item__duet_origin_item__video__play_addr"`
	AwemeListItemDuetOriginItemVideoPlayAddr265 string `json:"aweme_list__item__duet_origin_item__video__play_addr_265"`
	AwemeListItemDuetOriginItemVideoPlayAddrH264 string `json:"aweme_list__item__duet_origin_item__video__play_addr_h264"`
	AwemeListItemDuetOriginItemVideoPlayAddrLowbr string `json:"aweme_list__item__duet_origin_item__video__play_addr_lowbr"`
	AwemeListItemDuetOriginItemVideoRatio string `json:"aweme_list__item__duet_origin_item__video__ratio"`
	AwemeListItemDuetOriginItemVideoTags string `json:"aweme_list__item__duet_origin_item__video__tags"`
	AwemeListItemDuetOriginItemVideoUseStaticCover bool `json:"aweme_list__item__duet_origin_item__video__use_static_cover"`
	AwemeListItemDuetOriginItemVideoVideoModel string `json:"aweme_list__item__duet_origin_item__video__video_model"`
	AwemeListItemDuetOriginItemVideoWidth int `json:"aweme_list__item__duet_origin_item__video__width"`
	AwemeListItemDuetOriginItemRiskInfosContent string `json:"aweme_list__item__duet_origin_item__risk_infos__content"`
	AwemeListItemDuetOriginItemRiskInfosRiskSink bool `json:"aweme_list__item__duet_origin_item__risk_infos__risk_sink"`
	AwemeListItemDuetOriginItemRiskInfosType int `json:"aweme_list__item__duet_origin_item__risk_infos__type"`
	AwemeListItemDuetOriginItemRiskInfosVote bool `json:"aweme_list__item__duet_origin_item__risk_infos__vote"`
	AwemeListItemDuetOriginItemRiskInfosWarn bool `json:"aweme_list__item__duet_origin_item__risk_infos__warn"`
	AwemeListItemDuetOriginItemImpressionDataGroupIdListA string `json:"aweme_list__item__duet_origin_item__impression_data__group_id_list_a"`
	AwemeListItemDuetOriginItemImpressionDataGroupIdListB string `json:"aweme_list__item__duet_origin_item__impression_data__group_id_list_b"`
	AwemeListItemDuetOriginItemImpressionDataGroupIdListC string `json:"aweme_list__item__duet_origin_item__impression_data__group_id_list_c"`
	AwemeListItemDuetOriginItemImpressionDataSimilarIdListA string `json:"aweme_list__item__duet_origin_item__impression_data__similar_id_list_a"`
	AwemeListItemDuetOriginItemImpressionDataSimilarIdListB string `json:"aweme_list__item__duet_origin_item__impression_data__similar_id_list_b"`
	AwemeListItemDuetOriginItemCommentPermissionInfoCanComment bool `json:"aweme_list__item__duet_origin_item__comment_permission_info__can_comment"`
	AwemeListItemDuetOriginItemCommentPermissionInfoCommentPermissionStatus int `json:"aweme_list__item__duet_origin_item__comment_permission_info__comment_permission_status"`
	AwemeListItemDuetOriginItemCommentPermissionInfoItemDetailEntry bool `json:"aweme_list__item__duet_origin_item__comment_permission_info__item_detail_entry"`
	AwemeListItemDuetOriginItemCommentPermissionInfoPressEntry bool `json:"aweme_list__item__duet_origin_item__comment_permission_info__press_entry"`
	AwemeListItemDuetOriginItemCommentPermissionInfoToastGuide bool `json:"aweme_list__item__duet_origin_item__comment_permission_info__toast_guide"`
	AwemeListItemDuetOriginItemAwemeAclDownloadMaskPanel string `json:"aweme_list__item__duet_origin_item__aweme_acl__download_mask_panel"`
	AwemeListItemDuetOriginItemAuthorAcceptPrivatePolicy bool `json:"aweme_list__item__duet_origin_item__author__accept_private_policy"`
	AwemeListItemDuetOriginItemAuthorAccountRegion string `json:"aweme_list__item__duet_origin_item__author__account_region"`
	AwemeListItemDuetOriginItemAuthorAdCoverUrl string `json:"aweme_list__item__duet_origin_item__author__ad_cover_url"`
	AwemeListItemDuetOriginItemAuthorAppleAccount int `json:"aweme_list__item__duet_origin_item__author__apple_account"`
	AwemeListItemDuetOriginItemAuthorAuthorityStatus int `json:"aweme_list__item__duet_origin_item__author__authority_status"`
	AwemeListItemDuetOriginItemAuthorAvatar168x168 string `json:"aweme_list__item__duet_origin_item__author__avatar_168x168"`
	AwemeListItemDuetOriginItemAuthorAvatar300x300 string `json:"aweme_list__item__duet_origin_item__author__avatar_300x300"`
	AwemeListItemDuetOriginItemAuthorAvatarLarger string `json:"aweme_list__item__duet_origin_item__author__avatar_larger"`
	AwemeListItemDuetOriginItemAuthorAvatarMedium string `json:"aweme_list__item__duet_origin_item__author__avatar_medium"`
	AwemeListItemDuetOriginItemAuthorAvatarThumb string `json:"aweme_list__item__duet_origin_item__author__avatar_thumb"`
	AwemeListItemDuetOriginItemAuthorAvatarUri string `json:"aweme_list__item__duet_origin_item__author__avatar_uri"`
	AwemeListItemDuetOriginItemAuthorAwemeControl string `json:"aweme_list__item__duet_origin_item__author__aweme_control"`
	AwemeListItemDuetOriginItemAuthorAwemeCount int `json:"aweme_list__item__duet_origin_item__author__aweme_count"`
	AwemeListItemDuetOriginItemAuthorAwemeHotsoonAuth int `json:"aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth"`
	AwemeListItemDuetOriginItemAuthorAwemeHotsoonAuthRelation int `json:"aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth_relation"`
	AwemeListItemDuetOriginItemAuthorBanUserFunctions string `json:"aweme_list__item__duet_origin_item__author__ban_user_functions"`
	AwemeListItemDuetOriginItemAuthorBindPhone string `json:"aweme_list__item__duet_origin_item__author__bind_phone"`
	AwemeListItemDuetOriginItemAuthorBirthday string `json:"aweme_list__item__duet_origin_item__author__birthday"`
	AwemeListItemDuetOriginItemAuthorCanSetGeofencing string `json:"aweme_list__item__duet_origin_item__author__can_set_geofencing"`
	AwemeListItemDuetOriginItemAuthorCardEntries string `json:"aweme_list__item__duet_origin_item__author__card_entries"`
	AwemeListItemDuetOriginItemAuthorCardEntriesNotDisplay string `json:"aweme_list__item__duet_origin_item__author__card_entries_not_display"`
	AwemeListItemDuetOriginItemAuthorCardSortPriority string `json:"aweme_list__item__duet_origin_item__author__card_sort_priority"`
	AwemeListItemDuetOriginItemAuthorCfList string `json:"aweme_list__item__duet_origin_item__author__cf_list"`
	AwemeListItemDuetOriginItemAuthorChaList string `json:"aweme_list__item__duet_origin_item__author__cha_list"`
	AwemeListItemDuetOriginItemAuthorCloseFriendType int `json:"aweme_list__item__duet_origin_item__author__close_friend_type"`
	AwemeListItemDuetOriginItemAuthorCommentFilterStatus int `json:"aweme_list__item__duet_origin_item__author__comment_filter_status"`
	AwemeListItemDuetOriginItemAuthorCommentSetting int `json:"aweme_list__item__duet_origin_item__author__comment_setting"`
	AwemeListItemDuetOriginItemAuthorCommerceUserLevel int `json:"aweme_list__item__duet_origin_item__author__commerce_user_level"`
	AwemeListItemDuetOriginItemAuthorConstellation int `json:"aweme_list__item__duet_origin_item__author__constellation"`
	AwemeListItemDuetOriginItemAuthorContactsStatus int `json:"aweme_list__item__duet_origin_item__author__contacts_status"`
	AwemeListItemDuetOriginItemAuthorContrailList string `json:"aweme_list__item__duet_origin_item__author__contrail_list"`
	AwemeListItemDuetOriginItemAuthorCoverUrl string `json:"aweme_list__item__duet_origin_item__author__cover_url"`
	AwemeListItemDuetOriginItemAuthorCreateTime int `json:"aweme_list__item__duet_origin_item__author__create_time"`
	AwemeListItemDuetOriginItemAuthorCustomVerify string `json:"aweme_list__item__duet_origin_item__author__custom_verify"`
	AwemeListItemDuetOriginItemAuthorCvLevel string `json:"aweme_list__item__duet_origin_item__author__cv_level"`
	AwemeListItemDuetOriginItemAuthorDataLabelList string `json:"aweme_list__item__duet_origin_item__author__data_label_list"`
	AwemeListItemDuetOriginItemAuthorDisplayInfo string `json:"aweme_list__item__duet_origin_item__author__display_info"`
	AwemeListItemDuetOriginItemAuthorDownloadPromptTs int `json:"aweme_list__item__duet_origin_item__author__download_prompt_ts"`
	AwemeListItemDuetOriginItemAuthorDownloadSetting int `json:"aweme_list__item__duet_origin_item__author__download_setting"`
	AwemeListItemDuetOriginItemAuthorDuetSetting int `json:"aweme_list__item__duet_origin_item__author__duet_setting"`
	AwemeListItemDuetOriginItemAuthorEnableNearbyVisible bool `json:"aweme_list__item__duet_origin_item__author__enable_nearby_visible"`
	AwemeListItemDuetOriginItemAuthorEndorsementInfoList string `json:"aweme_list__item__duet_origin_item__author__endorsement_info_list"`
	AwemeListItemDuetOriginItemAuthorEnterpriseVerifyReason string `json:"aweme_list__item__duet_origin_item__author__enterprise_verify_reason"`
	AwemeListItemDuetOriginItemAuthorFavoritingCount int `json:"aweme_list__item__duet_origin_item__author__favoriting_count"`
	AwemeListItemDuetOriginItemAuthorFbExpireTime int `json:"aweme_list__item__duet_origin_item__author__fb_expire_time"`
	AwemeListItemDuetOriginItemAuthorFollowStatus int `json:"aweme_list__item__duet_origin_item__author__follow_status"`
	AwemeListItemDuetOriginItemAuthorFollowerCount int `json:"aweme_list__item__duet_origin_item__author__follower_count"`
	AwemeListItemDuetOriginItemAuthorFollowerListSecondaryInformationStruct string `json:"aweme_list__item__duet_origin_item__author__follower_list_secondary_information_struct"`
	AwemeListItemDuetOriginItemAuthorFollowerRequestStatus int `json:"aweme_list__item__duet_origin_item__author__follower_request_status"`
	AwemeListItemDuetOriginItemAuthorFollowerStatus int `json:"aweme_list__item__duet_origin_item__author__follower_status"`
	AwemeListItemDuetOriginItemAuthorFollowersDetail string `json:"aweme_list__item__duet_origin_item__author__followers_detail"`
	AwemeListItemDuetOriginItemAuthorFollowingCount int `json:"aweme_list__item__duet_origin_item__author__following_count"`
	AwemeListItemDuetOriginItemAuthorGender int `json:"aweme_list__item__duet_origin_item__author__gender"`
	AwemeListItemDuetOriginItemAuthorGeofencing string `json:"aweme_list__item__duet_origin_item__author__geofencing"`
	AwemeListItemDuetOriginItemAuthorGoogleAccount string `json:"aweme_list__item__duet_origin_item__author__google_account"`
	AwemeListItemDuetOriginItemAuthorHasEmail bool `json:"aweme_list__item__duet_origin_item__author__has_email"`
	AwemeListItemDuetOriginItemAuthorHasFacebookToken bool `json:"aweme_list__item__duet_origin_item__author__has_facebook_token"`
	AwemeListItemDuetOriginItemAuthorHasInsights bool `json:"aweme_list__item__duet_origin_item__author__has_insights"`
	AwemeListItemDuetOriginItemAuthorHasOrders bool `json:"aweme_list__item__duet_origin_item__author__has_orders"`
	AwemeListItemDuetOriginItemAuthorHasTwitterToken bool `json:"aweme_list__item__duet_origin_item__author__has_twitter_token"`
	AwemeListItemDuetOriginItemAuthorHasUnreadStory bool `json:"aweme_list__item__duet_origin_item__author__has_unread_story"`
	AwemeListItemDuetOriginItemAuthorHasYoutubeToken bool `json:"aweme_list__item__duet_origin_item__author__has_youtube_token"`
	AwemeListItemDuetOriginItemAuthorHideLocation bool `json:"aweme_list__item__duet_origin_item__author__hide_location"`
	AwemeListItemDuetOriginItemAuthorHideSearch bool `json:"aweme_list__item__duet_origin_item__author__hide_search"`
	AwemeListItemDuetOriginItemAuthorHomepageBottomToast string `json:"aweme_list__item__duet_origin_item__author__homepage_bottom_toast"`
	AwemeListItemDuetOriginItemAuthorImRoleIds string `json:"aweme_list__item__duet_origin_item__author__im_role_ids"`
	AwemeListItemDuetOriginItemAuthorInsId string `json:"aweme_list__item__duet_origin_item__author__ins_id"`
	AwemeListItemDuetOriginItemAuthorInterestTags string `json:"aweme_list__item__duet_origin_item__author__interest_tags"`
	AwemeListItemDuetOriginItemAuthorIsAdFake bool `json:"aweme_list__item__duet_origin_item__author__is_ad_fake"`
	AwemeListItemDuetOriginItemAuthorIsBindedWeibo bool `json:"aweme_list__item__duet_origin_item__author__is_binded_weibo"`
	AwemeListItemDuetOriginItemAuthorIsBlock bool `json:"aweme_list__item__duet_origin_item__author__is_block"`
	AwemeListItemDuetOriginItemAuthorIsBlockedV2 bool `json:"aweme_list__item__duet_origin_item__author__is_blocked_v2"`
	AwemeListItemDuetOriginItemAuthorIsBlockingV2 bool `json:"aweme_list__item__duet_origin_item__author__is_blocking_v2"`
	AwemeListItemDuetOriginItemAuthorIsCf int `json:"aweme_list__item__duet_origin_item__author__is_cf"`
	AwemeListItemDuetOriginItemAuthorIsDisciplineMember bool `json:"aweme_list__item__duet_origin_item__author__is_discipline_member"`
	AwemeListItemDuetOriginItemAuthorIsGovMediaVip bool `json:"aweme_list__item__duet_origin_item__author__is_gov_media_vip"`
	AwemeListItemDuetOriginItemAuthorIsMixUser bool `json:"aweme_list__item__duet_origin_item__author__is_mix_user"`
	AwemeListItemDuetOriginItemAuthorIsNotShow bool `json:"aweme_list__item__duet_origin_item__author__is_not_show"`
	AwemeListItemDuetOriginItemAuthorIsPhoneBinded bool `json:"aweme_list__item__duet_origin_item__author__is_phone_binded"`
	AwemeListItemDuetOriginItemAuthorIsStar bool `json:"aweme_list__item__duet_origin_item__author__is_star"`
	AwemeListItemDuetOriginItemAuthorIsVerified bool `json:"aweme_list__item__duet_origin_item__author__is_verified"`
	AwemeListItemDuetOriginItemAuthorItemList string `json:"aweme_list__item__duet_origin_item__author__item_list"`
	AwemeListItemDuetOriginItemAuthorKyOnlyPredict float64 `json:"aweme_list__item__duet_origin_item__author__ky_only_predict"`
	AwemeListItemDuetOriginItemAuthorLanguage string `json:"aweme_list__item__duet_origin_item__author__language"`
	AwemeListItemDuetOriginItemAuthorLinkItemList string `json:"aweme_list__item__duet_origin_item__author__link_item_list"`
	AwemeListItemDuetOriginItemAuthorLiveAgreement int `json:"aweme_list__item__duet_origin_item__author__live_agreement"`
	AwemeListItemDuetOriginItemAuthorLiveAgreementTime int `json:"aweme_list__item__duet_origin_item__author__live_agreement_time"`
	AwemeListItemDuetOriginItemAuthorLiveCommerce bool `json:"aweme_list__item__duet_origin_item__author__live_commerce"`
	AwemeListItemDuetOriginItemAuthorLiveStatus int `json:"aweme_list__item__duet_origin_item__author__live_status"`
	AwemeListItemDuetOriginItemAuthorLiveVerify int `json:"aweme_list__item__duet_origin_item__author__live_verify"`
	AwemeListItemDuetOriginItemAuthorLocation string `json:"aweme_list__item__duet_origin_item__author__location"`
	AwemeListItemDuetOriginItemAuthorMaxFollowerCount int `json:"aweme_list__item__duet_origin_item__author__max_follower_count"`
	AwemeListItemDuetOriginItemAuthorNeedPoints string `json:"aweme_list__item__duet_origin_item__author__need_points"`
	AwemeListItemDuetOriginItemAuthorNeedRecommend int `json:"aweme_list__item__duet_origin_item__author__need_recommend"`
	AwemeListItemDuetOriginItemAuthorNeiguangShield int `json:"aweme_list__item__duet_origin_item__author__neiguang_shield"`
	AwemeListItemDuetOriginItemAuthorNewStoryCover string `json:"aweme_list__item__duet_origin_item__author__new_story_cover"`
	AwemeListItemDuetOriginItemAuthorNickname string `json:"aweme_list__item__duet_origin_item__author__nickname"`
	AwemeListItemDuetOriginItemAuthorNotSeenItemIdList string `json:"aweme_list__item__duet_origin_item__author__not_seen_item_id_list"`
	AwemeListItemDuetOriginItemAuthorNotSeenItemIdListV2 string `json:"aweme_list__item__duet_origin_item__author__not_seen_item_id_list_v2"`
	AwemeListItemDuetOriginItemAuthorOfflineInfoList string `json:"aweme_list__item__duet_origin_item__author__offline_info_list"`
	AwemeListItemDuetOriginItemAuthorPersonalTagList string `json:"aweme_list__item__duet_origin_item__author__personal_tag_list"`
	AwemeListItemDuetOriginItemAuthorPlatformSyncInfo string `json:"aweme_list__item__duet_origin_item__author__platform_sync_info"`
	AwemeListItemDuetOriginItemAuthorPreventDownload bool `json:"aweme_list__item__duet_origin_item__author__prevent_download"`
	AwemeListItemDuetOriginItemAuthorReactSetting int `json:"aweme_list__item__duet_origin_item__author__react_setting"`
	AwemeListItemDuetOriginItemAuthorReflowPageGid int `json:"aweme_list__item__duet_origin_item__author__reflow_page_gid"`
	AwemeListItemDuetOriginItemAuthorReflowPageUid int `json:"aweme_list__item__duet_origin_item__author__reflow_page_uid"`
	AwemeListItemDuetOriginItemAuthorRegion string `json:"aweme_list__item__duet_origin_item__author__region"`
	AwemeListItemDuetOriginItemAuthorRelativeUsers string `json:"aweme_list__item__duet_origin_item__author__relative_users"`
	AwemeListItemDuetOriginItemAuthorRiskNoticeText string `json:"aweme_list__item__duet_origin_item__author__risk_notice_text"`
	AwemeListItemDuetOriginItemAuthorRoomId int `json:"aweme_list__item__duet_origin_item__author__room_id"`
	AwemeListItemDuetOriginItemAuthorSchoolCategory int `json:"aweme_list__item__duet_origin_item__author__school_category"`
	AwemeListItemDuetOriginItemAuthorSchoolId string `json:"aweme_list__item__duet_origin_item__author__school_id"`
	AwemeListItemDuetOriginItemAuthorSchoolName string `json:"aweme_list__item__duet_origin_item__author__school_name"`
	AwemeListItemDuetOriginItemAuthorSchoolPoiId string `json:"aweme_list__item__duet_origin_item__author__school_poi_id"`
	AwemeListItemDuetOriginItemAuthorSchoolType int `json:"aweme_list__item__duet_origin_item__author__school_type"`
	AwemeListItemDuetOriginItemAuthorSearchImpr string `json:"aweme_list__item__duet_origin_item__author__search_impr"`
	AwemeListItemDuetOriginItemAuthorSecUid string `json:"aweme_list__item__duet_origin_item__author__sec_uid"`
	AwemeListItemDuetOriginItemAuthorSecret int `json:"aweme_list__item__duet_origin_item__author__secret"`
	AwemeListItemDuetOriginItemAuthorShieldCommentNotice int `json:"aweme_list__item__duet_origin_item__author__shield_comment_notice"`
	AwemeListItemDuetOriginItemAuthorShieldDiggNotice int `json:"aweme_list__item__duet_origin_item__author__shield_digg_notice"`
	AwemeListItemDuetOriginItemAuthorShieldFollowNotice int `json:"aweme_list__item__duet_origin_item__author__shield_follow_notice"`
	AwemeListItemDuetOriginItemAuthorShortId string `json:"aweme_list__item__duet_origin_item__author__short_id"`
	AwemeListItemDuetOriginItemAuthorShowImageBubble bool `json:"aweme_list__item__duet_origin_item__author__show_image_bubble"`
	AwemeListItemDuetOriginItemAuthorShowNearbyActive bool `json:"aweme_list__item__duet_origin_item__author__show_nearby_active"`
	AwemeListItemDuetOriginItemAuthorSignature string `json:"aweme_list__item__duet_origin_item__author__signature"`
	AwemeListItemDuetOriginItemAuthorSignatureDisplayLines int `json:"aweme_list__item__duet_origin_item__author__signature_display_lines"`
	AwemeListItemDuetOriginItemAuthorSignatureExtra string `json:"aweme_list__item__duet_origin_item__author__signature_extra"`
	AwemeListItemDuetOriginItemAuthorSpecialFollowStatus int `json:"aweme_list__item__duet_origin_item__author__special_follow_status"`
	AwemeListItemDuetOriginItemAuthorSpecialLock int `json:"aweme_list__item__duet_origin_item__author__special_lock"`
	AwemeListItemDuetOriginItemAuthorSpecialPeopleLabels string `json:"aweme_list__item__duet_origin_item__author__special_people_labels"`
	AwemeListItemDuetOriginItemAuthorStatus int `json:"aweme_list__item__duet_origin_item__author__status"`
	AwemeListItemDuetOriginItemAuthorStitchSetting int `json:"aweme_list__item__duet_origin_item__author__stitch_setting"`
	AwemeListItemDuetOriginItemAuthorStoryCount int `json:"aweme_list__item__duet_origin_item__author__story_count"`
	AwemeListItemDuetOriginItemAuthorStoryOpen bool `json:"aweme_list__item__duet_origin_item__author__story_open"`
	AwemeListItemDuetOriginItemAuthorSyncToToutiao int `json:"aweme_list__item__duet_origin_item__author__sync_to_toutiao"`
	AwemeListItemDuetOriginItemAuthorTextExtra string `json:"aweme_list__item__duet_origin_item__author__text_extra"`
	AwemeListItemDuetOriginItemAuthorTotalFavorited int `json:"aweme_list__item__duet_origin_item__author__total_favorited"`
	AwemeListItemDuetOriginItemAuthorTwExpireTime int `json:"aweme_list__item__duet_origin_item__author__tw_expire_time"`
	AwemeListItemDuetOriginItemAuthorTwitterId string `json:"aweme_list__item__duet_origin_item__author__twitter_id"`
	AwemeListItemDuetOriginItemAuthorTwitterName string `json:"aweme_list__item__duet_origin_item__author__twitter_name"`
	AwemeListItemDuetOriginItemAuthorTypeLabel string `json:"aweme_list__item__duet_origin_item__author__type_label"`
	AwemeListItemDuetOriginItemAuthorUid string `json:"aweme_list__item__duet_origin_item__author__uid"`
	AwemeListItemDuetOriginItemAuthorUniqueId string `json:"aweme_list__item__duet_origin_item__author__unique_id"`
	AwemeListItemDuetOriginItemAuthorUniqueIdModifyTime int `json:"aweme_list__item__duet_origin_item__author__unique_id_modify_time"`
	AwemeListItemDuetOriginItemAuthorUserAge int `json:"aweme_list__item__duet_origin_item__author__user_age"`
	AwemeListItemDuetOriginItemAuthorUserCanceled bool `json:"aweme_list__item__duet_origin_item__author__user_canceled"`
	AwemeListItemDuetOriginItemAuthorUserMode int `json:"aweme_list__item__duet_origin_item__author__user_mode"`
	AwemeListItemDuetOriginItemAuthorUserNotSee int `json:"aweme_list__item__duet_origin_item__author__user_not_see"`
	AwemeListItemDuetOriginItemAuthorUserNotShow int `json:"aweme_list__item__duet_origin_item__author__user_not_show"`
	AwemeListItemDuetOriginItemAuthorUserPeriod int `json:"aweme_list__item__duet_origin_item__author__user_period"`
	AwemeListItemDuetOriginItemAuthorUserPermissions string `json:"aweme_list__item__duet_origin_item__author__user_permissions"`
	AwemeListItemDuetOriginItemAuthorUserRate int `json:"aweme_list__item__duet_origin_item__author__user_rate"`
	AwemeListItemDuetOriginItemAuthorUserTags string `json:"aweme_list__item__duet_origin_item__author__user_tags"`
	AwemeListItemDuetOriginItemAuthorVerificationType int `json:"aweme_list__item__duet_origin_item__author__verification_type"`
	AwemeListItemDuetOriginItemAuthorVerifyInfo string `json:"aweme_list__item__duet_origin_item__author__verify_info"`
	AwemeListItemDuetOriginItemAuthorVideoIcon string `json:"aweme_list__item__duet_origin_item__author__video_icon"`
	AwemeListItemDuetOriginItemAuthorWeiboName string `json:"aweme_list__item__duet_origin_item__author__weibo_name"`
	AwemeListItemDuetOriginItemAuthorWeiboSchema string `json:"aweme_list__item__duet_origin_item__author__weibo_schema"`
	AwemeListItemDuetOriginItemAuthorWeiboUrl string `json:"aweme_list__item__duet_origin_item__author__weibo_url"`
	AwemeListItemDuetOriginItemAuthorWeiboVerify string `json:"aweme_list__item__duet_origin_item__author__weibo_verify"`
	AwemeListItemDuetOriginItemAuthorWhiteCoverUrl string `json:"aweme_list__item__duet_origin_item__author__white_cover_url"`
	AwemeListItemDuetOriginItemAuthorWithCommerceEntry bool `json:"aweme_list__item__duet_origin_item__author__with_commerce_entry"`
	AwemeListItemDuetOriginItemAuthorWithDouEntry bool `json:"aweme_list__item__duet_origin_item__author__with_dou_entry"`
	AwemeListItemDuetOriginItemAuthorWithFusionShopEntry bool `json:"aweme_list__item__duet_origin_item__author__with_fusion_shop_entry"`
	AwemeListItemDuetOriginItemAuthorWithShopEntry bool `json:"aweme_list__item__duet_origin_item__author__with_shop_entry"`
	AwemeListItemDuetOriginItemAuthorYoutubeChannelId string `json:"aweme_list__item__duet_origin_item__author__youtube_channel_id"`
	AwemeListItemDuetOriginItemAuthorYoutubeChannelTitle string `json:"aweme_list__item__duet_origin_item__author__youtube_channel_title"`
	AwemeListItemDuetOriginItemAuthorYoutubeExpireTime int `json:"aweme_list__item__duet_origin_item__author__youtube_expire_time"`
	AwemeListItemAwemeControlCanComment bool `json:"aweme_list__item__aweme_control__can_comment"`
	AwemeListItemAwemeControlCanForward bool `json:"aweme_list__item__aweme_control__can_forward"`
	AwemeListItemAwemeControlCanShare bool `json:"aweme_list__item__aweme_control__can_share"`
	AwemeListItemAwemeControlCanShowComment bool `json:"aweme_list__item__aweme_control__can_show_comment"`
	AwemeListItemAwemeAclDownloadMaskPanelCode int `json:"aweme_list__item__aweme_acl__download_mask_panel__code"`
	AwemeListItemAwemeAclDownloadMaskPanelShowType int `json:"aweme_list__item__aweme_acl__download_mask_panel__show_type"`
	AwemeListItemSuggestWordsSuggestWords string `json:"aweme_list__item__suggest_words__suggest_words"`
	AwemeListItemStatusAllowComment bool `json:"aweme_list__item__status__allow_comment"`
	AwemeListItemStatusAllowShare bool `json:"aweme_list__item__status__allow_share"`
	AwemeListItemStatusAwemeEditInfo string `json:"aweme_list__item__status__aweme_edit_info"`
	AwemeListItemStatusAwemeId string `json:"aweme_list__item__status__aweme_id"`
	AwemeListItemStatusDontShareStatus int `json:"aweme_list__item__status__dont_share_status"`
	AwemeListItemStatusDownloadStatus int `json:"aweme_list__item__status__download_status"`
	AwemeListItemStatusInReviewing bool `json:"aweme_list__item__status__in_reviewing"`
	AwemeListItemStatusIsDelete bool `json:"aweme_list__item__status__is_delete"`
	AwemeListItemStatusIsPrivate bool `json:"aweme_list__item__status__is_private"`
	AwemeListItemStatusIsProhibited bool `json:"aweme_list__item__status__is_prohibited"`
	AwemeListItemStatusListenVideoStatus int `json:"aweme_list__item__status__listen_video_status"`
	AwemeListItemStatusPartSee int `json:"aweme_list__item__status__part_see"`
	AwemeListItemStatusPrivateStatus int `json:"aweme_list__item__status__private_status"`
	AwemeListItemStatusReviewResult string `json:"aweme_list__item__status__review_result"`
	AwemeListItemStatusReviewed int `json:"aweme_list__item__status__reviewed"`
	AwemeListItemStatusSelfSee bool `json:"aweme_list__item__status__self_see"`
	AwemeListItemStatusVideoHideSearch int `json:"aweme_list__item__status__video_hide_search"`
	AwemeListItemStatusWithFusionGoods bool `json:"aweme_list__item__status__with_fusion_goods"`
	AwemeListItemStatusWithGoods bool `json:"aweme_list__item__status__with_goods"`
	AwemeListItemMusicAlbum string `json:"aweme_list__item__music__album"`
	AwemeListItemMusicArtistUserInfos string `json:"aweme_list__item__music__artist_user_infos"`
	AwemeListItemMusicArtists string `json:"aweme_list__item__music__artists"`
	AwemeListItemMusicAuditionDuration int `json:"aweme_list__item__music__audition_duration"`
	AwemeListItemMusicAuthor string `json:"aweme_list__item__music__author"`
	AwemeListItemMusicAuthorDeleted bool `json:"aweme_list__item__music__author_deleted"`
	AwemeListItemMusicAuthorPosition string `json:"aweme_list__item__music__author_position"`
	AwemeListItemMusicAuthorStatus int `json:"aweme_list__item__music__author_status"`
	AwemeListItemMusicAvatarLarge string `json:"aweme_list__item__music__avatar_large"`
	AwemeListItemMusicAvatarMedium string `json:"aweme_list__item__music__avatar_medium"`
	AwemeListItemMusicAvatarThumb string `json:"aweme_list__item__music__avatar_thumb"`
	AwemeListItemMusicBindedChallengeId int `json:"aweme_list__item__music__binded_challenge_id"`
	AwemeListItemMusicCanBackgroundPlay bool `json:"aweme_list__item__music__can_background_play"`
	AwemeListItemMusicClimax string `json:"aweme_list__item__music__climax"`
	AwemeListItemMusicCollectStat int `json:"aweme_list__item__music__collect_stat"`
	AwemeListItemMusicCoverColorHsv string `json:"aweme_list__item__music__cover_color_hsv"`
	AwemeListItemMusicCoverHd string `json:"aweme_list__item__music__cover_hd"`
	AwemeListItemMusicCoverLarge string `json:"aweme_list__item__music__cover_large"`
	AwemeListItemMusicCoverMedium string `json:"aweme_list__item__music__cover_medium"`
	AwemeListItemMusicCoverThumb string `json:"aweme_list__item__music__cover_thumb"`
	AwemeListItemMusicDmvAutoShow bool `json:"aweme_list__item__music__dmv_auto_show"`
	AwemeListItemMusicDspStatus int `json:"aweme_list__item__music__dsp_status"`
	AwemeListItemMusicDuration int `json:"aweme_list__item__music__duration"`
	AwemeListItemMusicEndTime int `json:"aweme_list__item__music__end_time"`
	AwemeListItemMusicExternalSongInfo string `json:"aweme_list__item__music__external_song_info"`
	AwemeListItemMusicExtra string `json:"aweme_list__item__music__extra"`
	AwemeListItemMusicId int `json:"aweme_list__item__music__id"`
	AwemeListItemMusicIdStr string `json:"aweme_list__item__music__id_str"`
	AwemeListItemMusicIsAudioUrlWithCookie bool `json:"aweme_list__item__music__is_audio_url_with_cookie"`
	AwemeListItemMusicIsCommerceMusic bool `json:"aweme_list__item__music__is_commerce_music"`
	AwemeListItemMusicIsDelVideo bool `json:"aweme_list__item__music__is_del_video"`
	AwemeListItemMusicIsMatchedMetadata bool `json:"aweme_list__item__music__is_matched_metadata"`
	AwemeListItemMusicIsOriginal bool `json:"aweme_list__item__music__is_original"`
	AwemeListItemMusicIsOriginalSound bool `json:"aweme_list__item__music__is_original_sound"`
	AwemeListItemMusicIsPgc bool `json:"aweme_list__item__music__is_pgc"`
	AwemeListItemMusicIsRestricted bool `json:"aweme_list__item__music__is_restricted"`
	AwemeListItemMusicIsVideoSelfSee bool `json:"aweme_list__item__music__is_video_self_see"`
	AwemeListItemMusicLunaInfo string `json:"aweme_list__item__music__luna_info"`
	AwemeListItemMusicLyricShortPosition string `json:"aweme_list__item__music__lyric_short_position"`
	AwemeListItemMusicMatchedPgcSound string `json:"aweme_list__item__music__matched_pgc_sound"`
	AwemeListItemMusicMid string `json:"aweme_list__item__music__mid"`
	AwemeListItemMusicMusicChartRanks string `json:"aweme_list__item__music__music_chart_ranks"`
	AwemeListItemMusicMusicStatus int `json:"aweme_list__item__music__music_status"`
	AwemeListItemMusicMusicianUserInfos string `json:"aweme_list__item__music__musician_user_infos"`
	AwemeListItemMusicMuteShare bool `json:"aweme_list__item__music__mute_share"`
	AwemeListItemMusicOfflineDesc string `json:"aweme_list__item__music__offline_desc"`
	AwemeListItemMusicOwnerHandle string `json:"aweme_list__item__music__owner_handle"`
	AwemeListItemMusicOwnerId string `json:"aweme_list__item__music__owner_id"`
	AwemeListItemMusicOwnerNickname string `json:"aweme_list__item__music__owner_nickname"`
	AwemeListItemMusicPgcMusicType int `json:"aweme_list__item__music__pgc_music_type"`
	AwemeListItemMusicPlayUrl string `json:"aweme_list__item__music__play_url"`
	AwemeListItemMusicPosition string `json:"aweme_list__item__music__position"`
	AwemeListItemMusicPreventDownload bool `json:"aweme_list__item__music__prevent_download"`
	AwemeListItemMusicPreventItemDownloadStatus int `json:"aweme_list__item__music__prevent_item_download_status"`
	AwemeListItemMusicPreviewEndTime int `json:"aweme_list__item__music__preview_end_time"`
	AwemeListItemMusicPreviewStartTime float64 `json:"aweme_list__item__music__preview_start_time"`
	AwemeListItemMusicReasonType int `json:"aweme_list__item__music__reason_type"`
	AwemeListItemMusicRedirect bool `json:"aweme_list__item__music__redirect"`
	AwemeListItemMusicSchemaUrl string `json:"aweme_list__item__music__schema_url"`
	AwemeListItemMusicSearchImpr string `json:"aweme_list__item__music__search_impr"`
	AwemeListItemMusicSecUid string `json:"aweme_list__item__music__sec_uid"`
	AwemeListItemMusicShootDuration int `json:"aweme_list__item__music__shoot_duration"`
	AwemeListItemMusicSong string `json:"aweme_list__item__music__song"`
	AwemeListItemMusicSourcePlatform int `json:"aweme_list__item__music__source_platform"`
	AwemeListItemMusicStartTime int `json:"aweme_list__item__music__start_time"`
	AwemeListItemMusicStatus int `json:"aweme_list__item__music__status"`
	AwemeListItemMusicStrongBeatUrl string `json:"aweme_list__item__music__strong_beat_url"`
	AwemeListItemMusicTagList string `json:"aweme_list__item__music__tag_list"`
	AwemeListItemMusicTitle string `json:"aweme_list__item__music__title"`
	AwemeListItemMusicUnshelveCountries string `json:"aweme_list__item__music__unshelve_countries"`
	AwemeListItemMusicUserCount int `json:"aweme_list__item__music__user_count"`
	AwemeListItemMusicVideoDuration int `json:"aweme_list__item__music__video_duration"`
	AwemeListItemMixInfoCoverUrl string `json:"aweme_list__item__mix_info__cover_url"`
	AwemeListItemMixInfoCreateTime int `json:"aweme_list__item__mix_info__create_time"`
	AwemeListItemMixInfoDesc string `json:"aweme_list__item__mix_info__desc"`
	AwemeListItemMixInfoExtra string `json:"aweme_list__item__mix_info__extra"`
	AwemeListItemMixInfoIds string `json:"aweme_list__item__mix_info__ids"`
	AwemeListItemMixInfoIsSerialMix int `json:"aweme_list__item__mix_info__is_serial_mix"`
	AwemeListItemMixInfoMixId string `json:"aweme_list__item__mix_info__mix_id"`
	AwemeListItemMixInfoMixName string `json:"aweme_list__item__mix_info__mix_name"`
	AwemeListItemMixInfoMixPicType int `json:"aweme_list__item__mix_info__mix_pic_type"`
	AwemeListItemMixInfoMixType int `json:"aweme_list__item__mix_info__mix_type"`
	AwemeListItemMixInfoStatus string `json:"aweme_list__item__mix_info__status"`
	AwemeListItemMixInfoUpdateTime int `json:"aweme_list__item__mix_info__update_time"`
	AwemeListItemMixInfoWatchedItem string `json:"aweme_list__item__mix_info__watched_item"`
	AwemeListItemMixInfoStatisCollectVv int `json:"aweme_list__item__mix_info__statis__collect_vv"`
	AwemeListItemMixInfoStatisCurrentEpisode int `json:"aweme_list__item__mix_info__statis__current_episode"`
	AwemeListItemMixInfoStatisPlayVv int `json:"aweme_list__item__mix_info__statis__play_vv"`
	AwemeListItemMixInfoStatisUpdatedToEpisode int `json:"aweme_list__item__mix_info__statis__updated_to_episode"`
	AwemeListItemMixInfoShareInfoShareDesc string `json:"aweme_list__item__mix_info__share_info__share_desc"`
	AwemeListItemMixInfoShareInfoShareDescInfo string `json:"aweme_list__item__mix_info__share_info__share_desc_info"`
	AwemeListItemMixInfoShareInfoShareTitle string `json:"aweme_list__item__mix_info__share_info__share_title"`
	AwemeListItemMixInfoShareInfoShareTitleMyself string `json:"aweme_list__item__mix_info__share_info__share_title_myself"`
	AwemeListItemMixInfoShareInfoShareTitleOther string `json:"aweme_list__item__mix_info__share_info__share_title_other"`
	AwemeListItemMixInfoShareInfoShareUrl string `json:"aweme_list__item__mix_info__share_info__share_url"`
	AwemeListItemMixInfoShareInfoShareWeiboDesc string `json:"aweme_list__item__mix_info__share_info__share_weibo_desc"`
	AwemeListItemAuthorAcceptPrivatePolicy bool `json:"aweme_list__item__author__accept_private_policy"`
	AwemeListItemAuthorAccountRegion string `json:"aweme_list__item__author__account_region"`
	AwemeListItemAuthorAdCoverUrl string `json:"aweme_list__item__author__ad_cover_url"`
	AwemeListItemAuthorAppleAccount int `json:"aweme_list__item__author__apple_account"`
	AwemeListItemAuthorAuthorityStatus int `json:"aweme_list__item__author__authority_status"`
	AwemeListItemAuthorAvatar168x168 string `json:"aweme_list__item__author__avatar_168x168"`
	AwemeListItemAuthorAvatar300x300 string `json:"aweme_list__item__author__avatar_300x300"`
	AwemeListItemAuthorAvatarLarger string `json:"aweme_list__item__author__avatar_larger"`
	AwemeListItemAuthorAvatarMedium string `json:"aweme_list__item__author__avatar_medium"`
	AwemeListItemAuthorAvatarThumb string `json:"aweme_list__item__author__avatar_thumb"`
	AwemeListItemAuthorAvatarUri string `json:"aweme_list__item__author__avatar_uri"`
	AwemeListItemAuthorAwemeCount int `json:"aweme_list__item__author__aweme_count"`
	AwemeListItemAuthorAwemeHotsoonAuth int `json:"aweme_list__item__author__aweme_hotsoon_auth"`
	AwemeListItemAuthorAwemeHotsoonAuthRelation int `json:"aweme_list__item__author__aweme_hotsoon_auth_relation"`
	AwemeListItemAuthorBanUserFunctions string `json:"aweme_list__item__author__ban_user_functions"`
	AwemeListItemAuthorBindPhone string `json:"aweme_list__item__author__bind_phone"`
	AwemeListItemAuthorBirthday string `json:"aweme_list__item__author__birthday"`
	AwemeListItemAuthorCanSetGeofencing string `json:"aweme_list__item__author__can_set_geofencing"`
	AwemeListItemAuthorCardEntries string `json:"aweme_list__item__author__card_entries"`
	AwemeListItemAuthorCardEntriesNotDisplay string `json:"aweme_list__item__author__card_entries_not_display"`
	AwemeListItemAuthorCardSortPriority string `json:"aweme_list__item__author__card_sort_priority"`
	AwemeListItemAuthorCfList string `json:"aweme_list__item__author__cf_list"`
	AwemeListItemAuthorChaList string `json:"aweme_list__item__author__cha_list"`
	AwemeListItemAuthorCloseFriendType int `json:"aweme_list__item__author__close_friend_type"`
	AwemeListItemAuthorCommentFilterStatus int `json:"aweme_list__item__author__comment_filter_status"`
	AwemeListItemAuthorCommentSetting int `json:"aweme_list__item__author__comment_setting"`
	AwemeListItemAuthorCommerceUserLevel int `json:"aweme_list__item__author__commerce_user_level"`
	AwemeListItemAuthorConstellation int `json:"aweme_list__item__author__constellation"`
	AwemeListItemAuthorContactsStatus int `json:"aweme_list__item__author__contacts_status"`
	AwemeListItemAuthorContrailList string `json:"aweme_list__item__author__contrail_list"`
	AwemeListItemAuthorCoverUrl string `json:"aweme_list__item__author__cover_url"`
	AwemeListItemAuthorCreateTime int `json:"aweme_list__item__author__create_time"`
	AwemeListItemAuthorCustomVerify string `json:"aweme_list__item__author__custom_verify"`
	AwemeListItemAuthorCvLevel string `json:"aweme_list__item__author__cv_level"`
	AwemeListItemAuthorDataLabelList string `json:"aweme_list__item__author__data_label_list"`
	AwemeListItemAuthorDisplayInfo string `json:"aweme_list__item__author__display_info"`
	AwemeListItemAuthorDownloadPromptTs int `json:"aweme_list__item__author__download_prompt_ts"`
	AwemeListItemAuthorDownloadSetting int `json:"aweme_list__item__author__download_setting"`
	AwemeListItemAuthorDuetSetting int `json:"aweme_list__item__author__duet_setting"`
	AwemeListItemAuthorEnableNearbyVisible bool `json:"aweme_list__item__author__enable_nearby_visible"`
	AwemeListItemAuthorEndorsementInfoList string `json:"aweme_list__item__author__endorsement_info_list"`
	AwemeListItemAuthorEnterpriseVerifyReason string `json:"aweme_list__item__author__enterprise_verify_reason"`
	AwemeListItemAuthorFavoritingCount int `json:"aweme_list__item__author__favoriting_count"`
	AwemeListItemAuthorFbExpireTime int `json:"aweme_list__item__author__fb_expire_time"`
	AwemeListItemAuthorFollowStatus int `json:"aweme_list__item__author__follow_status"`
	AwemeListItemAuthorFollowerCount int `json:"aweme_list__item__author__follower_count"`
	AwemeListItemAuthorFollowerListSecondaryInformationStruct string `json:"aweme_list__item__author__follower_list_secondary_information_struct"`
	AwemeListItemAuthorFollowerRequestStatus int `json:"aweme_list__item__author__follower_request_status"`
	AwemeListItemAuthorFollowerStatus int `json:"aweme_list__item__author__follower_status"`
	AwemeListItemAuthorFollowersDetail string `json:"aweme_list__item__author__followers_detail"`
	AwemeListItemAuthorFollowingCount int `json:"aweme_list__item__author__following_count"`
	AwemeListItemAuthorGender int `json:"aweme_list__item__author__gender"`
	AwemeListItemAuthorGeofencing string `json:"aweme_list__item__author__geofencing"`
	AwemeListItemAuthorGoogleAccount string `json:"aweme_list__item__author__google_account"`
	AwemeListItemAuthorHasEmail bool `json:"aweme_list__item__author__has_email"`
	AwemeListItemAuthorHasFacebookToken bool `json:"aweme_list__item__author__has_facebook_token"`
	AwemeListItemAuthorHasInsights bool `json:"aweme_list__item__author__has_insights"`
	AwemeListItemAuthorHasOrders bool `json:"aweme_list__item__author__has_orders"`
	AwemeListItemAuthorHasTwitterToken bool `json:"aweme_list__item__author__has_twitter_token"`
	AwemeListItemAuthorHasUnreadStory bool `json:"aweme_list__item__author__has_unread_story"`
	AwemeListItemAuthorHasYoutubeToken bool `json:"aweme_list__item__author__has_youtube_token"`
	AwemeListItemAuthorHideLocation bool `json:"aweme_list__item__author__hide_location"`
	AwemeListItemAuthorHideSearch bool `json:"aweme_list__item__author__hide_search"`
	AwemeListItemAuthorHomepageBottomToast string `json:"aweme_list__item__author__homepage_bottom_toast"`
	AwemeListItemAuthorImRoleIds string `json:"aweme_list__item__author__im_role_ids"`
	AwemeListItemAuthorInsId string `json:"aweme_list__item__author__ins_id"`
	AwemeListItemAuthorInterestTags string `json:"aweme_list__item__author__interest_tags"`
	AwemeListItemAuthorIsAdFake bool `json:"aweme_list__item__author__is_ad_fake"`
	AwemeListItemAuthorIsBindedWeibo bool `json:"aweme_list__item__author__is_binded_weibo"`
	AwemeListItemAuthorIsBlock bool `json:"aweme_list__item__author__is_block"`
	AwemeListItemAuthorIsBlockedV2 bool `json:"aweme_list__item__author__is_blocked_v2"`
	AwemeListItemAuthorIsBlockingV2 bool `json:"aweme_list__item__author__is_blocking_v2"`
	AwemeListItemAuthorIsCf int `json:"aweme_list__item__author__is_cf"`
	AwemeListItemAuthorIsDisciplineMember bool `json:"aweme_list__item__author__is_discipline_member"`
	AwemeListItemAuthorIsGovMediaVip bool `json:"aweme_list__item__author__is_gov_media_vip"`
	AwemeListItemAuthorIsMixUser bool `json:"aweme_list__item__author__is_mix_user"`
	AwemeListItemAuthorIsNotShow bool `json:"aweme_list__item__author__is_not_show"`
	AwemeListItemAuthorIsPhoneBinded bool `json:"aweme_list__item__author__is_phone_binded"`
	AwemeListItemAuthorIsStar bool `json:"aweme_list__item__author__is_star"`
	AwemeListItemAuthorIsVerified bool `json:"aweme_list__item__author__is_verified"`
	AwemeListItemAuthorItemList string `json:"aweme_list__item__author__item_list"`
	AwemeListItemAuthorKyOnlyPredict float64 `json:"aweme_list__item__author__ky_only_predict"`
	AwemeListItemAuthorLanguage string `json:"aweme_list__item__author__language"`
	AwemeListItemAuthorLinkItemList string `json:"aweme_list__item__author__link_item_list"`
	AwemeListItemAuthorLiveAgreement int `json:"aweme_list__item__author__live_agreement"`
	AwemeListItemAuthorLiveAgreementTime int `json:"aweme_list__item__author__live_agreement_time"`
	AwemeListItemAuthorLiveCommerce bool `json:"aweme_list__item__author__live_commerce"`
	AwemeListItemAuthorLiveStatus int `json:"aweme_list__item__author__live_status"`
	AwemeListItemAuthorLiveVerify int `json:"aweme_list__item__author__live_verify"`
	AwemeListItemAuthorLocation string `json:"aweme_list__item__author__location"`
	AwemeListItemAuthorMaxFollowerCount int `json:"aweme_list__item__author__max_follower_count"`
	AwemeListItemAuthorNeedPoints string `json:"aweme_list__item__author__need_points"`
	AwemeListItemAuthorNeedRecommend int `json:"aweme_list__item__author__need_recommend"`
	AwemeListItemAuthorNeiguangShield int `json:"aweme_list__item__author__neiguang_shield"`
	AwemeListItemAuthorNewStoryCover string `json:"aweme_list__item__author__new_story_cover"`
	AwemeListItemAuthorNickname string `json:"aweme_list__item__author__nickname"`
	AwemeListItemAuthorNotSeenItemIdList string `json:"aweme_list__item__author__not_seen_item_id_list"`
	AwemeListItemAuthorNotSeenItemIdListV2 string `json:"aweme_list__item__author__not_seen_item_id_list_v2"`
	AwemeListItemAuthorOfflineInfoList string `json:"aweme_list__item__author__offline_info_list"`
	AwemeListItemAuthorPersonalTagList string `json:"aweme_list__item__author__personal_tag_list"`
	AwemeListItemAuthorPlatformSyncInfo string `json:"aweme_list__item__author__platform_sync_info"`
	AwemeListItemAuthorPreventDownload bool `json:"aweme_list__item__author__prevent_download"`
	AwemeListItemAuthorReactSetting int `json:"aweme_list__item__author__react_setting"`
	AwemeListItemAuthorReflowPageGid int `json:"aweme_list__item__author__reflow_page_gid"`
	AwemeListItemAuthorReflowPageUid int `json:"aweme_list__item__author__reflow_page_uid"`
	AwemeListItemAuthorRegion string `json:"aweme_list__item__author__region"`
	AwemeListItemAuthorRelativeUsers string `json:"aweme_list__item__author__relative_users"`
	AwemeListItemAuthorRiskNoticeText string `json:"aweme_list__item__author__risk_notice_text"`
	AwemeListItemAuthorRoomData string `json:"aweme_list__item__author__room_data"`
	AwemeListItemAuthorRoomId int `json:"aweme_list__item__author__room_id"`
	AwemeListItemAuthorRoomIdStr string `json:"aweme_list__item__author__room_id_str"`
	AwemeListItemAuthorSchoolCategory int `json:"aweme_list__item__author__school_category"`
	AwemeListItemAuthorSchoolId string `json:"aweme_list__item__author__school_id"`
	AwemeListItemAuthorSchoolName string `json:"aweme_list__item__author__school_name"`
	AwemeListItemAuthorSchoolPoiId string `json:"aweme_list__item__author__school_poi_id"`
	AwemeListItemAuthorSchoolType int `json:"aweme_list__item__author__school_type"`
	AwemeListItemAuthorSearchImpr string `json:"aweme_list__item__author__search_impr"`
	AwemeListItemAuthorSecUid string `json:"aweme_list__item__author__sec_uid"`
	AwemeListItemAuthorSecret int `json:"aweme_list__item__author__secret"`
	AwemeListItemAuthorShareQrcodeUri string `json:"aweme_list__item__author__share_qrcode_uri"`
	AwemeListItemAuthorShieldCommentNotice int `json:"aweme_list__item__author__shield_comment_notice"`
	AwemeListItemAuthorShieldDiggNotice int `json:"aweme_list__item__author__shield_digg_notice"`
	AwemeListItemAuthorShieldFollowNotice int `json:"aweme_list__item__author__shield_follow_notice"`
	AwemeListItemAuthorShortId string `json:"aweme_list__item__author__short_id"`
	AwemeListItemAuthorShowImageBubble bool `json:"aweme_list__item__author__show_image_bubble"`
	AwemeListItemAuthorShowNearbyActive bool `json:"aweme_list__item__author__show_nearby_active"`
	AwemeListItemAuthorSignature string `json:"aweme_list__item__author__signature"`
	AwemeListItemAuthorSignatureDisplayLines int `json:"aweme_list__item__author__signature_display_lines"`
	AwemeListItemAuthorSignatureExtra string `json:"aweme_list__item__author__signature_extra"`
	AwemeListItemAuthorSpecialFollowStatus int `json:"aweme_list__item__author__special_follow_status"`
	AwemeListItemAuthorSpecialLock int `json:"aweme_list__item__author__special_lock"`
	AwemeListItemAuthorSpecialPeopleLabels string `json:"aweme_list__item__author__special_people_labels"`
	AwemeListItemAuthorStatus int `json:"aweme_list__item__author__status"`
	AwemeListItemAuthorStitchSetting int `json:"aweme_list__item__author__stitch_setting"`
	AwemeListItemAuthorStoryCount int `json:"aweme_list__item__author__story_count"`
	AwemeListItemAuthorStoryOpen bool `json:"aweme_list__item__author__story_open"`
	AwemeListItemAuthorSyncToToutiao int `json:"aweme_list__item__author__sync_to_toutiao"`
	AwemeListItemAuthorTextExtra string `json:"aweme_list__item__author__text_extra"`
	AwemeListItemAuthorTotalFavorited int `json:"aweme_list__item__author__total_favorited"`
	AwemeListItemAuthorTwExpireTime int `json:"aweme_list__item__author__tw_expire_time"`
	AwemeListItemAuthorTwitterId string `json:"aweme_list__item__author__twitter_id"`
	AwemeListItemAuthorTwitterName string `json:"aweme_list__item__author__twitter_name"`
	AwemeListItemAuthorTypeLabel string `json:"aweme_list__item__author__type_label"`
	AwemeListItemAuthorUid string `json:"aweme_list__item__author__uid"`
	AwemeListItemAuthorUniqueId string `json:"aweme_list__item__author__unique_id"`
	AwemeListItemAuthorUniqueIdModifyTime int `json:"aweme_list__item__author__unique_id_modify_time"`
	AwemeListItemAuthorUserAge int `json:"aweme_list__item__author__user_age"`
	AwemeListItemAuthorUserCanceled bool `json:"aweme_list__item__author__user_canceled"`
	AwemeListItemAuthorUserMode int `json:"aweme_list__item__author__user_mode"`
	AwemeListItemAuthorUserNotSee int `json:"aweme_list__item__author__user_not_see"`
	AwemeListItemAuthorUserNotShow int `json:"aweme_list__item__author__user_not_show"`
	AwemeListItemAuthorUserPeriod int `json:"aweme_list__item__author__user_period"`
	AwemeListItemAuthorUserPermissions string `json:"aweme_list__item__author__user_permissions"`
	AwemeListItemAuthorUserRate int `json:"aweme_list__item__author__user_rate"`
	AwemeListItemAuthorUserTags string `json:"aweme_list__item__author__user_tags"`
	AwemeListItemAuthorVerificationType int `json:"aweme_list__item__author__verification_type"`
	AwemeListItemAuthorVerifyInfo string `json:"aweme_list__item__author__verify_info"`
	AwemeListItemAuthorVideoIcon string `json:"aweme_list__item__author__video_icon"`
	AwemeListItemAuthorWeiboName string `json:"aweme_list__item__author__weibo_name"`
	AwemeListItemAuthorWeiboSchema string `json:"aweme_list__item__author__weibo_schema"`
	AwemeListItemAuthorWeiboUrl string `json:"aweme_list__item__author__weibo_url"`
	AwemeListItemAuthorWeiboVerify string `json:"aweme_list__item__author__weibo_verify"`
	AwemeListItemAuthorWhiteCoverUrl string `json:"aweme_list__item__author__white_cover_url"`
	AwemeListItemAuthorWithCommerceEntry bool `json:"aweme_list__item__author__with_commerce_entry"`
	AwemeListItemAuthorWithDouEntry bool `json:"aweme_list__item__author__with_dou_entry"`
	AwemeListItemAuthorWithFusionShopEntry bool `json:"aweme_list__item__author__with_fusion_shop_entry"`
	AwemeListItemAuthorWithShopEntry bool `json:"aweme_list__item__author__with_shop_entry"`
	AwemeListItemAuthorYoutubeChannelId string `json:"aweme_list__item__author__youtube_channel_id"`
	AwemeListItemAuthorYoutubeChannelTitle string `json:"aweme_list__item__author__youtube_channel_title"`
	AwemeListItemAuthorYoutubeExpireTime int `json:"aweme_list__item__author__youtube_expire_time"`
	AwemeListItemAuthorShareInfoShareDesc string `json:"aweme_list__item__author__share_info__share_desc"`
	AwemeListItemAuthorShareInfoShareDescInfo string `json:"aweme_list__item__author__share_info__share_desc_info"`
	AwemeListItemAuthorShareInfoShareQrcodeUrl string `json:"aweme_list__item__author__share_info__share_qrcode_url"`
	AwemeListItemAuthorShareInfoShareTitle string `json:"aweme_list__item__author__share_info__share_title"`
	AwemeListItemAuthorShareInfoShareTitleMyself string `json:"aweme_list__item__author__share_info__share_title_myself"`
	AwemeListItemAuthorShareInfoShareTitleOther string `json:"aweme_list__item__author__share_info__share_title_other"`
	AwemeListItemAuthorShareInfoShareUrl string `json:"aweme_list__item__author__share_info__share_url"`
	AwemeListItemAuthorShareInfoShareWeiboDesc string `json:"aweme_list__item__author__share_info__share_weibo_desc"`
	AwemeListItemAuthorOriginalMusicianDiggCount int `json:"aweme_list__item__author__original_musician__digg_count"`
	AwemeListItemAuthorOriginalMusicianMusicCount int `json:"aweme_list__item__author__original_musician__music_count"`
	AwemeListItemAuthorOriginalMusicianMusicUsedCount int `json:"aweme_list__item__author__original_musician__music_used_count"`
	AwemeListItemAuthorAwemeControlCanComment bool `json:"aweme_list__item__author__aweme_control__can_comment"`
	AwemeListItemAuthorAwemeControlCanForward bool `json:"aweme_list__item__author__aweme_control__can_forward"`
	AwemeListItemAuthorAwemeControlCanShare bool `json:"aweme_list__item__author__aweme_control__can_share"`
	AwemeListItemAuthorAwemeControlCanShowComment bool `json:"aweme_list__item__author__aweme_control__can_show_comment"`
}



type T struct {
	AwemeList []struct {
		Item struct {
			AdAwemeSource int `json:"ad_aweme_source,omitempty"`
			AncestorInfo  *struct {
				Gid       int `json:"gid"`
				ProductID int `json:"product_id"`
				Uid       int `json:"uid"`
			} `json:"ancestor_info,omitempty"`
			AnchorInfo *struct {
				Content     string `json:"content"`
				DisplayInfo *struct {
					AfterPlayMs int `json:"after_play_ms"`
				} `json:"display_info,omitempty"`
				Extra string `json:"extra,omitempty"`
				Icon  struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLKey  string   `json:"url_key,omitempty"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"icon"`
				ID        string `json:"id"`
				LogExtra  string `json:"log_extra"`
				MpURL     string `json:"mp_url"`
				OpenURL   string `json:"open_url"`
				StyleInfo *struct {
					DefaultIcon string `json:"default_icon,omitempty"`
					Extra       string `json:"extra"`
					SceneIcon   string `json:"scene_icon"`
				} `json:"style_info,omitempty"`
				Title    string `json:"title"`
				TitleTag string `json:"title_tag"`
				Type     int    `json:"type"`
				WebURL   string `json:"web_url"`
			} `json:"anchor_info,omitempty"`
			Anchors             any    `json:"anchors"`
			AuthenticationToken string `json:"authentication_token"`
			Author              struct {
				AcceptPrivatePolicy bool   `json:"accept_private_policy"`
				AccountRegion       string `json:"account_region"`
				AdCoverURL          any    `json:"ad_cover_url"`
				AppleAccount        int    `json:"apple_account"`
				AuthorityStatus     int    `json:"authority_status"`
				Avatar168x168       struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_168x168"`
				Avatar300x300 struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_300x300"`
				AvatarLarger struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_larger"`
				AvatarMedium struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_medium"`
				AvatarThumb struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_thumb"`
				AvatarURI    string `json:"avatar_uri"`
				AwemeControl struct {
					CanComment     bool `json:"can_comment"`
					CanForward     bool `json:"can_forward"`
					CanShare       bool `json:"can_share"`
					CanShowComment bool `json:"can_show_comment"`
				} `json:"aweme_control"`
				AwemeCount               int    `json:"aweme_count"`
				AwemeHotsoonAuth         int    `json:"aweme_hotsoon_auth,omitempty"`
				AwemeHotsoonAuthRelation int    `json:"aweme_hotsoon_auth_relation,omitempty"`
				BanUserFunctions         []int  `json:"ban_user_functions"`
				BindPhone                string `json:"bind_phone"`
				Birthday                 string `json:"birthday"`
				CanSetGeofencing         any    `json:"can_set_geofencing"`
				CardEntries              any    `json:"card_entries"`
				CardEntriesNotDisplay    any    `json:"card_entries_not_display"`
				CardSortPriority         any    `json:"card_sort_priority"`
				CfList                   any    `json:"cf_list"`
				ChaList                  any    `json:"cha_list"`
				CloseFriendType          int    `json:"close_friend_type"`
				CommentFilterStatus      int    `json:"comment_filter_status"`
				CommentSetting           int    `json:"comment_setting"`
				CommerceUserLevel        int    `json:"commerce_user_level"`
				Constellation            int    `json:"constellation"`
				ContactsStatus           int    `json:"contacts_status"`
				ContrailList             any    `json:"contrail_list"`
				CoverURL                 []struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_url"`
				CreateTime                             int     `json:"create_time"`
				CustomVerify                           string  `json:"custom_verify"`
				CvLevel                                string  `json:"cv_level"`
				DataLabelList                          any     `json:"data_label_list"`
				DisplayInfo                            any     `json:"display_info"`
				DownloadPromptTs                       int     `json:"download_prompt_ts"`
				DownloadSetting                        int     `json:"download_setting"`
				DuetSetting                            int     `json:"duet_setting"`
				EnableNearbyVisible                    bool    `json:"enable_nearby_visible"`
				EndorsementInfoList                    any     `json:"endorsement_info_list"`
				EnterpriseVerifyReason                 string  `json:"enterprise_verify_reason"`
				FavoritingCount                        int     `json:"favoriting_count"`
				FbExpireTime                           int     `json:"fb_expire_time"`
				FollowStatus                           int     `json:"follow_status"`
				FollowerCount                          int     `json:"follower_count"`
				FollowerListSecondaryInformationStruct any     `json:"follower_list_secondary_information_struct"`
				FollowerRequestStatus                  int     `json:"follower_request_status"`
				FollowerStatus                         int     `json:"follower_status"`
				FollowersDetail                        any     `json:"followers_detail"`
				FollowingCount                         int     `json:"following_count"`
				Gender                                 int     `json:"gender"`
				Geofencing                             []any   `json:"geofencing"`
				GoogleAccount                          string  `json:"google_account"`
				HasEmail                               bool    `json:"has_email"`
				HasFacebookToken                       bool    `json:"has_facebook_token"`
				HasInsights                            bool    `json:"has_insights"`
				HasOrders                              bool    `json:"has_orders"`
				HasTwitterToken                        bool    `json:"has_twitter_token"`
				HasUnreadStory                         bool    `json:"has_unread_story"`
				HasYoutubeToken                        bool    `json:"has_youtube_token"`
				HideLocation                           bool    `json:"hide_location"`
				HideSearch                             bool    `json:"hide_search"`
				HomepageBottomToast                    any     `json:"homepage_bottom_toast"`
				ImRoleIds                              any     `json:"im_role_ids"`
				InsID                                  string  `json:"ins_id"`
				InterestTags                           any     `json:"interest_tags"`
				IsAdFake                               bool    `json:"is_ad_fake"`
				IsBindedWeibo                          bool    `json:"is_binded_weibo"`
				IsBlock                                bool    `json:"is_block"`
				IsBlockedV2                            bool    `json:"is_blocked_v2"`
				IsBlockingV2                           bool    `json:"is_blocking_v2"`
				IsCf                                   int     `json:"is_cf"`
				IsDisciplineMember                     bool    `json:"is_discipline_member"`
				IsGovMediaVip                          bool    `json:"is_gov_media_vip"`
				IsMixUser                              bool    `json:"is_mix_user"`
				IsNotShow                              bool    `json:"is_not_show"`
				IsPhoneBinded                          bool    `json:"is_phone_binded"`
				IsStar                                 bool    `json:"is_star"`
				IsVerified                             bool    `json:"is_verified"`
				ItemList                               any     `json:"item_list"`
				KyOnlyPredict                          float64 `json:"ky_only_predict"`
				Language                               string  `json:"language"`
				LinkItemList                           any     `json:"link_item_list"`
				LiveAgreement                          int     `json:"live_agreement"`
				LiveAgreementTime                      int     `json:"live_agreement_time"`
				LiveCommerce                           bool    `json:"live_commerce"`
				LiveStatus                             int     `json:"live_status"`
				LiveVerify                             int     `json:"live_verify"`
				Location                               string  `json:"location"`
				MaxFollowerCount                       int     `json:"max_follower_count"`
				NeedPoints                             any     `json:"need_points"`
				NeedRecommend                          int     `json:"need_recommend"`
				NeiguangShield                         int     `json:"neiguang_shield"`
				NewStoryCover                          any     `json:"new_story_cover"`
				Nickname                               string  `json:"nickname"`
				NotSeenItemIDList                      any     `json:"not_seen_item_id_list"`
				NotSeenItemIDListV2                    any     `json:"not_seen_item_id_list_v2"`
				OfflineInfoList                        any     `json:"offline_info_list"`
				OriginalMusician                       struct {
					DiggCount      int `json:"digg_count"`
					MusicCount     int `json:"music_count"`
					MusicUsedCount int `json:"music_used_count"`
				} `json:"original_musician"`
				PersonalTagList  any    `json:"personal_tag_list"`
				PlatformSyncInfo any    `json:"platform_sync_info"`
				PreventDownload  bool   `json:"prevent_download"`
				ReactSetting     int    `json:"react_setting"`
				ReflowPageGid    int    `json:"reflow_page_gid"`
				ReflowPageUid    int    `json:"reflow_page_uid"`
				Region           string `json:"region"`
				RelativeUsers    any    `json:"relative_users"`
				RiskNoticeText   string `json:"risk_notice_text"`
				RoomData         string `json:"room_data,omitempty"`
				RoomID           int    `json:"room_id"`
				RoomIDStr        string `json:"room_id_str"`
				SchoolCategory   int    `json:"school_category"`
				SchoolID         string `json:"school_id"`
				SchoolName       string `json:"school_name"`
				SchoolPoiID      string `json:"school_poi_id"`
				SchoolType       int    `json:"school_type"`
				SearchImpr       struct {
					EntityID string `json:"entity_id"`
				} `json:"search_impr"`
				SecUid    string `json:"sec_uid"`
				Secret    int    `json:"secret"`
				ShareInfo struct {
					ShareDesc      string `json:"share_desc"`
					ShareDescInfo  string `json:"share_desc_info"`
					ShareQrcodeURL struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"share_qrcode_url"`
					ShareTitle       string `json:"share_title"`
					ShareTitleMyself string `json:"share_title_myself"`
					ShareTitleOther  string `json:"share_title_other"`
					ShareURL         string `json:"share_url"`
					ShareWeiboDesc   string `json:"share_weibo_desc"`
				} `json:"share_info"`
				ShareQrcodeURI        string `json:"share_qrcode_uri"`
				ShieldCommentNotice   int    `json:"shield_comment_notice"`
				ShieldDiggNotice      int    `json:"shield_digg_notice"`
				ShieldFollowNotice    int    `json:"shield_follow_notice"`
				ShortID               string `json:"short_id"`
				ShowImageBubble       bool   `json:"show_image_bubble"`
				ShowNearbyActive      bool   `json:"show_nearby_active"`
				Signature             string `json:"signature"`
				SignatureDisplayLines int    `json:"signature_display_lines"`
				SignatureExtra        any    `json:"signature_extra"`
				SpecialFollowStatus   int    `json:"special_follow_status"`
				SpecialLock           int    `json:"special_lock"`
				SpecialPeopleLabels   any    `json:"special_people_labels"`
				Status                int    `json:"status"`
				StitchSetting         int    `json:"stitch_setting"`
				StoryCount            int    `json:"story_count"`
				StoryOpen             bool   `json:"story_open"`
				SyncToToutiao         int    `json:"sync_to_toutiao"`
				TextExtra             []any  `json:"text_extra"`
				TotalFavorited        int    `json:"total_favorited"`
				TwExpireTime          int    `json:"tw_expire_time"`
				TwitterID             string `json:"twitter_id"`
				TwitterName           string `json:"twitter_name"`
				TypeLabel             any    `json:"type_label"`
				Uid                   string `json:"uid"`
				UniqueID              string `json:"unique_id"`
				UniqueIDModifyTime    int    `json:"unique_id_modify_time"`
				UserAge               int    `json:"user_age"`
				UserCanceled          bool   `json:"user_canceled"`
				UserMode              int    `json:"user_mode"`
				UserNotSee            int    `json:"user_not_see"`
				UserNotShow           int    `json:"user_not_show"`
				UserPeriod            int    `json:"user_period"`
				UserPermissions       any    `json:"user_permissions"`
				UserRate              int    `json:"user_rate"`
				UserTags              any    `json:"user_tags"`
				VerificationType      int    `json:"verification_type"`
				VerifyInfo            string `json:"verify_info"`
				VideoIcon             struct {
					Height  int    `json:"height"`
					URI     string `json:"uri"`
					URLList []any  `json:"url_list"`
					Width   int    `json:"width"`
				} `json:"video_icon"`
				WeiboName           string `json:"weibo_name"`
				WeiboSchema         string `json:"weibo_schema"`
				WeiboURL            string `json:"weibo_url"`
				WeiboVerify         string `json:"weibo_verify"`
				WhiteCoverURL       any    `json:"white_cover_url"`
				WithCommerceEntry   bool   `json:"with_commerce_entry"`
				WithDouEntry        bool   `json:"with_dou_entry"`
				WithFusionShopEntry bool   `json:"with_fusion_shop_entry"`
				WithShopEntry       bool   `json:"with_shop_entry"`
				YoutubeChannelID    string `json:"youtube_channel_id"`
				YoutubeChannelTitle string `json:"youtube_channel_title"`
				YoutubeExpireTime   int    `json:"youtube_expire_time"`
			} `json:"author"`
			AuthorMaskTag int `json:"author_mask_tag"`
			AuthorUserID  int `json:"author_user_id"`
			AwemeAcl      *struct {
				DownloadMaskPanel struct {
					Code     int `json:"code"`
					ShowType int `json:"show_type"`
				} `json:"download_mask_panel"`
			} `json:"aweme_acl,omitempty"`
			AwemeControl struct {
				CanComment     bool `json:"can_comment"`
				CanForward     bool `json:"can_forward"`
				CanShare       bool `json:"can_share"`
				CanShowComment bool `json:"can_show_comment"`
			} `json:"aweme_control"`
			AwemeID        string   `json:"aweme_id"`
			AwemeType      int      `json:"aweme_type"`
			BodydanceScore int      `json:"bodydance_score,omitempty"`
			BookBar        struct{} `json:"book_bar"`
			CategoryDa     int      `json:"category_da,omitempty"`
			ChaList        []struct {
				Author struct {
					AdCoverURL                             any `json:"ad_cover_url"`
					BanUserFunctions                       any `json:"ban_user_functions"`
					CanSetGeofencing                       any `json:"can_set_geofencing"`
					CardEntries                            any `json:"card_entries"`
					CardEntriesNotDisplay                  any `json:"card_entries_not_display"`
					CardSortPriority                       any `json:"card_sort_priority"`
					CfList                                 any `json:"cf_list"`
					ChaList                                any `json:"cha_list"`
					ContrailList                           any `json:"contrail_list"`
					CoverURL                               any `json:"cover_url"`
					DataLabelList                          any `json:"data_label_list"`
					DisplayInfo                            any `json:"display_info"`
					EndorsementInfoList                    any `json:"endorsement_info_list"`
					FollowerListSecondaryInformationStruct any `json:"follower_list_secondary_information_struct"`
					FollowersDetail                        any `json:"followers_detail"`
					Geofencing                             any `json:"geofencing"`
					HomepageBottomToast                    any `json:"homepage_bottom_toast"`
					ImRoleIds                              any `json:"im_role_ids"`
					InterestTags                           any `json:"interest_tags"`
					ItemList                               any `json:"item_list"`
					LinkItemList                           any `json:"link_item_list"`
					NeedPoints                             any `json:"need_points"`
					NewStoryCover                          any `json:"new_story_cover"`
					NotSeenItemIDList                      any `json:"not_seen_item_id_list"`
					NotSeenItemIDListV2                    any `json:"not_seen_item_id_list_v2"`
					OfflineInfoList                        any `json:"offline_info_list"`
					PersonalTagList                        any `json:"personal_tag_list"`
					PlatformSyncInfo                       any `json:"platform_sync_info"`
					RelativeUsers                          any `json:"relative_users"`
					SignatureExtra                         any `json:"signature_extra"`
					SpecialPeopleLabels                    any `json:"special_people_labels"`
					TextExtra                              any `json:"text_extra"`
					TypeLabel                              any `json:"type_label"`
					UserPermissions                        any `json:"user_permissions"`
					UserTags                               any `json:"user_tags"`
					WhiteCoverURL                          any `json:"white_cover_url"`
				} `json:"author"`
				BannerList   any    `json:"banner_list"`
				ChaAttrs     any    `json:"cha_attrs"`
				ChaName      string `json:"cha_name"`
				Cid          string `json:"cid"`
				CollectStat  int    `json:"collect_stat"`
				ConnectMusic []any  `json:"connect_music"`
				Desc         string `json:"desc"`
				ExtraAttr    struct {
					IsLive bool `json:"is_live"`
				} `json:"extra_attr"`
				HashtagProfile string `json:"hashtag_profile"`
				IsChallenge    int    `json:"is_challenge"`
				IsCommerce     bool   `json:"is_commerce"`
				IsPgcshow      bool   `json:"is_pgcshow"`
				Schema         string `json:"schema"`
				SearchImpr     struct {
					EntityID string `json:"entity_id"`
				} `json:"search_impr"`
				ShareInfo struct {
					BoolPersist        int    `json:"bool_persist"`
					ShareDesc          string `json:"share_desc"`
					ShareDescInfo      string `json:"share_desc_info"`
					ShareQuote         string `json:"share_quote"`
					ShareSignatureDesc string `json:"share_signature_desc"`
					ShareSignatureURL  string `json:"share_signature_url"`
					ShareTitle         string `json:"share_title"`
					ShareTitleMyself   string `json:"share_title_myself"`
					ShareTitleOther    string `json:"share_title_other"`
					ShareURL           string `json:"share_url"`
					ShareWeiboDesc     string `json:"share_weibo_desc"`
				} `json:"share_info"`
				ShowItems    any `json:"show_items"`
				SubType      int `json:"sub_type"`
				Type         int `json:"type"`
				UserCount    int `json:"user_count"`
				VerticalType int `json:"vertical_type,omitempty"`
				ViewCount    int `json:"view_count"`
			} `json:"cha_list"`
			ChallengePosition any `json:"challenge_position"`
			ChapterList       []struct {
				Desc          string `json:"desc"`
				DescForSearch string `json:"desc_for_search"`
				Timestamp     int    `json:"timestamp"`
			} `json:"chapter_list"`
			City                  string `json:"city,omitempty"`
			CmtSwt                bool   `json:"cmt_swt"`
			CollectStat           int    `json:"collect_stat"`
			CollectionCornerMark  int    `json:"collection_corner_mark"`
			CommentGid            int    `json:"comment_gid"`
			CommentList           any    `json:"comment_list"`
			CommentPermissionInfo struct {
				CanComment              bool `json:"can_comment"`
				CommentPermissionStatus int  `json:"comment_permission_status"`
				ItemDetailEntry         bool `json:"item_detail_entry"`
				PressEntry              bool `json:"press_entry"`
				ToastGuide              bool `json:"toast_guide"`
			} `json:"comment_permission_info"`
			CommerceConfigData any `json:"commerce_config_data"`
			CommerceInfo       struct {
				AdAuthStatus     int  `json:"ad_auth_status,omitempty"`
				AdAuthTargetType int  `json:"ad_auth_target_type,omitempty"`
				AdBanMask        int  `json:"ad_ban_mask"`
				AdSource         int  `json:"ad_source,omitempty"`
				AdType           int  `json:"ad_type"`
				IsAd             bool `json:"is_ad"`
			} `json:"commerce_info"`
			CommonBarInfo   string `json:"common_bar_info"`
			ComponentInfoV2 string `json:"component_info_v2"`
			CooperationInfo *struct {
				CoCreators []struct {
					AvatarThumb struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_thumb"`
					CustomVerify           string `json:"custom_verify"`
					EnterpriseVerifyReason string `json:"enterprise_verify_reason"`
					FollowStatus           int    `json:"follow_status"`
					FollowerCount          int    `json:"follower_count"`
					FollowerStatus         int    `json:"follower_status"`
					Index                  int    `json:"index"`
					InviteStatus           int    `json:"invite_status"`
					Nickname               string `json:"nickname"`
					RoleID                 int    `json:"role_id"`
					RoleTitle              string `json:"role_title"`
					SecUid                 string `json:"sec_uid"`
					Uid                    string `json:"uid"`
				} `json:"co_creators"`
				Extra string `json:"extra"`
				Tag   string `json:"tag"`
			} `json:"cooperation_info,omitempty"`
			CoverLabels      any `json:"cover_labels"`
			CreateTime       int `json:"create_time"`
			CreateTimeConfig struct {
				FontColor string `json:"font_color"`
				Position  int    `json:"position"`
			} `json:"create_time_config"`
			DanmakuControl *struct {
				EnableDanmaku      bool   `json:"enable_danmaku"`
				IsPostDenied       bool   `json:"is_post_denied"`
				PostDeniedReason   string `json:"post_denied_reason"`
				PostPrivilegeLevel int    `json:"post_privilege_level"`
			} `json:"danmaku_control,omitempty"`
			Desc         string `json:"desc"`
			DescLanguage string `json:"desc_language,omitempty"`
			Descendants  *struct {
				NotifyMsg string   `json:"notify_msg"`
				Platforms []string `json:"platforms"`
			} `json:"descendants,omitempty"`
			DiggLottie *struct {
				CanBomb  int    `json:"can_bomb"`
				LottieID string `json:"lottie_id"`
			} `json:"digg_lottie,omitempty"`
			DisableRelationBar      int    `json:"disable_relation_bar,omitempty"`
			DislikeDimensionList    any    `json:"dislike_dimension_list"`
			Distance                string `json:"distance"`
			DistributeType          int    `json:"distribute_type,omitempty"`
			DuetAggregateInMusicTab bool   `json:"duet_aggregate_in_music_tab"`
			DuetOriginItem          *struct {
				AdAwemeSource       int    `json:"ad_aweme_source,omitempty"`
				Anchors             any    `json:"anchors"`
				AuthenticationToken string `json:"authentication_token"`
				Author              struct {
					AcceptPrivatePolicy bool   `json:"accept_private_policy"`
					AccountRegion       string `json:"account_region"`
					AdCoverURL          any    `json:"ad_cover_url"`
					AppleAccount        int    `json:"apple_account"`
					AuthorityStatus     int    `json:"authority_status"`
					Avatar168x168       struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_168x168"`
					Avatar300x300 struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_300x300"`
					AvatarLarger struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_larger"`
					AvatarMedium struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_medium"`
					AvatarThumb struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_thumb"`
					AvatarURI    string `json:"avatar_uri"`
					AwemeControl struct {
						CanComment     bool `json:"can_comment"`
						CanForward     bool `json:"can_forward"`
						CanShare       bool `json:"can_share"`
						CanShowComment bool `json:"can_show_comment"`
					} `json:"aweme_control"`
					AwemeCount               int    `json:"aweme_count"`
					AwemeHotsoonAuth         int    `json:"aweme_hotsoon_auth,omitempty"`
					AwemeHotsoonAuthRelation int    `json:"aweme_hotsoon_auth_relation,omitempty"`
					BanUserFunctions         []int  `json:"ban_user_functions"`
					BindPhone                string `json:"bind_phone"`
					Birthday                 string `json:"birthday"`
					CanSetGeofencing         any    `json:"can_set_geofencing"`
					CardEntries              any    `json:"card_entries"`
					CardEntriesNotDisplay    any    `json:"card_entries_not_display"`
					CardSortPriority         any    `json:"card_sort_priority"`
					CfList                   any    `json:"cf_list"`
					ChaList                  any    `json:"cha_list"`
					CloseFriendType          int    `json:"close_friend_type"`
					CommentFilterStatus      int    `json:"comment_filter_status"`
					CommentSetting           int    `json:"comment_setting"`
					CommerceUserLevel        int    `json:"commerce_user_level"`
					Constellation            int    `json:"constellation"`
					ContactsStatus           int    `json:"contacts_status"`
					ContrailList             any    `json:"contrail_list"`
					CoverURL                 []struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_url"`
					CreateTime                             int     `json:"create_time"`
					CustomVerify                           string  `json:"custom_verify"`
					CvLevel                                string  `json:"cv_level"`
					DataLabelList                          any     `json:"data_label_list"`
					DisplayInfo                            any     `json:"display_info"`
					DownloadPromptTs                       int     `json:"download_prompt_ts"`
					DownloadSetting                        int     `json:"download_setting"`
					DuetSetting                            int     `json:"duet_setting"`
					EnableNearbyVisible                    bool    `json:"enable_nearby_visible"`
					EndorsementInfoList                    any     `json:"endorsement_info_list"`
					EnterpriseVerifyReason                 string  `json:"enterprise_verify_reason"`
					FavoritingCount                        int     `json:"favoriting_count"`
					FbExpireTime                           int     `json:"fb_expire_time"`
					FollowStatus                           int     `json:"follow_status"`
					FollowerCount                          int     `json:"follower_count"`
					FollowerListSecondaryInformationStruct any     `json:"follower_list_secondary_information_struct"`
					FollowerRequestStatus                  int     `json:"follower_request_status"`
					FollowerStatus                         int     `json:"follower_status"`
					FollowersDetail                        any     `json:"followers_detail"`
					FollowingCount                         int     `json:"following_count"`
					Gender                                 int     `json:"gender"`
					Geofencing                             []any   `json:"geofencing"`
					GoogleAccount                          string  `json:"google_account"`
					HasEmail                               bool    `json:"has_email"`
					HasFacebookToken                       bool    `json:"has_facebook_token"`
					HasInsights                            bool    `json:"has_insights"`
					HasOrders                              bool    `json:"has_orders"`
					HasTwitterToken                        bool    `json:"has_twitter_token"`
					HasUnreadStory                         bool    `json:"has_unread_story"`
					HasYoutubeToken                        bool    `json:"has_youtube_token"`
					HideLocation                           bool    `json:"hide_location"`
					HideSearch                             bool    `json:"hide_search"`
					HomepageBottomToast                    any     `json:"homepage_bottom_toast"`
					ImRoleIds                              any     `json:"im_role_ids"`
					InsID                                  string  `json:"ins_id"`
					InterestTags                           any     `json:"interest_tags"`
					IsAdFake                               bool    `json:"is_ad_fake"`
					IsBindedWeibo                          bool    `json:"is_binded_weibo"`
					IsBlock                                bool    `json:"is_block"`
					IsBlockedV2                            bool    `json:"is_blocked_v2"`
					IsBlockingV2                           bool    `json:"is_blocking_v2"`
					IsCf                                   int     `json:"is_cf"`
					IsDisciplineMember                     bool    `json:"is_discipline_member"`
					IsGovMediaVip                          bool    `json:"is_gov_media_vip"`
					IsMixUser                              bool    `json:"is_mix_user"`
					IsNotShow                              bool    `json:"is_not_show"`
					IsPhoneBinded                          bool    `json:"is_phone_binded"`
					IsStar                                 bool    `json:"is_star"`
					IsVerified                             bool    `json:"is_verified"`
					ItemList                               any     `json:"item_list"`
					KyOnlyPredict                          float64 `json:"ky_only_predict"`
					Language                               string  `json:"language"`
					LinkItemList                           any     `json:"link_item_list"`
					LiveAgreement                          int     `json:"live_agreement"`
					LiveAgreementTime                      int     `json:"live_agreement_time"`
					LiveCommerce                           bool    `json:"live_commerce"`
					LiveStatus                             int     `json:"live_status"`
					LiveVerify                             int     `json:"live_verify"`
					Location                               string  `json:"location"`
					MaxFollowerCount                       int     `json:"max_follower_count"`
					NeedPoints                             any     `json:"need_points"`
					NeedRecommend                          int     `json:"need_recommend"`
					NeiguangShield                         int     `json:"neiguang_shield"`
					NewStoryCover                          any     `json:"new_story_cover"`
					Nickname                               string  `json:"nickname"`
					NotSeenItemIDList                      any     `json:"not_seen_item_id_list"`
					NotSeenItemIDListV2                    any     `json:"not_seen_item_id_list_v2"`
					OfflineInfoList                        any     `json:"offline_info_list"`
					PersonalTagList                        any     `json:"personal_tag_list"`
					PlatformSyncInfo                       any     `json:"platform_sync_info"`
					PreventDownload                        bool    `json:"prevent_download"`
					ReactSetting                           int     `json:"react_setting"`
					ReflowPageGid                          int     `json:"reflow_page_gid"`
					ReflowPageUid                          int     `json:"reflow_page_uid"`
					Region                                 string  `json:"region"`
					RelativeUsers                          any     `json:"relative_users"`
					RiskNoticeText                         string  `json:"risk_notice_text"`
					RoomID                                 int     `json:"room_id"`
					SchoolCategory                         int     `json:"school_category"`
					SchoolID                               string  `json:"school_id"`
					SchoolName                             string  `json:"school_name"`
					SchoolPoiID                            string  `json:"school_poi_id"`
					SchoolType                             int     `json:"school_type"`
					SearchImpr                             struct {
						EntityID string `json:"entity_id"`
					} `json:"search_impr"`
					SecUid                string `json:"sec_uid"`
					Secret                int    `json:"secret"`
					ShieldCommentNotice   int    `json:"shield_comment_notice"`
					ShieldDiggNotice      int    `json:"shield_digg_notice"`
					ShieldFollowNotice    int    `json:"shield_follow_notice"`
					ShortID               string `json:"short_id"`
					ShowImageBubble       bool   `json:"show_image_bubble"`
					ShowNearbyActive      bool   `json:"show_nearby_active"`
					Signature             string `json:"signature"`
					SignatureDisplayLines int    `json:"signature_display_lines"`
					SignatureExtra        any    `json:"signature_extra"`
					SpecialFollowStatus   int    `json:"special_follow_status"`
					SpecialLock           int    `json:"special_lock"`
					SpecialPeopleLabels   any    `json:"special_people_labels"`
					Status                int    `json:"status"`
					StitchSetting         int    `json:"stitch_setting"`
					StoryCount            int    `json:"story_count"`
					StoryOpen             bool   `json:"story_open"`
					SyncToToutiao         int    `json:"sync_to_toutiao"`
					TextExtra             any    `json:"text_extra"`
					TotalFavorited        int    `json:"total_favorited"`
					TwExpireTime          int    `json:"tw_expire_time"`
					TwitterID             string `json:"twitter_id"`
					TwitterName           string `json:"twitter_name"`
					TypeLabel             any    `json:"type_label"`
					Uid                   string `json:"uid"`
					UniqueID              string `json:"unique_id"`
					UniqueIDModifyTime    int    `json:"unique_id_modify_time"`
					UserAge               int    `json:"user_age"`
					UserCanceled          bool   `json:"user_canceled"`
					UserMode              int    `json:"user_mode"`
					UserNotSee            int    `json:"user_not_see"`
					UserNotShow           int    `json:"user_not_show"`
					UserPeriod            int    `json:"user_period"`
					UserPermissions       any    `json:"user_permissions"`
					UserRate              int    `json:"user_rate"`
					UserTags              any    `json:"user_tags"`
					VerificationType      int    `json:"verification_type"`
					VerifyInfo            string `json:"verify_info"`
					VideoIcon             struct {
						Height  int    `json:"height"`
						URI     string `json:"uri"`
						URLList []any  `json:"url_list"`
						Width   int    `json:"width"`
					} `json:"video_icon"`
					WeiboName           string `json:"weibo_name"`
					WeiboSchema         string `json:"weibo_schema"`
					WeiboURL            string `json:"weibo_url"`
					WeiboVerify         string `json:"weibo_verify"`
					WhiteCoverURL       any    `json:"white_cover_url"`
					WithCommerceEntry   bool   `json:"with_commerce_entry"`
					WithDouEntry        bool   `json:"with_dou_entry"`
					WithFusionShopEntry bool   `json:"with_fusion_shop_entry"`
					WithShopEntry       bool   `json:"with_shop_entry"`
					YoutubeChannelID    string `json:"youtube_channel_id"`
					YoutubeChannelTitle string `json:"youtube_channel_title"`
					YoutubeExpireTime   int    `json:"youtube_expire_time"`
				} `json:"author"`
				AuthorMaskTag int `json:"author_mask_tag"`
				AuthorUserID  int `json:"author_user_id"`
				AwemeAcl      *struct {
					DownloadMaskPanel struct {
						Code     int `json:"code"`
						ShowType int `json:"show_type"`
					} `json:"download_mask_panel"`
				} `json:"aweme_acl,omitempty"`
				AwemeControl struct {
					CanComment     bool `json:"can_comment"`
					CanForward     bool `json:"can_forward"`
					CanShare       bool `json:"can_share"`
					CanShowComment bool `json:"can_show_comment"`
				} `json:"aweme_control"`
				AwemeID               string `json:"aweme_id"`
				AwemeType             int    `json:"aweme_type"`
				BodydanceScore        int    `json:"bodydance_score"`
				ChaList               any    `json:"cha_list"`
				ChallengePosition     any    `json:"challenge_position"`
				ChapterList           any    `json:"chapter_list"`
				City                  string `json:"city"`
				CmtSwt                bool   `json:"cmt_swt"`
				CollectStat           int    `json:"collect_stat"`
				CollectionCornerMark  int    `json:"collection_corner_mark"`
				CommentGid            int    `json:"comment_gid"`
				CommentList           any    `json:"comment_list"`
				CommentPermissionInfo struct {
					CanComment              bool `json:"can_comment"`
					CommentPermissionStatus int  `json:"comment_permission_status"`
					ItemDetailEntry         bool `json:"item_detail_entry"`
					PressEntry              bool `json:"press_entry"`
					ToastGuide              bool `json:"toast_guide"`
				} `json:"comment_permission_info"`
				CommerceConfigData any `json:"commerce_config_data"`
				CommerceInfo       struct {
					AdAuthStatus     int  `json:"ad_auth_status,omitempty"`
					AdAuthTargetType int  `json:"ad_auth_target_type,omitempty"`
					AdBanMask        int  `json:"ad_ban_mask"`
					AdSource         int  `json:"ad_source,omitempty"`
					AdType           int  `json:"ad_type"`
					IsAd             bool `json:"is_ad"`
				} `json:"commerce_info"`
				CommonBarInfo   string `json:"common_bar_info"`
				ComponentInfoV2 string `json:"component_info_v2"`
				CoverLabels     any    `json:"cover_labels"`
				CreateTime      int    `json:"create_time"`
				Desc            string `json:"desc"`
				DescLanguage    string `json:"desc_language"`
				Descendants     *struct {
					NotifyMsg string   `json:"notify_msg"`
					Platforms []string `json:"platforms"`
				} `json:"descendants,omitempty"`
				DisableRelationBar      int    `json:"disable_relation_bar"`
				DislikeDimensionList    any    `json:"dislike_dimension_list"`
				Distance                string `json:"distance"`
				DistributeType          int    `json:"distribute_type"`
				DuetAggregateInMusicTab bool   `json:"duet_aggregate_in_music_tab"`
				Duration                int    `json:"duration"`
				Geofencing              []any  `json:"geofencing"`
				GeofencingRegions       any    `json:"geofencing_regions"`
				GroupID                 string `json:"group_id"`
				GuideBtnType            int    `json:"guide_btn_type"`
				HasVsEntry              bool   `json:"has_vs_entry"`
				HaveDashboard           bool   `json:"have_dashboard"`
				HorizontalType          int    `json:"horizontal_type,omitempty"`
				HybridLabel             any    `json:"hybrid_label"`
				ImageAlbumMusicInfo     struct {
					BeginTime int `json:"begin_time"`
					EndTime   int `json:"end_time"`
					Volume    int `json:"volume"`
				} `json:"image_album_music_info"`
				ImageComment   struct{} `json:"image_comment"`
				ImageInfos     any      `json:"image_infos"`
				ImageList      any      `json:"image_list"`
				Images         any      `json:"images"`
				ImgBitrate     any      `json:"img_bitrate"`
				ImpressionData struct {
					GroupIDListA   []int `json:"group_id_list_a"`
					GroupIDListB   []int `json:"group_id_list_b"`
					GroupIDListC   any   `json:"group_id_list_c"`
					SimilarIDListA any   `json:"similar_id_list_a"`
					SimilarIDListB []int `json:"similar_id_list_b"`
				} `json:"impression_data"`
				InteractionStickers any    `json:"interaction_stickers"`
				IsCollectsSelected  int    `json:"is_collects_selected"`
				IsDuetSing          bool   `json:"is_duet_sing"`
				IsFantasy           bool   `json:"is_fantasy"`
				IsFirstVideo        bool   `json:"is_first_video"`
				IsHashTag           int    `json:"is_hash_tag"`
				IsImageBeat         bool   `json:"is_image_beat"`
				IsInScope           bool   `json:"is_in_scope"`
				IsKaraoke           bool   `json:"is_karaoke"`
				IsLifeItem          bool   `json:"is_life_item"`
				IsPgcshow           bool   `json:"is_pgcshow"`
				IsPreview           int    `json:"is_preview"`
				IsRelieve           bool   `json:"is_relieve"`
				IsSharePost         bool   `json:"is_share_post"`
				IsStory             int    `json:"is_story"`
				IsTop               int    `json:"is_top"`
				IsVr                bool   `json:"is_vr"`
				ItemCommentSettings int    `json:"item_comment_settings"`
				ItemDuet            int    `json:"item_duet"`
				ItemReact           int    `json:"item_react"`
				ItemShare           int    `json:"item_share"`
				ItemStitch          int    `json:"item_stitch"`
				LabelTopText        any    `json:"label_top_text"`
				LongVideo           any    `json:"long_video"`
				MiscInfo            string `json:"misc_info"`
				Music               struct {
					Album            string `json:"album"`
					ArtistUserInfos  any    `json:"artist_user_infos"`
					Artists          []any  `json:"artists"`
					AuditionDuration int    `json:"audition_duration"`
					Author           string `json:"author"`
					AuthorDeleted    bool   `json:"author_deleted"`
					AuthorPosition   any    `json:"author_position"`
					AuthorStatus     int    `json:"author_status,omitempty"`
					AvatarLarge      *struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_large,omitempty"`
					AvatarMedium *struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_medium,omitempty"`
					AvatarThumb *struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"avatar_thumb,omitempty"`
					BindedChallengeID int  `json:"binded_challenge_id"`
					CanBackgroundPlay bool `json:"can_background_play"`
					Climax            *struct {
						StartPoint int `json:"start_point"`
					} `json:"climax,omitempty"`
					CollectStat   int `json:"collect_stat"`
					CoverColorHsv *struct {
						H int `json:"h"`
						S int `json:"s"`
						V int `json:"v"`
					} `json:"cover_color_hsv,omitempty"`
					CoverHd struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_hd"`
					CoverLarge struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_large"`
					CoverMedium struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_medium"`
					CoverThumb struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_thumb"`
					DmvAutoShow          bool   `json:"dmv_auto_show"`
					DspStatus            int    `json:"dsp_status"`
					Duration             int    `json:"duration"`
					EndTime              int    `json:"end_time"`
					ExternalSongInfo     []any  `json:"external_song_info"`
					Extra                string `json:"extra"`
					ID                   int    `json:"id"`
					IDStr                string `json:"id_str"`
					IsAudioURLWithCookie bool   `json:"is_audio_url_with_cookie"`
					IsCommerceMusic      bool   `json:"is_commerce_music"`
					IsDelVideo           bool   `json:"is_del_video"`
					IsMatchedMetadata    bool   `json:"is_matched_metadata"`
					IsOriginal           bool   `json:"is_original"`
					IsOriginalSound      bool   `json:"is_original_sound"`
					IsPgc                bool   `json:"is_pgc"`
					IsRestricted         bool   `json:"is_restricted"`
					IsVideoSelfSee       bool   `json:"is_video_self_see"`
					LunaInfo             struct {
						HasCopyright bool `json:"has_copyright"`
						IsLunaUser   bool `json:"is_luna_user"`
					} `json:"luna_info"`
					LyricShortPosition any `json:"lyric_short_position"`
					MatchedPgcSound    *struct {
						Author      string `json:"author"`
						CoverMedium struct {
							Height  int      `json:"height"`
							URI     string   `json:"uri"`
							URLList []string `json:"url_list"`
							Width   int      `json:"width"`
						} `json:"cover_medium"`
						MixedAuthor string `json:"mixed_author"`
						MixedTitle  string `json:"mixed_title"`
						Title       string `json:"title"`
					} `json:"matched_pgc_sound,omitempty"`
					Mid               string `json:"mid"`
					MusicChartRanks   any    `json:"music_chart_ranks"`
					MusicStatus       int    `json:"music_status"`
					MusicianUserInfos any    `json:"musician_user_infos"`
					MuteShare         bool   `json:"mute_share"`
					OfflineDesc       string `json:"offline_desc"`
					OwnerHandle       string `json:"owner_handle"`
					OwnerID           string `json:"owner_id,omitempty"`
					OwnerNickname     string `json:"owner_nickname"`
					PgcMusicType      int    `json:"pgc_music_type"`
					PlayURL           struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLKey  string   `json:"url_key"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"play_url"`
					Position                  any     `json:"position"`
					PreventDownload           bool    `json:"prevent_download"`
					PreventItemDownloadStatus int     `json:"prevent_item_download_status"`
					PreviewEndTime            int     `json:"preview_end_time"`
					PreviewStartTime          float64 `json:"preview_start_time"`
					ReasonType                int     `json:"reason_type"`
					Redirect                  bool    `json:"redirect"`
					SchemaURL                 string  `json:"schema_url"`
					SearchImpr                struct {
						EntityID string `json:"entity_id"`
					} `json:"search_impr"`
					SecUid        string `json:"sec_uid,omitempty"`
					ShootDuration int    `json:"shoot_duration"`
					Song          *struct {
						Artists any `json:"artists"`
						Chorus  *struct {
							DurationMs int `json:"duration_ms"`
							StartMs    int `json:"start_ms"`
						} `json:"chorus,omitempty"`
						ChorusV3Infos any    `json:"chorus_v3_infos"`
						ID            int    `json:"id"`
						IDStr         string `json:"id_str"`
						Title         string `json:"title,omitempty"`
					} `json:"song,omitempty"`
					SourcePlatform int `json:"source_platform"`
					StartTime      int `json:"start_time"`
					Status         int `json:"status"`
					StrongBeatURL  *struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"strong_beat_url,omitempty"`
					TagList           any    `json:"tag_list"`
					Title             string `json:"title"`
					UnshelveCountries any    `json:"unshelve_countries"`
					UserCount         int    `json:"user_count"`
					VideoDuration     int    `json:"video_duration"`
				} `json:"music"`
				NearbyLevel         int   `json:"nearby_level"`
				NeedVsEntry         bool  `json:"need_vs_entry"`
				NicknamePosition    any   `json:"nickname_position"`
				OriginCommentIds    any   `json:"origin_comment_ids"`
				OriginTextExtra     []any `json:"origin_text_extra"`
				OriginalImages      any   `json:"original_images"`
				PackedClips         any   `json:"packed_clips"`
				PhotoSearchEntrance struct {
					EcomType int `json:"ecom_type"`
				} `json:"photo_search_entrance"`
				PoiBiz       struct{} `json:"poi_biz"`
				PoiPatchInfo struct {
					Extra                  string `json:"extra"`
					ItemPatchPoiPromptMark int    `json:"item_patch_poi_prompt_mark"`
				} `json:"poi_patch_info"`
				Position             any    `json:"position"`
				PreventDownload      bool   `json:"prevent_download"`
				PreviewTitle         string `json:"preview_title"`
				PreviewVideoStatus   int    `json:"preview_video_status"`
				Promotions           []any  `json:"promotions"`
				Rate                 int    `json:"rate"`
				RefTtsIDList         any    `json:"ref_tts_id_list"`
				RefVoiceModifyIDList any    `json:"ref_voice_modify_id_list"`
				Region               string `json:"region"`
				RelationLabels       any    `json:"relation_labels"`
				ReportAction         bool   `json:"report_action"`
				RiskInfos            struct {
					Content  string `json:"content"`
					RiskSink bool   `json:"risk_sink"`
					Type     int    `json:"type"`
					Vote     bool   `json:"vote"`
					Warn     bool   `json:"warn"`
				} `json:"risk_infos"`
				SearchImpr struct {
					EntityID   string `json:"entity_id"`
					EntityType string `json:"entity_type"`
				} `json:"search_impr"`
				SeoInfo        struct{} `json:"seo_info"`
				SeriesPaidInfo struct {
					ItemPrice        int `json:"item_price"`
					SeriesPaidStatus int `json:"series_paid_status"`
				} `json:"series_paid_info"`
				ShouldOpenAdReport  bool     `json:"should_open_ad_report"`
				ShowFollowButton    struct{} `json:"show_follow_button"`
				SocialTagList       any      `json:"social_tag_list"`
				SortLabel           string   `json:"sort_label"`
				StandardBarInfoList any      `json:"standard_bar_info_list"`
				Statistics          struct {
					AdmireCount        int    `json:"admire_count"`
					AwemeID            string `json:"aweme_id"`
					CollectCount       int    `json:"collect_count"`
					CommentCount       int    `json:"comment_count"`
					Digest             string `json:"digest"`
					DiggCount          int    `json:"digg_count"`
					DownloadCount      int    `json:"download_count"`
					ExposureCount      int    `json:"exposure_count"`
					ForwardCount       int    `json:"forward_count"`
					LiveWatchCount     int    `json:"live_watch_count"`
					LoseCommentCount   int    `json:"lose_comment_count"`
					LoseCount          int    `json:"lose_count"`
					PlayCount          int    `json:"play_count"`
					ShareCount         int    `json:"share_count"`
					WhatsappShareCount int    `json:"whatsapp_share_count"`
				} `json:"statistics"`
				Status struct {
					AllowComment  bool `json:"allow_comment"`
					AllowShare    bool `json:"allow_share"`
					AwemeEditInfo struct {
						ButtonStatus int    `json:"button_status"`
						ButtonToast  string `json:"button_toast"`
					} `json:"aweme_edit_info"`
					AwemeID           string `json:"aweme_id"`
					DontShareStatus   int    `json:"dont_share_status"`
					DownloadStatus    int    `json:"download_status"`
					InReviewing       bool   `json:"in_reviewing"`
					IsDelete          bool   `json:"is_delete"`
					IsPrivate         bool   `json:"is_private"`
					IsProhibited      bool   `json:"is_prohibited"`
					ListenVideoStatus int    `json:"listen_video_status"`
					PartSee           int    `json:"part_see"`
					PrivateStatus     int    `json:"private_status"`
					ReviewResult      struct {
						ReviewStatus int `json:"review_status"`
					} `json:"review_result"`
					Reviewed        int  `json:"reviewed"`
					SelfSee         bool `json:"self_see"`
					VideoHideSearch int  `json:"video_hide_search"`
					WithFusionGoods bool `json:"with_fusion_goods"`
					WithGoods       bool `json:"with_goods"`
				} `json:"status"`
				StoryTtl  int `json:"story_ttl"`
				TextExtra []struct {
					End         int    `json:"end"`
					HashtagName string `json:"hashtag_name,omitempty"`
					SecUid      string `json:"sec_uid,omitempty"`
					Start       int    `json:"start"`
					Type        int    `json:"type"`
					UserID      string `json:"user_id,omitempty"`
				} `json:"text_extra"`
				ToolBar             struct{} `json:"tool_bar"`
				TtsIDList           any      `json:"tts_id_list"`
				UniqidPosition      any      `json:"uniqid_position"`
				UserDigged          int      `json:"user_digged"`
				UserRecommendStatus int      `json:"user_recommend_status"`
				Video               struct {
					AnimatedCover struct {
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
					} `json:"animated_cover"`
					BigThumbs []struct {
						Duration float64 `json:"duration"`
						Fext     string  `json:"fext"`
						ImgNum   int     `json:"img_num"`
						ImgURL   string  `json:"img_url"`
						ImgXLen  int     `json:"img_x_len"`
						ImgXSize int     `json:"img_x_size"`
						ImgYLen  int     `json:"img_y_len"`
						ImgYSize int     `json:"img_y_size"`
						Interval int     `json:"interval"`
						URI      string  `json:"uri"`
					} `json:"big_thumbs"`
					BitRate []struct {
						Fps       int    `json:"FPS"`
						HdrBit    string `json:"HDR_bit"`
						HdrType   string `json:"HDR_type"`
						BitRate   int    `json:"bit_rate"`
						GearName  string `json:"gear_name"`
						IsBytevc1 int    `json:"is_bytevc1"`
						IsH265    int    `json:"is_h265"`
						PlayAddr  struct {
							DataSize int      `json:"data_size"`
							FileCs   string   `json:"file_cs"`
							FileHash string   `json:"file_hash"`
							Height   int      `json:"height"`
							URI      string   `json:"uri"`
							URLKey   string   `json:"url_key"`
							URLList  []string `json:"url_list"`
							Width    int      `json:"width"`
						} `json:"play_addr"`
						QualityType int    `json:"quality_type"`
						VideoExtra  string `json:"video_extra"`
					} `json:"bit_rate"`
					CdnURLExpired int `json:"cdn_url_expired"`
					Cover         struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover"`
					DownloadAddr struct {
						DataSize int      `json:"data_size,omitempty"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"download_addr"`
					DownloadSuffixLogoAddr *struct {
						DataSize int      `json:"data_size,omitempty"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"download_suffix_logo_addr,omitempty"`
					Duration     int `json:"duration"`
					DynamicCover struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"dynamic_cover"`
					HasDownloadSuffixLogoAddr bool   `json:"has_download_suffix_logo_addr,omitempty"`
					HasWatermark              bool   `json:"has_watermark"`
					Height                    int    `json:"height"`
					HorizontalType            int    `json:"horizontal_type,omitempty"`
					IsBytevc1                 int    `json:"is_bytevc1"`
					IsCallback                bool   `json:"is_callback"`
					IsH265                    int    `json:"is_h265"`
					IsLongVideo               int    `json:"is_long_video,omitempty"`
					IsSourceHdr               int    `json:"is_source_HDR"`
					Meta                      string `json:"meta"`
					MiscDownloadAddrs         string `json:"misc_download_addrs,omitempty"`
					NeedSetToken              bool   `json:"need_set_token"`
					OptimizedCover            *struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"optimized_cover,omitempty"`
					OriginCover struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"origin_cover"`
					PlayAddr struct {
						DataSize int      `json:"data_size"`
						FileCs   string   `json:"file_cs"`
						FileHash string   `json:"file_hash"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLKey   string   `json:"url_key"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"play_addr"`
					PlayAddr265 *struct {
						DataSize int      `json:"data_size"`
						FileCs   string   `json:"file_cs"`
						FileHash string   `json:"file_hash"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLKey   string   `json:"url_key"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"play_addr_265,omitempty"`
					PlayAddrH264 *struct {
						DataSize int      `json:"data_size"`
						FileCs   string   `json:"file_cs"`
						FileHash string   `json:"file_hash"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLKey   string   `json:"url_key"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"play_addr_h264,omitempty"`
					PlayAddrLowbr struct {
						DataSize int      `json:"data_size"`
						FileCs   string   `json:"file_cs"`
						FileHash string   `json:"file_hash"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLKey   string   `json:"url_key"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"play_addr_lowbr"`
					Ratio          string `json:"ratio"`
					Tags           any    `json:"tags"`
					UseStaticCover bool   `json:"use_static_cover"`
					VideoModel     string `json:"video_model"`
					Width          int    `json:"width"`
				} `json:"video"`
				VideoControl struct {
					AllowDouplus             bool `json:"allow_douplus"`
					AllowDownload            bool `json:"allow_download"`
					AllowDuet                bool `json:"allow_duet"`
					AllowDynamicWallpaper    bool `json:"allow_dynamic_wallpaper"`
					AllowMusic               bool `json:"allow_music"`
					AllowReact               bool `json:"allow_react"`
					AllowShare               bool `json:"allow_share"`
					AllowStitch              bool `json:"allow_stitch"`
					DownloadIgnoreVisibility bool `json:"download_ignore_visibility"`
					DownloadInfo             struct {
						FailInfo *struct {
							Code   int    `json:"code"`
							Msg    string `json:"msg"`
							Reason string `json:"reason"`
						} `json:"fail_info,omitempty"`
						Level int `json:"level"`
					} `json:"download_info"`
					DraftProgressBar     int  `json:"draft_progress_bar"`
					DuetIgnoreVisibility bool `json:"duet_ignore_visibility"`
					DuetInfo             struct {
						FailInfo *struct {
							Code   int    `json:"code"`
							Reason string `json:"reason"`
						} `json:"fail_info,omitempty"`
						Level int `json:"level"`
					} `json:"duet_info"`
					PreventDownloadType   int  `json:"prevent_download_type"`
					ShareGrayed           bool `json:"share_grayed"`
					ShareIgnoreVisibility bool `json:"share_ignore_visibility"`
					ShareType             int  `json:"share_type"`
					ShowProgressBar       int  `json:"show_progress_bar"`
					TimerStatus           int  `json:"timer_status"`
				} `json:"video_control"`
				VideoLabels any `json:"video_labels"`
				VideoTag    []struct {
					Level   int    `json:"level"`
					TagID   int    `json:"tag_id"`
					TagName string `json:"tag_name"`
				} `json:"video_tag"`
				VideoText            []any `json:"video_text"`
				VoiceModifyIDList    any   `json:"voice_modify_id_list"`
				VrType               int   `json:"vr_type"`
				WithPromotionalMusic bool  `json:"with_promotional_music"`
				WithoutWatermark     bool  `json:"without_watermark"`
				XiguaTask            struct {
					IsXiguaTask bool `json:"is_xigua_task"`
				} `json:"xigua_task"`
			} `json:"duet_origin_item,omitempty"`
			DuetOriginItemID string `json:"duet_origin_item_id,omitempty"`
			Duration         int    `json:"duration"`
			GameInfo         *struct {
				GameScore int `json:"game_score"`
				GameType  int `json:"game_type"`
			} `json:"game_info,omitempty"`
			Geofencing        []any  `json:"geofencing"`
			GeofencingRegions any    `json:"geofencing_regions"`
			GroupID           string `json:"group_id"`
			GuideBtnType      int    `json:"guide_btn_type"`
			HasVsEntry        bool   `json:"has_vs_entry"`
			HaveDashboard     bool   `json:"have_dashboard"`
			HorizontalType    int    `json:"horizontal_type,omitempty"`
			HotList           *struct {
				Extra       string `json:"extra"`
				Footer      string `json:"footer"`
				GroupID     string `json:"group_id"`
				Header      string `json:"header"`
				HotScore    int    `json:"hot_score"`
				I18nTitle   string `json:"i18n_title"`
				ImageURL    string `json:"image_url"`
				PatternType int    `json:"pattern_type"`
				Rank        int    `json:"rank"`
				Schema      string `json:"schema"`
				Sentence    string `json:"sentence"`
				SentenceID  int    `json:"sentence_id"`
				Title       string `json:"title"`
				Type        int    `json:"type"`
				ViewCount   int    `json:"view_count"`
			} `json:"hot_list,omitempty"`
			HybridLabel         any `json:"hybrid_label"`
			ImageAlbumMusicInfo *struct {
				BeginTime int `json:"begin_time"`
				EndTime   int `json:"end_time"`
				Volume    int `json:"volume"`
			} `json:"image_album_music_info,omitempty"`
			ImageComment struct{} `json:"image_comment"`
			ImageInfos   any      `json:"image_infos"`
			ImageList    any      `json:"image_list"`
			Images       []struct {
				DownloadURLList []string `json:"download_url_list"`
				Height          int      `json:"height"`
				MaskURLList     any      `json:"mask_url_list"`
				URI             string   `json:"uri"`
				URLList         []string `json:"url_list"`
				Width           int      `json:"width"`
			} `json:"images"`
			ImgBitrate []struct {
				Images []struct {
					DownloadURLList []string `json:"download_url_list"`
					Height          int      `json:"height"`
					MaskURLList     any      `json:"mask_url_list"`
					URI             string   `json:"uri"`
					URLList         []string `json:"url_list"`
					Width           int      `json:"width"`
				} `json:"images"`
				Name string `json:"name"`
			} `json:"img_bitrate"`
			ImpressionData struct {
				GroupIDListA   []int `json:"group_id_list_a"`
				GroupIDListB   []int `json:"group_id_list_b"`
				GroupIDListC   any   `json:"group_id_list_c"`
				SimilarIDListA []int `json:"similar_id_list_a"`
				SimilarIDListB []int `json:"similar_id_list_b"`
			} `json:"impression_data"`
			InteractionStickers []struct {
				Attr        string `json:"attr"`
				HashtagInfo *struct {
					HashtagID   string `json:"hashtag_id"`
					HashtagName string `json:"hashtag_name"`
				} `json:"hashtag_info,omitempty"`
				ImageIndex      int    `json:"image_index,omitempty"`
				Index           int    `json:"index"`
				StickerConfig   string `json:"sticker_config"`
				TextInteraction []struct {
					HashtagInfo struct {
						HashtagID   string `json:"hashtag_id"`
						HashtagName string `json:"hashtag_name"`
					} `json:"hashtag_info"`
					Index int `json:"index"`
					Type  int `json:"type"`
				} `json:"text_interaction"`
				TrackInfo      string `json:"track_info"`
				Type           int    `json:"type"`
				VideoShareInfo *struct {
					AuthorID            string `json:"author_id"`
					AuthorName          string `json:"author_name"`
					AwemeID             string `json:"aweme_id"`
					CommentContent      string `json:"comment_content"`
					CommentID           string `json:"comment_id"`
					CommentUserID       string `json:"comment_user_id"`
					CommentUserNickname string `json:"comment_user_nickname"`
					CommentUserSecID    string `json:"comment_user_sec_id"`
					ImageIndex          string `json:"image_index"`
					SecAuthorID         string `json:"sec_author_id"`
				} `json:"video_share_info,omitempty"`
				VoteInfo *struct {
					Options []struct {
						OptionID   int    `json:"option_id"`
						OptionText string `json:"option_text"`
						VoteCount  int    `json:"vote_count"`
					} `json:"options"`
					Question       string `json:"question"`
					RefID          int    `json:"ref_id"`
					RefType        int    `json:"ref_type"`
					SelectOptionID int    `json:"select_option_id"`
					VoteID         int    `json:"vote_id"`
				} `json:"vote_info,omitempty"`
			} `json:"interaction_stickers"`
			IsCollectsSelected   int  `json:"is_collects_selected"`
			IsDuetSing           bool `json:"is_duet_sing"`
			IsFantasy            bool `json:"is_fantasy"`
			IsFirstVideo         bool `json:"is_first_video"`
			IsHashTag            int  `json:"is_hash_tag"`
			IsImageBeat          bool `json:"is_image_beat"`
			IsInScope            bool `json:"is_in_scope"`
			IsKaraoke            bool `json:"is_karaoke"`
			IsLifeItem           bool `json:"is_life_item"`
			IsMultiContent       int  `json:"is_multi_content,omitempty"`
			IsPgcshow            bool `json:"is_pgcshow"`
			IsPreview            int  `json:"is_preview,omitempty"`
			IsRelieve            bool `json:"is_relieve"`
			IsSharePost          bool `json:"is_share_post"`
			IsStory              int  `json:"is_story"`
			IsTop                int  `json:"is_top,omitempty"`
			IsVr                 bool `json:"is_vr"`
			ItemCommentSettings  int  `json:"item_comment_settings"`
			ItemDuet             int  `json:"item_duet"`
			ItemReact            int  `json:"item_react"`
			ItemShare            int  `json:"item_share"`
			ItemStitch           int  `json:"item_stitch"`
			ItemWarnNotification struct {
				Content string `json:"content"`
				Show    bool   `json:"show"`
				Type    int    `json:"type"`
			} `json:"item_warn_notification"`
			LabelTop struct {
				Height  int      `json:"height"`
				URI     string   `json:"uri"`
				URLList []string `json:"url_list"`
				Width   int      `json:"width"`
			} `json:"label_top"`
			LabelTopText any    `json:"label_top_text"`
			LinkAdData   string `json:"link_ad_data,omitempty"`
			LiveID       int    `json:"live_id,omitempty"`
			LiveType     string `json:"live_type,omitempty"`
			LongVideo    any    `json:"long_video"`
			MicroAppInfo *struct {
				AppID       string `json:"app_id"`
				AppName     string `json:"app_name"`
				Description string `json:"description"`
				Icon        string `json:"icon"`
				Orientation int    `json:"orientation"`
				Schema      string `json:"schema"`
				State       int    `json:"state"`
				Summary     string `json:"summary"`
				Title       string `json:"title"`
				Type        int    `json:"type"`
			} `json:"micro_app_info,omitempty"`
			MiscInfo string `json:"misc_info"`
			MixInfo  *struct {
				CoverURL struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_url"`
				CreateTime  int    `json:"create_time"`
				Desc        string `json:"desc"`
				Extra       string `json:"extra"`
				Ids         any    `json:"ids"`
				IsSerialMix int    `json:"is_serial_mix"`
				MixID       string `json:"mix_id"`
				MixName     string `json:"mix_name"`
				MixPicType  int    `json:"mix_pic_type"`
				MixType     int    `json:"mix_type"`
				ShareInfo   struct {
					ShareDesc        string `json:"share_desc"`
					ShareDescInfo    string `json:"share_desc_info"`
					ShareTitle       string `json:"share_title"`
					ShareTitleMyself string `json:"share_title_myself"`
					ShareTitleOther  string `json:"share_title_other"`
					ShareURL         string `json:"share_url"`
					ShareWeiboDesc   string `json:"share_weibo_desc"`
				} `json:"share_info"`
				Statis struct {
					CollectVv        int `json:"collect_vv"`
					CurrentEpisode   int `json:"current_episode"`
					PlayVv           int `json:"play_vv"`
					UpdatedToEpisode int `json:"updated_to_episode"`
				} `json:"statis"`
				Status struct {
					IsCollected int `json:"is_collected"`
					Status      int `json:"status"`
				} `json:"status"`
				UpdateTime  int    `json:"update_time"`
				WatchedItem string `json:"watched_item"`
			} `json:"mix_info,omitempty"`
			Music *struct {
				Album            string `json:"album"`
				ArtistUserInfos  any    `json:"artist_user_infos"`
				Artists          []any  `json:"artists"`
				AuditionDuration int    `json:"audition_duration"`
				Author           string `json:"author"`
				AuthorDeleted    bool   `json:"author_deleted"`
				AuthorPosition   any    `json:"author_position"`
				AuthorStatus     int    `json:"author_status,omitempty"`
				AvatarLarge      *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_large,omitempty"`
				AvatarMedium *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_medium,omitempty"`
				AvatarThumb *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"avatar_thumb,omitempty"`
				BindedChallengeID int  `json:"binded_challenge_id"`
				CanBackgroundPlay bool `json:"can_background_play"`
				Climax            *struct {
					StartPoint int `json:"start_point"`
				} `json:"climax,omitempty"`
				CollectStat   int `json:"collect_stat"`
				CoverColorHsv *struct {
					H int `json:"h"`
					S int `json:"s"`
					V int `json:"v"`
				} `json:"cover_color_hsv,omitempty"`
				CoverHd struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_hd"`
				CoverLarge struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_large"`
				CoverMedium struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_medium"`
				CoverThumb struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_thumb"`
				DmvAutoShow          bool   `json:"dmv_auto_show"`
				DspStatus            int    `json:"dsp_status"`
				Duration             int    `json:"duration"`
				EndTime              int    `json:"end_time"`
				ExternalSongInfo     []any  `json:"external_song_info"`
				Extra                string `json:"extra"`
				ID                   int    `json:"id"`
				IDStr                string `json:"id_str"`
				IsAudioURLWithCookie bool   `json:"is_audio_url_with_cookie"`
				IsCommerceMusic      bool   `json:"is_commerce_music"`
				IsDelVideo           bool   `json:"is_del_video"`
				IsMatchedMetadata    bool   `json:"is_matched_metadata"`
				IsOriginal           bool   `json:"is_original"`
				IsOriginalSound      bool   `json:"is_original_sound"`
				IsPgc                bool   `json:"is_pgc"`
				IsRestricted         bool   `json:"is_restricted"`
				IsVideoSelfSee       bool   `json:"is_video_self_see"`
				LunaInfo             struct {
					HasCopyright bool `json:"has_copyright"`
					IsLunaUser   bool `json:"is_luna_user"`
				} `json:"luna_info"`
				LyricShortPosition any `json:"lyric_short_position"`
				MatchedPgcSound    *struct {
					Author      string `json:"author"`
					CoverMedium struct {
						Height  int      `json:"height"`
						URI     string   `json:"uri"`
						URLList []string `json:"url_list"`
						Width   int      `json:"width"`
					} `json:"cover_medium"`
					MixedAuthor string `json:"mixed_author"`
					MixedTitle  string `json:"mixed_title"`
					Title       string `json:"title"`
				} `json:"matched_pgc_sound,omitempty"`
				Mid               string `json:"mid"`
				MusicChartRanks   any    `json:"music_chart_ranks"`
				MusicStatus       int    `json:"music_status"`
				MusicianUserInfos any    `json:"musician_user_infos"`
				MuteShare         bool   `json:"mute_share"`
				OfflineDesc       string `json:"offline_desc"`
				OwnerHandle       string `json:"owner_handle"`
				OwnerID           string `json:"owner_id,omitempty"`
				OwnerNickname     string `json:"owner_nickname"`
				PgcMusicType      int    `json:"pgc_music_type"`
				PlayURL           struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLKey  string   `json:"url_key"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"play_url"`
				Position                  any     `json:"position"`
				PreventDownload           bool    `json:"prevent_download"`
				PreventItemDownloadStatus int     `json:"prevent_item_download_status"`
				PreviewEndTime            int     `json:"preview_end_time"`
				PreviewStartTime          float64 `json:"preview_start_time"`
				ReasonType                int     `json:"reason_type"`
				Redirect                  bool    `json:"redirect"`
				SchemaURL                 string  `json:"schema_url"`
				SearchImpr                struct {
					EntityID string `json:"entity_id"`
				} `json:"search_impr"`
				SecUid        string `json:"sec_uid,omitempty"`
				ShootDuration int    `json:"shoot_duration"`
				Song          *struct {
					Artists any `json:"artists"`
					Chorus  *struct {
						DurationMs int `json:"duration_ms"`
						StartMs    int `json:"start_ms"`
					} `json:"chorus,omitempty"`
					ChorusV3Infos any    `json:"chorus_v3_infos"`
					ID            int    `json:"id"`
					IDStr         string `json:"id_str"`
					Title         string `json:"title,omitempty"`
				} `json:"song,omitempty"`
				SourcePlatform int `json:"source_platform"`
				StartTime      int `json:"start_time"`
				Status         int `json:"status"`
				StrongBeatURL  *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"strong_beat_url,omitempty"`
				TagList           any    `json:"tag_list"`
				Title             string `json:"title"`
				UnshelveCountries any    `json:"unshelve_countries"`
				UserCount         int    `json:"user_count"`
				VideoDuration     int    `json:"video_duration"`
			} `json:"music,omitempty"`
			NearbyLevel         int   `json:"nearby_level"`
			NeedVsEntry         bool  `json:"need_vs_entry,omitempty"`
			NicknamePosition    any   `json:"nickname_position"`
			OriginCommentIds    any   `json:"origin_comment_ids"`
			OriginTextExtra     []any `json:"origin_text_extra"`
			OriginalImages      any   `json:"original_images"`
			PackedClips         any   `json:"packed_clips"`
			PhotoSearchEntrance struct {
				EcomType int `json:"ecom_type"`
			} `json:"photo_search_entrance"`
			PoiBiz struct {
				AnchorReviewStatus *struct {
					Status int `json:"status"`
				} `json:"anchor_review_status,omitempty"`
			} `json:"poi_biz"`
			PoiInfo *struct {
				AddressInfo struct {
					AdCodeV2    string `json:"ad_code_v2"`
					Address     string `json:"address"`
					City        string `json:"city"`
					CityCode    string `json:"city_code"`
					CityCodeV2  string `json:"city_code_v2"`
					Country     string `json:"country"`
					CountryCode string `json:"country_code"`
					District    string `json:"district"`
					Province    string `json:"province"`
					SimpleAddr  string `json:"simple_addr"`
				} `json:"address_info"`
				CollectStat    int    `json:"collect_stat"`
				CollectedCount string `json:"collected_count,omitempty"`
				CoverHd        struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_hd"`
				CoverLarge struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_large"`
				CoverMedium struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_medium"`
				CoverThumb struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover_thumb"`
				Distance        string `json:"distance"`
				EffectIds       any    `json:"effect_ids"`
				ExpandType      int    `json:"expand_type"`
				ExtJSON         string `json:"ext_json"`
				FulfillTaskList any    `json:"fulfill_task_list"`
				IconOnEntry     struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"icon_on_entry"`
				IconOnInfo struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"icon_on_info"`
				IconOnMap struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"icon_on_map"`
				IconServiceTypeList any    `json:"icon_service_type_list"`
				IconType            int    `json:"icon_type"`
				IsAdminArea         bool   `json:"is_admin_area"`
				IsAtCallBackCollect bool   `json:"is_at_call_back_collect"`
				IsFoodGroupBuy      bool   `json:"is_food_group_buy"`
				ItemCount           int    `json:"item_count"`
				Poi3classType       string `json:"poi_3class_type,omitempty"`
				PoiBackendType      struct {
					Code string `json:"code"`
					Name string `json:"name"`
				} `json:"poi_backend_type"`
				PoiDetailTags   any     `json:"poi_detail_tags"`
				PoiFrontendType any     `json:"poi_frontend_type"`
				PoiID           string  `json:"poi_id"`
				PoiLatitude     float64 `json:"poi_latitude"`
				PoiLongitude    float64 `json:"poi_longitude"`
				PoiName         string  `json:"poi_name"`
				PoiRanks        []struct {
					RankDesc string `json:"rank_desc"`
				} `json:"poi_ranks"`
				PoiSubtitle     string `json:"poi_subtitle"`
				PoiSubtitleType int    `json:"poi_subtitle_type"`
				Popularity      string `json:"popularity"`
				ServiceTypeList any    `json:"service_type_list"`
				ShareInfo       struct {
					BoolPersist      int    `json:"bool_persist"`
					ShareDesc        string `json:"share_desc"`
					ShareDescInfo    string `json:"share_desc_info"`
					ShareTitle       string `json:"share_title"`
					ShareTitleMyself string `json:"share_title_myself"`
					ShareTitleOther  string `json:"share_title_other"`
					ShareURL         string `json:"share_url"`
					ShareWeiboDesc   string `json:"share_weibo_desc"`
				} `json:"share_info"`
				ShowType            int    `json:"show_type"`
				SpSource            string `json:"sp_source,omitempty"`
				TypeCode            string `json:"type_code"`
				UserCount           int    `json:"user_count"`
				ViewCount           string `json:"view_count"`
				VoucherReleaseAreas any    `json:"voucher_release_areas"`
			} `json:"poi_info,omitempty"`
			PoiPatchInfo struct {
				Extra                  string `json:"extra"`
				ItemPatchPoiPromptMark int    `json:"item_patch_poi_prompt_mark"`
			} `json:"poi_patch_info"`
			Position             any    `json:"position"`
			PreventDownload      bool   `json:"prevent_download"`
			PreviewTitle         string `json:"preview_title"`
			PreviewVideoStatus   int    `json:"preview_video_status"`
			Promotions           []any  `json:"promotions"`
			Rate                 int    `json:"rate"`
			RefTtsIDList         any    `json:"ref_tts_id_list"`
			RefVoiceModifyIDList any    `json:"ref_voice_modify_id_list"`
			Region               string `json:"region"`
			RelationLabels       any    `json:"relation_labels"`
			ReportAction         bool   `json:"report_action"`
			RiskInfos            struct {
				Content   string `json:"content"`
				IconURL   string `json:"icon_url,omitempty"`
				RiskSink  bool   `json:"risk_sink"`
				Type      int    `json:"type"`
				URL       string `json:"url,omitempty"`
				Vote      bool   `json:"vote"`
				Warn      bool   `json:"warn"`
				WarnLevel int    `json:"warn_level,omitempty"`
			} `json:"risk_infos"`
			SearchImpr struct {
				EntityID   string `json:"entity_id"`
				EntityType string `json:"entity_type"`
			} `json:"search_impr"`
			SeoInfo        *struct{} `json:"seo_info,omitempty"`
			SeriesPaidInfo struct {
				ItemPrice        int `json:"item_price"`
				SeriesPaidStatus int `json:"series_paid_status"`
			} `json:"series_paid_info"`
			ShareFrom string `json:"share_from,omitempty"`
			ShareInfo *struct {
				BoolPersist        int    `json:"bool_persist"`
				ShareDesc          string `json:"share_desc"`
				ShareDescInfo      string `json:"share_desc_info"`
				ShareLinkDesc      string `json:"share_link_desc"`
				ShareQuote         string `json:"share_quote"`
				ShareSignatureDesc string `json:"share_signature_desc"`
				ShareSignatureURL  string `json:"share_signature_url"`
				ShareTitle         string `json:"share_title"`
				ShareTitleMyself   string `json:"share_title_myself"`
				ShareTitleOther    string `json:"share_title_other"`
				ShareURL           string `json:"share_url"`
				ShareWeiboDesc     string `json:"share_weibo_desc"`
			} `json:"share_info,omitempty"`
			ShareURL            string   `json:"share_url,omitempty"`
			ShouldOpenAdReport  bool     `json:"should_open_ad_report"`
			ShowFollowButton    struct{} `json:"show_follow_button"`
			SocialTagList       any      `json:"social_tag_list"`
			SortLabel           string   `json:"sort_label"`
			SpecialMode         int      `json:"special_mode,omitempty"`
			StandardBarInfoList any      `json:"standard_bar_info_list"`
			StarAtlasInfo       *struct {
				LogExtra string `json:"log_extra"`
			} `json:"star_atlas_info,omitempty"`
			Statistics struct {
				AdmireCount        int    `json:"admire_count"`
				AwemeID            string `json:"aweme_id"`
				CollectCount       int    `json:"collect_count"`
				CommentCount       int    `json:"comment_count"`
				Digest             string `json:"digest"`
				DiggCount          int    `json:"digg_count"`
				DownloadCount      int    `json:"download_count"`
				ExposureCount      int    `json:"exposure_count"`
				ForwardCount       int    `json:"forward_count"`
				LiveWatchCount     int    `json:"live_watch_count"`
				LoseCommentCount   int    `json:"lose_comment_count"`
				LoseCount          int    `json:"lose_count"`
				PlayCount          int    `json:"play_count"`
				ShareCount         int    `json:"share_count"`
				WhatsappShareCount int    `json:"whatsapp_share_count"`
			} `json:"statistics"`
			Status struct {
				AllowComment  bool `json:"allow_comment"`
				AllowShare    bool `json:"allow_share"`
				AwemeEditInfo struct {
					ButtonStatus int    `json:"button_status"`
					ButtonToast  string `json:"button_toast"`
				} `json:"aweme_edit_info"`
				AwemeID           string `json:"aweme_id"`
				DontShareStatus   int    `json:"dont_share_status"`
				DownloadStatus    int    `json:"download_status"`
				InReviewing       bool   `json:"in_reviewing"`
				IsDelete          bool   `json:"is_delete"`
				IsPrivate         bool   `json:"is_private"`
				IsProhibited      bool   `json:"is_prohibited"`
				ListenVideoStatus int    `json:"listen_video_status,omitempty"`
				PartSee           int    `json:"part_see"`
				PrivateStatus     int    `json:"private_status"`
				ReviewResult      struct {
					ReviewStatus int `json:"review_status"`
				} `json:"review_result"`
				Reviewed        int  `json:"reviewed"`
				SelfSee         bool `json:"self_see"`
				VideoHideSearch int  `json:"video_hide_search"`
				WithFusionGoods bool `json:"with_fusion_goods"`
				WithGoods       bool `json:"with_goods"`
			} `json:"status"`
			StickerDetail *struct {
				Children any `json:"children"`
				IconURL  struct {
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
				} `json:"icon_url"`
				ID             string `json:"id"`
				Name           string `json:"name"`
				SimilarSticker any    `json:"similar_sticker"`
				Tags           any    `json:"tags"`
				UserCount      int    `json:"user_count"`
			} `json:"sticker_detail,omitempty"`
			Stickers        string `json:"stickers,omitempty"`
			StorySourceType int    `json:"story_source_type,omitempty"`
			StoryTtl        int    `json:"story_ttl,omitempty"`
			SuggestWords    *struct {
				SuggestWords []struct {
					ExtraInfo string `json:"extra_info"`
					HintText  string `json:"hint_text"`
					IconURL   string `json:"icon_url"`
					Scene     string `json:"scene"`
					Words     []struct {
						Info   string `json:"info"`
						Word   string `json:"word"`
						WordID string `json:"word_id"`
					} `json:"words"`
				} `json:"suggest_words"`
			} `json:"suggest_words,omitempty"`
			TextExtra []struct {
				AwemeID       string `json:"aweme_id,omitempty"`
				End           int    `json:"end"`
				HashtagID     string `json:"hashtag_id,omitempty"`
				HashtagName   string `json:"hashtag_name,omitempty"`
				IsCommerce    bool   `json:"is_commerce"`
				SearchQueryID string `json:"search_query_id,omitempty"`
				SearchText    string `json:"search_text,omitempty"`
				SecUid        string `json:"sec_uid,omitempty"`
				Start         int    `json:"start"`
				SubType       int    `json:"sub_type,omitempty"`
				Type          int    `json:"type"`
				UserID        string `json:"user_id,omitempty"`
			} `json:"text_extra"`
			ToolBar             *struct{} `json:"tool_bar,omitempty"`
			TtsIDList           any       `json:"tts_id_list"`
			UniqidPosition      any       `json:"uniqid_position"`
			UserDigged          int       `json:"user_digged"`
			UserRecommendStatus int       `json:"user_recommend_status"`
			Video               struct {
				AnimatedCover *struct {
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
				} `json:"animated_cover,omitempty"`
				BigThumbs []struct {
					Duration float64 `json:"duration"`
					Fext     string  `json:"fext"`
					ImgNum   int     `json:"img_num"`
					ImgURL   string  `json:"img_url"`
					ImgXLen  int     `json:"img_x_len"`
					ImgXSize int     `json:"img_x_size"`
					ImgYLen  int     `json:"img_y_len"`
					ImgYSize int     `json:"img_y_size"`
					Interval float64 `json:"interval"`
					URI      string  `json:"uri"`
				} `json:"big_thumbs"`
				BitRate []struct {
					Fps       int    `json:"FPS,omitempty"`
					HdrBit    string `json:"HDR_bit"`
					HdrType   string `json:"HDR_type"`
					BitRate   int    `json:"bit_rate"`
					GearName  string `json:"gear_name"`
					IsBytevc1 int    `json:"is_bytevc1"`
					IsH265    int    `json:"is_h265"`
					PlayAddr  *struct {
						DataSize int      `json:"data_size"`
						FileCs   string   `json:"file_cs,omitempty"`
						FileHash string   `json:"file_hash"`
						Height   int      `json:"height"`
						URI      string   `json:"uri"`
						URLKey   string   `json:"url_key"`
						URLList  []string `json:"url_list"`
						Width    int      `json:"width"`
					} `json:"play_addr,omitempty"`
					QualityType int    `json:"quality_type"`
					VideoExtra  string `json:"video_extra"`
				} `json:"bit_rate"`
				CdnURLExpired int `json:"cdn_url_expired,omitempty"`
				Cover         struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"cover"`
				DownloadAddr *struct {
					DataSize int      `json:"data_size,omitempty"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"download_addr,omitempty"`
				DownloadSuffixLogoAddr *struct {
					DataSize int      `json:"data_size,omitempty"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"download_suffix_logo_addr,omitempty"`
				Duration     int `json:"duration"`
				DynamicCover *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"dynamic_cover,omitempty"`
				HasDownloadSuffixLogoAddr bool   `json:"has_download_suffix_logo_addr,omitempty"`
				HasWatermark              bool   `json:"has_watermark"`
				Height                    int    `json:"height"`
				HorizontalType            int    `json:"horizontal_type,omitempty"`
				IsBytevc1                 int    `json:"is_bytevc1"`
				IsCallback                bool   `json:"is_callback,omitempty"`
				IsH265                    int    `json:"is_h265"`
				IsLongVideo               int    `json:"is_long_video,omitempty"`
				IsSourceHdr               int    `json:"is_source_HDR,omitempty"`
				Meta                      string `json:"meta"`
				MiscDownloadAddrs         string `json:"misc_download_addrs,omitempty"`
				NeedSetToken              bool   `json:"need_set_token"`
				OptimizedCover            *struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"optimized_cover,omitempty"`
				OriginCover struct {
					Height  int      `json:"height"`
					URI     string   `json:"uri"`
					URLList []string `json:"url_list"`
					Width   int      `json:"width"`
				} `json:"origin_cover"`
				PlayAddr struct {
					DataSize int      `json:"data_size,omitempty"`
					FileCs   string   `json:"file_cs,omitempty"`
					FileHash string   `json:"file_hash,omitempty"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLKey   string   `json:"url_key"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"play_addr"`
				PlayAddr265 *struct {
					DataSize int      `json:"data_size"`
					FileCs   string   `json:"file_cs"`
					FileHash string   `json:"file_hash"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLKey   string   `json:"url_key"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"play_addr_265,omitempty"`
				PlayAddrH264 *struct {
					DataSize int      `json:"data_size"`
					FileCs   string   `json:"file_cs"`
					FileHash string   `json:"file_hash"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLKey   string   `json:"url_key"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"play_addr_h264,omitempty"`
				PlayAddrLowbr *struct {
					DataSize int      `json:"data_size,omitempty"`
					FileCs   string   `json:"file_cs,omitempty"`
					FileHash string   `json:"file_hash,omitempty"`
					Height   int      `json:"height"`
					URI      string   `json:"uri"`
					URLKey   string   `json:"url_key"`
					URLList  []string `json:"url_list"`
					Width    int      `json:"width"`
				} `json:"play_addr_lowbr,omitempty"`
				Ratio          string `json:"ratio"`
				Tags           any    `json:"tags"`
				UseStaticCover bool   `json:"use_static_cover"`
				VideoModel     string `json:"video_model"`
				Width          int    `json:"width"`
			} `json:"video"`
			VideoControl struct {
				AllowDouplus             bool `json:"allow_douplus"`
				AllowDownload            bool `json:"allow_download"`
				AllowDuet                bool `json:"allow_duet"`
				AllowDynamicWallpaper    bool `json:"allow_dynamic_wallpaper"`
				AllowMusic               bool `json:"allow_music"`
				AllowReact               bool `json:"allow_react"`
				AllowShare               bool `json:"allow_share"`
				AllowStitch              bool `json:"allow_stitch"`
				DownloadIgnoreVisibility bool `json:"download_ignore_visibility"`
				DownloadInfo             struct {
					FailInfo *struct {
						Code   int    `json:"code"`
						Msg    string `json:"msg,omitempty"`
						Reason string `json:"reason"`
					} `json:"fail_info,omitempty"`
					Level int `json:"level"`
				} `json:"download_info"`
				DraftProgressBar     int  `json:"draft_progress_bar"`
				DuetIgnoreVisibility bool `json:"duet_ignore_visibility"`
				DuetInfo             struct {
					FailInfo *struct {
						Code   int    `json:"code"`
						Msg    string `json:"msg,omitempty"`
						Reason string `json:"reason"`
					} `json:"fail_info,omitempty"`
					Level int `json:"level"`
				} `json:"duet_info"`
				PreventDownloadType   int  `json:"prevent_download_type"`
				ShareGrayed           bool `json:"share_grayed"`
				ShareIgnoreVisibility bool `json:"share_ignore_visibility"`
				ShareType             int  `json:"share_type"`
				ShowProgressBar       int  `json:"show_progress_bar"`
				TimerStatus           int  `json:"timer_status"`
			} `json:"video_control"`
			VideoLabels    []any `json:"video_labels"`
			VideoReplyInfo *struct {
				AliasCommentID int `json:"alias_comment_id"`
				AwemeID        int `json:"aweme_id"`
				CommentID      int `json:"comment_id"`
				ReplyUserID    int `json:"reply_user_id"`
			} `json:"video_reply_info,omitempty"`
			VideoTag []struct {
				Level   int    `json:"level"`
				TagID   int    `json:"tag_id"`
				TagName string `json:"tag_name"`
			} `json:"video_tag"`
			VideoText            []any `json:"video_text"`
			VoiceModifyIDList    any   `json:"voice_modify_id_list"`
			VrType               int   `json:"vr_type"`
			WithPromotionalMusic bool  `json:"with_promotional_music"`
			WithoutWatermark     bool  `json:"without_watermark"`
			XiguaTask            struct {
				IsXiguaTask bool `json:"is_xigua_task"`
			} `json:"xigua_task"`
		} `json:"item"`
		Type int `json:"type"`
	} `json:"aweme_list"`
	Cursor int `json:"cursor"`
	Extra  struct {
		FatalItemIds    []any  `json:"fatal_item_ids"`
		Logid           string `json:"logid"`
		Now             int    `json:"now"`
		SearchRequestID string `json:"search_request_id"`
	} `json:"extra"`
	GlobalDoodleConfig struct {
		HomeText    string `json:"home_text"`
		JumpGeneral int    `json:"jump_general"`
		Keyword     string `json:"keyword"`
	} `json:"global_doodle_config"`
	HasMore int `json:"has_more"`
	LogPb   struct {
		ImprID string `json:"impr_id"`
	} `json:"log_pb"`
	SearchNilInfo *struct {
		IsLoadMore    string `json:"is_load_more"`
		SearchNilItem string `json:"search_nil_item"`
		SearchNilType string `json:"search_nil_type"`
		TextType      int    `json:"text_type"`
	} `json:"search_nil_info,omitempty"`
	StatusCode int `json:"status_code"`
}


type SourceData struct {
	SpiderType string   `json:"spider_type"  ch:"spider_type"`
	Seed       string    `json:"seed" ch:"seed"`
	SpiderData string    `json:"spider_data" ch:"spider_data"`
	CreatedAt  time.Time `json:"created_at" ch:"created_at"`
}
func logR(err error){
	log.Panicln(err.Error())
}
func main() {
	var err error
	sql := "SELECT spider_type,seed,spider_data,created_at FROM spider_data.spider_dy_pc where spider_type = 'aweme_v1_web_aweme_post'"
	rows, err := clickhouse.ClickHouse.Query(context.Background(), sql)
	if err != nil {
		return
	}
	tts := make([]TT, 0)
	for rows.Next() {
		sourceData := SourceData{}
		err = rows.ScanStruct(&sourceData)
		if err != nil {
			return
		}
		t := T{}
		err = json.Unmarshal([]byte(sourceData.SpiderData), &t)
		if err != nil {
			return
		}
		tt := TT{}
		var (
			marshal []byte
		)
		tt.Cursor = t.Cursor
	marshal, err = json.Marshal(t.GlobalDoodleConfig)
	if err != nil {
		logR(err)
	}
	 tt.GlobalDoodleConfig = string(marshal)
	tt.HasMore = t.HasMore
	marshal, err = json.Marshal(t.LogPb)
	if err != nil {
		logR(err)
	}
	 tt.LogPb = string(marshal)
	marshal, err = json.Marshal(t.SearchNilInfo)
	if err != nil {
		logR(err)
	}
	 tt.SearchNilInfo = string(marshal)
	tt.StatusCode = t.StatusCode
	for _, awemeListI := range t.AwemeList {
	SpiderDataAwemeListItem := awemeListI.Item
	tt.AwemeListItemAdAwemeSource = SpiderDataAwemeListItem.AdAwemeSource
	marshal, err = json.Marshal(SpiderDataAwemeListItem.AncestorInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAncestorInfo = string(marshal)
	tt.AwemeListItemAnchors = fmt.Sprintf("%v", SpiderDataAwemeListItem.Anchors)
	tt.AwemeListItemAuthenticationToken = SpiderDataAwemeListItem.AuthenticationToken
	tt.AwemeListItemAuthorMaskTag = SpiderDataAwemeListItem.AuthorMaskTag
	tt.AwemeListItemAuthorUserId = SpiderDataAwemeListItem.AuthorUserID
	tt.AwemeListItemAwemeId = SpiderDataAwemeListItem.AwemeID
	tt.AwemeListItemAwemeType = SpiderDataAwemeListItem.AwemeType
	tt.AwemeListItemBodydanceScore = SpiderDataAwemeListItem.BodydanceScore
	marshal, err = json.Marshal(SpiderDataAwemeListItem.BookBar)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemBookBar = string(marshal)
	tt.AwemeListItemCategoryDa = SpiderDataAwemeListItem.CategoryDa
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ChaList)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemChaList = string(marshal)
	tt.AwemeListItemChallengePosition = fmt.Sprintf("%v", SpiderDataAwemeListItem.ChallengePosition)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ChapterList)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemChapterList = string(marshal)
	tt.AwemeListItemCity = SpiderDataAwemeListItem.City
	tt.AwemeListItemCmtSwt = SpiderDataAwemeListItem.CmtSwt
	tt.AwemeListItemCollectStat = SpiderDataAwemeListItem.CollectStat
	tt.AwemeListItemCollectionCornerMark = SpiderDataAwemeListItem.CollectionCornerMark
	tt.AwemeListItemCommentGid = SpiderDataAwemeListItem.CommentGid
	tt.AwemeListItemCommentList = fmt.Sprintf("%v", SpiderDataAwemeListItem.CommentList)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.CommentPermissionInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemCommentPermissionInfo = string(marshal)
	tt.AwemeListItemCommerceConfigData = fmt.Sprintf("%v", SpiderDataAwemeListItem.CommerceConfigData)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.CommerceInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemCommerceInfo = string(marshal)
	tt.AwemeListItemCommonBarInfo = SpiderDataAwemeListItem.CommonBarInfo
	tt.AwemeListItemComponentInfoV2 = SpiderDataAwemeListItem.ComponentInfoV2
	marshal, err = json.Marshal(SpiderDataAwemeListItem.CooperationInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemCooperationInfo = string(marshal)
	tt.AwemeListItemCoverLabels = fmt.Sprintf("%v", SpiderDataAwemeListItem.CoverLabels)
	tt.AwemeListItemCreateTime = SpiderDataAwemeListItem.CreateTime
	marshal, err = json.Marshal(SpiderDataAwemeListItem.CreateTimeConfig)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemCreateTimeConfig = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.DanmakuControl)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDanmakuControl = string(marshal)
	tt.AwemeListItemDesc = SpiderDataAwemeListItem.Desc
	tt.AwemeListItemDescLanguage = SpiderDataAwemeListItem.DescLanguage
	marshal, err = json.Marshal(SpiderDataAwemeListItem.Descendants)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDescendants = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.DiggLottie)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDiggLottie = string(marshal)
	tt.AwemeListItemDisableRelationBar = SpiderDataAwemeListItem.DisableRelationBar
	tt.AwemeListItemDislikeDimensionList = fmt.Sprintf("%v", SpiderDataAwemeListItem.DislikeDimensionList)
	tt.AwemeListItemDistance = SpiderDataAwemeListItem.Distance
	tt.AwemeListItemDistributeType = SpiderDataAwemeListItem.DistributeType
	tt.AwemeListItemDuetAggregateInMusicTab = SpiderDataAwemeListItem.DuetAggregateInMusicTab
	tt.AwemeListItemDuetOriginItemId = SpiderDataAwemeListItem.DuetOriginItemID
	tt.AwemeListItemDuration = SpiderDataAwemeListItem.Duration
	marshal, err = json.Marshal(SpiderDataAwemeListItem.GameInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemGameInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.Geofencing)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemGeofencing = string(marshal)
	tt.AwemeListItemGeofencingRegions = fmt.Sprintf("%v", SpiderDataAwemeListItem.GeofencingRegions)
	tt.AwemeListItemGroupId = SpiderDataAwemeListItem.GroupID
	tt.AwemeListItemGuideBtnType = SpiderDataAwemeListItem.GuideBtnType
	tt.AwemeListItemHasVsEntry = SpiderDataAwemeListItem.HasVsEntry
	tt.AwemeListItemHaveDashboard = SpiderDataAwemeListItem.HaveDashboard
	tt.AwemeListItemHorizontalType = SpiderDataAwemeListItem.HorizontalType
	tt.AwemeListItemHybridLabel = fmt.Sprintf("%v", SpiderDataAwemeListItem.HybridLabel)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ImageAlbumMusicInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImageAlbumMusicInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ImageComment)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImageComment = string(marshal)
	tt.AwemeListItemImageInfos = fmt.Sprintf("%v", SpiderDataAwemeListItem.ImageInfos)
	tt.AwemeListItemImageList = fmt.Sprintf("%v", SpiderDataAwemeListItem.ImageList)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.Images)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImages = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ImgBitrate)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImgBitrate = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.InteractionStickers)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemInteractionStickers = string(marshal)
	tt.AwemeListItemIsCollectsSelected = SpiderDataAwemeListItem.IsCollectsSelected
	tt.AwemeListItemIsDuetSing = SpiderDataAwemeListItem.IsDuetSing
	tt.AwemeListItemIsFantasy = SpiderDataAwemeListItem.IsFantasy
	tt.AwemeListItemIsFirstVideo = SpiderDataAwemeListItem.IsFirstVideo
	tt.AwemeListItemIsHashTag = SpiderDataAwemeListItem.IsHashTag
	tt.AwemeListItemIsImageBeat = SpiderDataAwemeListItem.IsImageBeat
	tt.AwemeListItemIsInScope = SpiderDataAwemeListItem.IsInScope
	tt.AwemeListItemIsKaraoke = SpiderDataAwemeListItem.IsKaraoke
	tt.AwemeListItemIsLifeItem = SpiderDataAwemeListItem.IsLifeItem
	tt.AwemeListItemIsMultiContent = SpiderDataAwemeListItem.IsMultiContent
	tt.AwemeListItemIsPgcshow = SpiderDataAwemeListItem.IsPgcshow
	tt.AwemeListItemIsPreview = SpiderDataAwemeListItem.IsPreview
	tt.AwemeListItemIsRelieve = SpiderDataAwemeListItem.IsRelieve
	tt.AwemeListItemIsSharePost = SpiderDataAwemeListItem.IsSharePost
	tt.AwemeListItemIsStory = SpiderDataAwemeListItem.IsStory
	tt.AwemeListItemIsTop = SpiderDataAwemeListItem.IsTop
	tt.AwemeListItemIsVr = SpiderDataAwemeListItem.IsVr
	tt.AwemeListItemItemCommentSettings = SpiderDataAwemeListItem.ItemCommentSettings
	tt.AwemeListItemItemDuet = SpiderDataAwemeListItem.ItemDuet
	tt.AwemeListItemItemReact = SpiderDataAwemeListItem.ItemReact
	tt.AwemeListItemItemShare = SpiderDataAwemeListItem.ItemShare
	tt.AwemeListItemItemStitch = SpiderDataAwemeListItem.ItemStitch
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ItemWarnNotification)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemItemWarnNotification = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.LabelTop)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemLabelTop = string(marshal)
	tt.AwemeListItemLabelTopText = fmt.Sprintf("%v", SpiderDataAwemeListItem.LabelTopText)
	tt.AwemeListItemLinkAdData = SpiderDataAwemeListItem.LinkAdData
	tt.AwemeListItemLiveId = SpiderDataAwemeListItem.LiveID
	tt.AwemeListItemLiveType = SpiderDataAwemeListItem.LiveType
	tt.AwemeListItemLongVideo = fmt.Sprintf("%v", SpiderDataAwemeListItem.LongVideo)
	tt.AwemeListItemMiscInfo = SpiderDataAwemeListItem.MiscInfo
	tt.AwemeListItemNearbyLevel = SpiderDataAwemeListItem.NearbyLevel
	tt.AwemeListItemNeedVsEntry = SpiderDataAwemeListItem.NeedVsEntry
	tt.AwemeListItemNicknamePosition = fmt.Sprintf("%v", SpiderDataAwemeListItem.NicknamePosition)
	tt.AwemeListItemOriginCommentIds = fmt.Sprintf("%v", SpiderDataAwemeListItem.OriginCommentIds)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.OriginTextExtra)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemOriginTextExtra = string(marshal)
	tt.AwemeListItemOriginalImages = fmt.Sprintf("%v", SpiderDataAwemeListItem.OriginalImages)
	tt.AwemeListItemPackedClips = fmt.Sprintf("%v", SpiderDataAwemeListItem.PackedClips)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.PhotoSearchEntrance)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPhotoSearchEntrance = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.PoiBiz)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiBiz = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.PoiPatchInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiPatchInfo = string(marshal)
	tt.AwemeListItemPosition = fmt.Sprintf("%v", SpiderDataAwemeListItem.Position)
	tt.AwemeListItemPreventDownload = SpiderDataAwemeListItem.PreventDownload
	tt.AwemeListItemPreviewTitle = SpiderDataAwemeListItem.PreviewTitle
	tt.AwemeListItemPreviewVideoStatus = SpiderDataAwemeListItem.PreviewVideoStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItem.Promotions)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPromotions = string(marshal)
	tt.AwemeListItemRate = SpiderDataAwemeListItem.Rate
	tt.AwemeListItemRefTtsIdList = fmt.Sprintf("%v", SpiderDataAwemeListItem.RefTtsIDList)
	tt.AwemeListItemRefVoiceModifyIdList = fmt.Sprintf("%v", SpiderDataAwemeListItem.RefVoiceModifyIDList)
	tt.AwemeListItemRegion = SpiderDataAwemeListItem.Region
	tt.AwemeListItemRelationLabels = fmt.Sprintf("%v", SpiderDataAwemeListItem.RelationLabels)
	tt.AwemeListItemReportAction = SpiderDataAwemeListItem.ReportAction
	marshal, err = json.Marshal(SpiderDataAwemeListItem.SearchImpr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemSearchImpr = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.SeoInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemSeoInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.SeriesPaidInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemSeriesPaidInfo = string(marshal)
	tt.AwemeListItemShareFrom = SpiderDataAwemeListItem.ShareFrom
	tt.AwemeListItemShareUrl = SpiderDataAwemeListItem.ShareURL
	tt.AwemeListItemShouldOpenAdReport = SpiderDataAwemeListItem.ShouldOpenAdReport
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ShowFollowButton)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemShowFollowButton = string(marshal)
	tt.AwemeListItemSocialTagList = fmt.Sprintf("%v", SpiderDataAwemeListItem.SocialTagList)
	tt.AwemeListItemSortLabel = SpiderDataAwemeListItem.SortLabel
	tt.AwemeListItemSpecialMode = SpiderDataAwemeListItem.SpecialMode
	tt.AwemeListItemStandardBarInfoList = fmt.Sprintf("%v", SpiderDataAwemeListItem.StandardBarInfoList)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.StarAtlasInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemStarAtlasInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.StickerDetail)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemStickerDetail = string(marshal)
	tt.AwemeListItemStickers = SpiderDataAwemeListItem.Stickers
	tt.AwemeListItemStorySourceType = SpiderDataAwemeListItem.StorySourceType
	tt.AwemeListItemStoryTtl = SpiderDataAwemeListItem.StoryTtl
	marshal, err = json.Marshal(SpiderDataAwemeListItem.TextExtra)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemTextExtra = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.ToolBar)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemToolBar = string(marshal)
	tt.AwemeListItemTtsIdList = fmt.Sprintf("%v", SpiderDataAwemeListItem.TtsIDList)
	tt.AwemeListItemUniqidPosition = fmt.Sprintf("%v", SpiderDataAwemeListItem.UniqidPosition)
	tt.AwemeListItemUserDigged = SpiderDataAwemeListItem.UserDigged
	tt.AwemeListItemUserRecommendStatus = SpiderDataAwemeListItem.UserRecommendStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItem.VideoLabels)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoLabels = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.VideoReplyInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoReplyInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.VideoTag)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoTag = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItem.VideoText)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoText = string(marshal)
	tt.AwemeListItemVoiceModifyIdList = fmt.Sprintf("%v", SpiderDataAwemeListItem.VoiceModifyIDList)
	tt.AwemeListItemVrType = SpiderDataAwemeListItem.VrType
	tt.AwemeListItemWithPromotionalMusic = SpiderDataAwemeListItem.WithPromotionalMusic
	tt.AwemeListItemWithoutWatermark = SpiderDataAwemeListItem.WithoutWatermark
	marshal, err = json.Marshal(SpiderDataAwemeListItem.XiguaTask)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemXiguaTask = string(marshal)
	SpiderDataAwemeListItemVideo := SpiderDataAwemeListItem.Video
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.AnimatedCover)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoAnimatedCover = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.BigThumbs)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoBigThumbs = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.BitRate)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoBitRate = string(marshal)
	tt.AwemeListItemVideoCdnUrlExpired = SpiderDataAwemeListItemVideo.CdnURLExpired
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.Cover)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoCover = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.DownloadAddr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoDownloadAddr = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.DownloadSuffixLogoAddr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoDownloadSuffixLogoAddr = string(marshal)
	tt.AwemeListItemVideoDuration = SpiderDataAwemeListItemVideo.Duration
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.DynamicCover)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoDynamicCover = string(marshal)
	tt.AwemeListItemVideoHasDownloadSuffixLogoAddr = SpiderDataAwemeListItemVideo.HasDownloadSuffixLogoAddr
	tt.AwemeListItemVideoHasWatermark = SpiderDataAwemeListItemVideo.HasWatermark
	tt.AwemeListItemVideoHeight = SpiderDataAwemeListItemVideo.Height
	tt.AwemeListItemVideoHorizontalType = SpiderDataAwemeListItemVideo.HorizontalType
	tt.AwemeListItemVideoIsBytevc1 = SpiderDataAwemeListItemVideo.IsBytevc1
	tt.AwemeListItemVideoIsCallback = SpiderDataAwemeListItemVideo.IsCallback
	tt.AwemeListItemVideoIsH265 = SpiderDataAwemeListItemVideo.IsH265
	tt.AwemeListItemVideoIsLongVideo = SpiderDataAwemeListItemVideo.IsLongVideo
	tt.AwemeListItemVideoIsSourceHDR = SpiderDataAwemeListItemVideo.IsSourceHdr
	tt.AwemeListItemVideoMeta = SpiderDataAwemeListItemVideo.Meta
	tt.AwemeListItemVideoMiscDownloadAddrs = SpiderDataAwemeListItemVideo.MiscDownloadAddrs
	tt.AwemeListItemVideoNeedSetToken = SpiderDataAwemeListItemVideo.NeedSetToken
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.OptimizedCover)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoOptimizedCover = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.OriginCover)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoOriginCover = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.PlayAddr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoPlayAddr = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.PlayAddr265)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoPlayAddr265 = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.PlayAddrH264)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoPlayAddrH264 = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideo.PlayAddrLowbr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoPlayAddrLowbr = string(marshal)
	tt.AwemeListItemVideoRatio = SpiderDataAwemeListItemVideo.Ratio
	tt.AwemeListItemVideoTags = fmt.Sprintf("%v", SpiderDataAwemeListItemVideo.Tags)
	tt.AwemeListItemVideoUseStaticCover = SpiderDataAwemeListItemVideo.UseStaticCover
	tt.AwemeListItemVideoVideoModel = SpiderDataAwemeListItemVideo.VideoModel
	tt.AwemeListItemVideoWidth = SpiderDataAwemeListItemVideo.Width
	SpiderDataAwemeListItemAnchorInfo := SpiderDataAwemeListItem.AnchorInfo
if SpiderDataAwemeListItemAnchorInfo != nil {tt.AwemeListItemAnchorInfoContent = SpiderDataAwemeListItemAnchorInfo.Content
	marshal, err = json.Marshal(SpiderDataAwemeListItemAnchorInfo.DisplayInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAnchorInfoDisplayInfo = string(marshal)
	tt.AwemeListItemAnchorInfoExtra = SpiderDataAwemeListItemAnchorInfo.Extra
	marshal, err = json.Marshal(SpiderDataAwemeListItemAnchorInfo.Icon)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAnchorInfoIcon = string(marshal)
	tt.AwemeListItemAnchorInfoId = SpiderDataAwemeListItemAnchorInfo.ID
	tt.AwemeListItemAnchorInfoLogExtra = SpiderDataAwemeListItemAnchorInfo.LogExtra
	tt.AwemeListItemAnchorInfoMpUrl = SpiderDataAwemeListItemAnchorInfo.MpURL
	tt.AwemeListItemAnchorInfoOpenUrl = SpiderDataAwemeListItemAnchorInfo.OpenURL
	marshal, err = json.Marshal(SpiderDataAwemeListItemAnchorInfo.StyleInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAnchorInfoStyleInfo = string(marshal)
	tt.AwemeListItemAnchorInfoTitle = SpiderDataAwemeListItemAnchorInfo.Title
	tt.AwemeListItemAnchorInfoTitleTag = SpiderDataAwemeListItemAnchorInfo.TitleTag
	tt.AwemeListItemAnchorInfoType = SpiderDataAwemeListItemAnchorInfo.Type
	tt.AwemeListItemAnchorInfoWebUrl = SpiderDataAwemeListItemAnchorInfo.WebURL}
	SpiderDataAwemeListItemHotList := SpiderDataAwemeListItem.HotList
if SpiderDataAwemeListItemHotList != nil {tt.AwemeListItemHotListExtra = SpiderDataAwemeListItemHotList.Extra
	tt.AwemeListItemHotListFooter = SpiderDataAwemeListItemHotList.Footer
	tt.AwemeListItemHotListGroupId = SpiderDataAwemeListItemHotList.GroupID
	tt.AwemeListItemHotListHeader = SpiderDataAwemeListItemHotList.Header
	tt.AwemeListItemHotListHotScore = SpiderDataAwemeListItemHotList.HotScore
	tt.AwemeListItemHotListI18nTitle = SpiderDataAwemeListItemHotList.I18nTitle
	tt.AwemeListItemHotListImageUrl = SpiderDataAwemeListItemHotList.ImageURL
	tt.AwemeListItemHotListPatternType = SpiderDataAwemeListItemHotList.PatternType
	tt.AwemeListItemHotListRank = SpiderDataAwemeListItemHotList.Rank
	tt.AwemeListItemHotListSchema = SpiderDataAwemeListItemHotList.Schema
	tt.AwemeListItemHotListSentence = SpiderDataAwemeListItemHotList.Sentence
	tt.AwemeListItemHotListSentenceId = SpiderDataAwemeListItemHotList.SentenceID
	tt.AwemeListItemHotListTitle = SpiderDataAwemeListItemHotList.Title
	tt.AwemeListItemHotListType = SpiderDataAwemeListItemHotList.Type
	tt.AwemeListItemHotListViewCount = SpiderDataAwemeListItemHotList.ViewCount}
	SpiderDataAwemeListItemMicroAppInfo := SpiderDataAwemeListItem.MicroAppInfo
if SpiderDataAwemeListItemMicroAppInfo != nil {tt.AwemeListItemMicroAppInfoAppId = SpiderDataAwemeListItemMicroAppInfo.AppID
	tt.AwemeListItemMicroAppInfoAppName = SpiderDataAwemeListItemMicroAppInfo.AppName
	tt.AwemeListItemMicroAppInfoDescription = SpiderDataAwemeListItemMicroAppInfo.Description
	tt.AwemeListItemMicroAppInfoIcon = SpiderDataAwemeListItemMicroAppInfo.Icon
	tt.AwemeListItemMicroAppInfoOrientation = SpiderDataAwemeListItemMicroAppInfo.Orientation
	tt.AwemeListItemMicroAppInfoSchema = SpiderDataAwemeListItemMicroAppInfo.Schema
	tt.AwemeListItemMicroAppInfoState = SpiderDataAwemeListItemMicroAppInfo.State
	tt.AwemeListItemMicroAppInfoSummary = SpiderDataAwemeListItemMicroAppInfo.Summary
	tt.AwemeListItemMicroAppInfoTitle = SpiderDataAwemeListItemMicroAppInfo.Title
	tt.AwemeListItemMicroAppInfoType = SpiderDataAwemeListItemMicroAppInfo.Type}
	SpiderDataAwemeListItemRiskInfos := SpiderDataAwemeListItem.RiskInfos
	tt.AwemeListItemRiskInfosContent = SpiderDataAwemeListItemRiskInfos.Content
	tt.AwemeListItemRiskInfosIconUrl = SpiderDataAwemeListItemRiskInfos.IconURL
	tt.AwemeListItemRiskInfosRiskSink = SpiderDataAwemeListItemRiskInfos.RiskSink
	tt.AwemeListItemRiskInfosType = SpiderDataAwemeListItemRiskInfos.Type
	tt.AwemeListItemRiskInfosUrl = SpiderDataAwemeListItemRiskInfos.URL
	tt.AwemeListItemRiskInfosVote = SpiderDataAwemeListItemRiskInfos.Vote
	tt.AwemeListItemRiskInfosWarn = SpiderDataAwemeListItemRiskInfos.Warn
	tt.AwemeListItemRiskInfosWarnLevel = SpiderDataAwemeListItemRiskInfos.WarnLevel
	SpiderDataAwemeListItemAuthor := SpiderDataAwemeListItem.Author
	tt.AwemeListItemAuthorAcceptPrivatePolicy = SpiderDataAwemeListItemAuthor.AcceptPrivatePolicy
	tt.AwemeListItemAuthorAccountRegion = SpiderDataAwemeListItemAuthor.AccountRegion
	tt.AwemeListItemAuthorAdCoverUrl = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.AdCoverURL)
	tt.AwemeListItemAuthorAppleAccount = SpiderDataAwemeListItemAuthor.AppleAccount
	tt.AwemeListItemAuthorAuthorityStatus = SpiderDataAwemeListItemAuthor.AuthorityStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.Avatar168x168)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorAvatar168x168 = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.Avatar300x300)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorAvatar300x300 = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.AvatarLarger)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorAvatarLarger = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.AvatarMedium)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorAvatarMedium = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.AvatarThumb)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorAvatarThumb = string(marshal)
	tt.AwemeListItemAuthorAvatarUri = SpiderDataAwemeListItemAuthor.AvatarURI
	tt.AwemeListItemAuthorAwemeCount = SpiderDataAwemeListItemAuthor.AwemeCount
	tt.AwemeListItemAuthorAwemeHotsoonAuth = SpiderDataAwemeListItemAuthor.AwemeHotsoonAuth
	tt.AwemeListItemAuthorAwemeHotsoonAuthRelation = SpiderDataAwemeListItemAuthor.AwemeHotsoonAuthRelation
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.BanUserFunctions)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorBanUserFunctions = string(marshal)
	tt.AwemeListItemAuthorBindPhone = SpiderDataAwemeListItemAuthor.BindPhone
	tt.AwemeListItemAuthorBirthday = SpiderDataAwemeListItemAuthor.Birthday
	tt.AwemeListItemAuthorCanSetGeofencing = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.CanSetGeofencing)
	tt.AwemeListItemAuthorCardEntries = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.CardEntries)
	tt.AwemeListItemAuthorCardEntriesNotDisplay = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.CardEntriesNotDisplay)
	tt.AwemeListItemAuthorCardSortPriority = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.CardSortPriority)
	tt.AwemeListItemAuthorCfList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.CfList)
	tt.AwemeListItemAuthorChaList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.ChaList)
	tt.AwemeListItemAuthorCloseFriendType = SpiderDataAwemeListItemAuthor.CloseFriendType
	tt.AwemeListItemAuthorCommentFilterStatus = SpiderDataAwemeListItemAuthor.CommentFilterStatus
	tt.AwemeListItemAuthorCommentSetting = SpiderDataAwemeListItemAuthor.CommentSetting
	tt.AwemeListItemAuthorCommerceUserLevel = SpiderDataAwemeListItemAuthor.CommerceUserLevel
	tt.AwemeListItemAuthorConstellation = SpiderDataAwemeListItemAuthor.Constellation
	tt.AwemeListItemAuthorContactsStatus = SpiderDataAwemeListItemAuthor.ContactsStatus
	tt.AwemeListItemAuthorContrailList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.ContrailList)
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.CoverURL)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorCoverUrl = string(marshal)
	tt.AwemeListItemAuthorCreateTime = SpiderDataAwemeListItemAuthor.CreateTime
	tt.AwemeListItemAuthorCustomVerify = SpiderDataAwemeListItemAuthor.CustomVerify
	tt.AwemeListItemAuthorCvLevel = SpiderDataAwemeListItemAuthor.CvLevel
	tt.AwemeListItemAuthorDataLabelList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.DataLabelList)
	tt.AwemeListItemAuthorDisplayInfo = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.DisplayInfo)
	tt.AwemeListItemAuthorDownloadPromptTs = SpiderDataAwemeListItemAuthor.DownloadPromptTs
	tt.AwemeListItemAuthorDownloadSetting = SpiderDataAwemeListItemAuthor.DownloadSetting
	tt.AwemeListItemAuthorDuetSetting = SpiderDataAwemeListItemAuthor.DuetSetting
	tt.AwemeListItemAuthorEnableNearbyVisible = SpiderDataAwemeListItemAuthor.EnableNearbyVisible
	tt.AwemeListItemAuthorEndorsementInfoList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.EndorsementInfoList)
	tt.AwemeListItemAuthorEnterpriseVerifyReason = SpiderDataAwemeListItemAuthor.EnterpriseVerifyReason
	tt.AwemeListItemAuthorFavoritingCount = SpiderDataAwemeListItemAuthor.FavoritingCount
	tt.AwemeListItemAuthorFbExpireTime = SpiderDataAwemeListItemAuthor.FbExpireTime
	tt.AwemeListItemAuthorFollowStatus = SpiderDataAwemeListItemAuthor.FollowStatus
	tt.AwemeListItemAuthorFollowerCount = SpiderDataAwemeListItemAuthor.FollowerCount
	tt.AwemeListItemAuthorFollowerListSecondaryInformationStruct = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.FollowerListSecondaryInformationStruct)
	tt.AwemeListItemAuthorFollowerRequestStatus = SpiderDataAwemeListItemAuthor.FollowerRequestStatus
	tt.AwemeListItemAuthorFollowerStatus = SpiderDataAwemeListItemAuthor.FollowerStatus
	tt.AwemeListItemAuthorFollowersDetail = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.FollowersDetail)
	tt.AwemeListItemAuthorFollowingCount = SpiderDataAwemeListItemAuthor.FollowingCount
	tt.AwemeListItemAuthorGender = SpiderDataAwemeListItemAuthor.Gender
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.Geofencing)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorGeofencing = string(marshal)
	tt.AwemeListItemAuthorGoogleAccount = SpiderDataAwemeListItemAuthor.GoogleAccount
	tt.AwemeListItemAuthorHasEmail = SpiderDataAwemeListItemAuthor.HasEmail
	tt.AwemeListItemAuthorHasFacebookToken = SpiderDataAwemeListItemAuthor.HasFacebookToken
	tt.AwemeListItemAuthorHasInsights = SpiderDataAwemeListItemAuthor.HasInsights
	tt.AwemeListItemAuthorHasOrders = SpiderDataAwemeListItemAuthor.HasOrders
	tt.AwemeListItemAuthorHasTwitterToken = SpiderDataAwemeListItemAuthor.HasTwitterToken
	tt.AwemeListItemAuthorHasUnreadStory = SpiderDataAwemeListItemAuthor.HasUnreadStory
	tt.AwemeListItemAuthorHasYoutubeToken = SpiderDataAwemeListItemAuthor.HasYoutubeToken
	tt.AwemeListItemAuthorHideLocation = SpiderDataAwemeListItemAuthor.HideLocation
	tt.AwemeListItemAuthorHideSearch = SpiderDataAwemeListItemAuthor.HideSearch
	tt.AwemeListItemAuthorHomepageBottomToast = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.HomepageBottomToast)
	tt.AwemeListItemAuthorImRoleIds = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.ImRoleIds)
	tt.AwemeListItemAuthorInsId = SpiderDataAwemeListItemAuthor.InsID
	tt.AwemeListItemAuthorInterestTags = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.InterestTags)
	tt.AwemeListItemAuthorIsAdFake = SpiderDataAwemeListItemAuthor.IsAdFake
	tt.AwemeListItemAuthorIsBindedWeibo = SpiderDataAwemeListItemAuthor.IsBindedWeibo
	tt.AwemeListItemAuthorIsBlock = SpiderDataAwemeListItemAuthor.IsBlock
	tt.AwemeListItemAuthorIsBlockedV2 = SpiderDataAwemeListItemAuthor.IsBlockedV2
	tt.AwemeListItemAuthorIsBlockingV2 = SpiderDataAwemeListItemAuthor.IsBlockingV2
	tt.AwemeListItemAuthorIsCf = SpiderDataAwemeListItemAuthor.IsCf
	tt.AwemeListItemAuthorIsDisciplineMember = SpiderDataAwemeListItemAuthor.IsDisciplineMember
	tt.AwemeListItemAuthorIsGovMediaVip = SpiderDataAwemeListItemAuthor.IsGovMediaVip
	tt.AwemeListItemAuthorIsMixUser = SpiderDataAwemeListItemAuthor.IsMixUser
	tt.AwemeListItemAuthorIsNotShow = SpiderDataAwemeListItemAuthor.IsNotShow
	tt.AwemeListItemAuthorIsPhoneBinded = SpiderDataAwemeListItemAuthor.IsPhoneBinded
	tt.AwemeListItemAuthorIsStar = SpiderDataAwemeListItemAuthor.IsStar
	tt.AwemeListItemAuthorIsVerified = SpiderDataAwemeListItemAuthor.IsVerified
	tt.AwemeListItemAuthorItemList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.ItemList)
	tt.AwemeListItemAuthorKyOnlyPredict = SpiderDataAwemeListItemAuthor.KyOnlyPredict
	tt.AwemeListItemAuthorLanguage = SpiderDataAwemeListItemAuthor.Language
	tt.AwemeListItemAuthorLinkItemList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.LinkItemList)
	tt.AwemeListItemAuthorLiveAgreement = SpiderDataAwemeListItemAuthor.LiveAgreement
	tt.AwemeListItemAuthorLiveAgreementTime = SpiderDataAwemeListItemAuthor.LiveAgreementTime
	tt.AwemeListItemAuthorLiveCommerce = SpiderDataAwemeListItemAuthor.LiveCommerce
	tt.AwemeListItemAuthorLiveStatus = SpiderDataAwemeListItemAuthor.LiveStatus
	tt.AwemeListItemAuthorLiveVerify = SpiderDataAwemeListItemAuthor.LiveVerify
	tt.AwemeListItemAuthorLocation = SpiderDataAwemeListItemAuthor.Location
	tt.AwemeListItemAuthorMaxFollowerCount = SpiderDataAwemeListItemAuthor.MaxFollowerCount
	tt.AwemeListItemAuthorNeedPoints = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.NeedPoints)
	tt.AwemeListItemAuthorNeedRecommend = SpiderDataAwemeListItemAuthor.NeedRecommend
	tt.AwemeListItemAuthorNeiguangShield = SpiderDataAwemeListItemAuthor.NeiguangShield
	tt.AwemeListItemAuthorNewStoryCover = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.NewStoryCover)
	tt.AwemeListItemAuthorNickname = SpiderDataAwemeListItemAuthor.Nickname
	tt.AwemeListItemAuthorNotSeenItemIdList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.NotSeenItemIDList)
	tt.AwemeListItemAuthorNotSeenItemIdListV2 = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.NotSeenItemIDListV2)
	tt.AwemeListItemAuthorOfflineInfoList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.OfflineInfoList)
	tt.AwemeListItemAuthorPersonalTagList = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.PersonalTagList)
	tt.AwemeListItemAuthorPlatformSyncInfo = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.PlatformSyncInfo)
	tt.AwemeListItemAuthorPreventDownload = SpiderDataAwemeListItemAuthor.PreventDownload
	tt.AwemeListItemAuthorReactSetting = SpiderDataAwemeListItemAuthor.ReactSetting
	tt.AwemeListItemAuthorReflowPageGid = SpiderDataAwemeListItemAuthor.ReflowPageGid
	tt.AwemeListItemAuthorReflowPageUid = SpiderDataAwemeListItemAuthor.ReflowPageUid
	tt.AwemeListItemAuthorRegion = SpiderDataAwemeListItemAuthor.Region
	tt.AwemeListItemAuthorRelativeUsers = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.RelativeUsers)
	tt.AwemeListItemAuthorRiskNoticeText = SpiderDataAwemeListItemAuthor.RiskNoticeText
	tt.AwemeListItemAuthorRoomData = SpiderDataAwemeListItemAuthor.RoomData
	tt.AwemeListItemAuthorRoomId = SpiderDataAwemeListItemAuthor.RoomID
	tt.AwemeListItemAuthorRoomIdStr = SpiderDataAwemeListItemAuthor.RoomIDStr
	tt.AwemeListItemAuthorSchoolCategory = SpiderDataAwemeListItemAuthor.SchoolCategory
	tt.AwemeListItemAuthorSchoolId = SpiderDataAwemeListItemAuthor.SchoolID
	tt.AwemeListItemAuthorSchoolName = SpiderDataAwemeListItemAuthor.SchoolName
	tt.AwemeListItemAuthorSchoolPoiId = SpiderDataAwemeListItemAuthor.SchoolPoiID
	tt.AwemeListItemAuthorSchoolType = SpiderDataAwemeListItemAuthor.SchoolType
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.SearchImpr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorSearchImpr = string(marshal)
	tt.AwemeListItemAuthorSecUid = SpiderDataAwemeListItemAuthor.SecUid
	tt.AwemeListItemAuthorSecret = SpiderDataAwemeListItemAuthor.Secret
	tt.AwemeListItemAuthorShareQrcodeUri = SpiderDataAwemeListItemAuthor.ShareQrcodeURI
	tt.AwemeListItemAuthorShieldCommentNotice = SpiderDataAwemeListItemAuthor.ShieldCommentNotice
	tt.AwemeListItemAuthorShieldDiggNotice = SpiderDataAwemeListItemAuthor.ShieldDiggNotice
	tt.AwemeListItemAuthorShieldFollowNotice = SpiderDataAwemeListItemAuthor.ShieldFollowNotice
	tt.AwemeListItemAuthorShortId = SpiderDataAwemeListItemAuthor.ShortID
	tt.AwemeListItemAuthorShowImageBubble = SpiderDataAwemeListItemAuthor.ShowImageBubble
	tt.AwemeListItemAuthorShowNearbyActive = SpiderDataAwemeListItemAuthor.ShowNearbyActive
	tt.AwemeListItemAuthorSignature = SpiderDataAwemeListItemAuthor.Signature
	tt.AwemeListItemAuthorSignatureDisplayLines = SpiderDataAwemeListItemAuthor.SignatureDisplayLines
	tt.AwemeListItemAuthorSignatureExtra = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.SignatureExtra)
	tt.AwemeListItemAuthorSpecialFollowStatus = SpiderDataAwemeListItemAuthor.SpecialFollowStatus
	tt.AwemeListItemAuthorSpecialLock = SpiderDataAwemeListItemAuthor.SpecialLock
	tt.AwemeListItemAuthorSpecialPeopleLabels = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.SpecialPeopleLabels)
	tt.AwemeListItemAuthorStatus = SpiderDataAwemeListItemAuthor.Status
	tt.AwemeListItemAuthorStitchSetting = SpiderDataAwemeListItemAuthor.StitchSetting
	tt.AwemeListItemAuthorStoryCount = SpiderDataAwemeListItemAuthor.StoryCount
	tt.AwemeListItemAuthorStoryOpen = SpiderDataAwemeListItemAuthor.StoryOpen
	tt.AwemeListItemAuthorSyncToToutiao = SpiderDataAwemeListItemAuthor.SyncToToutiao
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.TextExtra)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorTextExtra = string(marshal)
	tt.AwemeListItemAuthorTotalFavorited = SpiderDataAwemeListItemAuthor.TotalFavorited
	tt.AwemeListItemAuthorTwExpireTime = SpiderDataAwemeListItemAuthor.TwExpireTime
	tt.AwemeListItemAuthorTwitterId = SpiderDataAwemeListItemAuthor.TwitterID
	tt.AwemeListItemAuthorTwitterName = SpiderDataAwemeListItemAuthor.TwitterName
	tt.AwemeListItemAuthorTypeLabel = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.TypeLabel)
	tt.AwemeListItemAuthorUid = SpiderDataAwemeListItemAuthor.Uid
	tt.AwemeListItemAuthorUniqueId = SpiderDataAwemeListItemAuthor.UniqueID
	tt.AwemeListItemAuthorUniqueIdModifyTime = SpiderDataAwemeListItemAuthor.UniqueIDModifyTime
	tt.AwemeListItemAuthorUserAge = SpiderDataAwemeListItemAuthor.UserAge
	tt.AwemeListItemAuthorUserCanceled = SpiderDataAwemeListItemAuthor.UserCanceled
	tt.AwemeListItemAuthorUserMode = SpiderDataAwemeListItemAuthor.UserMode
	tt.AwemeListItemAuthorUserNotSee = SpiderDataAwemeListItemAuthor.UserNotSee
	tt.AwemeListItemAuthorUserNotShow = SpiderDataAwemeListItemAuthor.UserNotShow
	tt.AwemeListItemAuthorUserPeriod = SpiderDataAwemeListItemAuthor.UserPeriod
	tt.AwemeListItemAuthorUserPermissions = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.UserPermissions)
	tt.AwemeListItemAuthorUserRate = SpiderDataAwemeListItemAuthor.UserRate
	tt.AwemeListItemAuthorUserTags = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.UserTags)
	tt.AwemeListItemAuthorVerificationType = SpiderDataAwemeListItemAuthor.VerificationType
	tt.AwemeListItemAuthorVerifyInfo = SpiderDataAwemeListItemAuthor.VerifyInfo
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthor.VideoIcon)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorVideoIcon = string(marshal)
	tt.AwemeListItemAuthorWeiboName = SpiderDataAwemeListItemAuthor.WeiboName
	tt.AwemeListItemAuthorWeiboSchema = SpiderDataAwemeListItemAuthor.WeiboSchema
	tt.AwemeListItemAuthorWeiboUrl = SpiderDataAwemeListItemAuthor.WeiboURL
	tt.AwemeListItemAuthorWeiboVerify = SpiderDataAwemeListItemAuthor.WeiboVerify
	tt.AwemeListItemAuthorWhiteCoverUrl = fmt.Sprintf("%v", SpiderDataAwemeListItemAuthor.WhiteCoverURL)
	tt.AwemeListItemAuthorWithCommerceEntry = SpiderDataAwemeListItemAuthor.WithCommerceEntry
	tt.AwemeListItemAuthorWithDouEntry = SpiderDataAwemeListItemAuthor.WithDouEntry
	tt.AwemeListItemAuthorWithFusionShopEntry = SpiderDataAwemeListItemAuthor.WithFusionShopEntry
	tt.AwemeListItemAuthorWithShopEntry = SpiderDataAwemeListItemAuthor.WithShopEntry
	tt.AwemeListItemAuthorYoutubeChannelId = SpiderDataAwemeListItemAuthor.YoutubeChannelID
	tt.AwemeListItemAuthorYoutubeChannelTitle = SpiderDataAwemeListItemAuthor.YoutubeChannelTitle
	tt.AwemeListItemAuthorYoutubeExpireTime = SpiderDataAwemeListItemAuthor.YoutubeExpireTime
	SpiderDataAwemeListItemAuthorAwemeControl := SpiderDataAwemeListItemAuthor.AwemeControl
	tt.AwemeListItemAuthorAwemeControlCanComment = SpiderDataAwemeListItemAuthorAwemeControl.CanComment
	tt.AwemeListItemAuthorAwemeControlCanForward = SpiderDataAwemeListItemAuthorAwemeControl.CanForward
	tt.AwemeListItemAuthorAwemeControlCanShare = SpiderDataAwemeListItemAuthorAwemeControl.CanShare
	tt.AwemeListItemAuthorAwemeControlCanShowComment = SpiderDataAwemeListItemAuthorAwemeControl.CanShowComment
	SpiderDataAwemeListItemAuthorOriginalMusician := SpiderDataAwemeListItemAuthor.OriginalMusician
	tt.AwemeListItemAuthorOriginalMusicianDiggCount = SpiderDataAwemeListItemAuthorOriginalMusician.DiggCount
	tt.AwemeListItemAuthorOriginalMusicianMusicCount = SpiderDataAwemeListItemAuthorOriginalMusician.MusicCount
	tt.AwemeListItemAuthorOriginalMusicianMusicUsedCount = SpiderDataAwemeListItemAuthorOriginalMusician.MusicUsedCount
	SpiderDataAwemeListItemAuthorShareInfo := SpiderDataAwemeListItemAuthor.ShareInfo
	tt.AwemeListItemAuthorShareInfoShareDesc = SpiderDataAwemeListItemAuthorShareInfo.ShareDesc
	tt.AwemeListItemAuthorShareInfoShareDescInfo = SpiderDataAwemeListItemAuthorShareInfo.ShareDescInfo
	marshal, err = json.Marshal(SpiderDataAwemeListItemAuthorShareInfo.ShareQrcodeURL)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemAuthorShareInfoShareQrcodeUrl = string(marshal)
	tt.AwemeListItemAuthorShareInfoShareTitle = SpiderDataAwemeListItemAuthorShareInfo.ShareTitle
	tt.AwemeListItemAuthorShareInfoShareTitleMyself = SpiderDataAwemeListItemAuthorShareInfo.ShareTitleMyself
	tt.AwemeListItemAuthorShareInfoShareTitleOther = SpiderDataAwemeListItemAuthorShareInfo.ShareTitleOther
	tt.AwemeListItemAuthorShareInfoShareUrl = SpiderDataAwemeListItemAuthorShareInfo.ShareURL
	tt.AwemeListItemAuthorShareInfoShareWeiboDesc = SpiderDataAwemeListItemAuthorShareInfo.ShareWeiboDesc
	SpiderDataAwemeListItemMixInfo := SpiderDataAwemeListItem.MixInfo
if SpiderDataAwemeListItemMixInfo != nil {marshal, err = json.Marshal(SpiderDataAwemeListItemMixInfo.CoverURL)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMixInfoCoverUrl = string(marshal)
	tt.AwemeListItemMixInfoCreateTime = SpiderDataAwemeListItemMixInfo.CreateTime
	tt.AwemeListItemMixInfoDesc = SpiderDataAwemeListItemMixInfo.Desc
	tt.AwemeListItemMixInfoExtra = SpiderDataAwemeListItemMixInfo.Extra
	tt.AwemeListItemMixInfoIds = fmt.Sprintf("%v", SpiderDataAwemeListItemMixInfo.Ids)
	tt.AwemeListItemMixInfoIsSerialMix = SpiderDataAwemeListItemMixInfo.IsSerialMix
	tt.AwemeListItemMixInfoMixId = SpiderDataAwemeListItemMixInfo.MixID
	tt.AwemeListItemMixInfoMixName = SpiderDataAwemeListItemMixInfo.MixName
	tt.AwemeListItemMixInfoMixPicType = SpiderDataAwemeListItemMixInfo.MixPicType
	tt.AwemeListItemMixInfoMixType = SpiderDataAwemeListItemMixInfo.MixType
	marshal, err = json.Marshal(SpiderDataAwemeListItemMixInfo.Status)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMixInfoStatus = string(marshal)
	tt.AwemeListItemMixInfoUpdateTime = SpiderDataAwemeListItemMixInfo.UpdateTime
	tt.AwemeListItemMixInfoWatchedItem = SpiderDataAwemeListItemMixInfo.WatchedItem}
	SpiderDataAwemeListItemMusic := SpiderDataAwemeListItem.Music
if SpiderDataAwemeListItemMusic != nil {tt.AwemeListItemMusicAlbum = SpiderDataAwemeListItemMusic.Album
	tt.AwemeListItemMusicArtistUserInfos = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.ArtistUserInfos)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.Artists)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicArtists = string(marshal)
	tt.AwemeListItemMusicAuditionDuration = SpiderDataAwemeListItemMusic.AuditionDuration
	tt.AwemeListItemMusicAuthor = SpiderDataAwemeListItemMusic.Author
	tt.AwemeListItemMusicAuthorDeleted = SpiderDataAwemeListItemMusic.AuthorDeleted
	tt.AwemeListItemMusicAuthorPosition = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.AuthorPosition)
	tt.AwemeListItemMusicAuthorStatus = SpiderDataAwemeListItemMusic.AuthorStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.AvatarLarge)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicAvatarLarge = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.AvatarMedium)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicAvatarMedium = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.AvatarThumb)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicAvatarThumb = string(marshal)
	tt.AwemeListItemMusicBindedChallengeId = SpiderDataAwemeListItemMusic.BindedChallengeID
	tt.AwemeListItemMusicCanBackgroundPlay = SpiderDataAwemeListItemMusic.CanBackgroundPlay
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.Climax)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicClimax = string(marshal)
	tt.AwemeListItemMusicCollectStat = SpiderDataAwemeListItemMusic.CollectStat
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.CoverColorHsv)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicCoverColorHsv = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.CoverHd)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicCoverHd = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.CoverLarge)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicCoverLarge = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.CoverMedium)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicCoverMedium = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.CoverThumb)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicCoverThumb = string(marshal)
	tt.AwemeListItemMusicDmvAutoShow = SpiderDataAwemeListItemMusic.DmvAutoShow
	tt.AwemeListItemMusicDspStatus = SpiderDataAwemeListItemMusic.DspStatus
	tt.AwemeListItemMusicDuration = SpiderDataAwemeListItemMusic.Duration
	tt.AwemeListItemMusicEndTime = SpiderDataAwemeListItemMusic.EndTime
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.ExternalSongInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicExternalSongInfo = string(marshal)
	tt.AwemeListItemMusicExtra = SpiderDataAwemeListItemMusic.Extra
	tt.AwemeListItemMusicId = SpiderDataAwemeListItemMusic.ID
	tt.AwemeListItemMusicIdStr = SpiderDataAwemeListItemMusic.IDStr
	tt.AwemeListItemMusicIsAudioUrlWithCookie = SpiderDataAwemeListItemMusic.IsAudioURLWithCookie
	tt.AwemeListItemMusicIsCommerceMusic = SpiderDataAwemeListItemMusic.IsCommerceMusic
	tt.AwemeListItemMusicIsDelVideo = SpiderDataAwemeListItemMusic.IsDelVideo
	tt.AwemeListItemMusicIsMatchedMetadata = SpiderDataAwemeListItemMusic.IsMatchedMetadata
	tt.AwemeListItemMusicIsOriginal = SpiderDataAwemeListItemMusic.IsOriginal
	tt.AwemeListItemMusicIsOriginalSound = SpiderDataAwemeListItemMusic.IsOriginalSound
	tt.AwemeListItemMusicIsPgc = SpiderDataAwemeListItemMusic.IsPgc
	tt.AwemeListItemMusicIsRestricted = SpiderDataAwemeListItemMusic.IsRestricted
	tt.AwemeListItemMusicIsVideoSelfSee = SpiderDataAwemeListItemMusic.IsVideoSelfSee
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.LunaInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicLunaInfo = string(marshal)
	tt.AwemeListItemMusicLyricShortPosition = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.LyricShortPosition)
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.MatchedPgcSound)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicMatchedPgcSound = string(marshal)
	tt.AwemeListItemMusicMid = SpiderDataAwemeListItemMusic.Mid
	tt.AwemeListItemMusicMusicChartRanks = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.MusicChartRanks)
	tt.AwemeListItemMusicMusicStatus = SpiderDataAwemeListItemMusic.MusicStatus
	tt.AwemeListItemMusicMusicianUserInfos = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.MusicianUserInfos)
	tt.AwemeListItemMusicMuteShare = SpiderDataAwemeListItemMusic.MuteShare
	tt.AwemeListItemMusicOfflineDesc = SpiderDataAwemeListItemMusic.OfflineDesc
	tt.AwemeListItemMusicOwnerHandle = SpiderDataAwemeListItemMusic.OwnerHandle
	tt.AwemeListItemMusicOwnerId = SpiderDataAwemeListItemMusic.OwnerID
	tt.AwemeListItemMusicOwnerNickname = SpiderDataAwemeListItemMusic.OwnerNickname
	tt.AwemeListItemMusicPgcMusicType = SpiderDataAwemeListItemMusic.PgcMusicType
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.PlayURL)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicPlayUrl = string(marshal)
	tt.AwemeListItemMusicPosition = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.Position)
	tt.AwemeListItemMusicPreventDownload = SpiderDataAwemeListItemMusic.PreventDownload
	tt.AwemeListItemMusicPreventItemDownloadStatus = SpiderDataAwemeListItemMusic.PreventItemDownloadStatus
	tt.AwemeListItemMusicPreviewEndTime = SpiderDataAwemeListItemMusic.PreviewEndTime
	tt.AwemeListItemMusicPreviewStartTime = SpiderDataAwemeListItemMusic.PreviewStartTime
	tt.AwemeListItemMusicReasonType = SpiderDataAwemeListItemMusic.ReasonType
	tt.AwemeListItemMusicRedirect = SpiderDataAwemeListItemMusic.Redirect
	tt.AwemeListItemMusicSchemaUrl = SpiderDataAwemeListItemMusic.SchemaURL
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.SearchImpr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicSearchImpr = string(marshal)
	tt.AwemeListItemMusicSecUid = SpiderDataAwemeListItemMusic.SecUid
	tt.AwemeListItemMusicShootDuration = SpiderDataAwemeListItemMusic.ShootDuration
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.Song)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicSong = string(marshal)
	tt.AwemeListItemMusicSourcePlatform = SpiderDataAwemeListItemMusic.SourcePlatform
	tt.AwemeListItemMusicStartTime = SpiderDataAwemeListItemMusic.StartTime
	tt.AwemeListItemMusicStatus = SpiderDataAwemeListItemMusic.Status
	marshal, err = json.Marshal(SpiderDataAwemeListItemMusic.StrongBeatURL)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemMusicStrongBeatUrl = string(marshal)
	tt.AwemeListItemMusicTagList = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.TagList)
	tt.AwemeListItemMusicTitle = SpiderDataAwemeListItemMusic.Title
	tt.AwemeListItemMusicUnshelveCountries = fmt.Sprintf("%v", SpiderDataAwemeListItemMusic.UnshelveCountries)
	tt.AwemeListItemMusicUserCount = SpiderDataAwemeListItemMusic.UserCount
	tt.AwemeListItemMusicVideoDuration = SpiderDataAwemeListItemMusic.VideoDuration}
	SpiderDataAwemeListItemStatus := SpiderDataAwemeListItem.Status
	tt.AwemeListItemStatusAllowComment = SpiderDataAwemeListItemStatus.AllowComment
	tt.AwemeListItemStatusAllowShare = SpiderDataAwemeListItemStatus.AllowShare
	marshal, err = json.Marshal(SpiderDataAwemeListItemStatus.AwemeEditInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemStatusAwemeEditInfo = string(marshal)
	tt.AwemeListItemStatusAwemeId = SpiderDataAwemeListItemStatus.AwemeID
	tt.AwemeListItemStatusDontShareStatus = SpiderDataAwemeListItemStatus.DontShareStatus
	tt.AwemeListItemStatusDownloadStatus = SpiderDataAwemeListItemStatus.DownloadStatus
	tt.AwemeListItemStatusInReviewing = SpiderDataAwemeListItemStatus.InReviewing
	tt.AwemeListItemStatusIsDelete = SpiderDataAwemeListItemStatus.IsDelete
	tt.AwemeListItemStatusIsPrivate = SpiderDataAwemeListItemStatus.IsPrivate
	tt.AwemeListItemStatusIsProhibited = SpiderDataAwemeListItemStatus.IsProhibited
	tt.AwemeListItemStatusListenVideoStatus = SpiderDataAwemeListItemStatus.ListenVideoStatus
	tt.AwemeListItemStatusPartSee = SpiderDataAwemeListItemStatus.PartSee
	tt.AwemeListItemStatusPrivateStatus = SpiderDataAwemeListItemStatus.PrivateStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItemStatus.ReviewResult)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemStatusReviewResult = string(marshal)
	tt.AwemeListItemStatusReviewed = SpiderDataAwemeListItemStatus.Reviewed
	tt.AwemeListItemStatusSelfSee = SpiderDataAwemeListItemStatus.SelfSee
	tt.AwemeListItemStatusVideoHideSearch = SpiderDataAwemeListItemStatus.VideoHideSearch
	tt.AwemeListItemStatusWithFusionGoods = SpiderDataAwemeListItemStatus.WithFusionGoods
	tt.AwemeListItemStatusWithGoods = SpiderDataAwemeListItemStatus.WithGoods
	SpiderDataAwemeListItemStatistics := SpiderDataAwemeListItem.Statistics
	tt.AwemeListItemStatisticsAdmireCount = SpiderDataAwemeListItemStatistics.AdmireCount
	tt.AwemeListItemStatisticsAwemeId = SpiderDataAwemeListItemStatistics.AwemeID
	tt.AwemeListItemStatisticsCollectCount = SpiderDataAwemeListItemStatistics.CollectCount
	tt.AwemeListItemStatisticsCommentCount = SpiderDataAwemeListItemStatistics.CommentCount
	tt.AwemeListItemStatisticsDigest = SpiderDataAwemeListItemStatistics.Digest
	tt.AwemeListItemStatisticsDiggCount = SpiderDataAwemeListItemStatistics.DiggCount
	tt.AwemeListItemStatisticsDownloadCount = SpiderDataAwemeListItemStatistics.DownloadCount
	tt.AwemeListItemStatisticsExposureCount = SpiderDataAwemeListItemStatistics.ExposureCount
	tt.AwemeListItemStatisticsForwardCount = SpiderDataAwemeListItemStatistics.ForwardCount
	tt.AwemeListItemStatisticsLiveWatchCount = SpiderDataAwemeListItemStatistics.LiveWatchCount
	tt.AwemeListItemStatisticsLoseCommentCount = SpiderDataAwemeListItemStatistics.LoseCommentCount
	tt.AwemeListItemStatisticsLoseCount = SpiderDataAwemeListItemStatistics.LoseCount
	tt.AwemeListItemStatisticsPlayCount = SpiderDataAwemeListItemStatistics.PlayCount
	tt.AwemeListItemStatisticsShareCount = SpiderDataAwemeListItemStatistics.ShareCount
	tt.AwemeListItemStatisticsWhatsappShareCount = SpiderDataAwemeListItemStatistics.WhatsappShareCount
	SpiderDataAwemeListItemSuggestWords := SpiderDataAwemeListItem.SuggestWords
if SpiderDataAwemeListItemSuggestWords != nil {marshal, err = json.Marshal(SpiderDataAwemeListItemSuggestWords.SuggestWords)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemSuggestWordsSuggestWords = string(marshal)}
	SpiderDataAwemeListItemAwemeAcl := SpiderDataAwemeListItem.AwemeAcl
if SpiderDataAwemeListItemAwemeAcl != nil {}
	SpiderDataAwemeListItemAwemeControl := SpiderDataAwemeListItem.AwemeControl
	tt.AwemeListItemAwemeControlCanComment = SpiderDataAwemeListItemAwemeControl.CanComment
	tt.AwemeListItemAwemeControlCanForward = SpiderDataAwemeListItemAwemeControl.CanForward
	tt.AwemeListItemAwemeControlCanShare = SpiderDataAwemeListItemAwemeControl.CanShare
	tt.AwemeListItemAwemeControlCanShowComment = SpiderDataAwemeListItemAwemeControl.CanShowComment
	SpiderDataAwemeListItemDuetOriginItem := SpiderDataAwemeListItem.DuetOriginItem
if SpiderDataAwemeListItemDuetOriginItem != nil {tt.AwemeListItemDuetOriginItemAdAwemeSource = SpiderDataAwemeListItemDuetOriginItem.AdAwemeSource
	tt.AwemeListItemDuetOriginItemAnchors = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.Anchors)
	tt.AwemeListItemDuetOriginItemAuthenticationToken = SpiderDataAwemeListItemDuetOriginItem.AuthenticationToken
	tt.AwemeListItemDuetOriginItemAuthorMaskTag = SpiderDataAwemeListItemDuetOriginItem.AuthorMaskTag
	tt.AwemeListItemDuetOriginItemAuthorUserId = SpiderDataAwemeListItemDuetOriginItem.AuthorUserID
	tt.AwemeListItemDuetOriginItemAwemeId = SpiderDataAwemeListItemDuetOriginItem.AwemeID
	tt.AwemeListItemDuetOriginItemAwemeType = SpiderDataAwemeListItemDuetOriginItem.AwemeType
	tt.AwemeListItemDuetOriginItemBodydanceScore = SpiderDataAwemeListItemDuetOriginItem.BodydanceScore
	tt.AwemeListItemDuetOriginItemChaList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ChaList)
	tt.AwemeListItemDuetOriginItemChallengePosition = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ChallengePosition)
	tt.AwemeListItemDuetOriginItemChapterList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ChapterList)
	tt.AwemeListItemDuetOriginItemCity = SpiderDataAwemeListItemDuetOriginItem.City
	tt.AwemeListItemDuetOriginItemCmtSwt = SpiderDataAwemeListItemDuetOriginItem.CmtSwt
	tt.AwemeListItemDuetOriginItemCollectStat = SpiderDataAwemeListItemDuetOriginItem.CollectStat
	tt.AwemeListItemDuetOriginItemCollectionCornerMark = SpiderDataAwemeListItemDuetOriginItem.CollectionCornerMark
	tt.AwemeListItemDuetOriginItemCommentGid = SpiderDataAwemeListItemDuetOriginItem.CommentGid
	tt.AwemeListItemDuetOriginItemCommentList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.CommentList)
	tt.AwemeListItemDuetOriginItemCommerceConfigData = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.CommerceConfigData)
	tt.AwemeListItemDuetOriginItemCommonBarInfo = SpiderDataAwemeListItemDuetOriginItem.CommonBarInfo
	tt.AwemeListItemDuetOriginItemComponentInfoV2 = SpiderDataAwemeListItemDuetOriginItem.ComponentInfoV2
	tt.AwemeListItemDuetOriginItemCoverLabels = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.CoverLabels)
	tt.AwemeListItemDuetOriginItemCreateTime = SpiderDataAwemeListItemDuetOriginItem.CreateTime
	tt.AwemeListItemDuetOriginItemDesc = SpiderDataAwemeListItemDuetOriginItem.Desc
	tt.AwemeListItemDuetOriginItemDescLanguage = SpiderDataAwemeListItemDuetOriginItem.DescLanguage
	tt.AwemeListItemDuetOriginItemDisableRelationBar = SpiderDataAwemeListItemDuetOriginItem.DisableRelationBar
	tt.AwemeListItemDuetOriginItemDislikeDimensionList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.DislikeDimensionList)
	tt.AwemeListItemDuetOriginItemDistance = SpiderDataAwemeListItemDuetOriginItem.Distance
	tt.AwemeListItemDuetOriginItemDistributeType = SpiderDataAwemeListItemDuetOriginItem.DistributeType
	tt.AwemeListItemDuetOriginItemDuetAggregateInMusicTab = SpiderDataAwemeListItemDuetOriginItem.DuetAggregateInMusicTab
	tt.AwemeListItemDuetOriginItemDuration = SpiderDataAwemeListItemDuetOriginItem.Duration
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.Geofencing)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemGeofencing = string(marshal)
	tt.AwemeListItemDuetOriginItemGeofencingRegions = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.GeofencingRegions)
	tt.AwemeListItemDuetOriginItemGroupId = SpiderDataAwemeListItemDuetOriginItem.GroupID
	tt.AwemeListItemDuetOriginItemGuideBtnType = SpiderDataAwemeListItemDuetOriginItem.GuideBtnType
	tt.AwemeListItemDuetOriginItemHasVsEntry = SpiderDataAwemeListItemDuetOriginItem.HasVsEntry
	tt.AwemeListItemDuetOriginItemHaveDashboard = SpiderDataAwemeListItemDuetOriginItem.HaveDashboard
	tt.AwemeListItemDuetOriginItemHorizontalType = SpiderDataAwemeListItemDuetOriginItem.HorizontalType
	tt.AwemeListItemDuetOriginItemHybridLabel = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.HybridLabel)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.ImageAlbumMusicInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemImageAlbumMusicInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.ImageComment)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemImageComment = string(marshal)
	tt.AwemeListItemDuetOriginItemImageInfos = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ImageInfos)
	tt.AwemeListItemDuetOriginItemImageList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ImageList)
	tt.AwemeListItemDuetOriginItemImages = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.Images)
	tt.AwemeListItemDuetOriginItemImgBitrate = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.ImgBitrate)
	tt.AwemeListItemDuetOriginItemInteractionStickers = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.InteractionStickers)
	tt.AwemeListItemDuetOriginItemIsCollectsSelected = SpiderDataAwemeListItemDuetOriginItem.IsCollectsSelected
	tt.AwemeListItemDuetOriginItemIsDuetSing = SpiderDataAwemeListItemDuetOriginItem.IsDuetSing
	tt.AwemeListItemDuetOriginItemIsFantasy = SpiderDataAwemeListItemDuetOriginItem.IsFantasy
	tt.AwemeListItemDuetOriginItemIsFirstVideo = SpiderDataAwemeListItemDuetOriginItem.IsFirstVideo
	tt.AwemeListItemDuetOriginItemIsHashTag = SpiderDataAwemeListItemDuetOriginItem.IsHashTag
	tt.AwemeListItemDuetOriginItemIsImageBeat = SpiderDataAwemeListItemDuetOriginItem.IsImageBeat
	tt.AwemeListItemDuetOriginItemIsInScope = SpiderDataAwemeListItemDuetOriginItem.IsInScope
	tt.AwemeListItemDuetOriginItemIsKaraoke = SpiderDataAwemeListItemDuetOriginItem.IsKaraoke
	tt.AwemeListItemDuetOriginItemIsLifeItem = SpiderDataAwemeListItemDuetOriginItem.IsLifeItem
	tt.AwemeListItemDuetOriginItemIsPgcshow = SpiderDataAwemeListItemDuetOriginItem.IsPgcshow
	tt.AwemeListItemDuetOriginItemIsPreview = SpiderDataAwemeListItemDuetOriginItem.IsPreview
	tt.AwemeListItemDuetOriginItemIsRelieve = SpiderDataAwemeListItemDuetOriginItem.IsRelieve
	tt.AwemeListItemDuetOriginItemIsSharePost = SpiderDataAwemeListItemDuetOriginItem.IsSharePost
	tt.AwemeListItemDuetOriginItemIsStory = SpiderDataAwemeListItemDuetOriginItem.IsStory
	tt.AwemeListItemDuetOriginItemIsTop = SpiderDataAwemeListItemDuetOriginItem.IsTop
	tt.AwemeListItemDuetOriginItemIsVr = SpiderDataAwemeListItemDuetOriginItem.IsVr
	tt.AwemeListItemDuetOriginItemItemCommentSettings = SpiderDataAwemeListItemDuetOriginItem.ItemCommentSettings
	tt.AwemeListItemDuetOriginItemItemDuet = SpiderDataAwemeListItemDuetOriginItem.ItemDuet
	tt.AwemeListItemDuetOriginItemItemReact = SpiderDataAwemeListItemDuetOriginItem.ItemReact
	tt.AwemeListItemDuetOriginItemItemShare = SpiderDataAwemeListItemDuetOriginItem.ItemShare
	tt.AwemeListItemDuetOriginItemItemStitch = SpiderDataAwemeListItemDuetOriginItem.ItemStitch
	tt.AwemeListItemDuetOriginItemLabelTopText = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.LabelTopText)
	tt.AwemeListItemDuetOriginItemLongVideo = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.LongVideo)
	tt.AwemeListItemDuetOriginItemMiscInfo = SpiderDataAwemeListItemDuetOriginItem.MiscInfo
	tt.AwemeListItemDuetOriginItemNearbyLevel = SpiderDataAwemeListItemDuetOriginItem.NearbyLevel
	tt.AwemeListItemDuetOriginItemNeedVsEntry = SpiderDataAwemeListItemDuetOriginItem.NeedVsEntry
	tt.AwemeListItemDuetOriginItemNicknamePosition = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.NicknamePosition)
	tt.AwemeListItemDuetOriginItemOriginCommentIds = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.OriginCommentIds)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.OriginTextExtra)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemOriginTextExtra = string(marshal)
	tt.AwemeListItemDuetOriginItemOriginalImages = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.OriginalImages)
	tt.AwemeListItemDuetOriginItemPackedClips = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.PackedClips)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.PhotoSearchEntrance)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemPhotoSearchEntrance = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.PoiBiz)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemPoiBiz = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.PoiPatchInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemPoiPatchInfo = string(marshal)
	tt.AwemeListItemDuetOriginItemPosition = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.Position)
	tt.AwemeListItemDuetOriginItemPreventDownload = SpiderDataAwemeListItemDuetOriginItem.PreventDownload
	tt.AwemeListItemDuetOriginItemPreviewTitle = SpiderDataAwemeListItemDuetOriginItem.PreviewTitle
	tt.AwemeListItemDuetOriginItemPreviewVideoStatus = SpiderDataAwemeListItemDuetOriginItem.PreviewVideoStatus
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.Promotions)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemPromotions = string(marshal)
	tt.AwemeListItemDuetOriginItemRate = SpiderDataAwemeListItemDuetOriginItem.Rate
	tt.AwemeListItemDuetOriginItemRefTtsIdList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.RefTtsIDList)
	tt.AwemeListItemDuetOriginItemRefVoiceModifyIdList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.RefVoiceModifyIDList)
	tt.AwemeListItemDuetOriginItemRegion = SpiderDataAwemeListItemDuetOriginItem.Region
	tt.AwemeListItemDuetOriginItemRelationLabels = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.RelationLabels)
	tt.AwemeListItemDuetOriginItemReportAction = SpiderDataAwemeListItemDuetOriginItem.ReportAction
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.SearchImpr)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemSearchImpr = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.SeoInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemSeoInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.SeriesPaidInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemSeriesPaidInfo = string(marshal)
	tt.AwemeListItemDuetOriginItemShouldOpenAdReport = SpiderDataAwemeListItemDuetOriginItem.ShouldOpenAdReport
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.ShowFollowButton)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemShowFollowButton = string(marshal)
	tt.AwemeListItemDuetOriginItemSocialTagList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.SocialTagList)
	tt.AwemeListItemDuetOriginItemSortLabel = SpiderDataAwemeListItemDuetOriginItem.SortLabel
	tt.AwemeListItemDuetOriginItemStandardBarInfoList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.StandardBarInfoList)
	tt.AwemeListItemDuetOriginItemStoryTtl = SpiderDataAwemeListItemDuetOriginItem.StoryTtl
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.TextExtra)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemTextExtra = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.ToolBar)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemToolBar = string(marshal)
	tt.AwemeListItemDuetOriginItemTtsIdList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.TtsIDList)
	tt.AwemeListItemDuetOriginItemUniqidPosition = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.UniqidPosition)
	tt.AwemeListItemDuetOriginItemUserDigged = SpiderDataAwemeListItemDuetOriginItem.UserDigged
	tt.AwemeListItemDuetOriginItemUserRecommendStatus = SpiderDataAwemeListItemDuetOriginItem.UserRecommendStatus
	tt.AwemeListItemDuetOriginItemVideoLabels = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.VideoLabels)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.VideoTag)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemVideoTag = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.VideoText)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemVideoText = string(marshal)
	tt.AwemeListItemDuetOriginItemVoiceModifyIdList = fmt.Sprintf("%v", SpiderDataAwemeListItemDuetOriginItem.VoiceModifyIDList)
	tt.AwemeListItemDuetOriginItemVrType = SpiderDataAwemeListItemDuetOriginItem.VrType
	tt.AwemeListItemDuetOriginItemWithPromotionalMusic = SpiderDataAwemeListItemDuetOriginItem.WithPromotionalMusic
	tt.AwemeListItemDuetOriginItemWithoutWatermark = SpiderDataAwemeListItemDuetOriginItem.WithoutWatermark
	marshal, err = json.Marshal(SpiderDataAwemeListItemDuetOriginItem.XiguaTask)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemDuetOriginItemXiguaTask = string(marshal)}
	SpiderDataAwemeListItemImpressionData := SpiderDataAwemeListItem.ImpressionData
	marshal, err = json.Marshal(SpiderDataAwemeListItemImpressionData.GroupIDListA)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImpressionDataGroupIdListA = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemImpressionData.GroupIDListB)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImpressionDataGroupIdListB = string(marshal)
	tt.AwemeListItemImpressionDataGroupIdListC = fmt.Sprintf("%v", SpiderDataAwemeListItemImpressionData.GroupIDListC)
	marshal, err = json.Marshal(SpiderDataAwemeListItemImpressionData.SimilarIDListA)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImpressionDataSimilarIdListA = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemImpressionData.SimilarIDListB)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemImpressionDataSimilarIdListB = string(marshal)
	SpiderDataAwemeListItemPoiInfo := SpiderDataAwemeListItem.PoiInfo
if SpiderDataAwemeListItemPoiInfo != nil {tt.AwemeListItemPoiInfoCollectStat = SpiderDataAwemeListItemPoiInfo.CollectStat
	tt.AwemeListItemPoiInfoCollectedCount = SpiderDataAwemeListItemPoiInfo.CollectedCount
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.CoverHd)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoCoverHd = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.CoverLarge)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoCoverLarge = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.CoverMedium)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoCoverMedium = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.CoverThumb)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoCoverThumb = string(marshal)
	tt.AwemeListItemPoiInfoDistance = SpiderDataAwemeListItemPoiInfo.Distance
	tt.AwemeListItemPoiInfoEffectIds = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.EffectIds)
	tt.AwemeListItemPoiInfoExpandType = SpiderDataAwemeListItemPoiInfo.ExpandType
	tt.AwemeListItemPoiInfoExtJson = SpiderDataAwemeListItemPoiInfo.ExtJSON
	tt.AwemeListItemPoiInfoFulfillTaskList = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.FulfillTaskList)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.IconOnEntry)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoIconOnEntry = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.IconOnInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoIconOnInfo = string(marshal)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.IconOnMap)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoIconOnMap = string(marshal)
	tt.AwemeListItemPoiInfoIconServiceTypeList = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.IconServiceTypeList)
	tt.AwemeListItemPoiInfoIconType = SpiderDataAwemeListItemPoiInfo.IconType
	tt.AwemeListItemPoiInfoIsAdminArea = SpiderDataAwemeListItemPoiInfo.IsAdminArea
	tt.AwemeListItemPoiInfoIsAtCallBackCollect = SpiderDataAwemeListItemPoiInfo.IsAtCallBackCollect
	tt.AwemeListItemPoiInfoIsFoodGroupBuy = SpiderDataAwemeListItemPoiInfo.IsFoodGroupBuy
	tt.AwemeListItemPoiInfoItemCount = SpiderDataAwemeListItemPoiInfo.ItemCount
	tt.AwemeListItemPoiInfoPoi3classType = SpiderDataAwemeListItemPoiInfo.Poi3classType
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.PoiBackendType)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoPoiBackendType = string(marshal)
	tt.AwemeListItemPoiInfoPoiDetailTags = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.PoiDetailTags)
	tt.AwemeListItemPoiInfoPoiFrontendType = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.PoiFrontendType)
	tt.AwemeListItemPoiInfoPoiId = SpiderDataAwemeListItemPoiInfo.PoiID
	tt.AwemeListItemPoiInfoPoiLatitude = SpiderDataAwemeListItemPoiInfo.PoiLatitude
	tt.AwemeListItemPoiInfoPoiLongitude = SpiderDataAwemeListItemPoiInfo.PoiLongitude
	tt.AwemeListItemPoiInfoPoiName = SpiderDataAwemeListItemPoiInfo.PoiName
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.PoiRanks)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoPoiRanks = string(marshal)
	tt.AwemeListItemPoiInfoPoiSubtitle = SpiderDataAwemeListItemPoiInfo.PoiSubtitle
	tt.AwemeListItemPoiInfoPoiSubtitleType = SpiderDataAwemeListItemPoiInfo.PoiSubtitleType
	tt.AwemeListItemPoiInfoPopularity = SpiderDataAwemeListItemPoiInfo.Popularity
	tt.AwemeListItemPoiInfoServiceTypeList = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.ServiceTypeList)
	marshal, err = json.Marshal(SpiderDataAwemeListItemPoiInfo.ShareInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemPoiInfoShareInfo = string(marshal)
	tt.AwemeListItemPoiInfoShowType = SpiderDataAwemeListItemPoiInfo.ShowType
	tt.AwemeListItemPoiInfoSpSource = SpiderDataAwemeListItemPoiInfo.SpSource
	tt.AwemeListItemPoiInfoTypeCode = SpiderDataAwemeListItemPoiInfo.TypeCode
	tt.AwemeListItemPoiInfoUserCount = SpiderDataAwemeListItemPoiInfo.UserCount
	tt.AwemeListItemPoiInfoViewCount = SpiderDataAwemeListItemPoiInfo.ViewCount
	tt.AwemeListItemPoiInfoVoucherReleaseAreas = fmt.Sprintf("%v", SpiderDataAwemeListItemPoiInfo.VoucherReleaseAreas)}
	SpiderDataAwemeListItemShareInfo := SpiderDataAwemeListItem.ShareInfo
if SpiderDataAwemeListItemShareInfo != nil {tt.AwemeListItemShareInfoBoolPersist = SpiderDataAwemeListItemShareInfo.BoolPersist
	tt.AwemeListItemShareInfoShareDesc = SpiderDataAwemeListItemShareInfo.ShareDesc
	tt.AwemeListItemShareInfoShareDescInfo = SpiderDataAwemeListItemShareInfo.ShareDescInfo
	tt.AwemeListItemShareInfoShareLinkDesc = SpiderDataAwemeListItemShareInfo.ShareLinkDesc
	tt.AwemeListItemShareInfoShareQuote = SpiderDataAwemeListItemShareInfo.ShareQuote
	tt.AwemeListItemShareInfoShareSignatureDesc = SpiderDataAwemeListItemShareInfo.ShareSignatureDesc
	tt.AwemeListItemShareInfoShareSignatureUrl = SpiderDataAwemeListItemShareInfo.ShareSignatureURL
	tt.AwemeListItemShareInfoShareTitle = SpiderDataAwemeListItemShareInfo.ShareTitle
	tt.AwemeListItemShareInfoShareTitleMyself = SpiderDataAwemeListItemShareInfo.ShareTitleMyself
	tt.AwemeListItemShareInfoShareTitleOther = SpiderDataAwemeListItemShareInfo.ShareTitleOther
	tt.AwemeListItemShareInfoShareUrl = SpiderDataAwemeListItemShareInfo.ShareURL
	tt.AwemeListItemShareInfoShareWeiboDesc = SpiderDataAwemeListItemShareInfo.ShareWeiboDesc}
	SpiderDataAwemeListItemVideoControl := SpiderDataAwemeListItem.VideoControl
	tt.AwemeListItemVideoControlAllowDouplus = SpiderDataAwemeListItemVideoControl.AllowDouplus
	tt.AwemeListItemVideoControlAllowDownload = SpiderDataAwemeListItemVideoControl.AllowDownload
	tt.AwemeListItemVideoControlAllowDuet = SpiderDataAwemeListItemVideoControl.AllowDuet
	tt.AwemeListItemVideoControlAllowDynamicWallpaper = SpiderDataAwemeListItemVideoControl.AllowDynamicWallpaper
	tt.AwemeListItemVideoControlAllowMusic = SpiderDataAwemeListItemVideoControl.AllowMusic
	tt.AwemeListItemVideoControlAllowReact = SpiderDataAwemeListItemVideoControl.AllowReact
	tt.AwemeListItemVideoControlAllowShare = SpiderDataAwemeListItemVideoControl.AllowShare
	tt.AwemeListItemVideoControlAllowStitch = SpiderDataAwemeListItemVideoControl.AllowStitch
	tt.AwemeListItemVideoControlDownloadIgnoreVisibility = SpiderDataAwemeListItemVideoControl.DownloadIgnoreVisibility
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideoControl.DownloadInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoControlDownloadInfo = string(marshal)
	tt.AwemeListItemVideoControlDraftProgressBar = SpiderDataAwemeListItemVideoControl.DraftProgressBar
	tt.AwemeListItemVideoControlDuetIgnoreVisibility = SpiderDataAwemeListItemVideoControl.DuetIgnoreVisibility
	marshal, err = json.Marshal(SpiderDataAwemeListItemVideoControl.DuetInfo)
	if err != nil {
		logR(err)
	}
	 tt.AwemeListItemVideoControlDuetInfo = string(marshal)
	tt.AwemeListItemVideoControlPreventDownloadType = SpiderDataAwemeListItemVideoControl.PreventDownloadType
	tt.AwemeListItemVideoControlShareGrayed = SpiderDataAwemeListItemVideoControl.ShareGrayed
	tt.AwemeListItemVideoControlShareIgnoreVisibility = SpiderDataAwemeListItemVideoControl.ShareIgnoreVisibility
	tt.AwemeListItemVideoControlShareType = SpiderDataAwemeListItemVideoControl.ShareType
	tt.AwemeListItemVideoControlShowProgressBar = SpiderDataAwemeListItemVideoControl.ShowProgressBar
	tt.AwemeListItemVideoControlTimerStatus = SpiderDataAwemeListItemVideoControl.TimerStatus
}
	SpiderDataExtra := t.Extra
	marshal, err = json.Marshal(SpiderDataExtra.FatalItemIds)
	if err != nil {
		logR(err)
	}
	 tt.ExtraFatalItemIds = string(marshal)
	tt.ExtraLogid = SpiderDataExtra.Logid
	tt.ExtraNow = SpiderDataExtra.Now
	tt.ExtraSearchRequestId = SpiderDataExtra.SearchRequestID
		tts = append(tts, tt)
	}
}
