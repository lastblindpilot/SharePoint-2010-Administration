### Using the SharePoint 2010 List data REST service
###
###

### Get list data
http://localhost/_vti_bin/listdata.svc/Parts

### Get list items with id = 3
http://localhost/_vti_bin/listdata.svc/Parts(3)

### Get list data ordered by the Name field
http://localhost/_vti_bin/listdata.svc/Parts?$orderby=Name

### Top 10
http://localhost/_vti_bin/listdata.svc/Parts?$top=10

### Using filters
http://localhost/_vti_bin/listdata.svc/Parts?$top=10&$filter=StatusValue eq ‘Active’

### Get specific column
http://localhost/_vti_bin/listdata.svc/Parts?$top=10&$filter=StatusValue eq ‘Active’/Name