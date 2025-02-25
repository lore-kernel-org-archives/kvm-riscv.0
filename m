Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8987C021B6
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0+qDjF+2+LuMr65pwkdielNvrUOHNwAFMpBA7euFBw=; b=eIHwD8qeVTjbhi
	v3JMkhMxxPqRYA7nA2TGuEBiJ87v6KTGPKvzKujUoLPn8tfbYIWL5GXMGnsWgx1ToDdM25otGSUAu
	PCPU44xBo5+sMVom54ah6kLblwI6/G/IQU4xxbvplN3rjU34dJv26Rqb2NYFCin77iQH3NHeK85jt
	4nPu1wz4l3EnktPVjyH37GfsFFfufCpcPSpmKUeF7J4iRYNaIXwqsiu6B+BG3uG6Grwg3BZTEZWcu
	gZl0WjbrMxyB5S33V2gn56wem4vTKxbGJcZrmJWEC3jOQvNlrgcfvAG6gEVdMFaECzOuFD3/kEAN5
	ay0GXGSnUn3uV34XfT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsal-0000000GueR-1lr7;
	Tue, 25 Feb 2025 10:55:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrtZ-0000000GlZB-43w0
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 10:10:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22128b7d587so103508565ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740478233; x=1741083033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BszIp08I3eanMgBTcHD88R/ZYOCd696icBQjHBlWeA=;
        b=kKuFjXltzGU3pJSCB+iCKyI4lbQEbOBJ7c3QExAHBLFhq1bmFiR4ukn4UcF8dKIh85
         ZKVvC0DCAW1tNPnRgdgRrOR8mIv1oUBSdj+/NDKBLgbtQ63s+kHoXmQmkkr/1US66N3z
         ESjK6FNuBeoRpAzmumCc6QCkO8XAfu+1rSpaS0VyrrbdzXV5Ki+fJ6jEJqqVm0O/O8aQ
         wt+wJPE0bboJ9xGQob8m0L8Vv84OM/xicjwytTCPvYR2mIrqlrGxqEWJhDmAzp8W+/w0
         ovVr9PJV/vXJJhhY4Fr/4Bk5T/mJYIFatp49xXqDA9iKuOAc5EMLUIZ9n+mLaThPMfRC
         YTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478233; x=1741083033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BszIp08I3eanMgBTcHD88R/ZYOCd696icBQjHBlWeA=;
        b=Bs+cnT/PBGcLKO/fyGr4cHx+FG7ZnxOcv1NWPgHib1NgcmLLOA07HdHo0Vikeo+0cK
         /0HHYPruFbiwlLLQ4Fv++eJjUJBUwYDbaoJE2SOW1EkuyZgNryZcm0+YiR23xi7KvP/6
         /WO0nIQ9LMNYdn5vkw2r3dt8G/qqLifZOwsbdOhJY7/99NZkgCrrGinVOaHLtRtI6Kxa
         XI4T1eJs9TM7bT3a1EXnJ94sYbAho0rx0yqxd9JCfU84LctWBfnB4+5Iyby9v+CmZahC
         AWgDNQaznbeerJ8vaskWeHIZ9Z91NHuwiZGlGlFKLMO/PRGuMQjAus9BpBq3d6nCDHgL
         f7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVWifZKwH3/7tV4unkRupzJs2xhAqtT/ySVnYpCQVVnlA0sDW3Dsye9TWE2psbwy1CIFQwfi1jjKJ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjAABKQPeoBNrcAjS0uvjs6+FYet2UrYDLIHcylOj2TvjRalWH
	NfzP6lK1eCn3V1BVsoFmEzy+EuI/xe9q9g0FZIie+dAVtJdTA39hJIsCuCbSUsk=
X-Gm-Gg: ASbGnct4B7JtTpDPAMSN80s+VdfrutXg0fq4qg/zLZgZj2Ef3koFpixZOm3TiflMM5y
	0SPB8NAjPGDn+XK8/Yvxx3rpKUBNjbEpVEbT7bOZJowexxms+OhlVTs6nAhmHXRPvk4NynaWNT0
	HQofQI+kGi83ucFJnm7Me3TJB2VUB8X8/hYuypIJiRTWWClUtx0KvfumWj/K+udoqm4ADiJiVp7
	9a5AfikO8Z1669KXPjXnhdUGEVrnWl1cuX+9x/9qqMJzfqLaZAAAPJsruv6/3bqQZRlP4ZTUcJF
	uc8XuxK+ft61RwTsa6ONwHa1K5VS2bE/bM6W8nXVYB40ofwGN60zhOPINu0YKJL6GBQHZZE=
X-Google-Smtp-Source: AGHT+IHi+6CrBgmWYeZhPZXzbC9X2YbiFwAB2wHBJFWyIGXzTsqQIBErUMBUakgKYyLgMb1Mxzt4cw==
X-Received: by 2002:a05:6a21:3e09:b0:1f0:e75d:3731 with SMTP id adf61e73a8af0-1f0e75d375fmr10476913637.11.1740478233128;
        Tue, 25 Feb 2025 02:10:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ea59sm1089472b3a.128.2025.02.25.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:10:32 -0800 (PST)
Message-ID: <096cffd2-3b29-40b4-8420-f969c0739017@rivosinc.com>
Date: Tue, 25 Feb 2025 11:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 3/3] riscv: sbi: Add sbiret_report_error
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com
References: <20250218185401.41250-5-andrew.jones@linux.dev>
 <20250218185401.41250-8-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250218185401.41250-8-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021034_007063_E9C93A58 
X-CRM114-Status: GOOD (  15.54  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC8wMi8yMDI1IDE5OjU0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gQW4gc2JpcmV0IHZh
bHVlIG1heSBiZSB1bnNwZWNpZmllZCBpbiB0aGUgY2FzZSBvZiBlcnJvcnMsIGFuZCBldmVuIGlu
Cj4gdGhlIGNhc2Ugb2Ygc3VjY2VzcyB3aGVuIHRoZSBmdW5jdGlvbiBkb2Vzbid0IHJldHVybiBh
bnl0aGluZy4KPiBQcm92aWRlIGFuIHNiaXJldCByZXBvcnQgZnVuY3Rpb24gdGhhdCBvbmx5IGNo
ZWNrcyBzYmlyZXQuZXJyb3IuCj4gCj4gc2JpcmV0X3JlcG9ydF9lcnJvcigpIGhhcyBhIGRpZmZl
cmVudCBQQVNTIGZvcm1hdCB0aGFuCj4gc2JpcmV0X3JlcG9ydCgpLiBUaGUgZm9ybWVyIHdpbGwg
YWx3YXlzIG91dHB1dCB0aGUgc3RyaW5naXplZAo+IGV4cGVjdGVkIGVycm9yIHNvIHRoZSBmb3Jt
YXQgc3RyaW5nIGRvZXNuJ3QgbmVlZCB0byBjb250YWluIGl0LCBlLmcuCj4gCj4gICBQQVNTOiBz
Ymk6IHRlc3QgZm9vOiBTQklfU1VDQ0VTUwo+ICAgUEFTUzogc2JpOiB0ZXN0IGV2ZW50IGlkIDB4
MDogU0JJX0lOVkFMSURfUEFSQU0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0BsaW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS10ZXN0cy5oIHwgMjEgKysr
KysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9yaXNjdi9zYmktdGVzdHMuaCBiL3Jpc2N2
L3NiaS10ZXN0cy5oCj4gaW5kZXggMmJkYzk0NDBkODJkLi43YTI0ZTA4M2E3YjggMTAwNjQ0Cj4g
LS0tIGEvcmlzY3Yvc2JpLXRlc3RzLmgKPiArKysgYi9yaXNjdi9zYmktdGVzdHMuaAo+IEBAIC0z
NiwyMCArMzYsMzUgQEAKPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiAgI2luY2x1ZGUgPGFzbS9z
YmkuaD4KPiAgCj4gLSNkZWZpbmUgc2JpcmV0X3JlcG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBl
eHBlY3RlZF92YWx1ZSwgZm10LCAuLi4pICh7CQkJCQkJXAo+ICsjZGVmaW5lIF9fc2JpcmV0X3Jl
cG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgaGFzX3ZhbHVlLCBleHBl
Y3RlZF9lcnJvcl9uYW1lLCBmbXQsIC4uLikgKHsJXAo+ICAJbG9uZyBleF9lcnIgPSBleHBlY3Rl
ZF9lcnJvcjsJCQkJCQkJCQkJXAo+ICAJbG9uZyBleF92YWwgPSBleHBlY3RlZF92YWx1ZTsJCQkJ
CQkJCQkJXAo+ICsJYm9vbCBoYXNfdmFsID0gISEoaGFzX3ZhbHVlKTsJCQkJCQkJCQkJXAo+ICAJ
Ym9vbCBjaF9lcnIgPSAocmV0KS0+ZXJyb3IgPT0gZXhfZXJyOwkJCQkJCQkJCVwKPiAgCWJvb2wg
Y2hfdmFsID0gKHJldCktPnZhbHVlID09IGV4X3ZhbDsJCQkJCQkJCQlcCj4gLQlib29sIHBhc3Mg
PSByZXBvcnQoY2hfZXJyICYmIGNoX3ZhbCwgZm10LCAjI19fVkFfQVJHU19fKTsJCQkJCQlcCj4g
Kwlib29sIHBhc3M7CQkJCQkJCQkJCQkJXAo+ICAJCQkJCQkJCQkJCQkJCVwKPiAtCWlmICghcGFz
cykJCQkJCQkJCQkJCQlcCj4gKwlpZiAoaGFzX3ZhbCkJCQkJCQkJCQkJCQlcCj4gKwkJcGFzcyA9
IHJlcG9ydChjaF9lcnIgJiYgY2hfdmFsLCBmbXQsICMjX19WQV9BUkdTX18pOwkJCQkJCVwKPiAr
CWVsc2UJCQkJCQkJCQkJCQkJXAo+ICsJCXBhc3MgPSByZXBvcnQoY2hfZXJyLCBmbXQgIjogJXMi
LCAjI19fVkFfQVJHU19fLCBleHBlY3RlZF9lcnJvcl9uYW1lKTsJCQkJXAo+ICsJCQkJCQkJCQkJ
CQkJCVwKPiArCWlmICghcGFzcyAmJiBoYXNfdmFsKQkJCQkJCQkJCQkJXAo+ICAJCXJlcG9ydF9p
bmZvKGZtdCAiOiBleHBlY3RlZCAoZXJyb3I6ICVsZCwgdmFsdWU6ICVsZCksIHJlY2VpdmVkOiAo
ZXJyb3I6ICVsZCwgdmFsdWUgJWxkKSIsCVwKPiAgCQkJICAgICMjX19WQV9BUkdTX18sIGV4X2Vy
ciwgZXhfdmFsLCAocmV0KS0+ZXJyb3IsIChyZXQpLT52YWx1ZSk7CQkJCVwKPiArCWVsc2UgaWYg
KCFwYXNzKQkJCQkJCQkJCQkJCVwKPiArCQlyZXBvcnRfaW5mbyhmbXQgIjogJXMgKCVsZCk6IHJl
Y2VpdmVkIGVycm9yICVsZCIsCQkJCQkJXAo+ICsJCQkgICAgIyNfX1ZBX0FSR1NfXywgZXhwZWN0
ZWRfZXJyb3JfbmFtZSwgZXhfZXJyLCAocmV0KS0+ZXJyb3IpOwkJCQlcCj4gIAkJCQkJCQkJCQkJ
CQkJXAo+ICAJcGFzczsJCQkJCQkJCQkJCQkJXAo+ICB9KQo+ICAKPiArI2RlZmluZSBzYmlyZXRf
cmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCAuLi4pIFwKPiArCV9f
c2JpcmV0X3JlcG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgdHJ1ZSwg
I2V4cGVjdGVkX2Vycm9yLCBfX1ZBX0FSR1NfXykKPiArCj4gKyNkZWZpbmUgc2JpcmV0X3JlcG9y
dF9lcnJvcihyZXQsIGV4cGVjdGVkX2Vycm9yLCAuLi4pIFwKPiArCV9fc2JpcmV0X3JlcG9ydChy
ZXQsIGV4cGVjdGVkX2Vycm9yLCAwLCBmYWxzZSwgI2V4cGVjdGVkX2Vycm9yLCBfX1ZBX0FSR1Nf
XykKPiArCj4gICNkZWZpbmUgc2JpcmV0X2NoZWNrKHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVj
dGVkX3ZhbHVlKSBcCj4gIAlzYmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVj
dGVkX3ZhbHVlLCAiY2hlY2sgc2JpLmVycm9yIGFuZCBzYmkudmFsdWUiKQo+ICAKCkhleSBBbmRy
ZXcsCgpUZXN0ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywK
CkNsw6ltZW50CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
