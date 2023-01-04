select
    da.datamodelapiscapabilitiesid,
    da.tablename,
    da.capability,
    da.createddate,
    da.statusid,
    dad.technology,
    dad."location",
    dad.apiname
from
    datamodel_apis da
        inner join datamodel_apis_dtls dad on
            da.datamodelapiscapabilitiesid = dad.apicapabilitiesid
order by tablename asc;