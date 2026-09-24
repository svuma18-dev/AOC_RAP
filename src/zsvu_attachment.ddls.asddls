@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for attachments'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSVU_ATTACHMENT as select from zsvu_attachments

 association to parent ZATS_UM_TRAVEL as _Travel on 
 $projection.TravelId = _Travel.TravelId
{
    key travel_id as TravelId,
    @EndUserText.label: 'Attachment ID'
    key id as Id,
    @EndUserText.label: 'Comments'
    comments as Comments,
    @Semantics.largeObject: { fileName: 'Filename',
                              mimeType: 'Filetype', 
                              contentDispositionPreference: #INLINE }
    @EndUserText.label: 'Attachment'
    attachment as Attachment,
    @EndUserText.label: 'File Name'
    filename as Filename, 
    @Semantics.mimeType: true
    @EndUserText.label: 'File Type'
    filetype as Filetype,
     @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as LocalCreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
     @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _Travel
}
