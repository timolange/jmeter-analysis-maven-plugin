<#ftl/>
<#-- @ftlvariable name="key" type="java.lang.String" -->
<#-- @ftlvariable name="aggregatedResponses" type="com.lazerycode.jmeter.analyzer.parser.AggregatedResponses" -->
<#-- @ftlvariable name="bytes" type="com.lazerycode.jmeter.analyzer.statistics.Samples" -->
<#-- @ftlvariable name="requests" type="com.lazerycode.jmeter.analyzer.statistics.Samples" -->
<#-- @ftlvariable name="Q_QUANTILES" type="java.lang.Integer" -->
<#-- @ftlvariable name="K_99_PERCENT" type="java.lang.Integer" -->
<#-- @ftlvariable name="K_99_PONT_9_PERCENT" type="java.lang.Integer" -->
<#-- @ftlvariable name="PERCENT_100" type="java.lang.Integer" -->
<#assign quantiles=requests.getQuantiles(Q_QUANTILES)/>
<#assign statusCodes=aggregatedResponses.statusCodes.codes/>
<#assign total=requests.successCount + requests.errorsCount/>
    {
      "min": ${requests.min},
      "max": ${requests.max},
      "quantile90": ${quantiles.getQuantile(900)},
      "average": ${requests.average},
      "total": ${total},
      "statusCodes":{
                  <#list statusCodes?keys as statusCode>
                    <#assign statusCodeCount=statusCodes(statusCode)/>
                      "${statusCode?string}": ${statusCodeCount}<#if statusCode_has_next>,</#if>
                  </#list>
                    }
    }