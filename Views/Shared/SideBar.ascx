﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="ReportsWebFormsSamples.Common.SideBar" %>

<div class="ej-sidebar-content">
    <div class="ej-sb-home ej-sb-icons" onclick="onHomeBtnClick()">
        <span class="ej-sb-home-text">Home</span>
    </div>
    <div class="ej-sb-toc">
        <% 
            dynamic data = sampledata;
            for (int i = 0; i < data.samples.Count; i++)
            {
                string basePath = Page.ResolveUrl("~/");
                var sample = data.samples[i];
                var isLandscape = (bool)sample.imageDetails.isLandscape;
                string imageClassName = isLandscape ? "ej-landscape-img" : "ej-portrait-img";
                string bgPosition = "background-position-y:" + (-( isLandscape ? (Int32)sample.imageDetails.index * 70 :
                (Int32)sample.imageDetails.index * 120)) + "px";
                
                string status = (string)sample.status ;
                { %>
                <div class="ej-sb-toc-card" onclick="onTocClick({index:'<%= i %>', e:event})" tabindex="-1">
                <div class="<%= imageClassName %>" style="<%= bgPosition %>"></div>
                <div class="ej-sb-toc-title"><%=  sample.sampleName %></div>
                <%if (!String.IsNullOrEmpty(status) && (status.ToUpper() == "UPDATED" || status.ToUpper() == "NEW"))
                    {%>
                        <span class="<%= isLandscape ? "ej-landscape" : "ej-portrait"%> ej-status-label ej-<%=@status.ToLower()%>"><%= status%></span>
                <%} %>

        </div>
        <% }} %>
    </div>
</div>

