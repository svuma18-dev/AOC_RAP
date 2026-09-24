@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for attachment'
@Metadata.allowExtensions: true
define view entity ZSVU_ATTACHMENT_PROCESSOR as projection on ZSVU_ATTACHMENT
{
    key TravelId,
    key Id,
    Comments,
    Attachment,
    Filename,
    Filetype,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Travel : redirected to parent ZATS_UM_TRAVEL_PROCESSOR
}
