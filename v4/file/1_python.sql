from interface.clean_interface import CleanInterface
from utils.log import debug_log, log_method_name

class spider_dy_pc(CleanInterface):
    INPUT_TABLE = "spider_data._spider_dy_pc"

    OUTPUT_TABLE = "spider_data.clean_spider_dy_pc"

    MATERIALIZED_VIEW = "spider_data._mv_spider_dy_pc"

    SOURCE_TABLE = "spider_data.spider_dy_pc"

    @debug_log
    def input_table_sql(self) -> str:
        '''
        输入表建表语句
        :return:
        '''
        pass
    
    @debug_log
    def store_table_sql(self) -> str:
        '''
        存储表建表语句
        :return:
        '''
        return f"""
create table if not exists {self.OUTPUT_TABLE} (
	cursor Int64 
	,global_doodle_config Nullable(String) 
	,has_more Int64 
	,log_pb Nullable(String) 
	,search_nil_info Nullable(String) 
	,status_code Int64 
	,extra__fatal_item_ids Nullable(String) 
	,extra__logid Nullable(String) 
	,extra__now Int64 
	,extra__search_request_id Nullable(String) 
	,aweme_list__item__ad_aweme_source Nullable(Int64) 
	,aweme_list__item__ancestor_info Nullable(String) 
	,aweme_list__item__anchors Nullable(String) 
	,aweme_list__item__authentication_token Nullable(String) 
	,aweme_list__item__author_mask_tag Int64 
	,aweme_list__item__author_user_id Int64 
	,aweme_list__item__aweme_id Nullable(String) 
	,aweme_list__item__aweme_type Int64 
	,aweme_list__item__bodydance_score Nullable(Int64) 
	,aweme_list__item__book_bar Nullable(String) 
	,aweme_list__item__category_da Nullable(Int64) 
	,aweme_list__item__cha_list Nullable(String) 
	,aweme_list__item__challenge_position Nullable(String) 
	,aweme_list__item__chapter_list Nullable(String) 
	,aweme_list__item__city Nullable(String) 
	,aweme_list__item__cmt_swt UInt8 
	,aweme_list__item__collect_stat Int64 
	,aweme_list__item__collection_corner_mark Int64 
	,aweme_list__item__comment_gid Int64 
	,aweme_list__item__comment_list Nullable(String) 
	,aweme_list__item__comment_permission_info Nullable(String) 
	,aweme_list__item__commerce_config_data Nullable(String) 
	,aweme_list__item__commerce_info Nullable(String) 
	,aweme_list__item__common_bar_info Nullable(String) 
	,aweme_list__item__component_info_v2 Nullable(String) 
	,aweme_list__item__cooperation_info Nullable(String) 
	,aweme_list__item__cover_labels Nullable(String) 
	,aweme_list__item__create_time Int64 
	,aweme_list__item__create_time_config Nullable(String) 
	,aweme_list__item__danmaku_control Nullable(String) 
	,aweme_list__item__desc Nullable(String) 
	,aweme_list__item__desc_language Nullable(String) 
	,aweme_list__item__descendants Nullable(String) 
	,aweme_list__item__digg_lottie Nullable(String) 
	,aweme_list__item__disable_relation_bar Nullable(Int64) 
	,aweme_list__item__dislike_dimension_list Nullable(String) 
	,aweme_list__item__distance Nullable(String) 
	,aweme_list__item__distribute_type Nullable(Int64) 
	,aweme_list__item__duet_aggregate_in_music_tab UInt8 
	,aweme_list__item__duet_origin_item_id Nullable(String) 
	,aweme_list__item__duration Int64 
	,aweme_list__item__game_info Nullable(String) 
	,aweme_list__item__geofencing Nullable(String) 
	,aweme_list__item__geofencing_regions Nullable(String) 
	,aweme_list__item__group_id Nullable(String) 
	,aweme_list__item__guide_btn_type Int64 
	,aweme_list__item__has_vs_entry UInt8 
	,aweme_list__item__have_dashboard UInt8 
	,aweme_list__item__horizontal_type Nullable(Int64) 
	,aweme_list__item__hybrid_label Nullable(String) 
	,aweme_list__item__image_album_music_info Nullable(String) 
	,aweme_list__item__image_comment Nullable(String) 
	,aweme_list__item__image_infos Nullable(String) 
	,aweme_list__item__image_list Nullable(String) 
	,aweme_list__item__images Nullable(String) 
	,aweme_list__item__img_bitrate Nullable(String) 
	,aweme_list__item__interaction_stickers Nullable(String) 
	,aweme_list__item__is_collects_selected Int64 
	,aweme_list__item__is_duet_sing UInt8 
	,aweme_list__item__is_fantasy UInt8 
	,aweme_list__item__is_first_video UInt8 
	,aweme_list__item__is_hash_tag Int64 
	,aweme_list__item__is_image_beat UInt8 
	,aweme_list__item__is_in_scope UInt8 
	,aweme_list__item__is_karaoke UInt8 
	,aweme_list__item__is_life_item UInt8 
	,aweme_list__item__is_multi_content Nullable(Int64) 
	,aweme_list__item__is_pgcshow UInt8 
	,aweme_list__item__is_preview Nullable(Int64) 
	,aweme_list__item__is_relieve UInt8 
	,aweme_list__item__is_share_post UInt8 
	,aweme_list__item__is_story Int64 
	,aweme_list__item__is_top Nullable(Int64) 
	,aweme_list__item__is_vr UInt8 
	,aweme_list__item__item_comment_settings Int64 
	,aweme_list__item__item_duet Int64 
	,aweme_list__item__item_react Int64 
	,aweme_list__item__item_share Int64 
	,aweme_list__item__item_stitch Int64 
	,aweme_list__item__item_warn_notification Nullable(String) 
	,aweme_list__item__label_top Nullable(String) 
	,aweme_list__item__label_top_text Nullable(String) 
	,aweme_list__item__link_ad_data Nullable(String) 
	,aweme_list__item__live_id Nullable(Int64) 
	,aweme_list__item__live_type Nullable(String) 
	,aweme_list__item__long_video Nullable(String) 
	,aweme_list__item__misc_info Nullable(String) 
	,aweme_list__item__nearby_level Int64 
	,aweme_list__item__need_vs_entry Nullable(UInt8) 
	,aweme_list__item__nickname_position Nullable(String) 
	,aweme_list__item__origin_comment_ids Nullable(String) 
	,aweme_list__item__origin_text_extra Nullable(String) 
	,aweme_list__item__original_images Nullable(String) 
	,aweme_list__item__packed_clips Nullable(String) 
	,aweme_list__item__photo_search_entrance Nullable(String) 
	,aweme_list__item__poi_biz Nullable(String) 
	,aweme_list__item__poi_patch_info Nullable(String) 
	,aweme_list__item__position Nullable(String) 
	,aweme_list__item__prevent_download UInt8 
	,aweme_list__item__preview_title Nullable(String) 
	,aweme_list__item__preview_video_status Int64 
	,aweme_list__item__promotions Nullable(String) 
	,aweme_list__item__rate Int64 
	,aweme_list__item__ref_tts_id_list Nullable(String) 
	,aweme_list__item__ref_voice_modify_id_list Nullable(String) 
	,aweme_list__item__region Nullable(String) 
	,aweme_list__item__relation_labels Nullable(String) 
	,aweme_list__item__report_action UInt8 
	,aweme_list__item__search_impr Nullable(String) 
	,aweme_list__item__seo_info Nullable(String) 
	,aweme_list__item__series_paid_info Nullable(String) 
	,aweme_list__item__share_from Nullable(String) 
	,aweme_list__item__share_url Nullable(String) 
	,aweme_list__item__should_open_ad_report UInt8 
	,aweme_list__item__show_follow_button Nullable(String) 
	,aweme_list__item__social_tag_list Nullable(String) 
	,aweme_list__item__sort_label Nullable(String) 
	,aweme_list__item__special_mode Nullable(Int64) 
	,aweme_list__item__standard_bar_info_list Nullable(String) 
	,aweme_list__item__star_atlas_info Nullable(String) 
	,aweme_list__item__sticker_detail Nullable(String) 
	,aweme_list__item__stickers Nullable(String) 
	,aweme_list__item__story_source_type Nullable(Int64) 
	,aweme_list__item__story_ttl Nullable(Int64) 
	,aweme_list__item__text_extra Nullable(String) 
	,aweme_list__item__tool_bar Nullable(String) 
	,aweme_list__item__tts_id_list Nullable(String) 
	,aweme_list__item__uniqid_position Nullable(String) 
	,aweme_list__item__user_digged Int64 
	,aweme_list__item__user_recommend_status Int64 
	,aweme_list__item__video_labels Nullable(String) 
	,aweme_list__item__video_reply_info Nullable(String) 
	,aweme_list__item__video_tag Nullable(String) 
	,aweme_list__item__video_text Nullable(String) 
	,aweme_list__item__voice_modify_id_list Nullable(String) 
	,aweme_list__item__vr_type Int64 
	,aweme_list__item__with_promotional_music UInt8 
	,aweme_list__item__without_watermark UInt8 
	,aweme_list__item__xigua_task Nullable(String) 
	,aweme_list__item__risk_infos__content Nullable(String) 
	,aweme_list__item__risk_infos__icon_url Nullable(String) 
	,aweme_list__item__risk_infos__risk_sink UInt8 
	,aweme_list__item__risk_infos__type Int64 
	,aweme_list__item__risk_infos__url Nullable(String) 
	,aweme_list__item__risk_infos__vote UInt8 
	,aweme_list__item__risk_infos__warn UInt8 
	,aweme_list__item__risk_infos__warn_level Nullable(Int64) 
	,aweme_list__item__micro_app_info__app_id Nullable(String) 
	,aweme_list__item__micro_app_info__app_name Nullable(String) 
	,aweme_list__item__micro_app_info__description Nullable(String) 
	,aweme_list__item__micro_app_info__icon Nullable(String) 
	,aweme_list__item__micro_app_info__orientation Nullable(Int64) 
	,aweme_list__item__micro_app_info__schema Nullable(String) 
	,aweme_list__item__micro_app_info__state Nullable(Int64) 
	,aweme_list__item__micro_app_info__summary Nullable(String) 
	,aweme_list__item__micro_app_info__title Nullable(String) 
	,aweme_list__item__micro_app_info__type Nullable(Int64) 
	,aweme_list__item__hot_list__extra Nullable(String) 
	,aweme_list__item__hot_list__footer Nullable(String) 
	,aweme_list__item__hot_list__group_id Nullable(String) 
	,aweme_list__item__hot_list__header Nullable(String) 
	,aweme_list__item__hot_list__hot_score Nullable(Int64) 
	,aweme_list__item__hot_list__i18n_title Nullable(String) 
	,aweme_list__item__hot_list__image_url Nullable(String) 
	,aweme_list__item__hot_list__pattern_type Nullable(Int64) 
	,aweme_list__item__hot_list__rank Nullable(Int64) 
	,aweme_list__item__hot_list__schema Nullable(String) 
	,aweme_list__item__hot_list__sentence Nullable(String) 
	,aweme_list__item__hot_list__sentence_id Nullable(Int64) 
	,aweme_list__item__hot_list__title Nullable(String) 
	,aweme_list__item__hot_list__type Nullable(Int64) 
	,aweme_list__item__hot_list__view_count Nullable(Int64) 
	,aweme_list__item__anchor_info__content Nullable(String) 
	,aweme_list__item__anchor_info__display_info Nullable(String) 
	,aweme_list__item__anchor_info__extra Nullable(String) 
	,aweme_list__item__anchor_info__icon Nullable(String) 
	,aweme_list__item__anchor_info__id Nullable(String) 
	,aweme_list__item__anchor_info__log_extra Nullable(String) 
	,aweme_list__item__anchor_info__mp_url Nullable(String) 
	,aweme_list__item__anchor_info__open_url Nullable(String) 
	,aweme_list__item__anchor_info__style_info Nullable(String) 
	,aweme_list__item__anchor_info__title Nullable(String) 
	,aweme_list__item__anchor_info__title_tag Nullable(String) 
	,aweme_list__item__anchor_info__type Nullable(Int64) 
	,aweme_list__item__anchor_info__web_url Nullable(String) 
	,aweme_list__item__video__animated_cover Nullable(String) 
	,aweme_list__item__video__big_thumbs Nullable(String) 
	,aweme_list__item__video__bit_rate Nullable(String) 
	,aweme_list__item__video__cdn_url_expired Nullable(Int64) 
	,aweme_list__item__video__cover Nullable(String) 
	,aweme_list__item__video__download_addr Nullable(String) 
	,aweme_list__item__video__download_suffix_logo_addr Nullable(String) 
	,aweme_list__item__video__duration Int64 
	,aweme_list__item__video__dynamic_cover Nullable(String) 
	,aweme_list__item__video__has_download_suffix_logo_addr Nullable(UInt8) 
	,aweme_list__item__video__has_watermark UInt8 
	,aweme_list__item__video__height Int64 
	,aweme_list__item__video__horizontal_type Nullable(Int64) 
	,aweme_list__item__video__is_bytevc1 Int64 
	,aweme_list__item__video__is_callback Nullable(UInt8) 
	,aweme_list__item__video__is_h265 Int64 
	,aweme_list__item__video__is_long_video Nullable(Int64) 
	,aweme_list__item__video__is_source_HDR Nullable(Int64) 
	,aweme_list__item__video__meta Nullable(String) 
	,aweme_list__item__video__misc_download_addrs Nullable(String) 
	,aweme_list__item__video__need_set_token UInt8 
	,aweme_list__item__video__optimized_cover Nullable(String) 
	,aweme_list__item__video__origin_cover Nullable(String) 
	,aweme_list__item__video__play_addr Nullable(String) 
	,aweme_list__item__video__play_addr_265 Nullable(String) 
	,aweme_list__item__video__play_addr_h264 Nullable(String) 
	,aweme_list__item__video__play_addr_lowbr Nullable(String) 
	,aweme_list__item__video__ratio Nullable(String) 
	,aweme_list__item__video__tags Nullable(String) 
	,aweme_list__item__video__use_static_cover UInt8 
	,aweme_list__item__video__video_model Nullable(String) 
	,aweme_list__item__video__width Int64 
	,aweme_list__item__video_control__allow_douplus UInt8 
	,aweme_list__item__video_control__allow_download UInt8 
	,aweme_list__item__video_control__allow_duet UInt8 
	,aweme_list__item__video_control__allow_dynamic_wallpaper UInt8 
	,aweme_list__item__video_control__allow_music UInt8 
	,aweme_list__item__video_control__allow_react UInt8 
	,aweme_list__item__video_control__allow_share UInt8 
	,aweme_list__item__video_control__allow_stitch UInt8 
	,aweme_list__item__video_control__download_ignore_visibility UInt8 
	,aweme_list__item__video_control__download_info Nullable(String) 
	,aweme_list__item__video_control__draft_progress_bar Int64 
	,aweme_list__item__video_control__duet_ignore_visibility UInt8 
	,aweme_list__item__video_control__duet_info Nullable(String) 
	,aweme_list__item__video_control__prevent_download_type Int64 
	,aweme_list__item__video_control__share_grayed UInt8 
	,aweme_list__item__video_control__share_ignore_visibility UInt8 
	,aweme_list__item__video_control__share_type Int64 
	,aweme_list__item__video_control__show_progress_bar Int64 
	,aweme_list__item__video_control__timer_status Int64 
	,aweme_list__item__statistics__admire_count Int64 
	,aweme_list__item__statistics__aweme_id Nullable(String) 
	,aweme_list__item__statistics__collect_count Int64 
	,aweme_list__item__statistics__comment_count Int64 
	,aweme_list__item__statistics__digest Nullable(String) 
	,aweme_list__item__statistics__digg_count Int64 
	,aweme_list__item__statistics__download_count Int64 
	,aweme_list__item__statistics__exposure_count Int64 
	,aweme_list__item__statistics__forward_count Int64 
	,aweme_list__item__statistics__live_watch_count Int64 
	,aweme_list__item__statistics__lose_comment_count Int64 
	,aweme_list__item__statistics__lose_count Int64 
	,aweme_list__item__statistics__play_count Int64 
	,aweme_list__item__statistics__share_count Int64 
	,aweme_list__item__statistics__whatsapp_share_count Int64 
	,aweme_list__item__share_info__bool_persist Nullable(Int64) 
	,aweme_list__item__share_info__share_desc Nullable(String) 
	,aweme_list__item__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__share_info__share_link_desc Nullable(String) 
	,aweme_list__item__share_info__share_quote Nullable(String) 
	,aweme_list__item__share_info__share_signature_desc Nullable(String) 
	,aweme_list__item__share_info__share_signature_url Nullable(String) 
	,aweme_list__item__share_info__share_title Nullable(String) 
	,aweme_list__item__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__share_info__share_title_other Nullable(String) 
	,aweme_list__item__share_info__share_url Nullable(String) 
	,aweme_list__item__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__poi_info__collect_stat Nullable(Int64) 
	,aweme_list__item__poi_info__collected_count Nullable(String) 
	,aweme_list__item__poi_info__cover_hd Nullable(String) 
	,aweme_list__item__poi_info__cover_large Nullable(String) 
	,aweme_list__item__poi_info__cover_medium Nullable(String) 
	,aweme_list__item__poi_info__cover_thumb Nullable(String) 
	,aweme_list__item__poi_info__distance Nullable(String) 
	,aweme_list__item__poi_info__effect_ids Nullable(String) 
	,aweme_list__item__poi_info__expand_type Nullable(Int64) 
	,aweme_list__item__poi_info__ext_json Nullable(String) 
	,aweme_list__item__poi_info__fulfill_task_list Nullable(String) 
	,aweme_list__item__poi_info__icon_on_entry Nullable(String) 
	,aweme_list__item__poi_info__icon_on_info Nullable(String) 
	,aweme_list__item__poi_info__icon_on_map Nullable(String) 
	,aweme_list__item__poi_info__icon_service_type_list Nullable(String) 
	,aweme_list__item__poi_info__icon_type Nullable(Int64) 
	,aweme_list__item__poi_info__is_admin_area Nullable(UInt8) 
	,aweme_list__item__poi_info__is_at_call_back_collect Nullable(UInt8) 
	,aweme_list__item__poi_info__is_food_group_buy Nullable(UInt8) 
	,aweme_list__item__poi_info__item_count Nullable(Int64) 
	,aweme_list__item__poi_info__poi_3class_type Nullable(String) 
	,aweme_list__item__poi_info__poi_backend_type Nullable(String) 
	,aweme_list__item__poi_info__poi_detail_tags Nullable(String) 
	,aweme_list__item__poi_info__poi_frontend_type Nullable(String) 
	,aweme_list__item__poi_info__poi_id Nullable(String) 
	,aweme_list__item__poi_info__poi_latitude Nullable(Float64) 
	,aweme_list__item__poi_info__poi_longitude Nullable(Float64) 
	,aweme_list__item__poi_info__poi_name Nullable(String) 
	,aweme_list__item__poi_info__poi_ranks Nullable(String) 
	,aweme_list__item__poi_info__poi_subtitle Nullable(String) 
	,aweme_list__item__poi_info__poi_subtitle_type Nullable(Int64) 
	,aweme_list__item__poi_info__popularity Nullable(String) 
	,aweme_list__item__poi_info__service_type_list Nullable(String) 
	,aweme_list__item__poi_info__share_info Nullable(String) 
	,aweme_list__item__poi_info__show_type Nullable(Int64) 
	,aweme_list__item__poi_info__sp_source Nullable(String) 
	,aweme_list__item__poi_info__type_code Nullable(String) 
	,aweme_list__item__poi_info__user_count Nullable(Int64) 
	,aweme_list__item__poi_info__view_count Nullable(String) 
	,aweme_list__item__poi_info__voucher_release_areas Nullable(String) 
	,aweme_list__item__poi_info__address_info__ad_code_v2 Nullable(String) 
	,aweme_list__item__poi_info__address_info__address Nullable(String) 
	,aweme_list__item__poi_info__address_info__city Nullable(String) 
	,aweme_list__item__poi_info__address_info__city_code Nullable(String) 
	,aweme_list__item__poi_info__address_info__city_code_v2 Nullable(String) 
	,aweme_list__item__poi_info__address_info__country Nullable(String) 
	,aweme_list__item__poi_info__address_info__country_code Nullable(String) 
	,aweme_list__item__poi_info__address_info__district Nullable(String) 
	,aweme_list__item__poi_info__address_info__province Nullable(String) 
	,aweme_list__item__poi_info__address_info__simple_addr Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_a Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_b Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_c Nullable(String) 
	,aweme_list__item__impression_data__similar_id_list_a Nullable(String) 
	,aweme_list__item__impression_data__similar_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__ad_aweme_source Nullable(Int64) 
	,aweme_list__item__duet_origin_item__anchors Nullable(String) 
	,aweme_list__item__duet_origin_item__authentication_token Nullable(String) 
	,aweme_list__item__duet_origin_item__author_mask_tag Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author_user_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__aweme_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__bodydance_score Nullable(Int64) 
	,aweme_list__item__duet_origin_item__cha_list Nullable(String) 
	,aweme_list__item__duet_origin_item__challenge_position Nullable(String) 
	,aweme_list__item__duet_origin_item__chapter_list Nullable(String) 
	,aweme_list__item__duet_origin_item__city Nullable(String) 
	,aweme_list__item__duet_origin_item__cmt_swt Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__collect_stat Nullable(Int64) 
	,aweme_list__item__duet_origin_item__collection_corner_mark Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_gid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_list Nullable(String) 
	,aweme_list__item__duet_origin_item__commerce_config_data Nullable(String) 
	,aweme_list__item__duet_origin_item__common_bar_info Nullable(String) 
	,aweme_list__item__duet_origin_item__component_info_v2 Nullable(String) 
	,aweme_list__item__duet_origin_item__cover_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__create_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__desc Nullable(String) 
	,aweme_list__item__duet_origin_item__desc_language Nullable(String) 
	,aweme_list__item__duet_origin_item__disable_relation_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__dislike_dimension_list Nullable(String) 
	,aweme_list__item__duet_origin_item__distance Nullable(String) 
	,aweme_list__item__duet_origin_item__distribute_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__duet_aggregate_in_music_tab Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__geofencing_regions Nullable(String) 
	,aweme_list__item__duet_origin_item__group_id Nullable(String) 
	,aweme_list__item__duet_origin_item__guide_btn_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__has_vs_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__have_dashboard Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__horizontal_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__hybrid_label Nullable(String) 
	,aweme_list__item__duet_origin_item__image_album_music_info Nullable(String) 
	,aweme_list__item__duet_origin_item__image_comment Nullable(String) 
	,aweme_list__item__duet_origin_item__image_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__image_list Nullable(String) 
	,aweme_list__item__duet_origin_item__images Nullable(String) 
	,aweme_list__item__duet_origin_item__img_bitrate Nullable(String) 
	,aweme_list__item__duet_origin_item__interaction_stickers Nullable(String) 
	,aweme_list__item__duet_origin_item__is_collects_selected Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_duet_sing Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_fantasy Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_first_video Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_hash_tag Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_image_beat Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_in_scope Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_karaoke Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_life_item Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_pgcshow Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_preview Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_relieve Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_share_post Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_story Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_top Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_vr Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__item_comment_settings Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_duet Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_react Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_share Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_stitch Nullable(Int64) 
	,aweme_list__item__duet_origin_item__label_top_text Nullable(String) 
	,aweme_list__item__duet_origin_item__long_video Nullable(String) 
	,aweme_list__item__duet_origin_item__misc_info Nullable(String) 
	,aweme_list__item__duet_origin_item__nearby_level Nullable(Int64) 
	,aweme_list__item__duet_origin_item__need_vs_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__nickname_position Nullable(String) 
	,aweme_list__item__duet_origin_item__origin_comment_ids Nullable(String) 
	,aweme_list__item__duet_origin_item__origin_text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__original_images Nullable(String) 
	,aweme_list__item__duet_origin_item__packed_clips Nullable(String) 
	,aweme_list__item__duet_origin_item__photo_search_entrance Nullable(String) 
	,aweme_list__item__duet_origin_item__poi_biz Nullable(String) 
	,aweme_list__item__duet_origin_item__poi_patch_info Nullable(String) 
	,aweme_list__item__duet_origin_item__position Nullable(String) 
	,aweme_list__item__duet_origin_item__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__preview_title Nullable(String) 
	,aweme_list__item__duet_origin_item__preview_video_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__promotions Nullable(String) 
	,aweme_list__item__duet_origin_item__rate Nullable(Int64) 
	,aweme_list__item__duet_origin_item__ref_tts_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__ref_voice_modify_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__region Nullable(String) 
	,aweme_list__item__duet_origin_item__relation_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__report_action Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__seo_info Nullable(String) 
	,aweme_list__item__duet_origin_item__series_paid_info Nullable(String) 
	,aweme_list__item__duet_origin_item__should_open_ad_report Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__show_follow_button Nullable(String) 
	,aweme_list__item__duet_origin_item__social_tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__sort_label Nullable(String) 
	,aweme_list__item__duet_origin_item__standard_bar_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__story_ttl Nullable(Int64) 
	,aweme_list__item__duet_origin_item__text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__tool_bar Nullable(String) 
	,aweme_list__item__duet_origin_item__tts_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__uniqid_position Nullable(String) 
	,aweme_list__item__duet_origin_item__user_digged Nullable(Int64) 
	,aweme_list__item__duet_origin_item__user_recommend_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__video_tag Nullable(String) 
	,aweme_list__item__duet_origin_item__video_text Nullable(String) 
	,aweme_list__item__duet_origin_item__voice_modify_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__vr_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__with_promotional_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__without_watermark Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__xigua_task Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__allow_douplus Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_duet Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_dynamic_wallpaper Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_react Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_stitch Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__download_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__download_info Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__draft_progress_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__duet_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__duet_info Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__prevent_download_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__share_grayed Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__share_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__share_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__show_progress_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__timer_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__allow_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__allow_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__aweme_edit_info Nullable(String) 
	,aweme_list__item__duet_origin_item__status__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__status__dont_share_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__download_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__in_reviewing Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_delete Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_private Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_prohibited Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__listen_video_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__part_see Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__private_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__review_result Nullable(String) 
	,aweme_list__item__duet_origin_item__status__reviewed Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__self_see Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__video_hide_search Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__with_fusion_goods Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__with_goods Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__statistics__admire_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__statistics__collect_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__comment_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__digest Nullable(String) 
	,aweme_list__item__duet_origin_item__statistics__digg_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__download_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__exposure_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__forward_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__live_watch_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__lose_comment_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__lose_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__play_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__share_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__whatsapp_share_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__album Nullable(String) 
	,aweme_list__item__duet_origin_item__music__artist_user_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__artists Nullable(String) 
	,aweme_list__item__duet_origin_item__music__audition_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__author Nullable(String) 
	,aweme_list__item__duet_origin_item__music__author_deleted Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__author_position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__author_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__avatar_large Nullable(String) 
	,aweme_list__item__duet_origin_item__music__avatar_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__music__avatar_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__music__binded_challenge_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__can_background_play Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__climax Nullable(String) 
	,aweme_list__item__duet_origin_item__music__collect_stat Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__cover_color_hsv Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_hd Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_large Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__music__dmv_auto_show Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__dsp_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__end_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__external_song_info Nullable(String) 
	,aweme_list__item__duet_origin_item__music__extra Nullable(String) 
	,aweme_list__item__duet_origin_item__music__id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__id_str Nullable(String) 
	,aweme_list__item__duet_origin_item__music__is_audio_url_with_cookie Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_commerce_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_del_video Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_matched_metadata Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_original Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_original_sound Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_pgc Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_restricted Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_video_self_see Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__luna_info Nullable(String) 
	,aweme_list__item__duet_origin_item__music__lyric_short_position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__matched_pgc_sound Nullable(String) 
	,aweme_list__item__duet_origin_item__music__mid Nullable(String) 
	,aweme_list__item__duet_origin_item__music__music_chart_ranks Nullable(String) 
	,aweme_list__item__duet_origin_item__music__music_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__musician_user_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__mute_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__offline_desc Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_handle Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_id Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_nickname Nullable(String) 
	,aweme_list__item__duet_origin_item__music__pgc_music_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__play_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__prevent_item_download_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__preview_end_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__preview_start_time Nullable(Float64) 
	,aweme_list__item__duet_origin_item__music__reason_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__redirect Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__schema_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__music__sec_uid Nullable(String) 
	,aweme_list__item__duet_origin_item__music__shoot_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__source_platform Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__start_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__strong_beat_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__music__title Nullable(String) 
	,aweme_list__item__duet_origin_item__music__unshelve_countries Nullable(String) 
	,aweme_list__item__duet_origin_item__music__user_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__video_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__song__artists Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__chorus Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__chorus_v3_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__song__id_str Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__title Nullable(String) 
	,aweme_list__item__duet_origin_item__descendants__notify_msg Nullable(String) 
	,aweme_list__item__duet_origin_item__descendants__platforms Nullable(String) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_auth_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_auth_target_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_ban_mask Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_source Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__is_ad Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_forward Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_show_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__animated_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__big_thumbs Nullable(String) 
	,aweme_list__item__duet_origin_item__video__bit_rate Nullable(String) 
	,aweme_list__item__duet_origin_item__video__cdn_url_expired Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__download_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__download_suffix_logo_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__dynamic_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__has_download_suffix_logo_addr Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__has_watermark Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__height Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__horizontal_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_bytevc1 Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_callback Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__is_h265 Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_long_video Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_source_HDR Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__meta Nullable(String) 
	,aweme_list__item__duet_origin_item__video__misc_download_addrs Nullable(String) 
	,aweme_list__item__duet_origin_item__video__need_set_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__optimized_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__origin_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_265 Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_h264 Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_lowbr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__ratio Nullable(String) 
	,aweme_list__item__duet_origin_item__video__tags Nullable(String) 
	,aweme_list__item__duet_origin_item__video__use_static_cover Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__video_model Nullable(String) 
	,aweme_list__item__duet_origin_item__video__width Nullable(Int64) 
	,aweme_list__item__duet_origin_item__risk_infos__content Nullable(String) 
	,aweme_list__item__duet_origin_item__risk_infos__risk_sink Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__risk_infos__type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__risk_infos__vote Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__risk_infos__warn Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_a Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_c Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__similar_id_list_a Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__similar_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__comment_permission_info__can_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__comment_permission_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_permission_info__item_detail_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__press_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__toast_guide Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_acl__download_mask_panel Nullable(String) 
	,aweme_list__item__duet_origin_item__author__accept_private_policy Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__account_region Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ad_cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__apple_account Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__authority_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__avatar_168x168 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_300x300 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_larger Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_uri Nullable(String) 
	,aweme_list__item__duet_origin_item__author__aweme_control Nullable(String) 
	,aweme_list__item__duet_origin_item__author__aweme_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth_relation Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__ban_user_functions Nullable(String) 
	,aweme_list__item__duet_origin_item__author__bind_phone Nullable(String) 
	,aweme_list__item__duet_origin_item__author__birthday Nullable(String) 
	,aweme_list__item__duet_origin_item__author__can_set_geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_entries Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_entries_not_display Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_sort_priority Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cf_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cha_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__close_friend_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__comment_filter_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__comment_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__commerce_user_level Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__constellation Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__contacts_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__contrail_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__create_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__custom_verify Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cv_level Nullable(String) 
	,aweme_list__item__duet_origin_item__author__data_label_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__display_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__download_prompt_ts Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__download_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__duet_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__enable_nearby_visible Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__endorsement_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__enterprise_verify_reason Nullable(String) 
	,aweme_list__item__duet_origin_item__author__favoriting_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__fb_expire_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follow_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_list_secondary_information_struct Nullable(String) 
	,aweme_list__item__duet_origin_item__author__follower_request_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__followers_detail Nullable(String) 
	,aweme_list__item__duet_origin_item__author__following_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__gender Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__author__google_account Nullable(String) 
	,aweme_list__item__duet_origin_item__author__has_email Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_facebook_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_insights Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_orders Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_twitter_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_unread_story Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_youtube_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__hide_location Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__hide_search Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__homepage_bottom_toast Nullable(String) 
	,aweme_list__item__duet_origin_item__author__im_role_ids Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ins_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__interest_tags Nullable(String) 
	,aweme_list__item__duet_origin_item__author__is_ad_fake Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_binded_weibo Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_block Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_blocked_v2 Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_blocking_v2 Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_cf Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__is_discipline_member Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_gov_media_vip Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_mix_user Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_not_show Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_phone_binded Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_star Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_verified Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__item_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ky_only_predict Nullable(Float64) 
	,aweme_list__item__duet_origin_item__author__language Nullable(String) 
	,aweme_list__item__duet_origin_item__author__link_item_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__live_agreement Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_agreement_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_commerce Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__live_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_verify Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__location Nullable(String) 
	,aweme_list__item__duet_origin_item__author__max_follower_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__need_points Nullable(String) 
	,aweme_list__item__duet_origin_item__author__need_recommend Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__neiguang_shield Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__new_story_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__author__nickname Nullable(String) 
	,aweme_list__item__duet_origin_item__author__not_seen_item_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__not_seen_item_id_list_v2 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__offline_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__personal_tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__platform_sync_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__react_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__reflow_page_gid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__reflow_page_uid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__region Nullable(String) 
	,aweme_list__item__duet_origin_item__author__relative_users Nullable(String) 
	,aweme_list__item__duet_origin_item__author__risk_notice_text Nullable(String) 
	,aweme_list__item__duet_origin_item__author__room_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__school_category Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__school_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_poi_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__author__sec_uid Nullable(String) 
	,aweme_list__item__duet_origin_item__author__secret Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_comment_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_digg_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_follow_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__short_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__show_image_bubble Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__show_nearby_active Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__signature Nullable(String) 
	,aweme_list__item__duet_origin_item__author__signature_display_lines Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__signature_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__author__special_follow_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__special_lock Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__special_people_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__author__status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__stitch_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__story_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__story_open Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__sync_to_toutiao Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__author__total_favorited Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__tw_expire_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__twitter_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__twitter_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__type_label Nullable(String) 
	,aweme_list__item__duet_origin_item__author__uid Nullable(String) 
	,aweme_list__item__duet_origin_item__author__unique_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__unique_id_modify_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_age Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_canceled Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__user_mode Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_not_see Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_not_show Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_period Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_permissions Nullable(String) 
	,aweme_list__item__duet_origin_item__author__user_rate Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_tags Nullable(String) 
	,aweme_list__item__duet_origin_item__author__verification_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__verify_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__video_icon Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_schema Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_verify Nullable(String) 
	,aweme_list__item__duet_origin_item__author__white_cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__with_commerce_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_dou_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_fusion_shop_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_shop_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__youtube_channel_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__youtube_channel_title Nullable(String) 
	,aweme_list__item__duet_origin_item__author__youtube_expire_time Nullable(Int64) 
	,aweme_list__item__aweme_control__can_comment UInt8 
	,aweme_list__item__aweme_control__can_forward UInt8 
	,aweme_list__item__aweme_control__can_share UInt8 
	,aweme_list__item__aweme_control__can_show_comment UInt8 
	,aweme_list__item__aweme_acl__download_mask_panel__code Nullable(Int64) 
	,aweme_list__item__aweme_acl__download_mask_panel__show_type Nullable(Int64) 
	,aweme_list__item__suggest_words__suggest_words Nullable(String) 
	,aweme_list__item__status__allow_comment UInt8 
	,aweme_list__item__status__allow_share UInt8 
	,aweme_list__item__status__aweme_edit_info Nullable(String) 
	,aweme_list__item__status__aweme_id Nullable(String) 
	,aweme_list__item__status__dont_share_status Int64 
	,aweme_list__item__status__download_status Int64 
	,aweme_list__item__status__in_reviewing UInt8 
	,aweme_list__item__status__is_delete UInt8 
	,aweme_list__item__status__is_private UInt8 
	,aweme_list__item__status__is_prohibited UInt8 
	,aweme_list__item__status__listen_video_status Nullable(Int64) 
	,aweme_list__item__status__part_see Int64 
	,aweme_list__item__status__private_status Int64 
	,aweme_list__item__status__review_result Nullable(String) 
	,aweme_list__item__status__reviewed Int64 
	,aweme_list__item__status__self_see UInt8 
	,aweme_list__item__status__video_hide_search Int64 
	,aweme_list__item__status__with_fusion_goods UInt8 
	,aweme_list__item__status__with_goods UInt8 
	,aweme_list__item__music__album Nullable(String) 
	,aweme_list__item__music__artist_user_infos Nullable(String) 
	,aweme_list__item__music__artists Nullable(String) 
	,aweme_list__item__music__audition_duration Nullable(Int64) 
	,aweme_list__item__music__author Nullable(String) 
	,aweme_list__item__music__author_deleted Nullable(UInt8) 
	,aweme_list__item__music__author_position Nullable(String) 
	,aweme_list__item__music__author_status Nullable(Int64) 
	,aweme_list__item__music__avatar_large Nullable(String) 
	,aweme_list__item__music__avatar_medium Nullable(String) 
	,aweme_list__item__music__avatar_thumb Nullable(String) 
	,aweme_list__item__music__binded_challenge_id Nullable(Int64) 
	,aweme_list__item__music__can_background_play Nullable(UInt8) 
	,aweme_list__item__music__climax Nullable(String) 
	,aweme_list__item__music__collect_stat Nullable(Int64) 
	,aweme_list__item__music__cover_color_hsv Nullable(String) 
	,aweme_list__item__music__cover_hd Nullable(String) 
	,aweme_list__item__music__cover_large Nullable(String) 
	,aweme_list__item__music__cover_medium Nullable(String) 
	,aweme_list__item__music__cover_thumb Nullable(String) 
	,aweme_list__item__music__dmv_auto_show Nullable(UInt8) 
	,aweme_list__item__music__dsp_status Nullable(Int64) 
	,aweme_list__item__music__duration Nullable(Int64) 
	,aweme_list__item__music__end_time Nullable(Int64) 
	,aweme_list__item__music__external_song_info Nullable(String) 
	,aweme_list__item__music__extra Nullable(String) 
	,aweme_list__item__music__id Nullable(Int64) 
	,aweme_list__item__music__id_str Nullable(String) 
	,aweme_list__item__music__is_audio_url_with_cookie Nullable(UInt8) 
	,aweme_list__item__music__is_commerce_music Nullable(UInt8) 
	,aweme_list__item__music__is_del_video Nullable(UInt8) 
	,aweme_list__item__music__is_matched_metadata Nullable(UInt8) 
	,aweme_list__item__music__is_original Nullable(UInt8) 
	,aweme_list__item__music__is_original_sound Nullable(UInt8) 
	,aweme_list__item__music__is_pgc Nullable(UInt8) 
	,aweme_list__item__music__is_restricted Nullable(UInt8) 
	,aweme_list__item__music__is_video_self_see Nullable(UInt8) 
	,aweme_list__item__music__luna_info Nullable(String) 
	,aweme_list__item__music__lyric_short_position Nullable(String) 
	,aweme_list__item__music__matched_pgc_sound Nullable(String) 
	,aweme_list__item__music__mid Nullable(String) 
	,aweme_list__item__music__music_chart_ranks Nullable(String) 
	,aweme_list__item__music__music_status Nullable(Int64) 
	,aweme_list__item__music__musician_user_infos Nullable(String) 
	,aweme_list__item__music__mute_share Nullable(UInt8) 
	,aweme_list__item__music__offline_desc Nullable(String) 
	,aweme_list__item__music__owner_handle Nullable(String) 
	,aweme_list__item__music__owner_id Nullable(String) 
	,aweme_list__item__music__owner_nickname Nullable(String) 
	,aweme_list__item__music__pgc_music_type Nullable(Int64) 
	,aweme_list__item__music__play_url Nullable(String) 
	,aweme_list__item__music__position Nullable(String) 
	,aweme_list__item__music__prevent_download Nullable(UInt8) 
	,aweme_list__item__music__prevent_item_download_status Nullable(Int64) 
	,aweme_list__item__music__preview_end_time Nullable(Int64) 
	,aweme_list__item__music__preview_start_time Nullable(Float64) 
	,aweme_list__item__music__reason_type Nullable(Int64) 
	,aweme_list__item__music__redirect Nullable(UInt8) 
	,aweme_list__item__music__schema_url Nullable(String) 
	,aweme_list__item__music__search_impr Nullable(String) 
	,aweme_list__item__music__sec_uid Nullable(String) 
	,aweme_list__item__music__shoot_duration Nullable(Int64) 
	,aweme_list__item__music__song Nullable(String) 
	,aweme_list__item__music__source_platform Nullable(Int64) 
	,aweme_list__item__music__start_time Nullable(Int64) 
	,aweme_list__item__music__status Nullable(Int64) 
	,aweme_list__item__music__strong_beat_url Nullable(String) 
	,aweme_list__item__music__tag_list Nullable(String) 
	,aweme_list__item__music__title Nullable(String) 
	,aweme_list__item__music__unshelve_countries Nullable(String) 
	,aweme_list__item__music__user_count Nullable(Int64) 
	,aweme_list__item__music__video_duration Nullable(Int64) 
	,aweme_list__item__mix_info__cover_url Nullable(String) 
	,aweme_list__item__mix_info__create_time Nullable(Int64) 
	,aweme_list__item__mix_info__desc Nullable(String) 
	,aweme_list__item__mix_info__extra Nullable(String) 
	,aweme_list__item__mix_info__ids Nullable(String) 
	,aweme_list__item__mix_info__is_serial_mix Nullable(Int64) 
	,aweme_list__item__mix_info__mix_id Nullable(String) 
	,aweme_list__item__mix_info__mix_name Nullable(String) 
	,aweme_list__item__mix_info__mix_pic_type Nullable(Int64) 
	,aweme_list__item__mix_info__mix_type Nullable(Int64) 
	,aweme_list__item__mix_info__status Nullable(String) 
	,aweme_list__item__mix_info__update_time Nullable(Int64) 
	,aweme_list__item__mix_info__watched_item Nullable(String) 
	,aweme_list__item__mix_info__statis__collect_vv Nullable(Int64) 
	,aweme_list__item__mix_info__statis__current_episode Nullable(Int64) 
	,aweme_list__item__mix_info__statis__play_vv Nullable(Int64) 
	,aweme_list__item__mix_info__statis__updated_to_episode Nullable(Int64) 
	,aweme_list__item__mix_info__share_info__share_desc Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title_other Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_url Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__author__accept_private_policy UInt8 
	,aweme_list__item__author__account_region Nullable(String) 
	,aweme_list__item__author__ad_cover_url Nullable(String) 
	,aweme_list__item__author__apple_account Int64 
	,aweme_list__item__author__authority_status Int64 
	,aweme_list__item__author__avatar_168x168 Nullable(String) 
	,aweme_list__item__author__avatar_300x300 Nullable(String) 
	,aweme_list__item__author__avatar_larger Nullable(String) 
	,aweme_list__item__author__avatar_medium Nullable(String) 
	,aweme_list__item__author__avatar_thumb Nullable(String) 
	,aweme_list__item__author__avatar_uri Nullable(String) 
	,aweme_list__item__author__aweme_count Int64 
	,aweme_list__item__author__aweme_hotsoon_auth Nullable(Int64) 
	,aweme_list__item__author__aweme_hotsoon_auth_relation Nullable(Int64) 
	,aweme_list__item__author__ban_user_functions Nullable(String) 
	,aweme_list__item__author__bind_phone Nullable(String) 
	,aweme_list__item__author__birthday Nullable(String) 
	,aweme_list__item__author__can_set_geofencing Nullable(String) 
	,aweme_list__item__author__card_entries Nullable(String) 
	,aweme_list__item__author__card_entries_not_display Nullable(String) 
	,aweme_list__item__author__card_sort_priority Nullable(String) 
	,aweme_list__item__author__cf_list Nullable(String) 
	,aweme_list__item__author__cha_list Nullable(String) 
	,aweme_list__item__author__close_friend_type Int64 
	,aweme_list__item__author__comment_filter_status Int64 
	,aweme_list__item__author__comment_setting Int64 
	,aweme_list__item__author__commerce_user_level Int64 
	,aweme_list__item__author__constellation Int64 
	,aweme_list__item__author__contacts_status Int64 
	,aweme_list__item__author__contrail_list Nullable(String) 
	,aweme_list__item__author__cover_url Nullable(String) 
	,aweme_list__item__author__create_time Int64 
	,aweme_list__item__author__custom_verify Nullable(String) 
	,aweme_list__item__author__cv_level Nullable(String) 
	,aweme_list__item__author__data_label_list Nullable(String) 
	,aweme_list__item__author__display_info Nullable(String) 
	,aweme_list__item__author__download_prompt_ts Int64 
	,aweme_list__item__author__download_setting Int64 
	,aweme_list__item__author__duet_setting Int64 
	,aweme_list__item__author__enable_nearby_visible UInt8 
	,aweme_list__item__author__endorsement_info_list Nullable(String) 
	,aweme_list__item__author__enterprise_verify_reason Nullable(String) 
	,aweme_list__item__author__favoriting_count Int64 
	,aweme_list__item__author__fb_expire_time Int64 
	,aweme_list__item__author__follow_status Int64 
	,aweme_list__item__author__follower_count Int64 
	,aweme_list__item__author__follower_list_secondary_information_struct Nullable(String) 
	,aweme_list__item__author__follower_request_status Int64 
	,aweme_list__item__author__follower_status Int64 
	,aweme_list__item__author__followers_detail Nullable(String) 
	,aweme_list__item__author__following_count Int64 
	,aweme_list__item__author__gender Int64 
	,aweme_list__item__author__geofencing Nullable(String) 
	,aweme_list__item__author__google_account Nullable(String) 
	,aweme_list__item__author__has_email UInt8 
	,aweme_list__item__author__has_facebook_token UInt8 
	,aweme_list__item__author__has_insights UInt8 
	,aweme_list__item__author__has_orders UInt8 
	,aweme_list__item__author__has_twitter_token UInt8 
	,aweme_list__item__author__has_unread_story UInt8 
	,aweme_list__item__author__has_youtube_token UInt8 
	,aweme_list__item__author__hide_location UInt8 
	,aweme_list__item__author__hide_search UInt8 
	,aweme_list__item__author__homepage_bottom_toast Nullable(String) 
	,aweme_list__item__author__im_role_ids Nullable(String) 
	,aweme_list__item__author__ins_id Nullable(String) 
	,aweme_list__item__author__interest_tags Nullable(String) 
	,aweme_list__item__author__is_ad_fake UInt8 
	,aweme_list__item__author__is_binded_weibo UInt8 
	,aweme_list__item__author__is_block UInt8 
	,aweme_list__item__author__is_blocked_v2 UInt8 
	,aweme_list__item__author__is_blocking_v2 UInt8 
	,aweme_list__item__author__is_cf Int64 
	,aweme_list__item__author__is_discipline_member UInt8 
	,aweme_list__item__author__is_gov_media_vip UInt8 
	,aweme_list__item__author__is_mix_user UInt8 
	,aweme_list__item__author__is_not_show UInt8 
	,aweme_list__item__author__is_phone_binded UInt8 
	,aweme_list__item__author__is_star UInt8 
	,aweme_list__item__author__is_verified UInt8 
	,aweme_list__item__author__item_list Nullable(String) 
	,aweme_list__item__author__ky_only_predict Float64 
	,aweme_list__item__author__language Nullable(String) 
	,aweme_list__item__author__link_item_list Nullable(String) 
	,aweme_list__item__author__live_agreement Int64 
	,aweme_list__item__author__live_agreement_time Int64 
	,aweme_list__item__author__live_commerce UInt8 
	,aweme_list__item__author__live_status Int64 
	,aweme_list__item__author__live_verify Int64 
	,aweme_list__item__author__location Nullable(String) 
	,aweme_list__item__author__max_follower_count Int64 
	,aweme_list__item__author__need_points Nullable(String) 
	,aweme_list__item__author__need_recommend Int64 
	,aweme_list__item__author__neiguang_shield Int64 
	,aweme_list__item__author__new_story_cover Nullable(String) 
	,aweme_list__item__author__nickname Nullable(String) 
	,aweme_list__item__author__not_seen_item_id_list Nullable(String) 
	,aweme_list__item__author__not_seen_item_id_list_v2 Nullable(String) 
	,aweme_list__item__author__offline_info_list Nullable(String) 
	,aweme_list__item__author__personal_tag_list Nullable(String) 
	,aweme_list__item__author__platform_sync_info Nullable(String) 
	,aweme_list__item__author__prevent_download UInt8 
	,aweme_list__item__author__react_setting Int64 
	,aweme_list__item__author__reflow_page_gid Int64 
	,aweme_list__item__author__reflow_page_uid Int64 
	,aweme_list__item__author__region Nullable(String) 
	,aweme_list__item__author__relative_users Nullable(String) 
	,aweme_list__item__author__risk_notice_text Nullable(String) 
	,aweme_list__item__author__room_data Nullable(String) 
	,aweme_list__item__author__room_id Int64 
	,aweme_list__item__author__room_id_str Nullable(String) 
	,aweme_list__item__author__school_category Int64 
	,aweme_list__item__author__school_id Nullable(String) 
	,aweme_list__item__author__school_name Nullable(String) 
	,aweme_list__item__author__school_poi_id Nullable(String) 
	,aweme_list__item__author__school_type Int64 
	,aweme_list__item__author__search_impr Nullable(String) 
	,aweme_list__item__author__sec_uid Nullable(String) 
	,aweme_list__item__author__secret Int64 
	,aweme_list__item__author__share_qrcode_uri Nullable(String) 
	,aweme_list__item__author__shield_comment_notice Int64 
	,aweme_list__item__author__shield_digg_notice Int64 
	,aweme_list__item__author__shield_follow_notice Int64 
	,aweme_list__item__author__short_id Nullable(String) 
	,aweme_list__item__author__show_image_bubble UInt8 
	,aweme_list__item__author__show_nearby_active UInt8 
	,aweme_list__item__author__signature Nullable(String) 
	,aweme_list__item__author__signature_display_lines Int64 
	,aweme_list__item__author__signature_extra Nullable(String) 
	,aweme_list__item__author__special_follow_status Int64 
	,aweme_list__item__author__special_lock Int64 
	,aweme_list__item__author__special_people_labels Nullable(String) 
	,aweme_list__item__author__status Int64 
	,aweme_list__item__author__stitch_setting Int64 
	,aweme_list__item__author__story_count Int64 
	,aweme_list__item__author__story_open UInt8 
	,aweme_list__item__author__sync_to_toutiao Int64 
	,aweme_list__item__author__text_extra Nullable(String) 
	,aweme_list__item__author__total_favorited Int64 
	,aweme_list__item__author__tw_expire_time Int64 
	,aweme_list__item__author__twitter_id Nullable(String) 
	,aweme_list__item__author__twitter_name Nullable(String) 
	,aweme_list__item__author__type_label Nullable(String) 
	,aweme_list__item__author__uid Nullable(String) 
	,aweme_list__item__author__unique_id Nullable(String) 
	,aweme_list__item__author__unique_id_modify_time Int64 
	,aweme_list__item__author__user_age Int64 
	,aweme_list__item__author__user_canceled UInt8 
	,aweme_list__item__author__user_mode Int64 
	,aweme_list__item__author__user_not_see Int64 
	,aweme_list__item__author__user_not_show Int64 
	,aweme_list__item__author__user_period Int64 
	,aweme_list__item__author__user_permissions Nullable(String) 
	,aweme_list__item__author__user_rate Int64 
	,aweme_list__item__author__user_tags Nullable(String) 
	,aweme_list__item__author__verification_type Int64 
	,aweme_list__item__author__verify_info Nullable(String) 
	,aweme_list__item__author__video_icon Nullable(String) 
	,aweme_list__item__author__weibo_name Nullable(String) 
	,aweme_list__item__author__weibo_schema Nullable(String) 
	,aweme_list__item__author__weibo_url Nullable(String) 
	,aweme_list__item__author__weibo_verify Nullable(String) 
	,aweme_list__item__author__white_cover_url Nullable(String) 
	,aweme_list__item__author__with_commerce_entry UInt8 
	,aweme_list__item__author__with_dou_entry UInt8 
	,aweme_list__item__author__with_fusion_shop_entry UInt8 
	,aweme_list__item__author__with_shop_entry UInt8 
	,aweme_list__item__author__youtube_channel_id Nullable(String) 
	,aweme_list__item__author__youtube_channel_title Nullable(String) 
	,aweme_list__item__author__youtube_expire_time Int64 
	,aweme_list__item__author__share_info__share_desc Nullable(String) 
	,aweme_list__item__author__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__author__share_info__share_qrcode_url Nullable(String) 
	,aweme_list__item__author__share_info__share_title Nullable(String) 
	,aweme_list__item__author__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__author__share_info__share_title_other Nullable(String) 
	,aweme_list__item__author__share_info__share_url Nullable(String) 
	,aweme_list__item__author__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__author__original_musician__digg_count Int64 
	,aweme_list__item__author__original_musician__music_count Int64 
	,aweme_list__item__author__original_musician__music_used_count Int64 
	,aweme_list__item__author__aweme_control__can_comment UInt8 
	,aweme_list__item__author__aweme_control__can_forward UInt8 
	,aweme_list__item__author__aweme_control__can_share UInt8 
	,aweme_list__item__author__aweme_control__can_show_comment UInt8 
	,source_time DateTime
	,inserted_time  DateTime default now() 
)engine=🍌🍌🍌
"""
    
    @debug_log
    def output_table_sql(self) -> str:
        '''
        远程表建表语句
        :return:
        '''
        return f"""
create table if not exists {self.OUTPUT_TABLE} (
	cursor Int64 
	,global_doodle_config Nullable(String) 
	,has_more Int64 
	,log_pb Nullable(String) 
	,search_nil_info Nullable(String) 
	,status_code Int64 
	,extra__fatal_item_ids Nullable(String) 
	,extra__logid Nullable(String) 
	,extra__now Int64 
	,extra__search_request_id Nullable(String) 
	,aweme_list__item__ad_aweme_source Nullable(Int64) 
	,aweme_list__item__ancestor_info Nullable(String) 
	,aweme_list__item__anchors Nullable(String) 
	,aweme_list__item__authentication_token Nullable(String) 
	,aweme_list__item__author_mask_tag Int64 
	,aweme_list__item__author_user_id Int64 
	,aweme_list__item__aweme_id Nullable(String) 
	,aweme_list__item__aweme_type Int64 
	,aweme_list__item__bodydance_score Nullable(Int64) 
	,aweme_list__item__book_bar Nullable(String) 
	,aweme_list__item__category_da Nullable(Int64) 
	,aweme_list__item__cha_list Nullable(String) 
	,aweme_list__item__challenge_position Nullable(String) 
	,aweme_list__item__chapter_list Nullable(String) 
	,aweme_list__item__city Nullable(String) 
	,aweme_list__item__cmt_swt UInt8 
	,aweme_list__item__collect_stat Int64 
	,aweme_list__item__collection_corner_mark Int64 
	,aweme_list__item__comment_gid Int64 
	,aweme_list__item__comment_list Nullable(String) 
	,aweme_list__item__comment_permission_info Nullable(String) 
	,aweme_list__item__commerce_config_data Nullable(String) 
	,aweme_list__item__commerce_info Nullable(String) 
	,aweme_list__item__common_bar_info Nullable(String) 
	,aweme_list__item__component_info_v2 Nullable(String) 
	,aweme_list__item__cooperation_info Nullable(String) 
	,aweme_list__item__cover_labels Nullable(String) 
	,aweme_list__item__create_time Int64 
	,aweme_list__item__create_time_config Nullable(String) 
	,aweme_list__item__danmaku_control Nullable(String) 
	,aweme_list__item__desc Nullable(String) 
	,aweme_list__item__desc_language Nullable(String) 
	,aweme_list__item__descendants Nullable(String) 
	,aweme_list__item__digg_lottie Nullable(String) 
	,aweme_list__item__disable_relation_bar Nullable(Int64) 
	,aweme_list__item__dislike_dimension_list Nullable(String) 
	,aweme_list__item__distance Nullable(String) 
	,aweme_list__item__distribute_type Nullable(Int64) 
	,aweme_list__item__duet_aggregate_in_music_tab UInt8 
	,aweme_list__item__duet_origin_item_id Nullable(String) 
	,aweme_list__item__duration Int64 
	,aweme_list__item__game_info Nullable(String) 
	,aweme_list__item__geofencing Nullable(String) 
	,aweme_list__item__geofencing_regions Nullable(String) 
	,aweme_list__item__group_id Nullable(String) 
	,aweme_list__item__guide_btn_type Int64 
	,aweme_list__item__has_vs_entry UInt8 
	,aweme_list__item__have_dashboard UInt8 
	,aweme_list__item__horizontal_type Nullable(Int64) 
	,aweme_list__item__hybrid_label Nullable(String) 
	,aweme_list__item__image_album_music_info Nullable(String) 
	,aweme_list__item__image_comment Nullable(String) 
	,aweme_list__item__image_infos Nullable(String) 
	,aweme_list__item__image_list Nullable(String) 
	,aweme_list__item__images Nullable(String) 
	,aweme_list__item__img_bitrate Nullable(String) 
	,aweme_list__item__interaction_stickers Nullable(String) 
	,aweme_list__item__is_collects_selected Int64 
	,aweme_list__item__is_duet_sing UInt8 
	,aweme_list__item__is_fantasy UInt8 
	,aweme_list__item__is_first_video UInt8 
	,aweme_list__item__is_hash_tag Int64 
	,aweme_list__item__is_image_beat UInt8 
	,aweme_list__item__is_in_scope UInt8 
	,aweme_list__item__is_karaoke UInt8 
	,aweme_list__item__is_life_item UInt8 
	,aweme_list__item__is_multi_content Nullable(Int64) 
	,aweme_list__item__is_pgcshow UInt8 
	,aweme_list__item__is_preview Nullable(Int64) 
	,aweme_list__item__is_relieve UInt8 
	,aweme_list__item__is_share_post UInt8 
	,aweme_list__item__is_story Int64 
	,aweme_list__item__is_top Nullable(Int64) 
	,aweme_list__item__is_vr UInt8 
	,aweme_list__item__item_comment_settings Int64 
	,aweme_list__item__item_duet Int64 
	,aweme_list__item__item_react Int64 
	,aweme_list__item__item_share Int64 
	,aweme_list__item__item_stitch Int64 
	,aweme_list__item__item_warn_notification Nullable(String) 
	,aweme_list__item__label_top Nullable(String) 
	,aweme_list__item__label_top_text Nullable(String) 
	,aweme_list__item__link_ad_data Nullable(String) 
	,aweme_list__item__live_id Nullable(Int64) 
	,aweme_list__item__live_type Nullable(String) 
	,aweme_list__item__long_video Nullable(String) 
	,aweme_list__item__misc_info Nullable(String) 
	,aweme_list__item__nearby_level Int64 
	,aweme_list__item__need_vs_entry Nullable(UInt8) 
	,aweme_list__item__nickname_position Nullable(String) 
	,aweme_list__item__origin_comment_ids Nullable(String) 
	,aweme_list__item__origin_text_extra Nullable(String) 
	,aweme_list__item__original_images Nullable(String) 
	,aweme_list__item__packed_clips Nullable(String) 
	,aweme_list__item__photo_search_entrance Nullable(String) 
	,aweme_list__item__poi_biz Nullable(String) 
	,aweme_list__item__poi_patch_info Nullable(String) 
	,aweme_list__item__position Nullable(String) 
	,aweme_list__item__prevent_download UInt8 
	,aweme_list__item__preview_title Nullable(String) 
	,aweme_list__item__preview_video_status Int64 
	,aweme_list__item__promotions Nullable(String) 
	,aweme_list__item__rate Int64 
	,aweme_list__item__ref_tts_id_list Nullable(String) 
	,aweme_list__item__ref_voice_modify_id_list Nullable(String) 
	,aweme_list__item__region Nullable(String) 
	,aweme_list__item__relation_labels Nullable(String) 
	,aweme_list__item__report_action UInt8 
	,aweme_list__item__search_impr Nullable(String) 
	,aweme_list__item__seo_info Nullable(String) 
	,aweme_list__item__series_paid_info Nullable(String) 
	,aweme_list__item__share_from Nullable(String) 
	,aweme_list__item__share_url Nullable(String) 
	,aweme_list__item__should_open_ad_report UInt8 
	,aweme_list__item__show_follow_button Nullable(String) 
	,aweme_list__item__social_tag_list Nullable(String) 
	,aweme_list__item__sort_label Nullable(String) 
	,aweme_list__item__special_mode Nullable(Int64) 
	,aweme_list__item__standard_bar_info_list Nullable(String) 
	,aweme_list__item__star_atlas_info Nullable(String) 
	,aweme_list__item__sticker_detail Nullable(String) 
	,aweme_list__item__stickers Nullable(String) 
	,aweme_list__item__story_source_type Nullable(Int64) 
	,aweme_list__item__story_ttl Nullable(Int64) 
	,aweme_list__item__text_extra Nullable(String) 
	,aweme_list__item__tool_bar Nullable(String) 
	,aweme_list__item__tts_id_list Nullable(String) 
	,aweme_list__item__uniqid_position Nullable(String) 
	,aweme_list__item__user_digged Int64 
	,aweme_list__item__user_recommend_status Int64 
	,aweme_list__item__video_labels Nullable(String) 
	,aweme_list__item__video_reply_info Nullable(String) 
	,aweme_list__item__video_tag Nullable(String) 
	,aweme_list__item__video_text Nullable(String) 
	,aweme_list__item__voice_modify_id_list Nullable(String) 
	,aweme_list__item__vr_type Int64 
	,aweme_list__item__with_promotional_music UInt8 
	,aweme_list__item__without_watermark UInt8 
	,aweme_list__item__xigua_task Nullable(String) 
	,aweme_list__item__risk_infos__content Nullable(String) 
	,aweme_list__item__risk_infos__icon_url Nullable(String) 
	,aweme_list__item__risk_infos__risk_sink UInt8 
	,aweme_list__item__risk_infos__type Int64 
	,aweme_list__item__risk_infos__url Nullable(String) 
	,aweme_list__item__risk_infos__vote UInt8 
	,aweme_list__item__risk_infos__warn UInt8 
	,aweme_list__item__risk_infos__warn_level Nullable(Int64) 
	,aweme_list__item__micro_app_info__app_id Nullable(String) 
	,aweme_list__item__micro_app_info__app_name Nullable(String) 
	,aweme_list__item__micro_app_info__description Nullable(String) 
	,aweme_list__item__micro_app_info__icon Nullable(String) 
	,aweme_list__item__micro_app_info__orientation Nullable(Int64) 
	,aweme_list__item__micro_app_info__schema Nullable(String) 
	,aweme_list__item__micro_app_info__state Nullable(Int64) 
	,aweme_list__item__micro_app_info__summary Nullable(String) 
	,aweme_list__item__micro_app_info__title Nullable(String) 
	,aweme_list__item__micro_app_info__type Nullable(Int64) 
	,aweme_list__item__hot_list__extra Nullable(String) 
	,aweme_list__item__hot_list__footer Nullable(String) 
	,aweme_list__item__hot_list__group_id Nullable(String) 
	,aweme_list__item__hot_list__header Nullable(String) 
	,aweme_list__item__hot_list__hot_score Nullable(Int64) 
	,aweme_list__item__hot_list__i18n_title Nullable(String) 
	,aweme_list__item__hot_list__image_url Nullable(String) 
	,aweme_list__item__hot_list__pattern_type Nullable(Int64) 
	,aweme_list__item__hot_list__rank Nullable(Int64) 
	,aweme_list__item__hot_list__schema Nullable(String) 
	,aweme_list__item__hot_list__sentence Nullable(String) 
	,aweme_list__item__hot_list__sentence_id Nullable(Int64) 
	,aweme_list__item__hot_list__title Nullable(String) 
	,aweme_list__item__hot_list__type Nullable(Int64) 
	,aweme_list__item__hot_list__view_count Nullable(Int64) 
	,aweme_list__item__anchor_info__content Nullable(String) 
	,aweme_list__item__anchor_info__display_info Nullable(String) 
	,aweme_list__item__anchor_info__extra Nullable(String) 
	,aweme_list__item__anchor_info__icon Nullable(String) 
	,aweme_list__item__anchor_info__id Nullable(String) 
	,aweme_list__item__anchor_info__log_extra Nullable(String) 
	,aweme_list__item__anchor_info__mp_url Nullable(String) 
	,aweme_list__item__anchor_info__open_url Nullable(String) 
	,aweme_list__item__anchor_info__style_info Nullable(String) 
	,aweme_list__item__anchor_info__title Nullable(String) 
	,aweme_list__item__anchor_info__title_tag Nullable(String) 
	,aweme_list__item__anchor_info__type Nullable(Int64) 
	,aweme_list__item__anchor_info__web_url Nullable(String) 
	,aweme_list__item__video__animated_cover Nullable(String) 
	,aweme_list__item__video__big_thumbs Nullable(String) 
	,aweme_list__item__video__bit_rate Nullable(String) 
	,aweme_list__item__video__cdn_url_expired Nullable(Int64) 
	,aweme_list__item__video__cover Nullable(String) 
	,aweme_list__item__video__download_addr Nullable(String) 
	,aweme_list__item__video__download_suffix_logo_addr Nullable(String) 
	,aweme_list__item__video__duration Int64 
	,aweme_list__item__video__dynamic_cover Nullable(String) 
	,aweme_list__item__video__has_download_suffix_logo_addr Nullable(UInt8) 
	,aweme_list__item__video__has_watermark UInt8 
	,aweme_list__item__video__height Int64 
	,aweme_list__item__video__horizontal_type Nullable(Int64) 
	,aweme_list__item__video__is_bytevc1 Int64 
	,aweme_list__item__video__is_callback Nullable(UInt8) 
	,aweme_list__item__video__is_h265 Int64 
	,aweme_list__item__video__is_long_video Nullable(Int64) 
	,aweme_list__item__video__is_source_HDR Nullable(Int64) 
	,aweme_list__item__video__meta Nullable(String) 
	,aweme_list__item__video__misc_download_addrs Nullable(String) 
	,aweme_list__item__video__need_set_token UInt8 
	,aweme_list__item__video__optimized_cover Nullable(String) 
	,aweme_list__item__video__origin_cover Nullable(String) 
	,aweme_list__item__video__play_addr Nullable(String) 
	,aweme_list__item__video__play_addr_265 Nullable(String) 
	,aweme_list__item__video__play_addr_h264 Nullable(String) 
	,aweme_list__item__video__play_addr_lowbr Nullable(String) 
	,aweme_list__item__video__ratio Nullable(String) 
	,aweme_list__item__video__tags Nullable(String) 
	,aweme_list__item__video__use_static_cover UInt8 
	,aweme_list__item__video__video_model Nullable(String) 
	,aweme_list__item__video__width Int64 
	,aweme_list__item__video_control__allow_douplus UInt8 
	,aweme_list__item__video_control__allow_download UInt8 
	,aweme_list__item__video_control__allow_duet UInt8 
	,aweme_list__item__video_control__allow_dynamic_wallpaper UInt8 
	,aweme_list__item__video_control__allow_music UInt8 
	,aweme_list__item__video_control__allow_react UInt8 
	,aweme_list__item__video_control__allow_share UInt8 
	,aweme_list__item__video_control__allow_stitch UInt8 
	,aweme_list__item__video_control__download_ignore_visibility UInt8 
	,aweme_list__item__video_control__download_info Nullable(String) 
	,aweme_list__item__video_control__draft_progress_bar Int64 
	,aweme_list__item__video_control__duet_ignore_visibility UInt8 
	,aweme_list__item__video_control__duet_info Nullable(String) 
	,aweme_list__item__video_control__prevent_download_type Int64 
	,aweme_list__item__video_control__share_grayed UInt8 
	,aweme_list__item__video_control__share_ignore_visibility UInt8 
	,aweme_list__item__video_control__share_type Int64 
	,aweme_list__item__video_control__show_progress_bar Int64 
	,aweme_list__item__video_control__timer_status Int64 
	,aweme_list__item__statistics__admire_count Int64 
	,aweme_list__item__statistics__aweme_id Nullable(String) 
	,aweme_list__item__statistics__collect_count Int64 
	,aweme_list__item__statistics__comment_count Int64 
	,aweme_list__item__statistics__digest Nullable(String) 
	,aweme_list__item__statistics__digg_count Int64 
	,aweme_list__item__statistics__download_count Int64 
	,aweme_list__item__statistics__exposure_count Int64 
	,aweme_list__item__statistics__forward_count Int64 
	,aweme_list__item__statistics__live_watch_count Int64 
	,aweme_list__item__statistics__lose_comment_count Int64 
	,aweme_list__item__statistics__lose_count Int64 
	,aweme_list__item__statistics__play_count Int64 
	,aweme_list__item__statistics__share_count Int64 
	,aweme_list__item__statistics__whatsapp_share_count Int64 
	,aweme_list__item__share_info__bool_persist Nullable(Int64) 
	,aweme_list__item__share_info__share_desc Nullable(String) 
	,aweme_list__item__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__share_info__share_link_desc Nullable(String) 
	,aweme_list__item__share_info__share_quote Nullable(String) 
	,aweme_list__item__share_info__share_signature_desc Nullable(String) 
	,aweme_list__item__share_info__share_signature_url Nullable(String) 
	,aweme_list__item__share_info__share_title Nullable(String) 
	,aweme_list__item__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__share_info__share_title_other Nullable(String) 
	,aweme_list__item__share_info__share_url Nullable(String) 
	,aweme_list__item__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__poi_info__collect_stat Nullable(Int64) 
	,aweme_list__item__poi_info__collected_count Nullable(String) 
	,aweme_list__item__poi_info__cover_hd Nullable(String) 
	,aweme_list__item__poi_info__cover_large Nullable(String) 
	,aweme_list__item__poi_info__cover_medium Nullable(String) 
	,aweme_list__item__poi_info__cover_thumb Nullable(String) 
	,aweme_list__item__poi_info__distance Nullable(String) 
	,aweme_list__item__poi_info__effect_ids Nullable(String) 
	,aweme_list__item__poi_info__expand_type Nullable(Int64) 
	,aweme_list__item__poi_info__ext_json Nullable(String) 
	,aweme_list__item__poi_info__fulfill_task_list Nullable(String) 
	,aweme_list__item__poi_info__icon_on_entry Nullable(String) 
	,aweme_list__item__poi_info__icon_on_info Nullable(String) 
	,aweme_list__item__poi_info__icon_on_map Nullable(String) 
	,aweme_list__item__poi_info__icon_service_type_list Nullable(String) 
	,aweme_list__item__poi_info__icon_type Nullable(Int64) 
	,aweme_list__item__poi_info__is_admin_area Nullable(UInt8) 
	,aweme_list__item__poi_info__is_at_call_back_collect Nullable(UInt8) 
	,aweme_list__item__poi_info__is_food_group_buy Nullable(UInt8) 
	,aweme_list__item__poi_info__item_count Nullable(Int64) 
	,aweme_list__item__poi_info__poi_3class_type Nullable(String) 
	,aweme_list__item__poi_info__poi_backend_type Nullable(String) 
	,aweme_list__item__poi_info__poi_detail_tags Nullable(String) 
	,aweme_list__item__poi_info__poi_frontend_type Nullable(String) 
	,aweme_list__item__poi_info__poi_id Nullable(String) 
	,aweme_list__item__poi_info__poi_latitude Nullable(Float64) 
	,aweme_list__item__poi_info__poi_longitude Nullable(Float64) 
	,aweme_list__item__poi_info__poi_name Nullable(String) 
	,aweme_list__item__poi_info__poi_ranks Nullable(String) 
	,aweme_list__item__poi_info__poi_subtitle Nullable(String) 
	,aweme_list__item__poi_info__poi_subtitle_type Nullable(Int64) 
	,aweme_list__item__poi_info__popularity Nullable(String) 
	,aweme_list__item__poi_info__service_type_list Nullable(String) 
	,aweme_list__item__poi_info__share_info Nullable(String) 
	,aweme_list__item__poi_info__show_type Nullable(Int64) 
	,aweme_list__item__poi_info__sp_source Nullable(String) 
	,aweme_list__item__poi_info__type_code Nullable(String) 
	,aweme_list__item__poi_info__user_count Nullable(Int64) 
	,aweme_list__item__poi_info__view_count Nullable(String) 
	,aweme_list__item__poi_info__voucher_release_areas Nullable(String) 
	,aweme_list__item__poi_info__address_info__ad_code_v2 Nullable(String) 
	,aweme_list__item__poi_info__address_info__address Nullable(String) 
	,aweme_list__item__poi_info__address_info__city Nullable(String) 
	,aweme_list__item__poi_info__address_info__city_code Nullable(String) 
	,aweme_list__item__poi_info__address_info__city_code_v2 Nullable(String) 
	,aweme_list__item__poi_info__address_info__country Nullable(String) 
	,aweme_list__item__poi_info__address_info__country_code Nullable(String) 
	,aweme_list__item__poi_info__address_info__district Nullable(String) 
	,aweme_list__item__poi_info__address_info__province Nullable(String) 
	,aweme_list__item__poi_info__address_info__simple_addr Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_a Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_b Nullable(String) 
	,aweme_list__item__impression_data__group_id_list_c Nullable(String) 
	,aweme_list__item__impression_data__similar_id_list_a Nullable(String) 
	,aweme_list__item__impression_data__similar_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__ad_aweme_source Nullable(Int64) 
	,aweme_list__item__duet_origin_item__anchors Nullable(String) 
	,aweme_list__item__duet_origin_item__authentication_token Nullable(String) 
	,aweme_list__item__duet_origin_item__author_mask_tag Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author_user_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__aweme_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__bodydance_score Nullable(Int64) 
	,aweme_list__item__duet_origin_item__cha_list Nullable(String) 
	,aweme_list__item__duet_origin_item__challenge_position Nullable(String) 
	,aweme_list__item__duet_origin_item__chapter_list Nullable(String) 
	,aweme_list__item__duet_origin_item__city Nullable(String) 
	,aweme_list__item__duet_origin_item__cmt_swt Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__collect_stat Nullable(Int64) 
	,aweme_list__item__duet_origin_item__collection_corner_mark Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_gid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_list Nullable(String) 
	,aweme_list__item__duet_origin_item__commerce_config_data Nullable(String) 
	,aweme_list__item__duet_origin_item__common_bar_info Nullable(String) 
	,aweme_list__item__duet_origin_item__component_info_v2 Nullable(String) 
	,aweme_list__item__duet_origin_item__cover_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__create_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__desc Nullable(String) 
	,aweme_list__item__duet_origin_item__desc_language Nullable(String) 
	,aweme_list__item__duet_origin_item__disable_relation_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__dislike_dimension_list Nullable(String) 
	,aweme_list__item__duet_origin_item__distance Nullable(String) 
	,aweme_list__item__duet_origin_item__distribute_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__duet_aggregate_in_music_tab Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__geofencing_regions Nullable(String) 
	,aweme_list__item__duet_origin_item__group_id Nullable(String) 
	,aweme_list__item__duet_origin_item__guide_btn_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__has_vs_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__have_dashboard Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__horizontal_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__hybrid_label Nullable(String) 
	,aweme_list__item__duet_origin_item__image_album_music_info Nullable(String) 
	,aweme_list__item__duet_origin_item__image_comment Nullable(String) 
	,aweme_list__item__duet_origin_item__image_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__image_list Nullable(String) 
	,aweme_list__item__duet_origin_item__images Nullable(String) 
	,aweme_list__item__duet_origin_item__img_bitrate Nullable(String) 
	,aweme_list__item__duet_origin_item__interaction_stickers Nullable(String) 
	,aweme_list__item__duet_origin_item__is_collects_selected Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_duet_sing Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_fantasy Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_first_video Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_hash_tag Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_image_beat Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_in_scope Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_karaoke Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_life_item Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_pgcshow Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_preview Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_relieve Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_share_post Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__is_story Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_top Nullable(Int64) 
	,aweme_list__item__duet_origin_item__is_vr Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__item_comment_settings Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_duet Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_react Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_share Nullable(Int64) 
	,aweme_list__item__duet_origin_item__item_stitch Nullable(Int64) 
	,aweme_list__item__duet_origin_item__label_top_text Nullable(String) 
	,aweme_list__item__duet_origin_item__long_video Nullable(String) 
	,aweme_list__item__duet_origin_item__misc_info Nullable(String) 
	,aweme_list__item__duet_origin_item__nearby_level Nullable(Int64) 
	,aweme_list__item__duet_origin_item__need_vs_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__nickname_position Nullable(String) 
	,aweme_list__item__duet_origin_item__origin_comment_ids Nullable(String) 
	,aweme_list__item__duet_origin_item__origin_text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__original_images Nullable(String) 
	,aweme_list__item__duet_origin_item__packed_clips Nullable(String) 
	,aweme_list__item__duet_origin_item__photo_search_entrance Nullable(String) 
	,aweme_list__item__duet_origin_item__poi_biz Nullable(String) 
	,aweme_list__item__duet_origin_item__poi_patch_info Nullable(String) 
	,aweme_list__item__duet_origin_item__position Nullable(String) 
	,aweme_list__item__duet_origin_item__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__preview_title Nullable(String) 
	,aweme_list__item__duet_origin_item__preview_video_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__promotions Nullable(String) 
	,aweme_list__item__duet_origin_item__rate Nullable(Int64) 
	,aweme_list__item__duet_origin_item__ref_tts_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__ref_voice_modify_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__region Nullable(String) 
	,aweme_list__item__duet_origin_item__relation_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__report_action Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__seo_info Nullable(String) 
	,aweme_list__item__duet_origin_item__series_paid_info Nullable(String) 
	,aweme_list__item__duet_origin_item__should_open_ad_report Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__show_follow_button Nullable(String) 
	,aweme_list__item__duet_origin_item__social_tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__sort_label Nullable(String) 
	,aweme_list__item__duet_origin_item__standard_bar_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__story_ttl Nullable(Int64) 
	,aweme_list__item__duet_origin_item__text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__tool_bar Nullable(String) 
	,aweme_list__item__duet_origin_item__tts_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__uniqid_position Nullable(String) 
	,aweme_list__item__duet_origin_item__user_digged Nullable(Int64) 
	,aweme_list__item__duet_origin_item__user_recommend_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__video_tag Nullable(String) 
	,aweme_list__item__duet_origin_item__video_text Nullable(String) 
	,aweme_list__item__duet_origin_item__voice_modify_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__vr_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__with_promotional_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__without_watermark Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__xigua_task Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__allow_douplus Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_duet Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_dynamic_wallpaper Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_react Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__allow_stitch Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__download_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__download_info Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__draft_progress_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__duet_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__duet_info Nullable(String) 
	,aweme_list__item__duet_origin_item__video_control__prevent_download_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__share_grayed Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__share_ignore_visibility Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video_control__share_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__show_progress_bar Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video_control__timer_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__allow_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__allow_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__aweme_edit_info Nullable(String) 
	,aweme_list__item__duet_origin_item__status__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__status__dont_share_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__download_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__in_reviewing Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_delete Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_private Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__is_prohibited Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__listen_video_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__part_see Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__private_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__review_result Nullable(String) 
	,aweme_list__item__duet_origin_item__status__reviewed Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__self_see Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__video_hide_search Nullable(Int64) 
	,aweme_list__item__duet_origin_item__status__with_fusion_goods Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__status__with_goods Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__statistics__admire_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__aweme_id Nullable(String) 
	,aweme_list__item__duet_origin_item__statistics__collect_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__comment_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__digest Nullable(String) 
	,aweme_list__item__duet_origin_item__statistics__digg_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__download_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__exposure_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__forward_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__live_watch_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__lose_comment_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__lose_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__play_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__share_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__statistics__whatsapp_share_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__album Nullable(String) 
	,aweme_list__item__duet_origin_item__music__artist_user_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__artists Nullable(String) 
	,aweme_list__item__duet_origin_item__music__audition_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__author Nullable(String) 
	,aweme_list__item__duet_origin_item__music__author_deleted Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__author_position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__author_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__avatar_large Nullable(String) 
	,aweme_list__item__duet_origin_item__music__avatar_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__music__avatar_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__music__binded_challenge_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__can_background_play Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__climax Nullable(String) 
	,aweme_list__item__duet_origin_item__music__collect_stat Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__cover_color_hsv Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_hd Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_large Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__music__cover_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__music__dmv_auto_show Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__dsp_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__end_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__external_song_info Nullable(String) 
	,aweme_list__item__duet_origin_item__music__extra Nullable(String) 
	,aweme_list__item__duet_origin_item__music__id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__id_str Nullable(String) 
	,aweme_list__item__duet_origin_item__music__is_audio_url_with_cookie Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_commerce_music Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_del_video Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_matched_metadata Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_original Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_original_sound Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_pgc Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_restricted Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__is_video_self_see Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__luna_info Nullable(String) 
	,aweme_list__item__duet_origin_item__music__lyric_short_position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__matched_pgc_sound Nullable(String) 
	,aweme_list__item__duet_origin_item__music__mid Nullable(String) 
	,aweme_list__item__duet_origin_item__music__music_chart_ranks Nullable(String) 
	,aweme_list__item__duet_origin_item__music__music_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__musician_user_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__mute_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__offline_desc Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_handle Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_id Nullable(String) 
	,aweme_list__item__duet_origin_item__music__owner_nickname Nullable(String) 
	,aweme_list__item__duet_origin_item__music__pgc_music_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__play_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__position Nullable(String) 
	,aweme_list__item__duet_origin_item__music__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__prevent_item_download_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__preview_end_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__preview_start_time Nullable(Float64) 
	,aweme_list__item__duet_origin_item__music__reason_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__redirect Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__music__schema_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__music__sec_uid Nullable(String) 
	,aweme_list__item__duet_origin_item__music__shoot_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__source_platform Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__start_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__strong_beat_url Nullable(String) 
	,aweme_list__item__duet_origin_item__music__tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__music__title Nullable(String) 
	,aweme_list__item__duet_origin_item__music__unshelve_countries Nullable(String) 
	,aweme_list__item__duet_origin_item__music__user_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__video_duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__song__artists Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__chorus Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__chorus_v3_infos Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__music__song__id_str Nullable(String) 
	,aweme_list__item__duet_origin_item__music__song__title Nullable(String) 
	,aweme_list__item__duet_origin_item__descendants__notify_msg Nullable(String) 
	,aweme_list__item__duet_origin_item__descendants__platforms Nullable(String) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_auth_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_auth_target_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_ban_mask Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_source Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__ad_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__commerce_info__is_ad Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_forward Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_share Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_control__can_show_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__animated_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__big_thumbs Nullable(String) 
	,aweme_list__item__duet_origin_item__video__bit_rate Nullable(String) 
	,aweme_list__item__duet_origin_item__video__cdn_url_expired Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__download_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__download_suffix_logo_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__duration Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__dynamic_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__has_download_suffix_logo_addr Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__has_watermark Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__height Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__horizontal_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_bytevc1 Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_callback Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__is_h265 Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_long_video Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__is_source_HDR Nullable(Int64) 
	,aweme_list__item__duet_origin_item__video__meta Nullable(String) 
	,aweme_list__item__duet_origin_item__video__misc_download_addrs Nullable(String) 
	,aweme_list__item__duet_origin_item__video__need_set_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__optimized_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__origin_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_265 Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_h264 Nullable(String) 
	,aweme_list__item__duet_origin_item__video__play_addr_lowbr Nullable(String) 
	,aweme_list__item__duet_origin_item__video__ratio Nullable(String) 
	,aweme_list__item__duet_origin_item__video__tags Nullable(String) 
	,aweme_list__item__duet_origin_item__video__use_static_cover Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__video__video_model Nullable(String) 
	,aweme_list__item__duet_origin_item__video__width Nullable(Int64) 
	,aweme_list__item__duet_origin_item__risk_infos__content Nullable(String) 
	,aweme_list__item__duet_origin_item__risk_infos__risk_sink Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__risk_infos__type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__risk_infos__vote Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__risk_infos__warn Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_a Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__group_id_list_c Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__similar_id_list_a Nullable(String) 
	,aweme_list__item__duet_origin_item__impression_data__similar_id_list_b Nullable(String) 
	,aweme_list__item__duet_origin_item__comment_permission_info__can_comment Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__comment_permission_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__comment_permission_info__item_detail_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__press_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__comment_permission_info__toast_guide Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__aweme_acl__download_mask_panel Nullable(String) 
	,aweme_list__item__duet_origin_item__author__accept_private_policy Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__account_region Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ad_cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__apple_account Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__authority_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__avatar_168x168 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_300x300 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_larger Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_medium Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_thumb Nullable(String) 
	,aweme_list__item__duet_origin_item__author__avatar_uri Nullable(String) 
	,aweme_list__item__duet_origin_item__author__aweme_control Nullable(String) 
	,aweme_list__item__duet_origin_item__author__aweme_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth_relation Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__ban_user_functions Nullable(String) 
	,aweme_list__item__duet_origin_item__author__bind_phone Nullable(String) 
	,aweme_list__item__duet_origin_item__author__birthday Nullable(String) 
	,aweme_list__item__duet_origin_item__author__can_set_geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_entries Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_entries_not_display Nullable(String) 
	,aweme_list__item__duet_origin_item__author__card_sort_priority Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cf_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cha_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__close_friend_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__comment_filter_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__comment_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__commerce_user_level Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__constellation Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__contacts_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__contrail_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__create_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__custom_verify Nullable(String) 
	,aweme_list__item__duet_origin_item__author__cv_level Nullable(String) 
	,aweme_list__item__duet_origin_item__author__data_label_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__display_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__download_prompt_ts Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__download_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__duet_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__enable_nearby_visible Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__endorsement_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__enterprise_verify_reason Nullable(String) 
	,aweme_list__item__duet_origin_item__author__favoriting_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__fb_expire_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follow_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_list_secondary_information_struct Nullable(String) 
	,aweme_list__item__duet_origin_item__author__follower_request_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__follower_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__followers_detail Nullable(String) 
	,aweme_list__item__duet_origin_item__author__following_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__gender Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__geofencing Nullable(String) 
	,aweme_list__item__duet_origin_item__author__google_account Nullable(String) 
	,aweme_list__item__duet_origin_item__author__has_email Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_facebook_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_insights Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_orders Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_twitter_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_unread_story Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__has_youtube_token Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__hide_location Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__hide_search Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__homepage_bottom_toast Nullable(String) 
	,aweme_list__item__duet_origin_item__author__im_role_ids Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ins_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__interest_tags Nullable(String) 
	,aweme_list__item__duet_origin_item__author__is_ad_fake Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_binded_weibo Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_block Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_blocked_v2 Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_blocking_v2 Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_cf Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__is_discipline_member Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_gov_media_vip Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_mix_user Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_not_show Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_phone_binded Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_star Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__is_verified Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__item_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__ky_only_predict Nullable(Float64) 
	,aweme_list__item__duet_origin_item__author__language Nullable(String) 
	,aweme_list__item__duet_origin_item__author__link_item_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__live_agreement Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_agreement_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_commerce Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__live_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__live_verify Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__location Nullable(String) 
	,aweme_list__item__duet_origin_item__author__max_follower_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__need_points Nullable(String) 
	,aweme_list__item__duet_origin_item__author__need_recommend Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__neiguang_shield Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__new_story_cover Nullable(String) 
	,aweme_list__item__duet_origin_item__author__nickname Nullable(String) 
	,aweme_list__item__duet_origin_item__author__not_seen_item_id_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__not_seen_item_id_list_v2 Nullable(String) 
	,aweme_list__item__duet_origin_item__author__offline_info_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__personal_tag_list Nullable(String) 
	,aweme_list__item__duet_origin_item__author__platform_sync_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__prevent_download Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__react_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__reflow_page_gid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__reflow_page_uid Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__region Nullable(String) 
	,aweme_list__item__duet_origin_item__author__relative_users Nullable(String) 
	,aweme_list__item__duet_origin_item__author__risk_notice_text Nullable(String) 
	,aweme_list__item__duet_origin_item__author__room_id Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__school_category Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__school_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_poi_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__school_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__search_impr Nullable(String) 
	,aweme_list__item__duet_origin_item__author__sec_uid Nullable(String) 
	,aweme_list__item__duet_origin_item__author__secret Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_comment_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_digg_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__shield_follow_notice Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__short_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__show_image_bubble Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__show_nearby_active Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__signature Nullable(String) 
	,aweme_list__item__duet_origin_item__author__signature_display_lines Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__signature_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__author__special_follow_status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__special_lock Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__special_people_labels Nullable(String) 
	,aweme_list__item__duet_origin_item__author__status Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__stitch_setting Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__story_count Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__story_open Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__sync_to_toutiao Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__text_extra Nullable(String) 
	,aweme_list__item__duet_origin_item__author__total_favorited Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__tw_expire_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__twitter_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__twitter_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__type_label Nullable(String) 
	,aweme_list__item__duet_origin_item__author__uid Nullable(String) 
	,aweme_list__item__duet_origin_item__author__unique_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__unique_id_modify_time Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_age Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_canceled Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__user_mode Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_not_see Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_not_show Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_period Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_permissions Nullable(String) 
	,aweme_list__item__duet_origin_item__author__user_rate Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__user_tags Nullable(String) 
	,aweme_list__item__duet_origin_item__author__verification_type Nullable(Int64) 
	,aweme_list__item__duet_origin_item__author__verify_info Nullable(String) 
	,aweme_list__item__duet_origin_item__author__video_icon Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_name Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_schema Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__weibo_verify Nullable(String) 
	,aweme_list__item__duet_origin_item__author__white_cover_url Nullable(String) 
	,aweme_list__item__duet_origin_item__author__with_commerce_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_dou_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_fusion_shop_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__with_shop_entry Nullable(UInt8) 
	,aweme_list__item__duet_origin_item__author__youtube_channel_id Nullable(String) 
	,aweme_list__item__duet_origin_item__author__youtube_channel_title Nullable(String) 
	,aweme_list__item__duet_origin_item__author__youtube_expire_time Nullable(Int64) 
	,aweme_list__item__aweme_control__can_comment UInt8 
	,aweme_list__item__aweme_control__can_forward UInt8 
	,aweme_list__item__aweme_control__can_share UInt8 
	,aweme_list__item__aweme_control__can_show_comment UInt8 
	,aweme_list__item__aweme_acl__download_mask_panel__code Nullable(Int64) 
	,aweme_list__item__aweme_acl__download_mask_panel__show_type Nullable(Int64) 
	,aweme_list__item__suggest_words__suggest_words Nullable(String) 
	,aweme_list__item__status__allow_comment UInt8 
	,aweme_list__item__status__allow_share UInt8 
	,aweme_list__item__status__aweme_edit_info Nullable(String) 
	,aweme_list__item__status__aweme_id Nullable(String) 
	,aweme_list__item__status__dont_share_status Int64 
	,aweme_list__item__status__download_status Int64 
	,aweme_list__item__status__in_reviewing UInt8 
	,aweme_list__item__status__is_delete UInt8 
	,aweme_list__item__status__is_private UInt8 
	,aweme_list__item__status__is_prohibited UInt8 
	,aweme_list__item__status__listen_video_status Nullable(Int64) 
	,aweme_list__item__status__part_see Int64 
	,aweme_list__item__status__private_status Int64 
	,aweme_list__item__status__review_result Nullable(String) 
	,aweme_list__item__status__reviewed Int64 
	,aweme_list__item__status__self_see UInt8 
	,aweme_list__item__status__video_hide_search Int64 
	,aweme_list__item__status__with_fusion_goods UInt8 
	,aweme_list__item__status__with_goods UInt8 
	,aweme_list__item__music__album Nullable(String) 
	,aweme_list__item__music__artist_user_infos Nullable(String) 
	,aweme_list__item__music__artists Nullable(String) 
	,aweme_list__item__music__audition_duration Nullable(Int64) 
	,aweme_list__item__music__author Nullable(String) 
	,aweme_list__item__music__author_deleted Nullable(UInt8) 
	,aweme_list__item__music__author_position Nullable(String) 
	,aweme_list__item__music__author_status Nullable(Int64) 
	,aweme_list__item__music__avatar_large Nullable(String) 
	,aweme_list__item__music__avatar_medium Nullable(String) 
	,aweme_list__item__music__avatar_thumb Nullable(String) 
	,aweme_list__item__music__binded_challenge_id Nullable(Int64) 
	,aweme_list__item__music__can_background_play Nullable(UInt8) 
	,aweme_list__item__music__climax Nullable(String) 
	,aweme_list__item__music__collect_stat Nullable(Int64) 
	,aweme_list__item__music__cover_color_hsv Nullable(String) 
	,aweme_list__item__music__cover_hd Nullable(String) 
	,aweme_list__item__music__cover_large Nullable(String) 
	,aweme_list__item__music__cover_medium Nullable(String) 
	,aweme_list__item__music__cover_thumb Nullable(String) 
	,aweme_list__item__music__dmv_auto_show Nullable(UInt8) 
	,aweme_list__item__music__dsp_status Nullable(Int64) 
	,aweme_list__item__music__duration Nullable(Int64) 
	,aweme_list__item__music__end_time Nullable(Int64) 
	,aweme_list__item__music__external_song_info Nullable(String) 
	,aweme_list__item__music__extra Nullable(String) 
	,aweme_list__item__music__id Nullable(Int64) 
	,aweme_list__item__music__id_str Nullable(String) 
	,aweme_list__item__music__is_audio_url_with_cookie Nullable(UInt8) 
	,aweme_list__item__music__is_commerce_music Nullable(UInt8) 
	,aweme_list__item__music__is_del_video Nullable(UInt8) 
	,aweme_list__item__music__is_matched_metadata Nullable(UInt8) 
	,aweme_list__item__music__is_original Nullable(UInt8) 
	,aweme_list__item__music__is_original_sound Nullable(UInt8) 
	,aweme_list__item__music__is_pgc Nullable(UInt8) 
	,aweme_list__item__music__is_restricted Nullable(UInt8) 
	,aweme_list__item__music__is_video_self_see Nullable(UInt8) 
	,aweme_list__item__music__luna_info Nullable(String) 
	,aweme_list__item__music__lyric_short_position Nullable(String) 
	,aweme_list__item__music__matched_pgc_sound Nullable(String) 
	,aweme_list__item__music__mid Nullable(String) 
	,aweme_list__item__music__music_chart_ranks Nullable(String) 
	,aweme_list__item__music__music_status Nullable(Int64) 
	,aweme_list__item__music__musician_user_infos Nullable(String) 
	,aweme_list__item__music__mute_share Nullable(UInt8) 
	,aweme_list__item__music__offline_desc Nullable(String) 
	,aweme_list__item__music__owner_handle Nullable(String) 
	,aweme_list__item__music__owner_id Nullable(String) 
	,aweme_list__item__music__owner_nickname Nullable(String) 
	,aweme_list__item__music__pgc_music_type Nullable(Int64) 
	,aweme_list__item__music__play_url Nullable(String) 
	,aweme_list__item__music__position Nullable(String) 
	,aweme_list__item__music__prevent_download Nullable(UInt8) 
	,aweme_list__item__music__prevent_item_download_status Nullable(Int64) 
	,aweme_list__item__music__preview_end_time Nullable(Int64) 
	,aweme_list__item__music__preview_start_time Nullable(Float64) 
	,aweme_list__item__music__reason_type Nullable(Int64) 
	,aweme_list__item__music__redirect Nullable(UInt8) 
	,aweme_list__item__music__schema_url Nullable(String) 
	,aweme_list__item__music__search_impr Nullable(String) 
	,aweme_list__item__music__sec_uid Nullable(String) 
	,aweme_list__item__music__shoot_duration Nullable(Int64) 
	,aweme_list__item__music__song Nullable(String) 
	,aweme_list__item__music__source_platform Nullable(Int64) 
	,aweme_list__item__music__start_time Nullable(Int64) 
	,aweme_list__item__music__status Nullable(Int64) 
	,aweme_list__item__music__strong_beat_url Nullable(String) 
	,aweme_list__item__music__tag_list Nullable(String) 
	,aweme_list__item__music__title Nullable(String) 
	,aweme_list__item__music__unshelve_countries Nullable(String) 
	,aweme_list__item__music__user_count Nullable(Int64) 
	,aweme_list__item__music__video_duration Nullable(Int64) 
	,aweme_list__item__mix_info__cover_url Nullable(String) 
	,aweme_list__item__mix_info__create_time Nullable(Int64) 
	,aweme_list__item__mix_info__desc Nullable(String) 
	,aweme_list__item__mix_info__extra Nullable(String) 
	,aweme_list__item__mix_info__ids Nullable(String) 
	,aweme_list__item__mix_info__is_serial_mix Nullable(Int64) 
	,aweme_list__item__mix_info__mix_id Nullable(String) 
	,aweme_list__item__mix_info__mix_name Nullable(String) 
	,aweme_list__item__mix_info__mix_pic_type Nullable(Int64) 
	,aweme_list__item__mix_info__mix_type Nullable(Int64) 
	,aweme_list__item__mix_info__status Nullable(String) 
	,aweme_list__item__mix_info__update_time Nullable(Int64) 
	,aweme_list__item__mix_info__watched_item Nullable(String) 
	,aweme_list__item__mix_info__statis__collect_vv Nullable(Int64) 
	,aweme_list__item__mix_info__statis__current_episode Nullable(Int64) 
	,aweme_list__item__mix_info__statis__play_vv Nullable(Int64) 
	,aweme_list__item__mix_info__statis__updated_to_episode Nullable(Int64) 
	,aweme_list__item__mix_info__share_info__share_desc Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_title_other Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_url Nullable(String) 
	,aweme_list__item__mix_info__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__author__accept_private_policy UInt8 
	,aweme_list__item__author__account_region Nullable(String) 
	,aweme_list__item__author__ad_cover_url Nullable(String) 
	,aweme_list__item__author__apple_account Int64 
	,aweme_list__item__author__authority_status Int64 
	,aweme_list__item__author__avatar_168x168 Nullable(String) 
	,aweme_list__item__author__avatar_300x300 Nullable(String) 
	,aweme_list__item__author__avatar_larger Nullable(String) 
	,aweme_list__item__author__avatar_medium Nullable(String) 
	,aweme_list__item__author__avatar_thumb Nullable(String) 
	,aweme_list__item__author__avatar_uri Nullable(String) 
	,aweme_list__item__author__aweme_count Int64 
	,aweme_list__item__author__aweme_hotsoon_auth Nullable(Int64) 
	,aweme_list__item__author__aweme_hotsoon_auth_relation Nullable(Int64) 
	,aweme_list__item__author__ban_user_functions Nullable(String) 
	,aweme_list__item__author__bind_phone Nullable(String) 
	,aweme_list__item__author__birthday Nullable(String) 
	,aweme_list__item__author__can_set_geofencing Nullable(String) 
	,aweme_list__item__author__card_entries Nullable(String) 
	,aweme_list__item__author__card_entries_not_display Nullable(String) 
	,aweme_list__item__author__card_sort_priority Nullable(String) 
	,aweme_list__item__author__cf_list Nullable(String) 
	,aweme_list__item__author__cha_list Nullable(String) 
	,aweme_list__item__author__close_friend_type Int64 
	,aweme_list__item__author__comment_filter_status Int64 
	,aweme_list__item__author__comment_setting Int64 
	,aweme_list__item__author__commerce_user_level Int64 
	,aweme_list__item__author__constellation Int64 
	,aweme_list__item__author__contacts_status Int64 
	,aweme_list__item__author__contrail_list Nullable(String) 
	,aweme_list__item__author__cover_url Nullable(String) 
	,aweme_list__item__author__create_time Int64 
	,aweme_list__item__author__custom_verify Nullable(String) 
	,aweme_list__item__author__cv_level Nullable(String) 
	,aweme_list__item__author__data_label_list Nullable(String) 
	,aweme_list__item__author__display_info Nullable(String) 
	,aweme_list__item__author__download_prompt_ts Int64 
	,aweme_list__item__author__download_setting Int64 
	,aweme_list__item__author__duet_setting Int64 
	,aweme_list__item__author__enable_nearby_visible UInt8 
	,aweme_list__item__author__endorsement_info_list Nullable(String) 
	,aweme_list__item__author__enterprise_verify_reason Nullable(String) 
	,aweme_list__item__author__favoriting_count Int64 
	,aweme_list__item__author__fb_expire_time Int64 
	,aweme_list__item__author__follow_status Int64 
	,aweme_list__item__author__follower_count Int64 
	,aweme_list__item__author__follower_list_secondary_information_struct Nullable(String) 
	,aweme_list__item__author__follower_request_status Int64 
	,aweme_list__item__author__follower_status Int64 
	,aweme_list__item__author__followers_detail Nullable(String) 
	,aweme_list__item__author__following_count Int64 
	,aweme_list__item__author__gender Int64 
	,aweme_list__item__author__geofencing Nullable(String) 
	,aweme_list__item__author__google_account Nullable(String) 
	,aweme_list__item__author__has_email UInt8 
	,aweme_list__item__author__has_facebook_token UInt8 
	,aweme_list__item__author__has_insights UInt8 
	,aweme_list__item__author__has_orders UInt8 
	,aweme_list__item__author__has_twitter_token UInt8 
	,aweme_list__item__author__has_unread_story UInt8 
	,aweme_list__item__author__has_youtube_token UInt8 
	,aweme_list__item__author__hide_location UInt8 
	,aweme_list__item__author__hide_search UInt8 
	,aweme_list__item__author__homepage_bottom_toast Nullable(String) 
	,aweme_list__item__author__im_role_ids Nullable(String) 
	,aweme_list__item__author__ins_id Nullable(String) 
	,aweme_list__item__author__interest_tags Nullable(String) 
	,aweme_list__item__author__is_ad_fake UInt8 
	,aweme_list__item__author__is_binded_weibo UInt8 
	,aweme_list__item__author__is_block UInt8 
	,aweme_list__item__author__is_blocked_v2 UInt8 
	,aweme_list__item__author__is_blocking_v2 UInt8 
	,aweme_list__item__author__is_cf Int64 
	,aweme_list__item__author__is_discipline_member UInt8 
	,aweme_list__item__author__is_gov_media_vip UInt8 
	,aweme_list__item__author__is_mix_user UInt8 
	,aweme_list__item__author__is_not_show UInt8 
	,aweme_list__item__author__is_phone_binded UInt8 
	,aweme_list__item__author__is_star UInt8 
	,aweme_list__item__author__is_verified UInt8 
	,aweme_list__item__author__item_list Nullable(String) 
	,aweme_list__item__author__ky_only_predict Float64 
	,aweme_list__item__author__language Nullable(String) 
	,aweme_list__item__author__link_item_list Nullable(String) 
	,aweme_list__item__author__live_agreement Int64 
	,aweme_list__item__author__live_agreement_time Int64 
	,aweme_list__item__author__live_commerce UInt8 
	,aweme_list__item__author__live_status Int64 
	,aweme_list__item__author__live_verify Int64 
	,aweme_list__item__author__location Nullable(String) 
	,aweme_list__item__author__max_follower_count Int64 
	,aweme_list__item__author__need_points Nullable(String) 
	,aweme_list__item__author__need_recommend Int64 
	,aweme_list__item__author__neiguang_shield Int64 
	,aweme_list__item__author__new_story_cover Nullable(String) 
	,aweme_list__item__author__nickname Nullable(String) 
	,aweme_list__item__author__not_seen_item_id_list Nullable(String) 
	,aweme_list__item__author__not_seen_item_id_list_v2 Nullable(String) 
	,aweme_list__item__author__offline_info_list Nullable(String) 
	,aweme_list__item__author__personal_tag_list Nullable(String) 
	,aweme_list__item__author__platform_sync_info Nullable(String) 
	,aweme_list__item__author__prevent_download UInt8 
	,aweme_list__item__author__react_setting Int64 
	,aweme_list__item__author__reflow_page_gid Int64 
	,aweme_list__item__author__reflow_page_uid Int64 
	,aweme_list__item__author__region Nullable(String) 
	,aweme_list__item__author__relative_users Nullable(String) 
	,aweme_list__item__author__risk_notice_text Nullable(String) 
	,aweme_list__item__author__room_data Nullable(String) 
	,aweme_list__item__author__room_id Int64 
	,aweme_list__item__author__room_id_str Nullable(String) 
	,aweme_list__item__author__school_category Int64 
	,aweme_list__item__author__school_id Nullable(String) 
	,aweme_list__item__author__school_name Nullable(String) 
	,aweme_list__item__author__school_poi_id Nullable(String) 
	,aweme_list__item__author__school_type Int64 
	,aweme_list__item__author__search_impr Nullable(String) 
	,aweme_list__item__author__sec_uid Nullable(String) 
	,aweme_list__item__author__secret Int64 
	,aweme_list__item__author__share_qrcode_uri Nullable(String) 
	,aweme_list__item__author__shield_comment_notice Int64 
	,aweme_list__item__author__shield_digg_notice Int64 
	,aweme_list__item__author__shield_follow_notice Int64 
	,aweme_list__item__author__short_id Nullable(String) 
	,aweme_list__item__author__show_image_bubble UInt8 
	,aweme_list__item__author__show_nearby_active UInt8 
	,aweme_list__item__author__signature Nullable(String) 
	,aweme_list__item__author__signature_display_lines Int64 
	,aweme_list__item__author__signature_extra Nullable(String) 
	,aweme_list__item__author__special_follow_status Int64 
	,aweme_list__item__author__special_lock Int64 
	,aweme_list__item__author__special_people_labels Nullable(String) 
	,aweme_list__item__author__status Int64 
	,aweme_list__item__author__stitch_setting Int64 
	,aweme_list__item__author__story_count Int64 
	,aweme_list__item__author__story_open UInt8 
	,aweme_list__item__author__sync_to_toutiao Int64 
	,aweme_list__item__author__text_extra Nullable(String) 
	,aweme_list__item__author__total_favorited Int64 
	,aweme_list__item__author__tw_expire_time Int64 
	,aweme_list__item__author__twitter_id Nullable(String) 
	,aweme_list__item__author__twitter_name Nullable(String) 
	,aweme_list__item__author__type_label Nullable(String) 
	,aweme_list__item__author__uid Nullable(String) 
	,aweme_list__item__author__unique_id Nullable(String) 
	,aweme_list__item__author__unique_id_modify_time Int64 
	,aweme_list__item__author__user_age Int64 
	,aweme_list__item__author__user_canceled UInt8 
	,aweme_list__item__author__user_mode Int64 
	,aweme_list__item__author__user_not_see Int64 
	,aweme_list__item__author__user_not_show Int64 
	,aweme_list__item__author__user_period Int64 
	,aweme_list__item__author__user_permissions Nullable(String) 
	,aweme_list__item__author__user_rate Int64 
	,aweme_list__item__author__user_tags Nullable(String) 
	,aweme_list__item__author__verification_type Int64 
	,aweme_list__item__author__verify_info Nullable(String) 
	,aweme_list__item__author__video_icon Nullable(String) 
	,aweme_list__item__author__weibo_name Nullable(String) 
	,aweme_list__item__author__weibo_schema Nullable(String) 
	,aweme_list__item__author__weibo_url Nullable(String) 
	,aweme_list__item__author__weibo_verify Nullable(String) 
	,aweme_list__item__author__white_cover_url Nullable(String) 
	,aweme_list__item__author__with_commerce_entry UInt8 
	,aweme_list__item__author__with_dou_entry UInt8 
	,aweme_list__item__author__with_fusion_shop_entry UInt8 
	,aweme_list__item__author__with_shop_entry UInt8 
	,aweme_list__item__author__youtube_channel_id Nullable(String) 
	,aweme_list__item__author__youtube_channel_title Nullable(String) 
	,aweme_list__item__author__youtube_expire_time Int64 
	,aweme_list__item__author__share_info__share_desc Nullable(String) 
	,aweme_list__item__author__share_info__share_desc_info Nullable(String) 
	,aweme_list__item__author__share_info__share_qrcode_url Nullable(String) 
	,aweme_list__item__author__share_info__share_title Nullable(String) 
	,aweme_list__item__author__share_info__share_title_myself Nullable(String) 
	,aweme_list__item__author__share_info__share_title_other Nullable(String) 
	,aweme_list__item__author__share_info__share_url Nullable(String) 
	,aweme_list__item__author__share_info__share_weibo_desc Nullable(String) 
	,aweme_list__item__author__original_musician__digg_count Int64 
	,aweme_list__item__author__original_musician__music_count Int64 
	,aweme_list__item__author__original_musician__music_used_count Int64 
	,aweme_list__item__author__aweme_control__can_comment UInt8 
	,aweme_list__item__author__aweme_control__can_forward UInt8 
	,aweme_list__item__author__aweme_control__can_share UInt8 
	,aweme_list__item__author__aweme_control__can_show_comment UInt8 
	,source_time DateTime
	,inserted_time  DateTime default now() 
)engine=🍌🍌🍌
        """
    
    @debug_log
    def materialized_view_sql(self) -> str:
        '''
        物化视图建表语句
        :return:
        '''
        return f"""
create materialized view if not exists {self.MATERIALIZED_VIEW} to {self.OUTPUT_TABLE}
as
with
	CAST(JSONExtractKeysAndValues(spider_data, 'String'), 'Map(String,String)') as spider_data_join
	,CAST(JSONExtractKeysAndValues(spider_data_join['extra'],'String'), 'Map(String,String)') as spider_data__extra_join
	,CAST(JSONExtractKeysAndValues(arrayJoin(JSONExtractArrayRaw(spider_data_join[ 'aweme_list'])), 'String'), 'Map(String,String)') as spider_data__aweme_list_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list_join['item'],'String'), 'Map(String,String)') as spider_data__aweme_list__item_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['risk_infos'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__risk_infos_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['micro_app_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__micro_app_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['hot_list'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__hot_list_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['anchor_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__anchor_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['video'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__video_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['video_control'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__video_control_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['statistics'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__statistics_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['share_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__share_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['poi_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__poi_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__poi_info_join['address_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__poi_info__address_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['impression_data'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__impression_data_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['duet_origin_item'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['video_control'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__video_control_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['status'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__status_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['statistics'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__statistics_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['music'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__music_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item__music_join['song'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__music__song_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['descendants'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__descendants_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['commerce_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__commerce_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['aweme_control'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__aweme_control_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['video'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__video_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['risk_infos'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__risk_infos_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['impression_data'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__impression_data_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['comment_permission_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['aweme_acl'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__aweme_acl_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__duet_origin_item_join['author'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__duet_origin_item__author_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['aweme_control'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__aweme_control_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['aweme_acl'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__aweme_acl_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__aweme_acl_join['download_mask_panel'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__aweme_acl__download_mask_panel_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['suggest_words'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__suggest_words_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['status'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__status_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['music'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__music_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['mix_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__mix_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__mix_info_join['statis'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__mix_info__statis_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__mix_info_join['share_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__mix_info__share_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item_join['author'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__author_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__author_join['share_info'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__author__share_info_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__author_join['original_musician'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__author__original_musician_join
	,CAST(JSONExtractKeysAndValues(spider_data__aweme_list__item__author_join['aweme_control'],'String'), 'Map(String,String)') as spider_data__aweme_list__item__author__aweme_control_join
select 
	toInt64(spider_data_join['cursor']) as cursor
	,if(spider_data_join['global_doodle_config'] = '',Null,spider_data_join['global_doodle_config']) as global_doodle_config
	,toInt64(spider_data_join['has_more']) as has_more
	,if(spider_data_join['log_pb'] = '',Null,spider_data_join['log_pb']) as log_pb
	,if(spider_data_join['search_nil_info'] = '',Null,spider_data_join['search_nil_info']) as search_nil_info
	,toInt64(spider_data_join['status_code']) as status_code
	,if(spider_data__extra_join['fatal_item_ids'] = '',Null,spider_data__extra_join['fatal_item_ids']) as extra__fatal_item_ids
	,if(spider_data__extra_join['logid'] = '',Null,spider_data__extra_join['logid']) as extra__logid
	,toInt64(spider_data__extra_join['now']) as extra__now
	,if(spider_data__extra_join['search_request_id'] = '',Null,spider_data__extra_join['search_request_id']) as extra__search_request_id
	,toInt64OrNull(spider_data__aweme_list__item_join['ad_aweme_source']) as aweme_list__item__ad_aweme_source
	,if(spider_data__aweme_list__item_join['ancestor_info'] = '',Null,spider_data__aweme_list__item_join['ancestor_info']) as aweme_list__item__ancestor_info
	,if(spider_data__aweme_list__item_join['anchors'] = '',Null,spider_data__aweme_list__item_join['anchors']) as aweme_list__item__anchors
	,if(spider_data__aweme_list__item_join['authentication_token'] = '',Null,spider_data__aweme_list__item_join['authentication_token']) as aweme_list__item__authentication_token
	,toInt64(spider_data__aweme_list__item_join['author_mask_tag']) as aweme_list__item__author_mask_tag
	,toInt64(spider_data__aweme_list__item_join['author_user_id']) as aweme_list__item__author_user_id
	,if(spider_data__aweme_list__item_join['aweme_id'] = '',Null,spider_data__aweme_list__item_join['aweme_id']) as aweme_list__item__aweme_id
	,toInt64(spider_data__aweme_list__item_join['aweme_type']) as aweme_list__item__aweme_type
	,toInt64OrNull(spider_data__aweme_list__item_join['bodydance_score']) as aweme_list__item__bodydance_score
	,if(spider_data__aweme_list__item_join['book_bar'] = '',Null,spider_data__aweme_list__item_join['book_bar']) as aweme_list__item__book_bar
	,toInt64OrNull(spider_data__aweme_list__item_join['category_da']) as aweme_list__item__category_da
	,if(spider_data__aweme_list__item_join['cha_list'] = '',Null,spider_data__aweme_list__item_join['cha_list']) as aweme_list__item__cha_list
	,if(spider_data__aweme_list__item_join['challenge_position'] = '',Null,spider_data__aweme_list__item_join['challenge_position']) as aweme_list__item__challenge_position
	,if(spider_data__aweme_list__item_join['chapter_list'] = '',Null,spider_data__aweme_list__item_join['chapter_list']) as aweme_list__item__chapter_list
	,if(spider_data__aweme_list__item_join['city'] = '',Null,spider_data__aweme_list__item_join['city']) as aweme_list__item__city
	,toUInt8(if(spider_data__aweme_list__item_join['cmt_swt']='true',1,0)) as aweme_list__item__cmt_swt
	,toInt64(spider_data__aweme_list__item_join['collect_stat']) as aweme_list__item__collect_stat
	,toInt64(spider_data__aweme_list__item_join['collection_corner_mark']) as aweme_list__item__collection_corner_mark
	,toInt64(spider_data__aweme_list__item_join['comment_gid']) as aweme_list__item__comment_gid
	,if(spider_data__aweme_list__item_join['comment_list'] = '',Null,spider_data__aweme_list__item_join['comment_list']) as aweme_list__item__comment_list
	,if(spider_data__aweme_list__item_join['comment_permission_info'] = '',Null,spider_data__aweme_list__item_join['comment_permission_info']) as aweme_list__item__comment_permission_info
	,if(spider_data__aweme_list__item_join['commerce_config_data'] = '',Null,spider_data__aweme_list__item_join['commerce_config_data']) as aweme_list__item__commerce_config_data
	,if(spider_data__aweme_list__item_join['commerce_info'] = '',Null,spider_data__aweme_list__item_join['commerce_info']) as aweme_list__item__commerce_info
	,if(spider_data__aweme_list__item_join['common_bar_info'] = '',Null,spider_data__aweme_list__item_join['common_bar_info']) as aweme_list__item__common_bar_info
	,if(spider_data__aweme_list__item_join['component_info_v2'] = '',Null,spider_data__aweme_list__item_join['component_info_v2']) as aweme_list__item__component_info_v2
	,if(spider_data__aweme_list__item_join['cooperation_info'] = '',Null,spider_data__aweme_list__item_join['cooperation_info']) as aweme_list__item__cooperation_info
	,if(spider_data__aweme_list__item_join['cover_labels'] = '',Null,spider_data__aweme_list__item_join['cover_labels']) as aweme_list__item__cover_labels
	,toInt64(spider_data__aweme_list__item_join['create_time']) as aweme_list__item__create_time
	,if(spider_data__aweme_list__item_join['create_time_config'] = '',Null,spider_data__aweme_list__item_join['create_time_config']) as aweme_list__item__create_time_config
	,if(spider_data__aweme_list__item_join['danmaku_control'] = '',Null,spider_data__aweme_list__item_join['danmaku_control']) as aweme_list__item__danmaku_control
	,if(spider_data__aweme_list__item_join['desc'] = '',Null,spider_data__aweme_list__item_join['desc']) as aweme_list__item__desc
	,if(spider_data__aweme_list__item_join['desc_language'] = '',Null,spider_data__aweme_list__item_join['desc_language']) as aweme_list__item__desc_language
	,if(spider_data__aweme_list__item_join['descendants'] = '',Null,spider_data__aweme_list__item_join['descendants']) as aweme_list__item__descendants
	,if(spider_data__aweme_list__item_join['digg_lottie'] = '',Null,spider_data__aweme_list__item_join['digg_lottie']) as aweme_list__item__digg_lottie
	,toInt64OrNull(spider_data__aweme_list__item_join['disable_relation_bar']) as aweme_list__item__disable_relation_bar
	,if(spider_data__aweme_list__item_join['dislike_dimension_list'] = '',Null,spider_data__aweme_list__item_join['dislike_dimension_list']) as aweme_list__item__dislike_dimension_list
	,if(spider_data__aweme_list__item_join['distance'] = '',Null,spider_data__aweme_list__item_join['distance']) as aweme_list__item__distance
	,toInt64OrNull(spider_data__aweme_list__item_join['distribute_type']) as aweme_list__item__distribute_type
	,toUInt8(if(spider_data__aweme_list__item_join['duet_aggregate_in_music_tab']='true',1,0)) as aweme_list__item__duet_aggregate_in_music_tab
	,if(spider_data__aweme_list__item_join['duet_origin_item_id'] = '',Null,spider_data__aweme_list__item_join['duet_origin_item_id']) as aweme_list__item__duet_origin_item_id
	,toInt64(spider_data__aweme_list__item_join['duration']) as aweme_list__item__duration
	,if(spider_data__aweme_list__item_join['game_info'] = '',Null,spider_data__aweme_list__item_join['game_info']) as aweme_list__item__game_info
	,if(spider_data__aweme_list__item_join['geofencing'] = '',Null,spider_data__aweme_list__item_join['geofencing']) as aweme_list__item__geofencing
	,if(spider_data__aweme_list__item_join['geofencing_regions'] = '',Null,spider_data__aweme_list__item_join['geofencing_regions']) as aweme_list__item__geofencing_regions
	,if(spider_data__aweme_list__item_join['group_id'] = '',Null,spider_data__aweme_list__item_join['group_id']) as aweme_list__item__group_id
	,toInt64(spider_data__aweme_list__item_join['guide_btn_type']) as aweme_list__item__guide_btn_type
	,toUInt8(if(spider_data__aweme_list__item_join['has_vs_entry']='true',1,0)) as aweme_list__item__has_vs_entry
	,toUInt8(if(spider_data__aweme_list__item_join['have_dashboard']='true',1,0)) as aweme_list__item__have_dashboard
	,toInt64OrNull(spider_data__aweme_list__item_join['horizontal_type']) as aweme_list__item__horizontal_type
	,if(spider_data__aweme_list__item_join['hybrid_label'] = '',Null,spider_data__aweme_list__item_join['hybrid_label']) as aweme_list__item__hybrid_label
	,if(spider_data__aweme_list__item_join['image_album_music_info'] = '',Null,spider_data__aweme_list__item_join['image_album_music_info']) as aweme_list__item__image_album_music_info
	,if(spider_data__aweme_list__item_join['image_comment'] = '',Null,spider_data__aweme_list__item_join['image_comment']) as aweme_list__item__image_comment
	,if(spider_data__aweme_list__item_join['image_infos'] = '',Null,spider_data__aweme_list__item_join['image_infos']) as aweme_list__item__image_infos
	,if(spider_data__aweme_list__item_join['image_list'] = '',Null,spider_data__aweme_list__item_join['image_list']) as aweme_list__item__image_list
	,if(spider_data__aweme_list__item_join['images'] = '',Null,spider_data__aweme_list__item_join['images']) as aweme_list__item__images
	,if(spider_data__aweme_list__item_join['img_bitrate'] = '',Null,spider_data__aweme_list__item_join['img_bitrate']) as aweme_list__item__img_bitrate
	,if(spider_data__aweme_list__item_join['interaction_stickers'] = '',Null,spider_data__aweme_list__item_join['interaction_stickers']) as aweme_list__item__interaction_stickers
	,toInt64(spider_data__aweme_list__item_join['is_collects_selected']) as aweme_list__item__is_collects_selected
	,toUInt8(if(spider_data__aweme_list__item_join['is_duet_sing']='true',1,0)) as aweme_list__item__is_duet_sing
	,toUInt8(if(spider_data__aweme_list__item_join['is_fantasy']='true',1,0)) as aweme_list__item__is_fantasy
	,toUInt8(if(spider_data__aweme_list__item_join['is_first_video']='true',1,0)) as aweme_list__item__is_first_video
	,toInt64(spider_data__aweme_list__item_join['is_hash_tag']) as aweme_list__item__is_hash_tag
	,toUInt8(if(spider_data__aweme_list__item_join['is_image_beat']='true',1,0)) as aweme_list__item__is_image_beat
	,toUInt8(if(spider_data__aweme_list__item_join['is_in_scope']='true',1,0)) as aweme_list__item__is_in_scope
	,toUInt8(if(spider_data__aweme_list__item_join['is_karaoke']='true',1,0)) as aweme_list__item__is_karaoke
	,toUInt8(if(spider_data__aweme_list__item_join['is_life_item']='true',1,0)) as aweme_list__item__is_life_item
	,toInt64OrNull(spider_data__aweme_list__item_join['is_multi_content']) as aweme_list__item__is_multi_content
	,toUInt8(if(spider_data__aweme_list__item_join['is_pgcshow']='true',1,0)) as aweme_list__item__is_pgcshow
	,toInt64OrNull(spider_data__aweme_list__item_join['is_preview']) as aweme_list__item__is_preview
	,toUInt8(if(spider_data__aweme_list__item_join['is_relieve']='true',1,0)) as aweme_list__item__is_relieve
	,toUInt8(if(spider_data__aweme_list__item_join['is_share_post']='true',1,0)) as aweme_list__item__is_share_post
	,toInt64(spider_data__aweme_list__item_join['is_story']) as aweme_list__item__is_story
	,toInt64OrNull(spider_data__aweme_list__item_join['is_top']) as aweme_list__item__is_top
	,toUInt8(if(spider_data__aweme_list__item_join['is_vr']='true',1,0)) as aweme_list__item__is_vr
	,toInt64(spider_data__aweme_list__item_join['item_comment_settings']) as aweme_list__item__item_comment_settings
	,toInt64(spider_data__aweme_list__item_join['item_duet']) as aweme_list__item__item_duet
	,toInt64(spider_data__aweme_list__item_join['item_react']) as aweme_list__item__item_react
	,toInt64(spider_data__aweme_list__item_join['item_share']) as aweme_list__item__item_share
	,toInt64(spider_data__aweme_list__item_join['item_stitch']) as aweme_list__item__item_stitch
	,if(spider_data__aweme_list__item_join['item_warn_notification'] = '',Null,spider_data__aweme_list__item_join['item_warn_notification']) as aweme_list__item__item_warn_notification
	,if(spider_data__aweme_list__item_join['label_top'] = '',Null,spider_data__aweme_list__item_join['label_top']) as aweme_list__item__label_top
	,if(spider_data__aweme_list__item_join['label_top_text'] = '',Null,spider_data__aweme_list__item_join['label_top_text']) as aweme_list__item__label_top_text
	,if(spider_data__aweme_list__item_join['link_ad_data'] = '',Null,spider_data__aweme_list__item_join['link_ad_data']) as aweme_list__item__link_ad_data
	,toInt64OrNull(spider_data__aweme_list__item_join['live_id']) as aweme_list__item__live_id
	,if(spider_data__aweme_list__item_join['live_type'] = '',Null,spider_data__aweme_list__item_join['live_type']) as aweme_list__item__live_type
	,if(spider_data__aweme_list__item_join['long_video'] = '',Null,spider_data__aweme_list__item_join['long_video']) as aweme_list__item__long_video
	,if(spider_data__aweme_list__item_join['misc_info'] = '',Null,spider_data__aweme_list__item_join['misc_info']) as aweme_list__item__misc_info
	,toInt64(spider_data__aweme_list__item_join['nearby_level']) as aweme_list__item__nearby_level
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item_join['need_vs_entry']='true','1',spider_data__aweme_list__item_join['need_vs_entry']='false','0','')) as aweme_list__item__need_vs_entry
	,if(spider_data__aweme_list__item_join['nickname_position'] = '',Null,spider_data__aweme_list__item_join['nickname_position']) as aweme_list__item__nickname_position
	,if(spider_data__aweme_list__item_join['origin_comment_ids'] = '',Null,spider_data__aweme_list__item_join['origin_comment_ids']) as aweme_list__item__origin_comment_ids
	,if(spider_data__aweme_list__item_join['origin_text_extra'] = '',Null,spider_data__aweme_list__item_join['origin_text_extra']) as aweme_list__item__origin_text_extra
	,if(spider_data__aweme_list__item_join['original_images'] = '',Null,spider_data__aweme_list__item_join['original_images']) as aweme_list__item__original_images
	,if(spider_data__aweme_list__item_join['packed_clips'] = '',Null,spider_data__aweme_list__item_join['packed_clips']) as aweme_list__item__packed_clips
	,if(spider_data__aweme_list__item_join['photo_search_entrance'] = '',Null,spider_data__aweme_list__item_join['photo_search_entrance']) as aweme_list__item__photo_search_entrance
	,if(spider_data__aweme_list__item_join['poi_biz'] = '',Null,spider_data__aweme_list__item_join['poi_biz']) as aweme_list__item__poi_biz
	,if(spider_data__aweme_list__item_join['poi_patch_info'] = '',Null,spider_data__aweme_list__item_join['poi_patch_info']) as aweme_list__item__poi_patch_info
	,if(spider_data__aweme_list__item_join['position'] = '',Null,spider_data__aweme_list__item_join['position']) as aweme_list__item__position
	,toUInt8(if(spider_data__aweme_list__item_join['prevent_download']='true',1,0)) as aweme_list__item__prevent_download
	,if(spider_data__aweme_list__item_join['preview_title'] = '',Null,spider_data__aweme_list__item_join['preview_title']) as aweme_list__item__preview_title
	,toInt64(spider_data__aweme_list__item_join['preview_video_status']) as aweme_list__item__preview_video_status
	,if(spider_data__aweme_list__item_join['promotions'] = '',Null,spider_data__aweme_list__item_join['promotions']) as aweme_list__item__promotions
	,toInt64(spider_data__aweme_list__item_join['rate']) as aweme_list__item__rate
	,if(spider_data__aweme_list__item_join['ref_tts_id_list'] = '',Null,spider_data__aweme_list__item_join['ref_tts_id_list']) as aweme_list__item__ref_tts_id_list
	,if(spider_data__aweme_list__item_join['ref_voice_modify_id_list'] = '',Null,spider_data__aweme_list__item_join['ref_voice_modify_id_list']) as aweme_list__item__ref_voice_modify_id_list
	,if(spider_data__aweme_list__item_join['region'] = '',Null,spider_data__aweme_list__item_join['region']) as aweme_list__item__region
	,if(spider_data__aweme_list__item_join['relation_labels'] = '',Null,spider_data__aweme_list__item_join['relation_labels']) as aweme_list__item__relation_labels
	,toUInt8(if(spider_data__aweme_list__item_join['report_action']='true',1,0)) as aweme_list__item__report_action
	,if(spider_data__aweme_list__item_join['search_impr'] = '',Null,spider_data__aweme_list__item_join['search_impr']) as aweme_list__item__search_impr
	,if(spider_data__aweme_list__item_join['seo_info'] = '',Null,spider_data__aweme_list__item_join['seo_info']) as aweme_list__item__seo_info
	,if(spider_data__aweme_list__item_join['series_paid_info'] = '',Null,spider_data__aweme_list__item_join['series_paid_info']) as aweme_list__item__series_paid_info
	,if(spider_data__aweme_list__item_join['share_from'] = '',Null,spider_data__aweme_list__item_join['share_from']) as aweme_list__item__share_from
	,if(spider_data__aweme_list__item_join['share_url'] = '',Null,spider_data__aweme_list__item_join['share_url']) as aweme_list__item__share_url
	,toUInt8(if(spider_data__aweme_list__item_join['should_open_ad_report']='true',1,0)) as aweme_list__item__should_open_ad_report
	,if(spider_data__aweme_list__item_join['show_follow_button'] = '',Null,spider_data__aweme_list__item_join['show_follow_button']) as aweme_list__item__show_follow_button
	,if(spider_data__aweme_list__item_join['social_tag_list'] = '',Null,spider_data__aweme_list__item_join['social_tag_list']) as aweme_list__item__social_tag_list
	,if(spider_data__aweme_list__item_join['sort_label'] = '',Null,spider_data__aweme_list__item_join['sort_label']) as aweme_list__item__sort_label
	,toInt64OrNull(spider_data__aweme_list__item_join['special_mode']) as aweme_list__item__special_mode
	,if(spider_data__aweme_list__item_join['standard_bar_info_list'] = '',Null,spider_data__aweme_list__item_join['standard_bar_info_list']) as aweme_list__item__standard_bar_info_list
	,if(spider_data__aweme_list__item_join['star_atlas_info'] = '',Null,spider_data__aweme_list__item_join['star_atlas_info']) as aweme_list__item__star_atlas_info
	,if(spider_data__aweme_list__item_join['sticker_detail'] = '',Null,spider_data__aweme_list__item_join['sticker_detail']) as aweme_list__item__sticker_detail
	,if(spider_data__aweme_list__item_join['stickers'] = '',Null,spider_data__aweme_list__item_join['stickers']) as aweme_list__item__stickers
	,toInt64OrNull(spider_data__aweme_list__item_join['story_source_type']) as aweme_list__item__story_source_type
	,toInt64OrNull(spider_data__aweme_list__item_join['story_ttl']) as aweme_list__item__story_ttl
	,if(spider_data__aweme_list__item_join['text_extra'] = '',Null,spider_data__aweme_list__item_join['text_extra']) as aweme_list__item__text_extra
	,if(spider_data__aweme_list__item_join['tool_bar'] = '',Null,spider_data__aweme_list__item_join['tool_bar']) as aweme_list__item__tool_bar
	,if(spider_data__aweme_list__item_join['tts_id_list'] = '',Null,spider_data__aweme_list__item_join['tts_id_list']) as aweme_list__item__tts_id_list
	,if(spider_data__aweme_list__item_join['uniqid_position'] = '',Null,spider_data__aweme_list__item_join['uniqid_position']) as aweme_list__item__uniqid_position
	,toInt64(spider_data__aweme_list__item_join['user_digged']) as aweme_list__item__user_digged
	,toInt64(spider_data__aweme_list__item_join['user_recommend_status']) as aweme_list__item__user_recommend_status
	,if(spider_data__aweme_list__item_join['video_labels'] = '',Null,spider_data__aweme_list__item_join['video_labels']) as aweme_list__item__video_labels
	,if(spider_data__aweme_list__item_join['video_reply_info'] = '',Null,spider_data__aweme_list__item_join['video_reply_info']) as aweme_list__item__video_reply_info
	,if(spider_data__aweme_list__item_join['video_tag'] = '',Null,spider_data__aweme_list__item_join['video_tag']) as aweme_list__item__video_tag
	,if(spider_data__aweme_list__item_join['video_text'] = '',Null,spider_data__aweme_list__item_join['video_text']) as aweme_list__item__video_text
	,if(spider_data__aweme_list__item_join['voice_modify_id_list'] = '',Null,spider_data__aweme_list__item_join['voice_modify_id_list']) as aweme_list__item__voice_modify_id_list
	,toInt64(spider_data__aweme_list__item_join['vr_type']) as aweme_list__item__vr_type
	,toUInt8(if(spider_data__aweme_list__item_join['with_promotional_music']='true',1,0)) as aweme_list__item__with_promotional_music
	,toUInt8(if(spider_data__aweme_list__item_join['without_watermark']='true',1,0)) as aweme_list__item__without_watermark
	,if(spider_data__aweme_list__item_join['xigua_task'] = '',Null,spider_data__aweme_list__item_join['xigua_task']) as aweme_list__item__xigua_task
	,if(spider_data__aweme_list__item__risk_infos_join['content'] = '',Null,spider_data__aweme_list__item__risk_infos_join['content']) as aweme_list__item__risk_infos__content
	,if(spider_data__aweme_list__item__risk_infos_join['icon_url'] = '',Null,spider_data__aweme_list__item__risk_infos_join['icon_url']) as aweme_list__item__risk_infos__icon_url
	,toUInt8(if(spider_data__aweme_list__item__risk_infos_join['risk_sink']='true',1,0)) as aweme_list__item__risk_infos__risk_sink
	,toInt64(spider_data__aweme_list__item__risk_infos_join['type']) as aweme_list__item__risk_infos__type
	,if(spider_data__aweme_list__item__risk_infos_join['url'] = '',Null,spider_data__aweme_list__item__risk_infos_join['url']) as aweme_list__item__risk_infos__url
	,toUInt8(if(spider_data__aweme_list__item__risk_infos_join['vote']='true',1,0)) as aweme_list__item__risk_infos__vote
	,toUInt8(if(spider_data__aweme_list__item__risk_infos_join['warn']='true',1,0)) as aweme_list__item__risk_infos__warn
	,toInt64OrNull(spider_data__aweme_list__item__risk_infos_join['warn_level']) as aweme_list__item__risk_infos__warn_level
	,if(spider_data__aweme_list__item__micro_app_info_join['app_id'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['app_id']) as aweme_list__item__micro_app_info__app_id
	,if(spider_data__aweme_list__item__micro_app_info_join['app_name'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['app_name']) as aweme_list__item__micro_app_info__app_name
	,if(spider_data__aweme_list__item__micro_app_info_join['description'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['description']) as aweme_list__item__micro_app_info__description
	,if(spider_data__aweme_list__item__micro_app_info_join['icon'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['icon']) as aweme_list__item__micro_app_info__icon
	,toInt64OrNull(spider_data__aweme_list__item__micro_app_info_join['orientation']) as aweme_list__item__micro_app_info__orientation
	,if(spider_data__aweme_list__item__micro_app_info_join['schema'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['schema']) as aweme_list__item__micro_app_info__schema
	,toInt64OrNull(spider_data__aweme_list__item__micro_app_info_join['state']) as aweme_list__item__micro_app_info__state
	,if(spider_data__aweme_list__item__micro_app_info_join['summary'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['summary']) as aweme_list__item__micro_app_info__summary
	,if(spider_data__aweme_list__item__micro_app_info_join['title'] = '',Null,spider_data__aweme_list__item__micro_app_info_join['title']) as aweme_list__item__micro_app_info__title
	,toInt64OrNull(spider_data__aweme_list__item__micro_app_info_join['type']) as aweme_list__item__micro_app_info__type
	,if(spider_data__aweme_list__item__hot_list_join['extra'] = '',Null,spider_data__aweme_list__item__hot_list_join['extra']) as aweme_list__item__hot_list__extra
	,if(spider_data__aweme_list__item__hot_list_join['footer'] = '',Null,spider_data__aweme_list__item__hot_list_join['footer']) as aweme_list__item__hot_list__footer
	,if(spider_data__aweme_list__item__hot_list_join['group_id'] = '',Null,spider_data__aweme_list__item__hot_list_join['group_id']) as aweme_list__item__hot_list__group_id
	,if(spider_data__aweme_list__item__hot_list_join['header'] = '',Null,spider_data__aweme_list__item__hot_list_join['header']) as aweme_list__item__hot_list__header
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['hot_score']) as aweme_list__item__hot_list__hot_score
	,if(spider_data__aweme_list__item__hot_list_join['i18n_title'] = '',Null,spider_data__aweme_list__item__hot_list_join['i18n_title']) as aweme_list__item__hot_list__i18n_title
	,if(spider_data__aweme_list__item__hot_list_join['image_url'] = '',Null,spider_data__aweme_list__item__hot_list_join['image_url']) as aweme_list__item__hot_list__image_url
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['pattern_type']) as aweme_list__item__hot_list__pattern_type
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['rank']) as aweme_list__item__hot_list__rank
	,if(spider_data__aweme_list__item__hot_list_join['schema'] = '',Null,spider_data__aweme_list__item__hot_list_join['schema']) as aweme_list__item__hot_list__schema
	,if(spider_data__aweme_list__item__hot_list_join['sentence'] = '',Null,spider_data__aweme_list__item__hot_list_join['sentence']) as aweme_list__item__hot_list__sentence
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['sentence_id']) as aweme_list__item__hot_list__sentence_id
	,if(spider_data__aweme_list__item__hot_list_join['title'] = '',Null,spider_data__aweme_list__item__hot_list_join['title']) as aweme_list__item__hot_list__title
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['type']) as aweme_list__item__hot_list__type
	,toInt64OrNull(spider_data__aweme_list__item__hot_list_join['view_count']) as aweme_list__item__hot_list__view_count
	,if(spider_data__aweme_list__item__anchor_info_join['content'] = '',Null,spider_data__aweme_list__item__anchor_info_join['content']) as aweme_list__item__anchor_info__content
	,if(spider_data__aweme_list__item__anchor_info_join['display_info'] = '',Null,spider_data__aweme_list__item__anchor_info_join['display_info']) as aweme_list__item__anchor_info__display_info
	,if(spider_data__aweme_list__item__anchor_info_join['extra'] = '',Null,spider_data__aweme_list__item__anchor_info_join['extra']) as aweme_list__item__anchor_info__extra
	,if(spider_data__aweme_list__item__anchor_info_join['icon'] = '',Null,spider_data__aweme_list__item__anchor_info_join['icon']) as aweme_list__item__anchor_info__icon
	,if(spider_data__aweme_list__item__anchor_info_join['id'] = '',Null,spider_data__aweme_list__item__anchor_info_join['id']) as aweme_list__item__anchor_info__id
	,if(spider_data__aweme_list__item__anchor_info_join['log_extra'] = '',Null,spider_data__aweme_list__item__anchor_info_join['log_extra']) as aweme_list__item__anchor_info__log_extra
	,if(spider_data__aweme_list__item__anchor_info_join['mp_url'] = '',Null,spider_data__aweme_list__item__anchor_info_join['mp_url']) as aweme_list__item__anchor_info__mp_url
	,if(spider_data__aweme_list__item__anchor_info_join['open_url'] = '',Null,spider_data__aweme_list__item__anchor_info_join['open_url']) as aweme_list__item__anchor_info__open_url
	,if(spider_data__aweme_list__item__anchor_info_join['style_info'] = '',Null,spider_data__aweme_list__item__anchor_info_join['style_info']) as aweme_list__item__anchor_info__style_info
	,if(spider_data__aweme_list__item__anchor_info_join['title'] = '',Null,spider_data__aweme_list__item__anchor_info_join['title']) as aweme_list__item__anchor_info__title
	,if(spider_data__aweme_list__item__anchor_info_join['title_tag'] = '',Null,spider_data__aweme_list__item__anchor_info_join['title_tag']) as aweme_list__item__anchor_info__title_tag
	,toInt64OrNull(spider_data__aweme_list__item__anchor_info_join['type']) as aweme_list__item__anchor_info__type
	,if(spider_data__aweme_list__item__anchor_info_join['web_url'] = '',Null,spider_data__aweme_list__item__anchor_info_join['web_url']) as aweme_list__item__anchor_info__web_url
	,if(spider_data__aweme_list__item__video_join['animated_cover'] = '',Null,spider_data__aweme_list__item__video_join['animated_cover']) as aweme_list__item__video__animated_cover
	,if(spider_data__aweme_list__item__video_join['big_thumbs'] = '',Null,spider_data__aweme_list__item__video_join['big_thumbs']) as aweme_list__item__video__big_thumbs
	,if(spider_data__aweme_list__item__video_join['bit_rate'] = '',Null,spider_data__aweme_list__item__video_join['bit_rate']) as aweme_list__item__video__bit_rate
	,toInt64OrNull(spider_data__aweme_list__item__video_join['cdn_url_expired']) as aweme_list__item__video__cdn_url_expired
	,if(spider_data__aweme_list__item__video_join['cover'] = '',Null,spider_data__aweme_list__item__video_join['cover']) as aweme_list__item__video__cover
	,if(spider_data__aweme_list__item__video_join['download_addr'] = '',Null,spider_data__aweme_list__item__video_join['download_addr']) as aweme_list__item__video__download_addr
	,if(spider_data__aweme_list__item__video_join['download_suffix_logo_addr'] = '',Null,spider_data__aweme_list__item__video_join['download_suffix_logo_addr']) as aweme_list__item__video__download_suffix_logo_addr
	,toInt64(spider_data__aweme_list__item__video_join['duration']) as aweme_list__item__video__duration
	,if(spider_data__aweme_list__item__video_join['dynamic_cover'] = '',Null,spider_data__aweme_list__item__video_join['dynamic_cover']) as aweme_list__item__video__dynamic_cover
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__video_join['has_download_suffix_logo_addr']='true','1',spider_data__aweme_list__item__video_join['has_download_suffix_logo_addr']='false','0','')) as aweme_list__item__video__has_download_suffix_logo_addr
	,toUInt8(if(spider_data__aweme_list__item__video_join['has_watermark']='true',1,0)) as aweme_list__item__video__has_watermark
	,toInt64(spider_data__aweme_list__item__video_join['height']) as aweme_list__item__video__height
	,toInt64OrNull(spider_data__aweme_list__item__video_join['horizontal_type']) as aweme_list__item__video__horizontal_type
	,toInt64(spider_data__aweme_list__item__video_join['is_bytevc1']) as aweme_list__item__video__is_bytevc1
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__video_join['is_callback']='true','1',spider_data__aweme_list__item__video_join['is_callback']='false','0','')) as aweme_list__item__video__is_callback
	,toInt64(spider_data__aweme_list__item__video_join['is_h265']) as aweme_list__item__video__is_h265
	,toInt64OrNull(spider_data__aweme_list__item__video_join['is_long_video']) as aweme_list__item__video__is_long_video
	,toInt64OrNull(spider_data__aweme_list__item__video_join['is_source_HDR']) as aweme_list__item__video__is_source_HDR
	,if(spider_data__aweme_list__item__video_join['meta'] = '',Null,spider_data__aweme_list__item__video_join['meta']) as aweme_list__item__video__meta
	,if(spider_data__aweme_list__item__video_join['misc_download_addrs'] = '',Null,spider_data__aweme_list__item__video_join['misc_download_addrs']) as aweme_list__item__video__misc_download_addrs
	,toUInt8(if(spider_data__aweme_list__item__video_join['need_set_token']='true',1,0)) as aweme_list__item__video__need_set_token
	,if(spider_data__aweme_list__item__video_join['optimized_cover'] = '',Null,spider_data__aweme_list__item__video_join['optimized_cover']) as aweme_list__item__video__optimized_cover
	,if(spider_data__aweme_list__item__video_join['origin_cover'] = '',Null,spider_data__aweme_list__item__video_join['origin_cover']) as aweme_list__item__video__origin_cover
	,if(spider_data__aweme_list__item__video_join['play_addr'] = '',Null,spider_data__aweme_list__item__video_join['play_addr']) as aweme_list__item__video__play_addr
	,if(spider_data__aweme_list__item__video_join['play_addr_265'] = '',Null,spider_data__aweme_list__item__video_join['play_addr_265']) as aweme_list__item__video__play_addr_265
	,if(spider_data__aweme_list__item__video_join['play_addr_h264'] = '',Null,spider_data__aweme_list__item__video_join['play_addr_h264']) as aweme_list__item__video__play_addr_h264
	,if(spider_data__aweme_list__item__video_join['play_addr_lowbr'] = '',Null,spider_data__aweme_list__item__video_join['play_addr_lowbr']) as aweme_list__item__video__play_addr_lowbr
	,if(spider_data__aweme_list__item__video_join['ratio'] = '',Null,spider_data__aweme_list__item__video_join['ratio']) as aweme_list__item__video__ratio
	,if(spider_data__aweme_list__item__video_join['tags'] = '',Null,spider_data__aweme_list__item__video_join['tags']) as aweme_list__item__video__tags
	,toUInt8(if(spider_data__aweme_list__item__video_join['use_static_cover']='true',1,0)) as aweme_list__item__video__use_static_cover
	,if(spider_data__aweme_list__item__video_join['video_model'] = '',Null,spider_data__aweme_list__item__video_join['video_model']) as aweme_list__item__video__video_model
	,toInt64(spider_data__aweme_list__item__video_join['width']) as aweme_list__item__video__width
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_douplus']='true',1,0)) as aweme_list__item__video_control__allow_douplus
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_download']='true',1,0)) as aweme_list__item__video_control__allow_download
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_duet']='true',1,0)) as aweme_list__item__video_control__allow_duet
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_dynamic_wallpaper']='true',1,0)) as aweme_list__item__video_control__allow_dynamic_wallpaper
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_music']='true',1,0)) as aweme_list__item__video_control__allow_music
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_react']='true',1,0)) as aweme_list__item__video_control__allow_react
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_share']='true',1,0)) as aweme_list__item__video_control__allow_share
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['allow_stitch']='true',1,0)) as aweme_list__item__video_control__allow_stitch
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['download_ignore_visibility']='true',1,0)) as aweme_list__item__video_control__download_ignore_visibility
	,if(spider_data__aweme_list__item__video_control_join['download_info'] = '',Null,spider_data__aweme_list__item__video_control_join['download_info']) as aweme_list__item__video_control__download_info
	,toInt64(spider_data__aweme_list__item__video_control_join['draft_progress_bar']) as aweme_list__item__video_control__draft_progress_bar
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['duet_ignore_visibility']='true',1,0)) as aweme_list__item__video_control__duet_ignore_visibility
	,if(spider_data__aweme_list__item__video_control_join['duet_info'] = '',Null,spider_data__aweme_list__item__video_control_join['duet_info']) as aweme_list__item__video_control__duet_info
	,toInt64(spider_data__aweme_list__item__video_control_join['prevent_download_type']) as aweme_list__item__video_control__prevent_download_type
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['share_grayed']='true',1,0)) as aweme_list__item__video_control__share_grayed
	,toUInt8(if(spider_data__aweme_list__item__video_control_join['share_ignore_visibility']='true',1,0)) as aweme_list__item__video_control__share_ignore_visibility
	,toInt64(spider_data__aweme_list__item__video_control_join['share_type']) as aweme_list__item__video_control__share_type
	,toInt64(spider_data__aweme_list__item__video_control_join['show_progress_bar']) as aweme_list__item__video_control__show_progress_bar
	,toInt64(spider_data__aweme_list__item__video_control_join['timer_status']) as aweme_list__item__video_control__timer_status
	,toInt64(spider_data__aweme_list__item__statistics_join['admire_count']) as aweme_list__item__statistics__admire_count
	,if(spider_data__aweme_list__item__statistics_join['aweme_id'] = '',Null,spider_data__aweme_list__item__statistics_join['aweme_id']) as aweme_list__item__statistics__aweme_id
	,toInt64(spider_data__aweme_list__item__statistics_join['collect_count']) as aweme_list__item__statistics__collect_count
	,toInt64(spider_data__aweme_list__item__statistics_join['comment_count']) as aweme_list__item__statistics__comment_count
	,if(spider_data__aweme_list__item__statistics_join['digest'] = '',Null,spider_data__aweme_list__item__statistics_join['digest']) as aweme_list__item__statistics__digest
	,toInt64(spider_data__aweme_list__item__statistics_join['digg_count']) as aweme_list__item__statistics__digg_count
	,toInt64(spider_data__aweme_list__item__statistics_join['download_count']) as aweme_list__item__statistics__download_count
	,toInt64(spider_data__aweme_list__item__statistics_join['exposure_count']) as aweme_list__item__statistics__exposure_count
	,toInt64(spider_data__aweme_list__item__statistics_join['forward_count']) as aweme_list__item__statistics__forward_count
	,toInt64(spider_data__aweme_list__item__statistics_join['live_watch_count']) as aweme_list__item__statistics__live_watch_count
	,toInt64(spider_data__aweme_list__item__statistics_join['lose_comment_count']) as aweme_list__item__statistics__lose_comment_count
	,toInt64(spider_data__aweme_list__item__statistics_join['lose_count']) as aweme_list__item__statistics__lose_count
	,toInt64(spider_data__aweme_list__item__statistics_join['play_count']) as aweme_list__item__statistics__play_count
	,toInt64(spider_data__aweme_list__item__statistics_join['share_count']) as aweme_list__item__statistics__share_count
	,toInt64(spider_data__aweme_list__item__statistics_join['whatsapp_share_count']) as aweme_list__item__statistics__whatsapp_share_count
	,toInt64OrNull(spider_data__aweme_list__item__share_info_join['bool_persist']) as aweme_list__item__share_info__bool_persist
	,if(spider_data__aweme_list__item__share_info_join['share_desc'] = '',Null,spider_data__aweme_list__item__share_info_join['share_desc']) as aweme_list__item__share_info__share_desc
	,if(spider_data__aweme_list__item__share_info_join['share_desc_info'] = '',Null,spider_data__aweme_list__item__share_info_join['share_desc_info']) as aweme_list__item__share_info__share_desc_info
	,if(spider_data__aweme_list__item__share_info_join['share_link_desc'] = '',Null,spider_data__aweme_list__item__share_info_join['share_link_desc']) as aweme_list__item__share_info__share_link_desc
	,if(spider_data__aweme_list__item__share_info_join['share_quote'] = '',Null,spider_data__aweme_list__item__share_info_join['share_quote']) as aweme_list__item__share_info__share_quote
	,if(spider_data__aweme_list__item__share_info_join['share_signature_desc'] = '',Null,spider_data__aweme_list__item__share_info_join['share_signature_desc']) as aweme_list__item__share_info__share_signature_desc
	,if(spider_data__aweme_list__item__share_info_join['share_signature_url'] = '',Null,spider_data__aweme_list__item__share_info_join['share_signature_url']) as aweme_list__item__share_info__share_signature_url
	,if(spider_data__aweme_list__item__share_info_join['share_title'] = '',Null,spider_data__aweme_list__item__share_info_join['share_title']) as aweme_list__item__share_info__share_title
	,if(spider_data__aweme_list__item__share_info_join['share_title_myself'] = '',Null,spider_data__aweme_list__item__share_info_join['share_title_myself']) as aweme_list__item__share_info__share_title_myself
	,if(spider_data__aweme_list__item__share_info_join['share_title_other'] = '',Null,spider_data__aweme_list__item__share_info_join['share_title_other']) as aweme_list__item__share_info__share_title_other
	,if(spider_data__aweme_list__item__share_info_join['share_url'] = '',Null,spider_data__aweme_list__item__share_info_join['share_url']) as aweme_list__item__share_info__share_url
	,if(spider_data__aweme_list__item__share_info_join['share_weibo_desc'] = '',Null,spider_data__aweme_list__item__share_info_join['share_weibo_desc']) as aweme_list__item__share_info__share_weibo_desc
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['collect_stat']) as aweme_list__item__poi_info__collect_stat
	,if(spider_data__aweme_list__item__poi_info_join['collected_count'] = '',Null,spider_data__aweme_list__item__poi_info_join['collected_count']) as aweme_list__item__poi_info__collected_count
	,if(spider_data__aweme_list__item__poi_info_join['cover_hd'] = '',Null,spider_data__aweme_list__item__poi_info_join['cover_hd']) as aweme_list__item__poi_info__cover_hd
	,if(spider_data__aweme_list__item__poi_info_join['cover_large'] = '',Null,spider_data__aweme_list__item__poi_info_join['cover_large']) as aweme_list__item__poi_info__cover_large
	,if(spider_data__aweme_list__item__poi_info_join['cover_medium'] = '',Null,spider_data__aweme_list__item__poi_info_join['cover_medium']) as aweme_list__item__poi_info__cover_medium
	,if(spider_data__aweme_list__item__poi_info_join['cover_thumb'] = '',Null,spider_data__aweme_list__item__poi_info_join['cover_thumb']) as aweme_list__item__poi_info__cover_thumb
	,if(spider_data__aweme_list__item__poi_info_join['distance'] = '',Null,spider_data__aweme_list__item__poi_info_join['distance']) as aweme_list__item__poi_info__distance
	,if(spider_data__aweme_list__item__poi_info_join['effect_ids'] = '',Null,spider_data__aweme_list__item__poi_info_join['effect_ids']) as aweme_list__item__poi_info__effect_ids
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['expand_type']) as aweme_list__item__poi_info__expand_type
	,if(spider_data__aweme_list__item__poi_info_join['ext_json'] = '',Null,spider_data__aweme_list__item__poi_info_join['ext_json']) as aweme_list__item__poi_info__ext_json
	,if(spider_data__aweme_list__item__poi_info_join['fulfill_task_list'] = '',Null,spider_data__aweme_list__item__poi_info_join['fulfill_task_list']) as aweme_list__item__poi_info__fulfill_task_list
	,if(spider_data__aweme_list__item__poi_info_join['icon_on_entry'] = '',Null,spider_data__aweme_list__item__poi_info_join['icon_on_entry']) as aweme_list__item__poi_info__icon_on_entry
	,if(spider_data__aweme_list__item__poi_info_join['icon_on_info'] = '',Null,spider_data__aweme_list__item__poi_info_join['icon_on_info']) as aweme_list__item__poi_info__icon_on_info
	,if(spider_data__aweme_list__item__poi_info_join['icon_on_map'] = '',Null,spider_data__aweme_list__item__poi_info_join['icon_on_map']) as aweme_list__item__poi_info__icon_on_map
	,if(spider_data__aweme_list__item__poi_info_join['icon_service_type_list'] = '',Null,spider_data__aweme_list__item__poi_info_join['icon_service_type_list']) as aweme_list__item__poi_info__icon_service_type_list
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['icon_type']) as aweme_list__item__poi_info__icon_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__poi_info_join['is_admin_area']='true','1',spider_data__aweme_list__item__poi_info_join['is_admin_area']='false','0','')) as aweme_list__item__poi_info__is_admin_area
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__poi_info_join['is_at_call_back_collect']='true','1',spider_data__aweme_list__item__poi_info_join['is_at_call_back_collect']='false','0','')) as aweme_list__item__poi_info__is_at_call_back_collect
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__poi_info_join['is_food_group_buy']='true','1',spider_data__aweme_list__item__poi_info_join['is_food_group_buy']='false','0','')) as aweme_list__item__poi_info__is_food_group_buy
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['item_count']) as aweme_list__item__poi_info__item_count
	,if(spider_data__aweme_list__item__poi_info_join['poi_3class_type'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_3class_type']) as aweme_list__item__poi_info__poi_3class_type
	,if(spider_data__aweme_list__item__poi_info_join['poi_backend_type'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_backend_type']) as aweme_list__item__poi_info__poi_backend_type
	,if(spider_data__aweme_list__item__poi_info_join['poi_detail_tags'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_detail_tags']) as aweme_list__item__poi_info__poi_detail_tags
	,if(spider_data__aweme_list__item__poi_info_join['poi_frontend_type'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_frontend_type']) as aweme_list__item__poi_info__poi_frontend_type
	,if(spider_data__aweme_list__item__poi_info_join['poi_id'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_id']) as aweme_list__item__poi_info__poi_id
	,toFloat64OrNull(spider_data__aweme_list__item__poi_info_join['poi_latitude']) as aweme_list__item__poi_info__poi_latitude
	,toFloat64OrNull(spider_data__aweme_list__item__poi_info_join['poi_longitude']) as aweme_list__item__poi_info__poi_longitude
	,if(spider_data__aweme_list__item__poi_info_join['poi_name'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_name']) as aweme_list__item__poi_info__poi_name
	,if(spider_data__aweme_list__item__poi_info_join['poi_ranks'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_ranks']) as aweme_list__item__poi_info__poi_ranks
	,if(spider_data__aweme_list__item__poi_info_join['poi_subtitle'] = '',Null,spider_data__aweme_list__item__poi_info_join['poi_subtitle']) as aweme_list__item__poi_info__poi_subtitle
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['poi_subtitle_type']) as aweme_list__item__poi_info__poi_subtitle_type
	,if(spider_data__aweme_list__item__poi_info_join['popularity'] = '',Null,spider_data__aweme_list__item__poi_info_join['popularity']) as aweme_list__item__poi_info__popularity
	,if(spider_data__aweme_list__item__poi_info_join['service_type_list'] = '',Null,spider_data__aweme_list__item__poi_info_join['service_type_list']) as aweme_list__item__poi_info__service_type_list
	,if(spider_data__aweme_list__item__poi_info_join['share_info'] = '',Null,spider_data__aweme_list__item__poi_info_join['share_info']) as aweme_list__item__poi_info__share_info
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['show_type']) as aweme_list__item__poi_info__show_type
	,if(spider_data__aweme_list__item__poi_info_join['sp_source'] = '',Null,spider_data__aweme_list__item__poi_info_join['sp_source']) as aweme_list__item__poi_info__sp_source
	,if(spider_data__aweme_list__item__poi_info_join['type_code'] = '',Null,spider_data__aweme_list__item__poi_info_join['type_code']) as aweme_list__item__poi_info__type_code
	,toInt64OrNull(spider_data__aweme_list__item__poi_info_join['user_count']) as aweme_list__item__poi_info__user_count
	,if(spider_data__aweme_list__item__poi_info_join['view_count'] = '',Null,spider_data__aweme_list__item__poi_info_join['view_count']) as aweme_list__item__poi_info__view_count
	,if(spider_data__aweme_list__item__poi_info_join['voucher_release_areas'] = '',Null,spider_data__aweme_list__item__poi_info_join['voucher_release_areas']) as aweme_list__item__poi_info__voucher_release_areas
	,if(spider_data__aweme_list__item__poi_info__address_info_join['ad_code_v2'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['ad_code_v2']) as aweme_list__item__poi_info__address_info__ad_code_v2
	,if(spider_data__aweme_list__item__poi_info__address_info_join['address'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['address']) as aweme_list__item__poi_info__address_info__address
	,if(spider_data__aweme_list__item__poi_info__address_info_join['city'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['city']) as aweme_list__item__poi_info__address_info__city
	,if(spider_data__aweme_list__item__poi_info__address_info_join['city_code'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['city_code']) as aweme_list__item__poi_info__address_info__city_code
	,if(spider_data__aweme_list__item__poi_info__address_info_join['city_code_v2'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['city_code_v2']) as aweme_list__item__poi_info__address_info__city_code_v2
	,if(spider_data__aweme_list__item__poi_info__address_info_join['country'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['country']) as aweme_list__item__poi_info__address_info__country
	,if(spider_data__aweme_list__item__poi_info__address_info_join['country_code'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['country_code']) as aweme_list__item__poi_info__address_info__country_code
	,if(spider_data__aweme_list__item__poi_info__address_info_join['district'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['district']) as aweme_list__item__poi_info__address_info__district
	,if(spider_data__aweme_list__item__poi_info__address_info_join['province'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['province']) as aweme_list__item__poi_info__address_info__province
	,if(spider_data__aweme_list__item__poi_info__address_info_join['simple_addr'] = '',Null,spider_data__aweme_list__item__poi_info__address_info_join['simple_addr']) as aweme_list__item__poi_info__address_info__simple_addr
	,if(spider_data__aweme_list__item__impression_data_join['group_id_list_a'] = '',Null,spider_data__aweme_list__item__impression_data_join['group_id_list_a']) as aweme_list__item__impression_data__group_id_list_a
	,if(spider_data__aweme_list__item__impression_data_join['group_id_list_b'] = '',Null,spider_data__aweme_list__item__impression_data_join['group_id_list_b']) as aweme_list__item__impression_data__group_id_list_b
	,if(spider_data__aweme_list__item__impression_data_join['group_id_list_c'] = '',Null,spider_data__aweme_list__item__impression_data_join['group_id_list_c']) as aweme_list__item__impression_data__group_id_list_c
	,if(spider_data__aweme_list__item__impression_data_join['similar_id_list_a'] = '',Null,spider_data__aweme_list__item__impression_data_join['similar_id_list_a']) as aweme_list__item__impression_data__similar_id_list_a
	,if(spider_data__aweme_list__item__impression_data_join['similar_id_list_b'] = '',Null,spider_data__aweme_list__item__impression_data_join['similar_id_list_b']) as aweme_list__item__impression_data__similar_id_list_b
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['ad_aweme_source']) as aweme_list__item__duet_origin_item__ad_aweme_source
	,if(spider_data__aweme_list__item__duet_origin_item_join['anchors'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['anchors']) as aweme_list__item__duet_origin_item__anchors
	,if(spider_data__aweme_list__item__duet_origin_item_join['authentication_token'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['authentication_token']) as aweme_list__item__duet_origin_item__authentication_token
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['author_mask_tag']) as aweme_list__item__duet_origin_item__author_mask_tag
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['author_user_id']) as aweme_list__item__duet_origin_item__author_user_id
	,if(spider_data__aweme_list__item__duet_origin_item_join['aweme_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['aweme_id']) as aweme_list__item__duet_origin_item__aweme_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['aweme_type']) as aweme_list__item__duet_origin_item__aweme_type
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['bodydance_score']) as aweme_list__item__duet_origin_item__bodydance_score
	,if(spider_data__aweme_list__item__duet_origin_item_join['cha_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['cha_list']) as aweme_list__item__duet_origin_item__cha_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['challenge_position'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['challenge_position']) as aweme_list__item__duet_origin_item__challenge_position
	,if(spider_data__aweme_list__item__duet_origin_item_join['chapter_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['chapter_list']) as aweme_list__item__duet_origin_item__chapter_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['city'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['city']) as aweme_list__item__duet_origin_item__city
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['cmt_swt']='true','1',spider_data__aweme_list__item__duet_origin_item_join['cmt_swt']='false','0','')) as aweme_list__item__duet_origin_item__cmt_swt
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['collect_stat']) as aweme_list__item__duet_origin_item__collect_stat
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['collection_corner_mark']) as aweme_list__item__duet_origin_item__collection_corner_mark
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['comment_gid']) as aweme_list__item__duet_origin_item__comment_gid
	,if(spider_data__aweme_list__item__duet_origin_item_join['comment_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['comment_list']) as aweme_list__item__duet_origin_item__comment_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['commerce_config_data'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['commerce_config_data']) as aweme_list__item__duet_origin_item__commerce_config_data
	,if(spider_data__aweme_list__item__duet_origin_item_join['common_bar_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['common_bar_info']) as aweme_list__item__duet_origin_item__common_bar_info
	,if(spider_data__aweme_list__item__duet_origin_item_join['component_info_v2'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['component_info_v2']) as aweme_list__item__duet_origin_item__component_info_v2
	,if(spider_data__aweme_list__item__duet_origin_item_join['cover_labels'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['cover_labels']) as aweme_list__item__duet_origin_item__cover_labels
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['create_time']) as aweme_list__item__duet_origin_item__create_time
	,if(spider_data__aweme_list__item__duet_origin_item_join['desc'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['desc']) as aweme_list__item__duet_origin_item__desc
	,if(spider_data__aweme_list__item__duet_origin_item_join['desc_language'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['desc_language']) as aweme_list__item__duet_origin_item__desc_language
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['disable_relation_bar']) as aweme_list__item__duet_origin_item__disable_relation_bar
	,if(spider_data__aweme_list__item__duet_origin_item_join['dislike_dimension_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['dislike_dimension_list']) as aweme_list__item__duet_origin_item__dislike_dimension_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['distance'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['distance']) as aweme_list__item__duet_origin_item__distance
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['distribute_type']) as aweme_list__item__duet_origin_item__distribute_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['duet_aggregate_in_music_tab']='true','1',spider_data__aweme_list__item__duet_origin_item_join['duet_aggregate_in_music_tab']='false','0','')) as aweme_list__item__duet_origin_item__duet_aggregate_in_music_tab
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['duration']) as aweme_list__item__duet_origin_item__duration
	,if(spider_data__aweme_list__item__duet_origin_item_join['geofencing'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['geofencing']) as aweme_list__item__duet_origin_item__geofencing
	,if(spider_data__aweme_list__item__duet_origin_item_join['geofencing_regions'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['geofencing_regions']) as aweme_list__item__duet_origin_item__geofencing_regions
	,if(spider_data__aweme_list__item__duet_origin_item_join['group_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['group_id']) as aweme_list__item__duet_origin_item__group_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['guide_btn_type']) as aweme_list__item__duet_origin_item__guide_btn_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['has_vs_entry']='true','1',spider_data__aweme_list__item__duet_origin_item_join['has_vs_entry']='false','0','')) as aweme_list__item__duet_origin_item__has_vs_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['have_dashboard']='true','1',spider_data__aweme_list__item__duet_origin_item_join['have_dashboard']='false','0','')) as aweme_list__item__duet_origin_item__have_dashboard
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['horizontal_type']) as aweme_list__item__duet_origin_item__horizontal_type
	,if(spider_data__aweme_list__item__duet_origin_item_join['hybrid_label'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['hybrid_label']) as aweme_list__item__duet_origin_item__hybrid_label
	,if(spider_data__aweme_list__item__duet_origin_item_join['image_album_music_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['image_album_music_info']) as aweme_list__item__duet_origin_item__image_album_music_info
	,if(spider_data__aweme_list__item__duet_origin_item_join['image_comment'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['image_comment']) as aweme_list__item__duet_origin_item__image_comment
	,if(spider_data__aweme_list__item__duet_origin_item_join['image_infos'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['image_infos']) as aweme_list__item__duet_origin_item__image_infos
	,if(spider_data__aweme_list__item__duet_origin_item_join['image_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['image_list']) as aweme_list__item__duet_origin_item__image_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['images'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['images']) as aweme_list__item__duet_origin_item__images
	,if(spider_data__aweme_list__item__duet_origin_item_join['img_bitrate'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['img_bitrate']) as aweme_list__item__duet_origin_item__img_bitrate
	,if(spider_data__aweme_list__item__duet_origin_item_join['interaction_stickers'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['interaction_stickers']) as aweme_list__item__duet_origin_item__interaction_stickers
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['is_collects_selected']) as aweme_list__item__duet_origin_item__is_collects_selected
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_duet_sing']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_duet_sing']='false','0','')) as aweme_list__item__duet_origin_item__is_duet_sing
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_fantasy']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_fantasy']='false','0','')) as aweme_list__item__duet_origin_item__is_fantasy
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_first_video']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_first_video']='false','0','')) as aweme_list__item__duet_origin_item__is_first_video
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['is_hash_tag']) as aweme_list__item__duet_origin_item__is_hash_tag
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_image_beat']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_image_beat']='false','0','')) as aweme_list__item__duet_origin_item__is_image_beat
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_in_scope']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_in_scope']='false','0','')) as aweme_list__item__duet_origin_item__is_in_scope
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_karaoke']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_karaoke']='false','0','')) as aweme_list__item__duet_origin_item__is_karaoke
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_life_item']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_life_item']='false','0','')) as aweme_list__item__duet_origin_item__is_life_item
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_pgcshow']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_pgcshow']='false','0','')) as aweme_list__item__duet_origin_item__is_pgcshow
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['is_preview']) as aweme_list__item__duet_origin_item__is_preview
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_relieve']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_relieve']='false','0','')) as aweme_list__item__duet_origin_item__is_relieve
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_share_post']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_share_post']='false','0','')) as aweme_list__item__duet_origin_item__is_share_post
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['is_story']) as aweme_list__item__duet_origin_item__is_story
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['is_top']) as aweme_list__item__duet_origin_item__is_top
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['is_vr']='true','1',spider_data__aweme_list__item__duet_origin_item_join['is_vr']='false','0','')) as aweme_list__item__duet_origin_item__is_vr
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['item_comment_settings']) as aweme_list__item__duet_origin_item__item_comment_settings
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['item_duet']) as aweme_list__item__duet_origin_item__item_duet
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['item_react']) as aweme_list__item__duet_origin_item__item_react
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['item_share']) as aweme_list__item__duet_origin_item__item_share
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['item_stitch']) as aweme_list__item__duet_origin_item__item_stitch
	,if(spider_data__aweme_list__item__duet_origin_item_join['label_top_text'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['label_top_text']) as aweme_list__item__duet_origin_item__label_top_text
	,if(spider_data__aweme_list__item__duet_origin_item_join['long_video'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['long_video']) as aweme_list__item__duet_origin_item__long_video
	,if(spider_data__aweme_list__item__duet_origin_item_join['misc_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['misc_info']) as aweme_list__item__duet_origin_item__misc_info
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['nearby_level']) as aweme_list__item__duet_origin_item__nearby_level
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['need_vs_entry']='true','1',spider_data__aweme_list__item__duet_origin_item_join['need_vs_entry']='false','0','')) as aweme_list__item__duet_origin_item__need_vs_entry
	,if(spider_data__aweme_list__item__duet_origin_item_join['nickname_position'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['nickname_position']) as aweme_list__item__duet_origin_item__nickname_position
	,if(spider_data__aweme_list__item__duet_origin_item_join['origin_comment_ids'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['origin_comment_ids']) as aweme_list__item__duet_origin_item__origin_comment_ids
	,if(spider_data__aweme_list__item__duet_origin_item_join['origin_text_extra'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['origin_text_extra']) as aweme_list__item__duet_origin_item__origin_text_extra
	,if(spider_data__aweme_list__item__duet_origin_item_join['original_images'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['original_images']) as aweme_list__item__duet_origin_item__original_images
	,if(spider_data__aweme_list__item__duet_origin_item_join['packed_clips'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['packed_clips']) as aweme_list__item__duet_origin_item__packed_clips
	,if(spider_data__aweme_list__item__duet_origin_item_join['photo_search_entrance'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['photo_search_entrance']) as aweme_list__item__duet_origin_item__photo_search_entrance
	,if(spider_data__aweme_list__item__duet_origin_item_join['poi_biz'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['poi_biz']) as aweme_list__item__duet_origin_item__poi_biz
	,if(spider_data__aweme_list__item__duet_origin_item_join['poi_patch_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['poi_patch_info']) as aweme_list__item__duet_origin_item__poi_patch_info
	,if(spider_data__aweme_list__item__duet_origin_item_join['position'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['position']) as aweme_list__item__duet_origin_item__position
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['prevent_download']='true','1',spider_data__aweme_list__item__duet_origin_item_join['prevent_download']='false','0','')) as aweme_list__item__duet_origin_item__prevent_download
	,if(spider_data__aweme_list__item__duet_origin_item_join['preview_title'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['preview_title']) as aweme_list__item__duet_origin_item__preview_title
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['preview_video_status']) as aweme_list__item__duet_origin_item__preview_video_status
	,if(spider_data__aweme_list__item__duet_origin_item_join['promotions'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['promotions']) as aweme_list__item__duet_origin_item__promotions
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['rate']) as aweme_list__item__duet_origin_item__rate
	,if(spider_data__aweme_list__item__duet_origin_item_join['ref_tts_id_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['ref_tts_id_list']) as aweme_list__item__duet_origin_item__ref_tts_id_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['ref_voice_modify_id_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['ref_voice_modify_id_list']) as aweme_list__item__duet_origin_item__ref_voice_modify_id_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['region'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['region']) as aweme_list__item__duet_origin_item__region
	,if(spider_data__aweme_list__item__duet_origin_item_join['relation_labels'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['relation_labels']) as aweme_list__item__duet_origin_item__relation_labels
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['report_action']='true','1',spider_data__aweme_list__item__duet_origin_item_join['report_action']='false','0','')) as aweme_list__item__duet_origin_item__report_action
	,if(spider_data__aweme_list__item__duet_origin_item_join['search_impr'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['search_impr']) as aweme_list__item__duet_origin_item__search_impr
	,if(spider_data__aweme_list__item__duet_origin_item_join['seo_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['seo_info']) as aweme_list__item__duet_origin_item__seo_info
	,if(spider_data__aweme_list__item__duet_origin_item_join['series_paid_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['series_paid_info']) as aweme_list__item__duet_origin_item__series_paid_info
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['should_open_ad_report']='true','1',spider_data__aweme_list__item__duet_origin_item_join['should_open_ad_report']='false','0','')) as aweme_list__item__duet_origin_item__should_open_ad_report
	,if(spider_data__aweme_list__item__duet_origin_item_join['show_follow_button'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['show_follow_button']) as aweme_list__item__duet_origin_item__show_follow_button
	,if(spider_data__aweme_list__item__duet_origin_item_join['social_tag_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['social_tag_list']) as aweme_list__item__duet_origin_item__social_tag_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['sort_label'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['sort_label']) as aweme_list__item__duet_origin_item__sort_label
	,if(spider_data__aweme_list__item__duet_origin_item_join['standard_bar_info_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['standard_bar_info_list']) as aweme_list__item__duet_origin_item__standard_bar_info_list
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['story_ttl']) as aweme_list__item__duet_origin_item__story_ttl
	,if(spider_data__aweme_list__item__duet_origin_item_join['text_extra'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['text_extra']) as aweme_list__item__duet_origin_item__text_extra
	,if(spider_data__aweme_list__item__duet_origin_item_join['tool_bar'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['tool_bar']) as aweme_list__item__duet_origin_item__tool_bar
	,if(spider_data__aweme_list__item__duet_origin_item_join['tts_id_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['tts_id_list']) as aweme_list__item__duet_origin_item__tts_id_list
	,if(spider_data__aweme_list__item__duet_origin_item_join['uniqid_position'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['uniqid_position']) as aweme_list__item__duet_origin_item__uniqid_position
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['user_digged']) as aweme_list__item__duet_origin_item__user_digged
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['user_recommend_status']) as aweme_list__item__duet_origin_item__user_recommend_status
	,if(spider_data__aweme_list__item__duet_origin_item_join['video_labels'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['video_labels']) as aweme_list__item__duet_origin_item__video_labels
	,if(spider_data__aweme_list__item__duet_origin_item_join['video_tag'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['video_tag']) as aweme_list__item__duet_origin_item__video_tag
	,if(spider_data__aweme_list__item__duet_origin_item_join['video_text'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['video_text']) as aweme_list__item__duet_origin_item__video_text
	,if(spider_data__aweme_list__item__duet_origin_item_join['voice_modify_id_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['voice_modify_id_list']) as aweme_list__item__duet_origin_item__voice_modify_id_list
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item_join['vr_type']) as aweme_list__item__duet_origin_item__vr_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['with_promotional_music']='true','1',spider_data__aweme_list__item__duet_origin_item_join['with_promotional_music']='false','0','')) as aweme_list__item__duet_origin_item__with_promotional_music
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item_join['without_watermark']='true','1',spider_data__aweme_list__item__duet_origin_item_join['without_watermark']='false','0','')) as aweme_list__item__duet_origin_item__without_watermark
	,if(spider_data__aweme_list__item__duet_origin_item_join['xigua_task'] = '',Null,spider_data__aweme_list__item__duet_origin_item_join['xigua_task']) as aweme_list__item__duet_origin_item__xigua_task
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_douplus']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_douplus']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_douplus
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_download']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_download']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_download
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_duet']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_duet']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_duet
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_dynamic_wallpaper']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_dynamic_wallpaper']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_dynamic_wallpaper
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_music']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_music']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_music
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_react']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_react']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_react
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_share']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_share']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_share
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_stitch']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['allow_stitch']='false','0','')) as aweme_list__item__duet_origin_item__video_control__allow_stitch
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['download_ignore_visibility']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['download_ignore_visibility']='false','0','')) as aweme_list__item__duet_origin_item__video_control__download_ignore_visibility
	,if(spider_data__aweme_list__item__duet_origin_item__video_control_join['download_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_control_join['download_info']) as aweme_list__item__duet_origin_item__video_control__download_info
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_control_join['draft_progress_bar']) as aweme_list__item__duet_origin_item__video_control__draft_progress_bar
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['duet_ignore_visibility']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['duet_ignore_visibility']='false','0','')) as aweme_list__item__duet_origin_item__video_control__duet_ignore_visibility
	,if(spider_data__aweme_list__item__duet_origin_item__video_control_join['duet_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_control_join['duet_info']) as aweme_list__item__duet_origin_item__video_control__duet_info
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_control_join['prevent_download_type']) as aweme_list__item__duet_origin_item__video_control__prevent_download_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['share_grayed']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['share_grayed']='false','0','')) as aweme_list__item__duet_origin_item__video_control__share_grayed
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_control_join['share_ignore_visibility']='true','1',spider_data__aweme_list__item__duet_origin_item__video_control_join['share_ignore_visibility']='false','0','')) as aweme_list__item__duet_origin_item__video_control__share_ignore_visibility
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_control_join['share_type']) as aweme_list__item__duet_origin_item__video_control__share_type
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_control_join['show_progress_bar']) as aweme_list__item__duet_origin_item__video_control__show_progress_bar
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_control_join['timer_status']) as aweme_list__item__duet_origin_item__video_control__timer_status
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['allow_comment']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['allow_comment']='false','0','')) as aweme_list__item__duet_origin_item__status__allow_comment
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['allow_share']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['allow_share']='false','0','')) as aweme_list__item__duet_origin_item__status__allow_share
	,if(spider_data__aweme_list__item__duet_origin_item__status_join['aweme_edit_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__status_join['aweme_edit_info']) as aweme_list__item__duet_origin_item__status__aweme_edit_info
	,if(spider_data__aweme_list__item__duet_origin_item__status_join['aweme_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__status_join['aweme_id']) as aweme_list__item__duet_origin_item__status__aweme_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['dont_share_status']) as aweme_list__item__duet_origin_item__status__dont_share_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['download_status']) as aweme_list__item__duet_origin_item__status__download_status
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['in_reviewing']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['in_reviewing']='false','0','')) as aweme_list__item__duet_origin_item__status__in_reviewing
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['is_delete']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['is_delete']='false','0','')) as aweme_list__item__duet_origin_item__status__is_delete
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['is_private']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['is_private']='false','0','')) as aweme_list__item__duet_origin_item__status__is_private
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['is_prohibited']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['is_prohibited']='false','0','')) as aweme_list__item__duet_origin_item__status__is_prohibited
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['listen_video_status']) as aweme_list__item__duet_origin_item__status__listen_video_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['part_see']) as aweme_list__item__duet_origin_item__status__part_see
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['private_status']) as aweme_list__item__duet_origin_item__status__private_status
	,if(spider_data__aweme_list__item__duet_origin_item__status_join['review_result'] = '',Null,spider_data__aweme_list__item__duet_origin_item__status_join['review_result']) as aweme_list__item__duet_origin_item__status__review_result
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['reviewed']) as aweme_list__item__duet_origin_item__status__reviewed
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['self_see']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['self_see']='false','0','')) as aweme_list__item__duet_origin_item__status__self_see
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__status_join['video_hide_search']) as aweme_list__item__duet_origin_item__status__video_hide_search
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['with_fusion_goods']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['with_fusion_goods']='false','0','')) as aweme_list__item__duet_origin_item__status__with_fusion_goods
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__status_join['with_goods']='true','1',spider_data__aweme_list__item__duet_origin_item__status_join['with_goods']='false','0','')) as aweme_list__item__duet_origin_item__status__with_goods
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['admire_count']) as aweme_list__item__duet_origin_item__statistics__admire_count
	,if(spider_data__aweme_list__item__duet_origin_item__statistics_join['aweme_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__statistics_join['aweme_id']) as aweme_list__item__duet_origin_item__statistics__aweme_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['collect_count']) as aweme_list__item__duet_origin_item__statistics__collect_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['comment_count']) as aweme_list__item__duet_origin_item__statistics__comment_count
	,if(spider_data__aweme_list__item__duet_origin_item__statistics_join['digest'] = '',Null,spider_data__aweme_list__item__duet_origin_item__statistics_join['digest']) as aweme_list__item__duet_origin_item__statistics__digest
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['digg_count']) as aweme_list__item__duet_origin_item__statistics__digg_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['download_count']) as aweme_list__item__duet_origin_item__statistics__download_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['exposure_count']) as aweme_list__item__duet_origin_item__statistics__exposure_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['forward_count']) as aweme_list__item__duet_origin_item__statistics__forward_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['live_watch_count']) as aweme_list__item__duet_origin_item__statistics__live_watch_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['lose_comment_count']) as aweme_list__item__duet_origin_item__statistics__lose_comment_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['lose_count']) as aweme_list__item__duet_origin_item__statistics__lose_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['play_count']) as aweme_list__item__duet_origin_item__statistics__play_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['share_count']) as aweme_list__item__duet_origin_item__statistics__share_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__statistics_join['whatsapp_share_count']) as aweme_list__item__duet_origin_item__statistics__whatsapp_share_count
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['album'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['album']) as aweme_list__item__duet_origin_item__music__album
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['artist_user_infos'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['artist_user_infos']) as aweme_list__item__duet_origin_item__music__artist_user_infos
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['artists'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['artists']) as aweme_list__item__duet_origin_item__music__artists
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['audition_duration']) as aweme_list__item__duet_origin_item__music__audition_duration
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['author'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['author']) as aweme_list__item__duet_origin_item__music__author
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['author_deleted']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['author_deleted']='false','0','')) as aweme_list__item__duet_origin_item__music__author_deleted
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['author_position'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['author_position']) as aweme_list__item__duet_origin_item__music__author_position
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['author_status']) as aweme_list__item__duet_origin_item__music__author_status
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['avatar_large'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['avatar_large']) as aweme_list__item__duet_origin_item__music__avatar_large
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['avatar_medium'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['avatar_medium']) as aweme_list__item__duet_origin_item__music__avatar_medium
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['avatar_thumb'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['avatar_thumb']) as aweme_list__item__duet_origin_item__music__avatar_thumb
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['binded_challenge_id']) as aweme_list__item__duet_origin_item__music__binded_challenge_id
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['can_background_play']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['can_background_play']='false','0','')) as aweme_list__item__duet_origin_item__music__can_background_play
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['climax'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['climax']) as aweme_list__item__duet_origin_item__music__climax
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['collect_stat']) as aweme_list__item__duet_origin_item__music__collect_stat
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['cover_color_hsv'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['cover_color_hsv']) as aweme_list__item__duet_origin_item__music__cover_color_hsv
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['cover_hd'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['cover_hd']) as aweme_list__item__duet_origin_item__music__cover_hd
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['cover_large'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['cover_large']) as aweme_list__item__duet_origin_item__music__cover_large
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['cover_medium'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['cover_medium']) as aweme_list__item__duet_origin_item__music__cover_medium
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['cover_thumb'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['cover_thumb']) as aweme_list__item__duet_origin_item__music__cover_thumb
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['dmv_auto_show']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['dmv_auto_show']='false','0','')) as aweme_list__item__duet_origin_item__music__dmv_auto_show
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['dsp_status']) as aweme_list__item__duet_origin_item__music__dsp_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['duration']) as aweme_list__item__duet_origin_item__music__duration
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['end_time']) as aweme_list__item__duet_origin_item__music__end_time
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['external_song_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['external_song_info']) as aweme_list__item__duet_origin_item__music__external_song_info
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['extra'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['extra']) as aweme_list__item__duet_origin_item__music__extra
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['id']) as aweme_list__item__duet_origin_item__music__id
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['id_str'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['id_str']) as aweme_list__item__duet_origin_item__music__id_str
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_audio_url_with_cookie']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_audio_url_with_cookie']='false','0','')) as aweme_list__item__duet_origin_item__music__is_audio_url_with_cookie
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_commerce_music']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_commerce_music']='false','0','')) as aweme_list__item__duet_origin_item__music__is_commerce_music
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_del_video']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_del_video']='false','0','')) as aweme_list__item__duet_origin_item__music__is_del_video
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_matched_metadata']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_matched_metadata']='false','0','')) as aweme_list__item__duet_origin_item__music__is_matched_metadata
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_original']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_original']='false','0','')) as aweme_list__item__duet_origin_item__music__is_original
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_original_sound']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_original_sound']='false','0','')) as aweme_list__item__duet_origin_item__music__is_original_sound
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_pgc']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_pgc']='false','0','')) as aweme_list__item__duet_origin_item__music__is_pgc
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_restricted']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_restricted']='false','0','')) as aweme_list__item__duet_origin_item__music__is_restricted
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['is_video_self_see']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['is_video_self_see']='false','0','')) as aweme_list__item__duet_origin_item__music__is_video_self_see
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['luna_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['luna_info']) as aweme_list__item__duet_origin_item__music__luna_info
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['lyric_short_position'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['lyric_short_position']) as aweme_list__item__duet_origin_item__music__lyric_short_position
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['matched_pgc_sound'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['matched_pgc_sound']) as aweme_list__item__duet_origin_item__music__matched_pgc_sound
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['mid'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['mid']) as aweme_list__item__duet_origin_item__music__mid
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['music_chart_ranks'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['music_chart_ranks']) as aweme_list__item__duet_origin_item__music__music_chart_ranks
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['music_status']) as aweme_list__item__duet_origin_item__music__music_status
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['musician_user_infos'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['musician_user_infos']) as aweme_list__item__duet_origin_item__music__musician_user_infos
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['mute_share']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['mute_share']='false','0','')) as aweme_list__item__duet_origin_item__music__mute_share
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['offline_desc'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['offline_desc']) as aweme_list__item__duet_origin_item__music__offline_desc
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['owner_handle'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['owner_handle']) as aweme_list__item__duet_origin_item__music__owner_handle
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['owner_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['owner_id']) as aweme_list__item__duet_origin_item__music__owner_id
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['owner_nickname'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['owner_nickname']) as aweme_list__item__duet_origin_item__music__owner_nickname
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['pgc_music_type']) as aweme_list__item__duet_origin_item__music__pgc_music_type
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['play_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['play_url']) as aweme_list__item__duet_origin_item__music__play_url
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['position'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['position']) as aweme_list__item__duet_origin_item__music__position
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['prevent_download']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['prevent_download']='false','0','')) as aweme_list__item__duet_origin_item__music__prevent_download
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['prevent_item_download_status']) as aweme_list__item__duet_origin_item__music__prevent_item_download_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['preview_end_time']) as aweme_list__item__duet_origin_item__music__preview_end_time
	,toFloat64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['preview_start_time']) as aweme_list__item__duet_origin_item__music__preview_start_time
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['reason_type']) as aweme_list__item__duet_origin_item__music__reason_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__music_join['redirect']='true','1',spider_data__aweme_list__item__duet_origin_item__music_join['redirect']='false','0','')) as aweme_list__item__duet_origin_item__music__redirect
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['schema_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['schema_url']) as aweme_list__item__duet_origin_item__music__schema_url
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['search_impr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['search_impr']) as aweme_list__item__duet_origin_item__music__search_impr
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['sec_uid'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['sec_uid']) as aweme_list__item__duet_origin_item__music__sec_uid
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['shoot_duration']) as aweme_list__item__duet_origin_item__music__shoot_duration
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['source_platform']) as aweme_list__item__duet_origin_item__music__source_platform
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['start_time']) as aweme_list__item__duet_origin_item__music__start_time
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['status']) as aweme_list__item__duet_origin_item__music__status
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['strong_beat_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['strong_beat_url']) as aweme_list__item__duet_origin_item__music__strong_beat_url
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['tag_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['tag_list']) as aweme_list__item__duet_origin_item__music__tag_list
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['title'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['title']) as aweme_list__item__duet_origin_item__music__title
	,if(spider_data__aweme_list__item__duet_origin_item__music_join['unshelve_countries'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music_join['unshelve_countries']) as aweme_list__item__duet_origin_item__music__unshelve_countries
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['user_count']) as aweme_list__item__duet_origin_item__music__user_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music_join['video_duration']) as aweme_list__item__duet_origin_item__music__video_duration
	,if(spider_data__aweme_list__item__duet_origin_item__music__song_join['artists'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music__song_join['artists']) as aweme_list__item__duet_origin_item__music__song__artists
	,if(spider_data__aweme_list__item__duet_origin_item__music__song_join['chorus'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music__song_join['chorus']) as aweme_list__item__duet_origin_item__music__song__chorus
	,if(spider_data__aweme_list__item__duet_origin_item__music__song_join['chorus_v3_infos'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music__song_join['chorus_v3_infos']) as aweme_list__item__duet_origin_item__music__song__chorus_v3_infos
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__music__song_join['id']) as aweme_list__item__duet_origin_item__music__song__id
	,if(spider_data__aweme_list__item__duet_origin_item__music__song_join['id_str'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music__song_join['id_str']) as aweme_list__item__duet_origin_item__music__song__id_str
	,if(spider_data__aweme_list__item__duet_origin_item__music__song_join['title'] = '',Null,spider_data__aweme_list__item__duet_origin_item__music__song_join['title']) as aweme_list__item__duet_origin_item__music__song__title
	,if(spider_data__aweme_list__item__duet_origin_item__descendants_join['notify_msg'] = '',Null,spider_data__aweme_list__item__duet_origin_item__descendants_join['notify_msg']) as aweme_list__item__duet_origin_item__descendants__notify_msg
	,if(spider_data__aweme_list__item__duet_origin_item__descendants_join['platforms'] = '',Null,spider_data__aweme_list__item__duet_origin_item__descendants_join['platforms']) as aweme_list__item__duet_origin_item__descendants__platforms
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['ad_auth_status']) as aweme_list__item__duet_origin_item__commerce_info__ad_auth_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['ad_auth_target_type']) as aweme_list__item__duet_origin_item__commerce_info__ad_auth_target_type
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['ad_ban_mask']) as aweme_list__item__duet_origin_item__commerce_info__ad_ban_mask
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['ad_source']) as aweme_list__item__duet_origin_item__commerce_info__ad_source
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['ad_type']) as aweme_list__item__duet_origin_item__commerce_info__ad_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__commerce_info_join['is_ad']='true','1',spider_data__aweme_list__item__duet_origin_item__commerce_info_join['is_ad']='false','0','')) as aweme_list__item__duet_origin_item__commerce_info__is_ad
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_comment']='true','1',spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_comment']='false','0','')) as aweme_list__item__duet_origin_item__aweme_control__can_comment
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_forward']='true','1',spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_forward']='false','0','')) as aweme_list__item__duet_origin_item__aweme_control__can_forward
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_share']='true','1',spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_share']='false','0','')) as aweme_list__item__duet_origin_item__aweme_control__can_share
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_show_comment']='true','1',spider_data__aweme_list__item__duet_origin_item__aweme_control_join['can_show_comment']='false','0','')) as aweme_list__item__duet_origin_item__aweme_control__can_show_comment
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['animated_cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['animated_cover']) as aweme_list__item__duet_origin_item__video__animated_cover
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['big_thumbs'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['big_thumbs']) as aweme_list__item__duet_origin_item__video__big_thumbs
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['bit_rate'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['bit_rate']) as aweme_list__item__duet_origin_item__video__bit_rate
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['cdn_url_expired']) as aweme_list__item__duet_origin_item__video__cdn_url_expired
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['cover']) as aweme_list__item__duet_origin_item__video__cover
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['download_addr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['download_addr']) as aweme_list__item__duet_origin_item__video__download_addr
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['download_suffix_logo_addr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['download_suffix_logo_addr']) as aweme_list__item__duet_origin_item__video__download_suffix_logo_addr
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['duration']) as aweme_list__item__duet_origin_item__video__duration
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['dynamic_cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['dynamic_cover']) as aweme_list__item__duet_origin_item__video__dynamic_cover
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_join['has_download_suffix_logo_addr']='true','1',spider_data__aweme_list__item__duet_origin_item__video_join['has_download_suffix_logo_addr']='false','0','')) as aweme_list__item__duet_origin_item__video__has_download_suffix_logo_addr
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_join['has_watermark']='true','1',spider_data__aweme_list__item__duet_origin_item__video_join['has_watermark']='false','0','')) as aweme_list__item__duet_origin_item__video__has_watermark
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['height']) as aweme_list__item__duet_origin_item__video__height
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['horizontal_type']) as aweme_list__item__duet_origin_item__video__horizontal_type
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['is_bytevc1']) as aweme_list__item__duet_origin_item__video__is_bytevc1
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_join['is_callback']='true','1',spider_data__aweme_list__item__duet_origin_item__video_join['is_callback']='false','0','')) as aweme_list__item__duet_origin_item__video__is_callback
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['is_h265']) as aweme_list__item__duet_origin_item__video__is_h265
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['is_long_video']) as aweme_list__item__duet_origin_item__video__is_long_video
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['is_source_HDR']) as aweme_list__item__duet_origin_item__video__is_source_HDR
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['meta'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['meta']) as aweme_list__item__duet_origin_item__video__meta
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['misc_download_addrs'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['misc_download_addrs']) as aweme_list__item__duet_origin_item__video__misc_download_addrs
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_join['need_set_token']='true','1',spider_data__aweme_list__item__duet_origin_item__video_join['need_set_token']='false','0','')) as aweme_list__item__duet_origin_item__video__need_set_token
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['optimized_cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['optimized_cover']) as aweme_list__item__duet_origin_item__video__optimized_cover
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['origin_cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['origin_cover']) as aweme_list__item__duet_origin_item__video__origin_cover
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['play_addr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['play_addr']) as aweme_list__item__duet_origin_item__video__play_addr
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_265'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_265']) as aweme_list__item__duet_origin_item__video__play_addr_265
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_h264'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_h264']) as aweme_list__item__duet_origin_item__video__play_addr_h264
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_lowbr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['play_addr_lowbr']) as aweme_list__item__duet_origin_item__video__play_addr_lowbr
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['ratio'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['ratio']) as aweme_list__item__duet_origin_item__video__ratio
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['tags'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['tags']) as aweme_list__item__duet_origin_item__video__tags
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__video_join['use_static_cover']='true','1',spider_data__aweme_list__item__duet_origin_item__video_join['use_static_cover']='false','0','')) as aweme_list__item__duet_origin_item__video__use_static_cover
	,if(spider_data__aweme_list__item__duet_origin_item__video_join['video_model'] = '',Null,spider_data__aweme_list__item__duet_origin_item__video_join['video_model']) as aweme_list__item__duet_origin_item__video__video_model
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__video_join['width']) as aweme_list__item__duet_origin_item__video__width
	,if(spider_data__aweme_list__item__duet_origin_item__risk_infos_join['content'] = '',Null,spider_data__aweme_list__item__duet_origin_item__risk_infos_join['content']) as aweme_list__item__duet_origin_item__risk_infos__content
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__risk_infos_join['risk_sink']='true','1',spider_data__aweme_list__item__duet_origin_item__risk_infos_join['risk_sink']='false','0','')) as aweme_list__item__duet_origin_item__risk_infos__risk_sink
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__risk_infos_join['type']) as aweme_list__item__duet_origin_item__risk_infos__type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__risk_infos_join['vote']='true','1',spider_data__aweme_list__item__duet_origin_item__risk_infos_join['vote']='false','0','')) as aweme_list__item__duet_origin_item__risk_infos__vote
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__risk_infos_join['warn']='true','1',spider_data__aweme_list__item__duet_origin_item__risk_infos_join['warn']='false','0','')) as aweme_list__item__duet_origin_item__risk_infos__warn
	,if(spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_a'] = '',Null,spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_a']) as aweme_list__item__duet_origin_item__impression_data__group_id_list_a
	,if(spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_b'] = '',Null,spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_b']) as aweme_list__item__duet_origin_item__impression_data__group_id_list_b
	,if(spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_c'] = '',Null,spider_data__aweme_list__item__duet_origin_item__impression_data_join['group_id_list_c']) as aweme_list__item__duet_origin_item__impression_data__group_id_list_c
	,if(spider_data__aweme_list__item__duet_origin_item__impression_data_join['similar_id_list_a'] = '',Null,spider_data__aweme_list__item__duet_origin_item__impression_data_join['similar_id_list_a']) as aweme_list__item__duet_origin_item__impression_data__similar_id_list_a
	,if(spider_data__aweme_list__item__duet_origin_item__impression_data_join['similar_id_list_b'] = '',Null,spider_data__aweme_list__item__duet_origin_item__impression_data_join['similar_id_list_b']) as aweme_list__item__duet_origin_item__impression_data__similar_id_list_b
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['can_comment']='true','1',spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['can_comment']='false','0','')) as aweme_list__item__duet_origin_item__comment_permission_info__can_comment
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['comment_permission_status']) as aweme_list__item__duet_origin_item__comment_permission_info__comment_permission_status
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['item_detail_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['item_detail_entry']='false','0','')) as aweme_list__item__duet_origin_item__comment_permission_info__item_detail_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['press_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['press_entry']='false','0','')) as aweme_list__item__duet_origin_item__comment_permission_info__press_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['toast_guide']='true','1',spider_data__aweme_list__item__duet_origin_item__comment_permission_info_join['toast_guide']='false','0','')) as aweme_list__item__duet_origin_item__comment_permission_info__toast_guide
	,if(spider_data__aweme_list__item__duet_origin_item__aweme_acl_join['download_mask_panel'] = '',Null,spider_data__aweme_list__item__duet_origin_item__aweme_acl_join['download_mask_panel']) as aweme_list__item__duet_origin_item__aweme_acl__download_mask_panel
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['accept_private_policy']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['accept_private_policy']='false','0','')) as aweme_list__item__duet_origin_item__author__accept_private_policy
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['account_region'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['account_region']) as aweme_list__item__duet_origin_item__author__account_region
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['ad_cover_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['ad_cover_url']) as aweme_list__item__duet_origin_item__author__ad_cover_url
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['apple_account']) as aweme_list__item__duet_origin_item__author__apple_account
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['authority_status']) as aweme_list__item__duet_origin_item__author__authority_status
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_168x168'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_168x168']) as aweme_list__item__duet_origin_item__author__avatar_168x168
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_300x300'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_300x300']) as aweme_list__item__duet_origin_item__author__avatar_300x300
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_larger'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_larger']) as aweme_list__item__duet_origin_item__author__avatar_larger
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_medium'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_medium']) as aweme_list__item__duet_origin_item__author__avatar_medium
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_thumb'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_thumb']) as aweme_list__item__duet_origin_item__author__avatar_thumb
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['avatar_uri'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['avatar_uri']) as aweme_list__item__duet_origin_item__author__avatar_uri
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['aweme_control'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['aweme_control']) as aweme_list__item__duet_origin_item__author__aweme_control
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['aweme_count']) as aweme_list__item__duet_origin_item__author__aweme_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['aweme_hotsoon_auth']) as aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['aweme_hotsoon_auth_relation']) as aweme_list__item__duet_origin_item__author__aweme_hotsoon_auth_relation
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['ban_user_functions'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['ban_user_functions']) as aweme_list__item__duet_origin_item__author__ban_user_functions
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['bind_phone'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['bind_phone']) as aweme_list__item__duet_origin_item__author__bind_phone
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['birthday'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['birthday']) as aweme_list__item__duet_origin_item__author__birthday
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['can_set_geofencing'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['can_set_geofencing']) as aweme_list__item__duet_origin_item__author__can_set_geofencing
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['card_entries'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['card_entries']) as aweme_list__item__duet_origin_item__author__card_entries
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['card_entries_not_display'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['card_entries_not_display']) as aweme_list__item__duet_origin_item__author__card_entries_not_display
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['card_sort_priority'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['card_sort_priority']) as aweme_list__item__duet_origin_item__author__card_sort_priority
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['cf_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['cf_list']) as aweme_list__item__duet_origin_item__author__cf_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['cha_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['cha_list']) as aweme_list__item__duet_origin_item__author__cha_list
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['close_friend_type']) as aweme_list__item__duet_origin_item__author__close_friend_type
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['comment_filter_status']) as aweme_list__item__duet_origin_item__author__comment_filter_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['comment_setting']) as aweme_list__item__duet_origin_item__author__comment_setting
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['commerce_user_level']) as aweme_list__item__duet_origin_item__author__commerce_user_level
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['constellation']) as aweme_list__item__duet_origin_item__author__constellation
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['contacts_status']) as aweme_list__item__duet_origin_item__author__contacts_status
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['contrail_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['contrail_list']) as aweme_list__item__duet_origin_item__author__contrail_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['cover_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['cover_url']) as aweme_list__item__duet_origin_item__author__cover_url
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['create_time']) as aweme_list__item__duet_origin_item__author__create_time
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['custom_verify'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['custom_verify']) as aweme_list__item__duet_origin_item__author__custom_verify
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['cv_level'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['cv_level']) as aweme_list__item__duet_origin_item__author__cv_level
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['data_label_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['data_label_list']) as aweme_list__item__duet_origin_item__author__data_label_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['display_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['display_info']) as aweme_list__item__duet_origin_item__author__display_info
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['download_prompt_ts']) as aweme_list__item__duet_origin_item__author__download_prompt_ts
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['download_setting']) as aweme_list__item__duet_origin_item__author__download_setting
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['duet_setting']) as aweme_list__item__duet_origin_item__author__duet_setting
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['enable_nearby_visible']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['enable_nearby_visible']='false','0','')) as aweme_list__item__duet_origin_item__author__enable_nearby_visible
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['endorsement_info_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['endorsement_info_list']) as aweme_list__item__duet_origin_item__author__endorsement_info_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['enterprise_verify_reason'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['enterprise_verify_reason']) as aweme_list__item__duet_origin_item__author__enterprise_verify_reason
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['favoriting_count']) as aweme_list__item__duet_origin_item__author__favoriting_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['fb_expire_time']) as aweme_list__item__duet_origin_item__author__fb_expire_time
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['follow_status']) as aweme_list__item__duet_origin_item__author__follow_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['follower_count']) as aweme_list__item__duet_origin_item__author__follower_count
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['follower_list_secondary_information_struct'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['follower_list_secondary_information_struct']) as aweme_list__item__duet_origin_item__author__follower_list_secondary_information_struct
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['follower_request_status']) as aweme_list__item__duet_origin_item__author__follower_request_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['follower_status']) as aweme_list__item__duet_origin_item__author__follower_status
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['followers_detail'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['followers_detail']) as aweme_list__item__duet_origin_item__author__followers_detail
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['following_count']) as aweme_list__item__duet_origin_item__author__following_count
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['gender']) as aweme_list__item__duet_origin_item__author__gender
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['geofencing'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['geofencing']) as aweme_list__item__duet_origin_item__author__geofencing
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['google_account'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['google_account']) as aweme_list__item__duet_origin_item__author__google_account
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_email']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_email']='false','0','')) as aweme_list__item__duet_origin_item__author__has_email
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_facebook_token']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_facebook_token']='false','0','')) as aweme_list__item__duet_origin_item__author__has_facebook_token
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_insights']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_insights']='false','0','')) as aweme_list__item__duet_origin_item__author__has_insights
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_orders']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_orders']='false','0','')) as aweme_list__item__duet_origin_item__author__has_orders
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_twitter_token']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_twitter_token']='false','0','')) as aweme_list__item__duet_origin_item__author__has_twitter_token
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_unread_story']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_unread_story']='false','0','')) as aweme_list__item__duet_origin_item__author__has_unread_story
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['has_youtube_token']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['has_youtube_token']='false','0','')) as aweme_list__item__duet_origin_item__author__has_youtube_token
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['hide_location']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['hide_location']='false','0','')) as aweme_list__item__duet_origin_item__author__hide_location
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['hide_search']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['hide_search']='false','0','')) as aweme_list__item__duet_origin_item__author__hide_search
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['homepage_bottom_toast'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['homepage_bottom_toast']) as aweme_list__item__duet_origin_item__author__homepage_bottom_toast
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['im_role_ids'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['im_role_ids']) as aweme_list__item__duet_origin_item__author__im_role_ids
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['ins_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['ins_id']) as aweme_list__item__duet_origin_item__author__ins_id
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['interest_tags'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['interest_tags']) as aweme_list__item__duet_origin_item__author__interest_tags
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_ad_fake']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_ad_fake']='false','0','')) as aweme_list__item__duet_origin_item__author__is_ad_fake
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_binded_weibo']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_binded_weibo']='false','0','')) as aweme_list__item__duet_origin_item__author__is_binded_weibo
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_block']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_block']='false','0','')) as aweme_list__item__duet_origin_item__author__is_block
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_blocked_v2']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_blocked_v2']='false','0','')) as aweme_list__item__duet_origin_item__author__is_blocked_v2
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_blocking_v2']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_blocking_v2']='false','0','')) as aweme_list__item__duet_origin_item__author__is_blocking_v2
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['is_cf']) as aweme_list__item__duet_origin_item__author__is_cf
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_discipline_member']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_discipline_member']='false','0','')) as aweme_list__item__duet_origin_item__author__is_discipline_member
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_gov_media_vip']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_gov_media_vip']='false','0','')) as aweme_list__item__duet_origin_item__author__is_gov_media_vip
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_mix_user']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_mix_user']='false','0','')) as aweme_list__item__duet_origin_item__author__is_mix_user
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_not_show']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_not_show']='false','0','')) as aweme_list__item__duet_origin_item__author__is_not_show
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_phone_binded']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_phone_binded']='false','0','')) as aweme_list__item__duet_origin_item__author__is_phone_binded
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_star']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_star']='false','0','')) as aweme_list__item__duet_origin_item__author__is_star
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['is_verified']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['is_verified']='false','0','')) as aweme_list__item__duet_origin_item__author__is_verified
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['item_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['item_list']) as aweme_list__item__duet_origin_item__author__item_list
	,toFloat64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['ky_only_predict']) as aweme_list__item__duet_origin_item__author__ky_only_predict
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['language'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['language']) as aweme_list__item__duet_origin_item__author__language
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['link_item_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['link_item_list']) as aweme_list__item__duet_origin_item__author__link_item_list
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['live_agreement']) as aweme_list__item__duet_origin_item__author__live_agreement
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['live_agreement_time']) as aweme_list__item__duet_origin_item__author__live_agreement_time
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['live_commerce']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['live_commerce']='false','0','')) as aweme_list__item__duet_origin_item__author__live_commerce
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['live_status']) as aweme_list__item__duet_origin_item__author__live_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['live_verify']) as aweme_list__item__duet_origin_item__author__live_verify
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['location'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['location']) as aweme_list__item__duet_origin_item__author__location
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['max_follower_count']) as aweme_list__item__duet_origin_item__author__max_follower_count
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['need_points'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['need_points']) as aweme_list__item__duet_origin_item__author__need_points
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['need_recommend']) as aweme_list__item__duet_origin_item__author__need_recommend
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['neiguang_shield']) as aweme_list__item__duet_origin_item__author__neiguang_shield
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['new_story_cover'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['new_story_cover']) as aweme_list__item__duet_origin_item__author__new_story_cover
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['nickname'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['nickname']) as aweme_list__item__duet_origin_item__author__nickname
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['not_seen_item_id_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['not_seen_item_id_list']) as aweme_list__item__duet_origin_item__author__not_seen_item_id_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['not_seen_item_id_list_v2'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['not_seen_item_id_list_v2']) as aweme_list__item__duet_origin_item__author__not_seen_item_id_list_v2
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['offline_info_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['offline_info_list']) as aweme_list__item__duet_origin_item__author__offline_info_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['personal_tag_list'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['personal_tag_list']) as aweme_list__item__duet_origin_item__author__personal_tag_list
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['platform_sync_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['platform_sync_info']) as aweme_list__item__duet_origin_item__author__platform_sync_info
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['prevent_download']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['prevent_download']='false','0','')) as aweme_list__item__duet_origin_item__author__prevent_download
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['react_setting']) as aweme_list__item__duet_origin_item__author__react_setting
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['reflow_page_gid']) as aweme_list__item__duet_origin_item__author__reflow_page_gid
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['reflow_page_uid']) as aweme_list__item__duet_origin_item__author__reflow_page_uid
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['region'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['region']) as aweme_list__item__duet_origin_item__author__region
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['relative_users'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['relative_users']) as aweme_list__item__duet_origin_item__author__relative_users
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['risk_notice_text'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['risk_notice_text']) as aweme_list__item__duet_origin_item__author__risk_notice_text
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['room_id']) as aweme_list__item__duet_origin_item__author__room_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['school_category']) as aweme_list__item__duet_origin_item__author__school_category
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['school_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['school_id']) as aweme_list__item__duet_origin_item__author__school_id
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['school_name'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['school_name']) as aweme_list__item__duet_origin_item__author__school_name
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['school_poi_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['school_poi_id']) as aweme_list__item__duet_origin_item__author__school_poi_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['school_type']) as aweme_list__item__duet_origin_item__author__school_type
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['search_impr'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['search_impr']) as aweme_list__item__duet_origin_item__author__search_impr
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['sec_uid'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['sec_uid']) as aweme_list__item__duet_origin_item__author__sec_uid
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['secret']) as aweme_list__item__duet_origin_item__author__secret
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['shield_comment_notice']) as aweme_list__item__duet_origin_item__author__shield_comment_notice
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['shield_digg_notice']) as aweme_list__item__duet_origin_item__author__shield_digg_notice
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['shield_follow_notice']) as aweme_list__item__duet_origin_item__author__shield_follow_notice
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['short_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['short_id']) as aweme_list__item__duet_origin_item__author__short_id
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['show_image_bubble']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['show_image_bubble']='false','0','')) as aweme_list__item__duet_origin_item__author__show_image_bubble
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['show_nearby_active']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['show_nearby_active']='false','0','')) as aweme_list__item__duet_origin_item__author__show_nearby_active
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['signature'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['signature']) as aweme_list__item__duet_origin_item__author__signature
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['signature_display_lines']) as aweme_list__item__duet_origin_item__author__signature_display_lines
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['signature_extra'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['signature_extra']) as aweme_list__item__duet_origin_item__author__signature_extra
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['special_follow_status']) as aweme_list__item__duet_origin_item__author__special_follow_status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['special_lock']) as aweme_list__item__duet_origin_item__author__special_lock
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['special_people_labels'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['special_people_labels']) as aweme_list__item__duet_origin_item__author__special_people_labels
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['status']) as aweme_list__item__duet_origin_item__author__status
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['stitch_setting']) as aweme_list__item__duet_origin_item__author__stitch_setting
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['story_count']) as aweme_list__item__duet_origin_item__author__story_count
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['story_open']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['story_open']='false','0','')) as aweme_list__item__duet_origin_item__author__story_open
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['sync_to_toutiao']) as aweme_list__item__duet_origin_item__author__sync_to_toutiao
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['text_extra'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['text_extra']) as aweme_list__item__duet_origin_item__author__text_extra
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['total_favorited']) as aweme_list__item__duet_origin_item__author__total_favorited
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['tw_expire_time']) as aweme_list__item__duet_origin_item__author__tw_expire_time
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['twitter_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['twitter_id']) as aweme_list__item__duet_origin_item__author__twitter_id
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['twitter_name'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['twitter_name']) as aweme_list__item__duet_origin_item__author__twitter_name
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['type_label'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['type_label']) as aweme_list__item__duet_origin_item__author__type_label
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['uid'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['uid']) as aweme_list__item__duet_origin_item__author__uid
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['unique_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['unique_id']) as aweme_list__item__duet_origin_item__author__unique_id
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['unique_id_modify_time']) as aweme_list__item__duet_origin_item__author__unique_id_modify_time
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_age']) as aweme_list__item__duet_origin_item__author__user_age
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['user_canceled']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['user_canceled']='false','0','')) as aweme_list__item__duet_origin_item__author__user_canceled
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_mode']) as aweme_list__item__duet_origin_item__author__user_mode
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_not_see']) as aweme_list__item__duet_origin_item__author__user_not_see
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_not_show']) as aweme_list__item__duet_origin_item__author__user_not_show
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_period']) as aweme_list__item__duet_origin_item__author__user_period
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['user_permissions'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['user_permissions']) as aweme_list__item__duet_origin_item__author__user_permissions
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['user_rate']) as aweme_list__item__duet_origin_item__author__user_rate
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['user_tags'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['user_tags']) as aweme_list__item__duet_origin_item__author__user_tags
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['verification_type']) as aweme_list__item__duet_origin_item__author__verification_type
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['verify_info'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['verify_info']) as aweme_list__item__duet_origin_item__author__verify_info
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['video_icon'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['video_icon']) as aweme_list__item__duet_origin_item__author__video_icon
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['weibo_name'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['weibo_name']) as aweme_list__item__duet_origin_item__author__weibo_name
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['weibo_schema'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['weibo_schema']) as aweme_list__item__duet_origin_item__author__weibo_schema
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['weibo_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['weibo_url']) as aweme_list__item__duet_origin_item__author__weibo_url
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['weibo_verify'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['weibo_verify']) as aweme_list__item__duet_origin_item__author__weibo_verify
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['white_cover_url'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['white_cover_url']) as aweme_list__item__duet_origin_item__author__white_cover_url
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['with_commerce_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['with_commerce_entry']='false','0','')) as aweme_list__item__duet_origin_item__author__with_commerce_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['with_dou_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['with_dou_entry']='false','0','')) as aweme_list__item__duet_origin_item__author__with_dou_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['with_fusion_shop_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['with_fusion_shop_entry']='false','0','')) as aweme_list__item__duet_origin_item__author__with_fusion_shop_entry
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__duet_origin_item__author_join['with_shop_entry']='true','1',spider_data__aweme_list__item__duet_origin_item__author_join['with_shop_entry']='false','0','')) as aweme_list__item__duet_origin_item__author__with_shop_entry
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['youtube_channel_id'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['youtube_channel_id']) as aweme_list__item__duet_origin_item__author__youtube_channel_id
	,if(spider_data__aweme_list__item__duet_origin_item__author_join['youtube_channel_title'] = '',Null,spider_data__aweme_list__item__duet_origin_item__author_join['youtube_channel_title']) as aweme_list__item__duet_origin_item__author__youtube_channel_title
	,toInt64OrNull(spider_data__aweme_list__item__duet_origin_item__author_join['youtube_expire_time']) as aweme_list__item__duet_origin_item__author__youtube_expire_time
	,toUInt8(if(spider_data__aweme_list__item__aweme_control_join['can_comment']='true',1,0)) as aweme_list__item__aweme_control__can_comment
	,toUInt8(if(spider_data__aweme_list__item__aweme_control_join['can_forward']='true',1,0)) as aweme_list__item__aweme_control__can_forward
	,toUInt8(if(spider_data__aweme_list__item__aweme_control_join['can_share']='true',1,0)) as aweme_list__item__aweme_control__can_share
	,toUInt8(if(spider_data__aweme_list__item__aweme_control_join['can_show_comment']='true',1,0)) as aweme_list__item__aweme_control__can_show_comment
	,toInt64OrNull(spider_data__aweme_list__item__aweme_acl__download_mask_panel_join['code']) as aweme_list__item__aweme_acl__download_mask_panel__code
	,toInt64OrNull(spider_data__aweme_list__item__aweme_acl__download_mask_panel_join['show_type']) as aweme_list__item__aweme_acl__download_mask_panel__show_type
	,if(spider_data__aweme_list__item__suggest_words_join['suggest_words'] = '',Null,spider_data__aweme_list__item__suggest_words_join['suggest_words']) as aweme_list__item__suggest_words__suggest_words
	,toUInt8(if(spider_data__aweme_list__item__status_join['allow_comment']='true',1,0)) as aweme_list__item__status__allow_comment
	,toUInt8(if(spider_data__aweme_list__item__status_join['allow_share']='true',1,0)) as aweme_list__item__status__allow_share
	,if(spider_data__aweme_list__item__status_join['aweme_edit_info'] = '',Null,spider_data__aweme_list__item__status_join['aweme_edit_info']) as aweme_list__item__status__aweme_edit_info
	,if(spider_data__aweme_list__item__status_join['aweme_id'] = '',Null,spider_data__aweme_list__item__status_join['aweme_id']) as aweme_list__item__status__aweme_id
	,toInt64(spider_data__aweme_list__item__status_join['dont_share_status']) as aweme_list__item__status__dont_share_status
	,toInt64(spider_data__aweme_list__item__status_join['download_status']) as aweme_list__item__status__download_status
	,toUInt8(if(spider_data__aweme_list__item__status_join['in_reviewing']='true',1,0)) as aweme_list__item__status__in_reviewing
	,toUInt8(if(spider_data__aweme_list__item__status_join['is_delete']='true',1,0)) as aweme_list__item__status__is_delete
	,toUInt8(if(spider_data__aweme_list__item__status_join['is_private']='true',1,0)) as aweme_list__item__status__is_private
	,toUInt8(if(spider_data__aweme_list__item__status_join['is_prohibited']='true',1,0)) as aweme_list__item__status__is_prohibited
	,toInt64OrNull(spider_data__aweme_list__item__status_join['listen_video_status']) as aweme_list__item__status__listen_video_status
	,toInt64(spider_data__aweme_list__item__status_join['part_see']) as aweme_list__item__status__part_see
	,toInt64(spider_data__aweme_list__item__status_join['private_status']) as aweme_list__item__status__private_status
	,if(spider_data__aweme_list__item__status_join['review_result'] = '',Null,spider_data__aweme_list__item__status_join['review_result']) as aweme_list__item__status__review_result
	,toInt64(spider_data__aweme_list__item__status_join['reviewed']) as aweme_list__item__status__reviewed
	,toUInt8(if(spider_data__aweme_list__item__status_join['self_see']='true',1,0)) as aweme_list__item__status__self_see
	,toInt64(spider_data__aweme_list__item__status_join['video_hide_search']) as aweme_list__item__status__video_hide_search
	,toUInt8(if(spider_data__aweme_list__item__status_join['with_fusion_goods']='true',1,0)) as aweme_list__item__status__with_fusion_goods
	,toUInt8(if(spider_data__aweme_list__item__status_join['with_goods']='true',1,0)) as aweme_list__item__status__with_goods
	,if(spider_data__aweme_list__item__music_join['album'] = '',Null,spider_data__aweme_list__item__music_join['album']) as aweme_list__item__music__album
	,if(spider_data__aweme_list__item__music_join['artist_user_infos'] = '',Null,spider_data__aweme_list__item__music_join['artist_user_infos']) as aweme_list__item__music__artist_user_infos
	,if(spider_data__aweme_list__item__music_join['artists'] = '',Null,spider_data__aweme_list__item__music_join['artists']) as aweme_list__item__music__artists
	,toInt64OrNull(spider_data__aweme_list__item__music_join['audition_duration']) as aweme_list__item__music__audition_duration
	,if(spider_data__aweme_list__item__music_join['author'] = '',Null,spider_data__aweme_list__item__music_join['author']) as aweme_list__item__music__author
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['author_deleted']='true','1',spider_data__aweme_list__item__music_join['author_deleted']='false','0','')) as aweme_list__item__music__author_deleted
	,if(spider_data__aweme_list__item__music_join['author_position'] = '',Null,spider_data__aweme_list__item__music_join['author_position']) as aweme_list__item__music__author_position
	,toInt64OrNull(spider_data__aweme_list__item__music_join['author_status']) as aweme_list__item__music__author_status
	,if(spider_data__aweme_list__item__music_join['avatar_large'] = '',Null,spider_data__aweme_list__item__music_join['avatar_large']) as aweme_list__item__music__avatar_large
	,if(spider_data__aweme_list__item__music_join['avatar_medium'] = '',Null,spider_data__aweme_list__item__music_join['avatar_medium']) as aweme_list__item__music__avatar_medium
	,if(spider_data__aweme_list__item__music_join['avatar_thumb'] = '',Null,spider_data__aweme_list__item__music_join['avatar_thumb']) as aweme_list__item__music__avatar_thumb
	,toInt64OrNull(spider_data__aweme_list__item__music_join['binded_challenge_id']) as aweme_list__item__music__binded_challenge_id
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['can_background_play']='true','1',spider_data__aweme_list__item__music_join['can_background_play']='false','0','')) as aweme_list__item__music__can_background_play
	,if(spider_data__aweme_list__item__music_join['climax'] = '',Null,spider_data__aweme_list__item__music_join['climax']) as aweme_list__item__music__climax
	,toInt64OrNull(spider_data__aweme_list__item__music_join['collect_stat']) as aweme_list__item__music__collect_stat
	,if(spider_data__aweme_list__item__music_join['cover_color_hsv'] = '',Null,spider_data__aweme_list__item__music_join['cover_color_hsv']) as aweme_list__item__music__cover_color_hsv
	,if(spider_data__aweme_list__item__music_join['cover_hd'] = '',Null,spider_data__aweme_list__item__music_join['cover_hd']) as aweme_list__item__music__cover_hd
	,if(spider_data__aweme_list__item__music_join['cover_large'] = '',Null,spider_data__aweme_list__item__music_join['cover_large']) as aweme_list__item__music__cover_large
	,if(spider_data__aweme_list__item__music_join['cover_medium'] = '',Null,spider_data__aweme_list__item__music_join['cover_medium']) as aweme_list__item__music__cover_medium
	,if(spider_data__aweme_list__item__music_join['cover_thumb'] = '',Null,spider_data__aweme_list__item__music_join['cover_thumb']) as aweme_list__item__music__cover_thumb
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['dmv_auto_show']='true','1',spider_data__aweme_list__item__music_join['dmv_auto_show']='false','0','')) as aweme_list__item__music__dmv_auto_show
	,toInt64OrNull(spider_data__aweme_list__item__music_join['dsp_status']) as aweme_list__item__music__dsp_status
	,toInt64OrNull(spider_data__aweme_list__item__music_join['duration']) as aweme_list__item__music__duration
	,toInt64OrNull(spider_data__aweme_list__item__music_join['end_time']) as aweme_list__item__music__end_time
	,if(spider_data__aweme_list__item__music_join['external_song_info'] = '',Null,spider_data__aweme_list__item__music_join['external_song_info']) as aweme_list__item__music__external_song_info
	,if(spider_data__aweme_list__item__music_join['extra'] = '',Null,spider_data__aweme_list__item__music_join['extra']) as aweme_list__item__music__extra
	,toInt64OrNull(spider_data__aweme_list__item__music_join['id']) as aweme_list__item__music__id
	,if(spider_data__aweme_list__item__music_join['id_str'] = '',Null,spider_data__aweme_list__item__music_join['id_str']) as aweme_list__item__music__id_str
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_audio_url_with_cookie']='true','1',spider_data__aweme_list__item__music_join['is_audio_url_with_cookie']='false','0','')) as aweme_list__item__music__is_audio_url_with_cookie
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_commerce_music']='true','1',spider_data__aweme_list__item__music_join['is_commerce_music']='false','0','')) as aweme_list__item__music__is_commerce_music
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_del_video']='true','1',spider_data__aweme_list__item__music_join['is_del_video']='false','0','')) as aweme_list__item__music__is_del_video
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_matched_metadata']='true','1',spider_data__aweme_list__item__music_join['is_matched_metadata']='false','0','')) as aweme_list__item__music__is_matched_metadata
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_original']='true','1',spider_data__aweme_list__item__music_join['is_original']='false','0','')) as aweme_list__item__music__is_original
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_original_sound']='true','1',spider_data__aweme_list__item__music_join['is_original_sound']='false','0','')) as aweme_list__item__music__is_original_sound
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_pgc']='true','1',spider_data__aweme_list__item__music_join['is_pgc']='false','0','')) as aweme_list__item__music__is_pgc
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_restricted']='true','1',spider_data__aweme_list__item__music_join['is_restricted']='false','0','')) as aweme_list__item__music__is_restricted
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['is_video_self_see']='true','1',spider_data__aweme_list__item__music_join['is_video_self_see']='false','0','')) as aweme_list__item__music__is_video_self_see
	,if(spider_data__aweme_list__item__music_join['luna_info'] = '',Null,spider_data__aweme_list__item__music_join['luna_info']) as aweme_list__item__music__luna_info
	,if(spider_data__aweme_list__item__music_join['lyric_short_position'] = '',Null,spider_data__aweme_list__item__music_join['lyric_short_position']) as aweme_list__item__music__lyric_short_position
	,if(spider_data__aweme_list__item__music_join['matched_pgc_sound'] = '',Null,spider_data__aweme_list__item__music_join['matched_pgc_sound']) as aweme_list__item__music__matched_pgc_sound
	,if(spider_data__aweme_list__item__music_join['mid'] = '',Null,spider_data__aweme_list__item__music_join['mid']) as aweme_list__item__music__mid
	,if(spider_data__aweme_list__item__music_join['music_chart_ranks'] = '',Null,spider_data__aweme_list__item__music_join['music_chart_ranks']) as aweme_list__item__music__music_chart_ranks
	,toInt64OrNull(spider_data__aweme_list__item__music_join['music_status']) as aweme_list__item__music__music_status
	,if(spider_data__aweme_list__item__music_join['musician_user_infos'] = '',Null,spider_data__aweme_list__item__music_join['musician_user_infos']) as aweme_list__item__music__musician_user_infos
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['mute_share']='true','1',spider_data__aweme_list__item__music_join['mute_share']='false','0','')) as aweme_list__item__music__mute_share
	,if(spider_data__aweme_list__item__music_join['offline_desc'] = '',Null,spider_data__aweme_list__item__music_join['offline_desc']) as aweme_list__item__music__offline_desc
	,if(spider_data__aweme_list__item__music_join['owner_handle'] = '',Null,spider_data__aweme_list__item__music_join['owner_handle']) as aweme_list__item__music__owner_handle
	,if(spider_data__aweme_list__item__music_join['owner_id'] = '',Null,spider_data__aweme_list__item__music_join['owner_id']) as aweme_list__item__music__owner_id
	,if(spider_data__aweme_list__item__music_join['owner_nickname'] = '',Null,spider_data__aweme_list__item__music_join['owner_nickname']) as aweme_list__item__music__owner_nickname
	,toInt64OrNull(spider_data__aweme_list__item__music_join['pgc_music_type']) as aweme_list__item__music__pgc_music_type
	,if(spider_data__aweme_list__item__music_join['play_url'] = '',Null,spider_data__aweme_list__item__music_join['play_url']) as aweme_list__item__music__play_url
	,if(spider_data__aweme_list__item__music_join['position'] = '',Null,spider_data__aweme_list__item__music_join['position']) as aweme_list__item__music__position
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['prevent_download']='true','1',spider_data__aweme_list__item__music_join['prevent_download']='false','0','')) as aweme_list__item__music__prevent_download
	,toInt64OrNull(spider_data__aweme_list__item__music_join['prevent_item_download_status']) as aweme_list__item__music__prevent_item_download_status
	,toInt64OrNull(spider_data__aweme_list__item__music_join['preview_end_time']) as aweme_list__item__music__preview_end_time
	,toFloat64OrNull(spider_data__aweme_list__item__music_join['preview_start_time']) as aweme_list__item__music__preview_start_time
	,toInt64OrNull(spider_data__aweme_list__item__music_join['reason_type']) as aweme_list__item__music__reason_type
	,toUInt8OrNull(multiIf(spider_data__aweme_list__item__music_join['redirect']='true','1',spider_data__aweme_list__item__music_join['redirect']='false','0','')) as aweme_list__item__music__redirect
	,if(spider_data__aweme_list__item__music_join['schema_url'] = '',Null,spider_data__aweme_list__item__music_join['schema_url']) as aweme_list__item__music__schema_url
	,if(spider_data__aweme_list__item__music_join['search_impr'] = '',Null,spider_data__aweme_list__item__music_join['search_impr']) as aweme_list__item__music__search_impr
	,if(spider_data__aweme_list__item__music_join['sec_uid'] = '',Null,spider_data__aweme_list__item__music_join['sec_uid']) as aweme_list__item__music__sec_uid
	,toInt64OrNull(spider_data__aweme_list__item__music_join['shoot_duration']) as aweme_list__item__music__shoot_duration
	,if(spider_data__aweme_list__item__music_join['song'] = '',Null,spider_data__aweme_list__item__music_join['song']) as aweme_list__item__music__song
	,toInt64OrNull(spider_data__aweme_list__item__music_join['source_platform']) as aweme_list__item__music__source_platform
	,toInt64OrNull(spider_data__aweme_list__item__music_join['start_time']) as aweme_list__item__music__start_time
	,toInt64OrNull(spider_data__aweme_list__item__music_join['status']) as aweme_list__item__music__status
	,if(spider_data__aweme_list__item__music_join['strong_beat_url'] = '',Null,spider_data__aweme_list__item__music_join['strong_beat_url']) as aweme_list__item__music__strong_beat_url
	,if(spider_data__aweme_list__item__music_join['tag_list'] = '',Null,spider_data__aweme_list__item__music_join['tag_list']) as aweme_list__item__music__tag_list
	,if(spider_data__aweme_list__item__music_join['title'] = '',Null,spider_data__aweme_list__item__music_join['title']) as aweme_list__item__music__title
	,if(spider_data__aweme_list__item__music_join['unshelve_countries'] = '',Null,spider_data__aweme_list__item__music_join['unshelve_countries']) as aweme_list__item__music__unshelve_countries
	,toInt64OrNull(spider_data__aweme_list__item__music_join['user_count']) as aweme_list__item__music__user_count
	,toInt64OrNull(spider_data__aweme_list__item__music_join['video_duration']) as aweme_list__item__music__video_duration
	,if(spider_data__aweme_list__item__mix_info_join['cover_url'] = '',Null,spider_data__aweme_list__item__mix_info_join['cover_url']) as aweme_list__item__mix_info__cover_url
	,toInt64OrNull(spider_data__aweme_list__item__mix_info_join['create_time']) as aweme_list__item__mix_info__create_time
	,if(spider_data__aweme_list__item__mix_info_join['desc'] = '',Null,spider_data__aweme_list__item__mix_info_join['desc']) as aweme_list__item__mix_info__desc
	,if(spider_data__aweme_list__item__mix_info_join['extra'] = '',Null,spider_data__aweme_list__item__mix_info_join['extra']) as aweme_list__item__mix_info__extra
	,if(spider_data__aweme_list__item__mix_info_join['ids'] = '',Null,spider_data__aweme_list__item__mix_info_join['ids']) as aweme_list__item__mix_info__ids
	,toInt64OrNull(spider_data__aweme_list__item__mix_info_join['is_serial_mix']) as aweme_list__item__mix_info__is_serial_mix
	,if(spider_data__aweme_list__item__mix_info_join['mix_id'] = '',Null,spider_data__aweme_list__item__mix_info_join['mix_id']) as aweme_list__item__mix_info__mix_id
	,if(spider_data__aweme_list__item__mix_info_join['mix_name'] = '',Null,spider_data__aweme_list__item__mix_info_join['mix_name']) as aweme_list__item__mix_info__mix_name
	,toInt64OrNull(spider_data__aweme_list__item__mix_info_join['mix_pic_type']) as aweme_list__item__mix_info__mix_pic_type
	,toInt64OrNull(spider_data__aweme_list__item__mix_info_join['mix_type']) as aweme_list__item__mix_info__mix_type
	,if(spider_data__aweme_list__item__mix_info_join['status'] = '',Null,spider_data__aweme_list__item__mix_info_join['status']) as aweme_list__item__mix_info__status
	,toInt64OrNull(spider_data__aweme_list__item__mix_info_join['update_time']) as aweme_list__item__mix_info__update_time
	,if(spider_data__aweme_list__item__mix_info_join['watched_item'] = '',Null,spider_data__aweme_list__item__mix_info_join['watched_item']) as aweme_list__item__mix_info__watched_item
	,toInt64OrNull(spider_data__aweme_list__item__mix_info__statis_join['collect_vv']) as aweme_list__item__mix_info__statis__collect_vv
	,toInt64OrNull(spider_data__aweme_list__item__mix_info__statis_join['current_episode']) as aweme_list__item__mix_info__statis__current_episode
	,toInt64OrNull(spider_data__aweme_list__item__mix_info__statis_join['play_vv']) as aweme_list__item__mix_info__statis__play_vv
	,toInt64OrNull(spider_data__aweme_list__item__mix_info__statis_join['updated_to_episode']) as aweme_list__item__mix_info__statis__updated_to_episode
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_desc'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_desc']) as aweme_list__item__mix_info__share_info__share_desc
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_desc_info'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_desc_info']) as aweme_list__item__mix_info__share_info__share_desc_info
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_title'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_title']) as aweme_list__item__mix_info__share_info__share_title
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_title_myself'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_title_myself']) as aweme_list__item__mix_info__share_info__share_title_myself
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_title_other'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_title_other']) as aweme_list__item__mix_info__share_info__share_title_other
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_url'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_url']) as aweme_list__item__mix_info__share_info__share_url
	,if(spider_data__aweme_list__item__mix_info__share_info_join['share_weibo_desc'] = '',Null,spider_data__aweme_list__item__mix_info__share_info_join['share_weibo_desc']) as aweme_list__item__mix_info__share_info__share_weibo_desc
	,toUInt8(if(spider_data__aweme_list__item__author_join['accept_private_policy']='true',1,0)) as aweme_list__item__author__accept_private_policy
	,if(spider_data__aweme_list__item__author_join['account_region'] = '',Null,spider_data__aweme_list__item__author_join['account_region']) as aweme_list__item__author__account_region
	,if(spider_data__aweme_list__item__author_join['ad_cover_url'] = '',Null,spider_data__aweme_list__item__author_join['ad_cover_url']) as aweme_list__item__author__ad_cover_url
	,toInt64(spider_data__aweme_list__item__author_join['apple_account']) as aweme_list__item__author__apple_account
	,toInt64(spider_data__aweme_list__item__author_join['authority_status']) as aweme_list__item__author__authority_status
	,if(spider_data__aweme_list__item__author_join['avatar_168x168'] = '',Null,spider_data__aweme_list__item__author_join['avatar_168x168']) as aweme_list__item__author__avatar_168x168
	,if(spider_data__aweme_list__item__author_join['avatar_300x300'] = '',Null,spider_data__aweme_list__item__author_join['avatar_300x300']) as aweme_list__item__author__avatar_300x300
	,if(spider_data__aweme_list__item__author_join['avatar_larger'] = '',Null,spider_data__aweme_list__item__author_join['avatar_larger']) as aweme_list__item__author__avatar_larger
	,if(spider_data__aweme_list__item__author_join['avatar_medium'] = '',Null,spider_data__aweme_list__item__author_join['avatar_medium']) as aweme_list__item__author__avatar_medium
	,if(spider_data__aweme_list__item__author_join['avatar_thumb'] = '',Null,spider_data__aweme_list__item__author_join['avatar_thumb']) as aweme_list__item__author__avatar_thumb
	,if(spider_data__aweme_list__item__author_join['avatar_uri'] = '',Null,spider_data__aweme_list__item__author_join['avatar_uri']) as aweme_list__item__author__avatar_uri
	,toInt64(spider_data__aweme_list__item__author_join['aweme_count']) as aweme_list__item__author__aweme_count
	,toInt64OrNull(spider_data__aweme_list__item__author_join['aweme_hotsoon_auth']) as aweme_list__item__author__aweme_hotsoon_auth
	,toInt64OrNull(spider_data__aweme_list__item__author_join['aweme_hotsoon_auth_relation']) as aweme_list__item__author__aweme_hotsoon_auth_relation
	,if(spider_data__aweme_list__item__author_join['ban_user_functions'] = '',Null,spider_data__aweme_list__item__author_join['ban_user_functions']) as aweme_list__item__author__ban_user_functions
	,if(spider_data__aweme_list__item__author_join['bind_phone'] = '',Null,spider_data__aweme_list__item__author_join['bind_phone']) as aweme_list__item__author__bind_phone
	,if(spider_data__aweme_list__item__author_join['birthday'] = '',Null,spider_data__aweme_list__item__author_join['birthday']) as aweme_list__item__author__birthday
	,if(spider_data__aweme_list__item__author_join['can_set_geofencing'] = '',Null,spider_data__aweme_list__item__author_join['can_set_geofencing']) as aweme_list__item__author__can_set_geofencing
	,if(spider_data__aweme_list__item__author_join['card_entries'] = '',Null,spider_data__aweme_list__item__author_join['card_entries']) as aweme_list__item__author__card_entries
	,if(spider_data__aweme_list__item__author_join['card_entries_not_display'] = '',Null,spider_data__aweme_list__item__author_join['card_entries_not_display']) as aweme_list__item__author__card_entries_not_display
	,if(spider_data__aweme_list__item__author_join['card_sort_priority'] = '',Null,spider_data__aweme_list__item__author_join['card_sort_priority']) as aweme_list__item__author__card_sort_priority
	,if(spider_data__aweme_list__item__author_join['cf_list'] = '',Null,spider_data__aweme_list__item__author_join['cf_list']) as aweme_list__item__author__cf_list
	,if(spider_data__aweme_list__item__author_join['cha_list'] = '',Null,spider_data__aweme_list__item__author_join['cha_list']) as aweme_list__item__author__cha_list
	,toInt64(spider_data__aweme_list__item__author_join['close_friend_type']) as aweme_list__item__author__close_friend_type
	,toInt64(spider_data__aweme_list__item__author_join['comment_filter_status']) as aweme_list__item__author__comment_filter_status
	,toInt64(spider_data__aweme_list__item__author_join['comment_setting']) as aweme_list__item__author__comment_setting
	,toInt64(spider_data__aweme_list__item__author_join['commerce_user_level']) as aweme_list__item__author__commerce_user_level
	,toInt64(spider_data__aweme_list__item__author_join['constellation']) as aweme_list__item__author__constellation
	,toInt64(spider_data__aweme_list__item__author_join['contacts_status']) as aweme_list__item__author__contacts_status
	,if(spider_data__aweme_list__item__author_join['contrail_list'] = '',Null,spider_data__aweme_list__item__author_join['contrail_list']) as aweme_list__item__author__contrail_list
	,if(spider_data__aweme_list__item__author_join['cover_url'] = '',Null,spider_data__aweme_list__item__author_join['cover_url']) as aweme_list__item__author__cover_url
	,toInt64(spider_data__aweme_list__item__author_join['create_time']) as aweme_list__item__author__create_time
	,if(spider_data__aweme_list__item__author_join['custom_verify'] = '',Null,spider_data__aweme_list__item__author_join['custom_verify']) as aweme_list__item__author__custom_verify
	,if(spider_data__aweme_list__item__author_join['cv_level'] = '',Null,spider_data__aweme_list__item__author_join['cv_level']) as aweme_list__item__author__cv_level
	,if(spider_data__aweme_list__item__author_join['data_label_list'] = '',Null,spider_data__aweme_list__item__author_join['data_label_list']) as aweme_list__item__author__data_label_list
	,if(spider_data__aweme_list__item__author_join['display_info'] = '',Null,spider_data__aweme_list__item__author_join['display_info']) as aweme_list__item__author__display_info
	,toInt64(spider_data__aweme_list__item__author_join['download_prompt_ts']) as aweme_list__item__author__download_prompt_ts
	,toInt64(spider_data__aweme_list__item__author_join['download_setting']) as aweme_list__item__author__download_setting
	,toInt64(spider_data__aweme_list__item__author_join['duet_setting']) as aweme_list__item__author__duet_setting
	,toUInt8(if(spider_data__aweme_list__item__author_join['enable_nearby_visible']='true',1,0)) as aweme_list__item__author__enable_nearby_visible
	,if(spider_data__aweme_list__item__author_join['endorsement_info_list'] = '',Null,spider_data__aweme_list__item__author_join['endorsement_info_list']) as aweme_list__item__author__endorsement_info_list
	,if(spider_data__aweme_list__item__author_join['enterprise_verify_reason'] = '',Null,spider_data__aweme_list__item__author_join['enterprise_verify_reason']) as aweme_list__item__author__enterprise_verify_reason
	,toInt64(spider_data__aweme_list__item__author_join['favoriting_count']) as aweme_list__item__author__favoriting_count
	,toInt64(spider_data__aweme_list__item__author_join['fb_expire_time']) as aweme_list__item__author__fb_expire_time
	,toInt64(spider_data__aweme_list__item__author_join['follow_status']) as aweme_list__item__author__follow_status
	,toInt64(spider_data__aweme_list__item__author_join['follower_count']) as aweme_list__item__author__follower_count
	,if(spider_data__aweme_list__item__author_join['follower_list_secondary_information_struct'] = '',Null,spider_data__aweme_list__item__author_join['follower_list_secondary_information_struct']) as aweme_list__item__author__follower_list_secondary_information_struct
	,toInt64(spider_data__aweme_list__item__author_join['follower_request_status']) as aweme_list__item__author__follower_request_status
	,toInt64(spider_data__aweme_list__item__author_join['follower_status']) as aweme_list__item__author__follower_status
	,if(spider_data__aweme_list__item__author_join['followers_detail'] = '',Null,spider_data__aweme_list__item__author_join['followers_detail']) as aweme_list__item__author__followers_detail
	,toInt64(spider_data__aweme_list__item__author_join['following_count']) as aweme_list__item__author__following_count
	,toInt64(spider_data__aweme_list__item__author_join['gender']) as aweme_list__item__author__gender
	,if(spider_data__aweme_list__item__author_join['geofencing'] = '',Null,spider_data__aweme_list__item__author_join['geofencing']) as aweme_list__item__author__geofencing
	,if(spider_data__aweme_list__item__author_join['google_account'] = '',Null,spider_data__aweme_list__item__author_join['google_account']) as aweme_list__item__author__google_account
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_email']='true',1,0)) as aweme_list__item__author__has_email
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_facebook_token']='true',1,0)) as aweme_list__item__author__has_facebook_token
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_insights']='true',1,0)) as aweme_list__item__author__has_insights
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_orders']='true',1,0)) as aweme_list__item__author__has_orders
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_twitter_token']='true',1,0)) as aweme_list__item__author__has_twitter_token
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_unread_story']='true',1,0)) as aweme_list__item__author__has_unread_story
	,toUInt8(if(spider_data__aweme_list__item__author_join['has_youtube_token']='true',1,0)) as aweme_list__item__author__has_youtube_token
	,toUInt8(if(spider_data__aweme_list__item__author_join['hide_location']='true',1,0)) as aweme_list__item__author__hide_location
	,toUInt8(if(spider_data__aweme_list__item__author_join['hide_search']='true',1,0)) as aweme_list__item__author__hide_search
	,if(spider_data__aweme_list__item__author_join['homepage_bottom_toast'] = '',Null,spider_data__aweme_list__item__author_join['homepage_bottom_toast']) as aweme_list__item__author__homepage_bottom_toast
	,if(spider_data__aweme_list__item__author_join['im_role_ids'] = '',Null,spider_data__aweme_list__item__author_join['im_role_ids']) as aweme_list__item__author__im_role_ids
	,if(spider_data__aweme_list__item__author_join['ins_id'] = '',Null,spider_data__aweme_list__item__author_join['ins_id']) as aweme_list__item__author__ins_id
	,if(spider_data__aweme_list__item__author_join['interest_tags'] = '',Null,spider_data__aweme_list__item__author_join['interest_tags']) as aweme_list__item__author__interest_tags
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_ad_fake']='true',1,0)) as aweme_list__item__author__is_ad_fake
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_binded_weibo']='true',1,0)) as aweme_list__item__author__is_binded_weibo
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_block']='true',1,0)) as aweme_list__item__author__is_block
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_blocked_v2']='true',1,0)) as aweme_list__item__author__is_blocked_v2
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_blocking_v2']='true',1,0)) as aweme_list__item__author__is_blocking_v2
	,toInt64(spider_data__aweme_list__item__author_join['is_cf']) as aweme_list__item__author__is_cf
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_discipline_member']='true',1,0)) as aweme_list__item__author__is_discipline_member
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_gov_media_vip']='true',1,0)) as aweme_list__item__author__is_gov_media_vip
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_mix_user']='true',1,0)) as aweme_list__item__author__is_mix_user
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_not_show']='true',1,0)) as aweme_list__item__author__is_not_show
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_phone_binded']='true',1,0)) as aweme_list__item__author__is_phone_binded
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_star']='true',1,0)) as aweme_list__item__author__is_star
	,toUInt8(if(spider_data__aweme_list__item__author_join['is_verified']='true',1,0)) as aweme_list__item__author__is_verified
	,if(spider_data__aweme_list__item__author_join['item_list'] = '',Null,spider_data__aweme_list__item__author_join['item_list']) as aweme_list__item__author__item_list
	,toFloat64(spider_data__aweme_list__item__author_join['ky_only_predict']) as aweme_list__item__author__ky_only_predict
	,if(spider_data__aweme_list__item__author_join['language'] = '',Null,spider_data__aweme_list__item__author_join['language']) as aweme_list__item__author__language
	,if(spider_data__aweme_list__item__author_join['link_item_list'] = '',Null,spider_data__aweme_list__item__author_join['link_item_list']) as aweme_list__item__author__link_item_list
	,toInt64(spider_data__aweme_list__item__author_join['live_agreement']) as aweme_list__item__author__live_agreement
	,toInt64(spider_data__aweme_list__item__author_join['live_agreement_time']) as aweme_list__item__author__live_agreement_time
	,toUInt8(if(spider_data__aweme_list__item__author_join['live_commerce']='true',1,0)) as aweme_list__item__author__live_commerce
	,toInt64(spider_data__aweme_list__item__author_join['live_status']) as aweme_list__item__author__live_status
	,toInt64(spider_data__aweme_list__item__author_join['live_verify']) as aweme_list__item__author__live_verify
	,if(spider_data__aweme_list__item__author_join['location'] = '',Null,spider_data__aweme_list__item__author_join['location']) as aweme_list__item__author__location
	,toInt64(spider_data__aweme_list__item__author_join['max_follower_count']) as aweme_list__item__author__max_follower_count
	,if(spider_data__aweme_list__item__author_join['need_points'] = '',Null,spider_data__aweme_list__item__author_join['need_points']) as aweme_list__item__author__need_points
	,toInt64(spider_data__aweme_list__item__author_join['need_recommend']) as aweme_list__item__author__need_recommend
	,toInt64(spider_data__aweme_list__item__author_join['neiguang_shield']) as aweme_list__item__author__neiguang_shield
	,if(spider_data__aweme_list__item__author_join['new_story_cover'] = '',Null,spider_data__aweme_list__item__author_join['new_story_cover']) as aweme_list__item__author__new_story_cover
	,if(spider_data__aweme_list__item__author_join['nickname'] = '',Null,spider_data__aweme_list__item__author_join['nickname']) as aweme_list__item__author__nickname
	,if(spider_data__aweme_list__item__author_join['not_seen_item_id_list'] = '',Null,spider_data__aweme_list__item__author_join['not_seen_item_id_list']) as aweme_list__item__author__not_seen_item_id_list
	,if(spider_data__aweme_list__item__author_join['not_seen_item_id_list_v2'] = '',Null,spider_data__aweme_list__item__author_join['not_seen_item_id_list_v2']) as aweme_list__item__author__not_seen_item_id_list_v2
	,if(spider_data__aweme_list__item__author_join['offline_info_list'] = '',Null,spider_data__aweme_list__item__author_join['offline_info_list']) as aweme_list__item__author__offline_info_list
	,if(spider_data__aweme_list__item__author_join['personal_tag_list'] = '',Null,spider_data__aweme_list__item__author_join['personal_tag_list']) as aweme_list__item__author__personal_tag_list
	,if(spider_data__aweme_list__item__author_join['platform_sync_info'] = '',Null,spider_data__aweme_list__item__author_join['platform_sync_info']) as aweme_list__item__author__platform_sync_info
	,toUInt8(if(spider_data__aweme_list__item__author_join['prevent_download']='true',1,0)) as aweme_list__item__author__prevent_download
	,toInt64(spider_data__aweme_list__item__author_join['react_setting']) as aweme_list__item__author__react_setting
	,toInt64(spider_data__aweme_list__item__author_join['reflow_page_gid']) as aweme_list__item__author__reflow_page_gid
	,toInt64(spider_data__aweme_list__item__author_join['reflow_page_uid']) as aweme_list__item__author__reflow_page_uid
	,if(spider_data__aweme_list__item__author_join['region'] = '',Null,spider_data__aweme_list__item__author_join['region']) as aweme_list__item__author__region
	,if(spider_data__aweme_list__item__author_join['relative_users'] = '',Null,spider_data__aweme_list__item__author_join['relative_users']) as aweme_list__item__author__relative_users
	,if(spider_data__aweme_list__item__author_join['risk_notice_text'] = '',Null,spider_data__aweme_list__item__author_join['risk_notice_text']) as aweme_list__item__author__risk_notice_text
	,if(spider_data__aweme_list__item__author_join['room_data'] = '',Null,spider_data__aweme_list__item__author_join['room_data']) as aweme_list__item__author__room_data
	,toInt64(spider_data__aweme_list__item__author_join['room_id']) as aweme_list__item__author__room_id
	,if(spider_data__aweme_list__item__author_join['room_id_str'] = '',Null,spider_data__aweme_list__item__author_join['room_id_str']) as aweme_list__item__author__room_id_str
	,toInt64(spider_data__aweme_list__item__author_join['school_category']) as aweme_list__item__author__school_category
	,if(spider_data__aweme_list__item__author_join['school_id'] = '',Null,spider_data__aweme_list__item__author_join['school_id']) as aweme_list__item__author__school_id
	,if(spider_data__aweme_list__item__author_join['school_name'] = '',Null,spider_data__aweme_list__item__author_join['school_name']) as aweme_list__item__author__school_name
	,if(spider_data__aweme_list__item__author_join['school_poi_id'] = '',Null,spider_data__aweme_list__item__author_join['school_poi_id']) as aweme_list__item__author__school_poi_id
	,toInt64(spider_data__aweme_list__item__author_join['school_type']) as aweme_list__item__author__school_type
	,if(spider_data__aweme_list__item__author_join['search_impr'] = '',Null,spider_data__aweme_list__item__author_join['search_impr']) as aweme_list__item__author__search_impr
	,if(spider_data__aweme_list__item__author_join['sec_uid'] = '',Null,spider_data__aweme_list__item__author_join['sec_uid']) as aweme_list__item__author__sec_uid
	,toInt64(spider_data__aweme_list__item__author_join['secret']) as aweme_list__item__author__secret
	,if(spider_data__aweme_list__item__author_join['share_qrcode_uri'] = '',Null,spider_data__aweme_list__item__author_join['share_qrcode_uri']) as aweme_list__item__author__share_qrcode_uri
	,toInt64(spider_data__aweme_list__item__author_join['shield_comment_notice']) as aweme_list__item__author__shield_comment_notice
	,toInt64(spider_data__aweme_list__item__author_join['shield_digg_notice']) as aweme_list__item__author__shield_digg_notice
	,toInt64(spider_data__aweme_list__item__author_join['shield_follow_notice']) as aweme_list__item__author__shield_follow_notice
	,if(spider_data__aweme_list__item__author_join['short_id'] = '',Null,spider_data__aweme_list__item__author_join['short_id']) as aweme_list__item__author__short_id
	,toUInt8(if(spider_data__aweme_list__item__author_join['show_image_bubble']='true',1,0)) as aweme_list__item__author__show_image_bubble
	,toUInt8(if(spider_data__aweme_list__item__author_join['show_nearby_active']='true',1,0)) as aweme_list__item__author__show_nearby_active
	,if(spider_data__aweme_list__item__author_join['signature'] = '',Null,spider_data__aweme_list__item__author_join['signature']) as aweme_list__item__author__signature
	,toInt64(spider_data__aweme_list__item__author_join['signature_display_lines']) as aweme_list__item__author__signature_display_lines
	,if(spider_data__aweme_list__item__author_join['signature_extra'] = '',Null,spider_data__aweme_list__item__author_join['signature_extra']) as aweme_list__item__author__signature_extra
	,toInt64(spider_data__aweme_list__item__author_join['special_follow_status']) as aweme_list__item__author__special_follow_status
	,toInt64(spider_data__aweme_list__item__author_join['special_lock']) as aweme_list__item__author__special_lock
	,if(spider_data__aweme_list__item__author_join['special_people_labels'] = '',Null,spider_data__aweme_list__item__author_join['special_people_labels']) as aweme_list__item__author__special_people_labels
	,toInt64(spider_data__aweme_list__item__author_join['status']) as aweme_list__item__author__status
	,toInt64(spider_data__aweme_list__item__author_join['stitch_setting']) as aweme_list__item__author__stitch_setting
	,toInt64(spider_data__aweme_list__item__author_join['story_count']) as aweme_list__item__author__story_count
	,toUInt8(if(spider_data__aweme_list__item__author_join['story_open']='true',1,0)) as aweme_list__item__author__story_open
	,toInt64(spider_data__aweme_list__item__author_join['sync_to_toutiao']) as aweme_list__item__author__sync_to_toutiao
	,if(spider_data__aweme_list__item__author_join['text_extra'] = '',Null,spider_data__aweme_list__item__author_join['text_extra']) as aweme_list__item__author__text_extra
	,toInt64(spider_data__aweme_list__item__author_join['total_favorited']) as aweme_list__item__author__total_favorited
	,toInt64(spider_data__aweme_list__item__author_join['tw_expire_time']) as aweme_list__item__author__tw_expire_time
	,if(spider_data__aweme_list__item__author_join['twitter_id'] = '',Null,spider_data__aweme_list__item__author_join['twitter_id']) as aweme_list__item__author__twitter_id
	,if(spider_data__aweme_list__item__author_join['twitter_name'] = '',Null,spider_data__aweme_list__item__author_join['twitter_name']) as aweme_list__item__author__twitter_name
	,if(spider_data__aweme_list__item__author_join['type_label'] = '',Null,spider_data__aweme_list__item__author_join['type_label']) as aweme_list__item__author__type_label
	,if(spider_data__aweme_list__item__author_join['uid'] = '',Null,spider_data__aweme_list__item__author_join['uid']) as aweme_list__item__author__uid
	,if(spider_data__aweme_list__item__author_join['unique_id'] = '',Null,spider_data__aweme_list__item__author_join['unique_id']) as aweme_list__item__author__unique_id
	,toInt64(spider_data__aweme_list__item__author_join['unique_id_modify_time']) as aweme_list__item__author__unique_id_modify_time
	,toInt64(spider_data__aweme_list__item__author_join['user_age']) as aweme_list__item__author__user_age
	,toUInt8(if(spider_data__aweme_list__item__author_join['user_canceled']='true',1,0)) as aweme_list__item__author__user_canceled
	,toInt64(spider_data__aweme_list__item__author_join['user_mode']) as aweme_list__item__author__user_mode
	,toInt64(spider_data__aweme_list__item__author_join['user_not_see']) as aweme_list__item__author__user_not_see
	,toInt64(spider_data__aweme_list__item__author_join['user_not_show']) as aweme_list__item__author__user_not_show
	,toInt64(spider_data__aweme_list__item__author_join['user_period']) as aweme_list__item__author__user_period
	,if(spider_data__aweme_list__item__author_join['user_permissions'] = '',Null,spider_data__aweme_list__item__author_join['user_permissions']) as aweme_list__item__author__user_permissions
	,toInt64(spider_data__aweme_list__item__author_join['user_rate']) as aweme_list__item__author__user_rate
	,if(spider_data__aweme_list__item__author_join['user_tags'] = '',Null,spider_data__aweme_list__item__author_join['user_tags']) as aweme_list__item__author__user_tags
	,toInt64(spider_data__aweme_list__item__author_join['verification_type']) as aweme_list__item__author__verification_type
	,if(spider_data__aweme_list__item__author_join['verify_info'] = '',Null,spider_data__aweme_list__item__author_join['verify_info']) as aweme_list__item__author__verify_info
	,if(spider_data__aweme_list__item__author_join['video_icon'] = '',Null,spider_data__aweme_list__item__author_join['video_icon']) as aweme_list__item__author__video_icon
	,if(spider_data__aweme_list__item__author_join['weibo_name'] = '',Null,spider_data__aweme_list__item__author_join['weibo_name']) as aweme_list__item__author__weibo_name
	,if(spider_data__aweme_list__item__author_join['weibo_schema'] = '',Null,spider_data__aweme_list__item__author_join['weibo_schema']) as aweme_list__item__author__weibo_schema
	,if(spider_data__aweme_list__item__author_join['weibo_url'] = '',Null,spider_data__aweme_list__item__author_join['weibo_url']) as aweme_list__item__author__weibo_url
	,if(spider_data__aweme_list__item__author_join['weibo_verify'] = '',Null,spider_data__aweme_list__item__author_join['weibo_verify']) as aweme_list__item__author__weibo_verify
	,if(spider_data__aweme_list__item__author_join['white_cover_url'] = '',Null,spider_data__aweme_list__item__author_join['white_cover_url']) as aweme_list__item__author__white_cover_url
	,toUInt8(if(spider_data__aweme_list__item__author_join['with_commerce_entry']='true',1,0)) as aweme_list__item__author__with_commerce_entry
	,toUInt8(if(spider_data__aweme_list__item__author_join['with_dou_entry']='true',1,0)) as aweme_list__item__author__with_dou_entry
	,toUInt8(if(spider_data__aweme_list__item__author_join['with_fusion_shop_entry']='true',1,0)) as aweme_list__item__author__with_fusion_shop_entry
	,toUInt8(if(spider_data__aweme_list__item__author_join['with_shop_entry']='true',1,0)) as aweme_list__item__author__with_shop_entry
	,if(spider_data__aweme_list__item__author_join['youtube_channel_id'] = '',Null,spider_data__aweme_list__item__author_join['youtube_channel_id']) as aweme_list__item__author__youtube_channel_id
	,if(spider_data__aweme_list__item__author_join['youtube_channel_title'] = '',Null,spider_data__aweme_list__item__author_join['youtube_channel_title']) as aweme_list__item__author__youtube_channel_title
	,toInt64(spider_data__aweme_list__item__author_join['youtube_expire_time']) as aweme_list__item__author__youtube_expire_time
	,if(spider_data__aweme_list__item__author__share_info_join['share_desc'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_desc']) as aweme_list__item__author__share_info__share_desc
	,if(spider_data__aweme_list__item__author__share_info_join['share_desc_info'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_desc_info']) as aweme_list__item__author__share_info__share_desc_info
	,if(spider_data__aweme_list__item__author__share_info_join['share_qrcode_url'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_qrcode_url']) as aweme_list__item__author__share_info__share_qrcode_url
	,if(spider_data__aweme_list__item__author__share_info_join['share_title'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_title']) as aweme_list__item__author__share_info__share_title
	,if(spider_data__aweme_list__item__author__share_info_join['share_title_myself'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_title_myself']) as aweme_list__item__author__share_info__share_title_myself
	,if(spider_data__aweme_list__item__author__share_info_join['share_title_other'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_title_other']) as aweme_list__item__author__share_info__share_title_other
	,if(spider_data__aweme_list__item__author__share_info_join['share_url'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_url']) as aweme_list__item__author__share_info__share_url
	,if(spider_data__aweme_list__item__author__share_info_join['share_weibo_desc'] = '',Null,spider_data__aweme_list__item__author__share_info_join['share_weibo_desc']) as aweme_list__item__author__share_info__share_weibo_desc
	,toInt64(spider_data__aweme_list__item__author__original_musician_join['digg_count']) as aweme_list__item__author__original_musician__digg_count
	,toInt64(spider_data__aweme_list__item__author__original_musician_join['music_count']) as aweme_list__item__author__original_musician__music_count
	,toInt64(spider_data__aweme_list__item__author__original_musician_join['music_used_count']) as aweme_list__item__author__original_musician__music_used_count
	,toUInt8(if(spider_data__aweme_list__item__author__aweme_control_join['can_comment']='true',1,0)) as aweme_list__item__author__aweme_control__can_comment
	,toUInt8(if(spider_data__aweme_list__item__author__aweme_control_join['can_forward']='true',1,0)) as aweme_list__item__author__aweme_control__can_forward
	,toUInt8(if(spider_data__aweme_list__item__author__aweme_control_join['can_share']='true',1,0)) as aweme_list__item__author__aweme_control__can_share
	,toUInt8(if(spider_data__aweme_list__item__author__aweme_control_join['can_show_comment']='true',1,0)) as aweme_list__item__author__aweme_control__can_show_comment
	,created_time as source_time
	,now() as inserted_time
FROM {self.INPUT_TABLE}
"""
