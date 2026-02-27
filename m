Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CFEFEFB52
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 14:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rZ/T4ZlNAGAjKGEBZQ0zq1y9DyL4BpyYM1z/pU5jzQ=; b=0vdJ4dNnhM/dJT
	nB/RB47z4r4H4GwLEL10CSvUbTYnMN3cDJ9OQYzc1WmJwcFcMKDsdZluo0TGaVl6w8qplB58KLlr8
	HuK6EakmT+Xn9nE/fDcdATJ+XilC0tyexY1zVa77jp7uYhnI9Df750pR00s7SJdYWSHwIonv3vNFM
	R/C/Ajk58yeENUbr8P9vl4YYvgwsmz4qxAw1Q4z4tSKr5Q7jpaSbYXiwTuig87xH4zyFB5uONL8NK
	afya81e9XTeRU1Xkr+wl/GaA8lYRw0jHS4RopvlNc6y/M3c0wyv9gdbeYlS0LqxVKBu7o6ENG8Ym0
	tVB3THcNyuiMVRz2x54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyP5-00000008Rvp-0XPW;
	Fri, 27 Feb 2026 14:01:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOe-00000008RPG-1LWe
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 14:00:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fVNj2308901
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlqb7BDCgmRJ1hZWQTjrCQIUXtq6dQQDj7TPdTyfFFg=; b=n/sz1jEkHInV5jOy
	e0RKqa6YVl9I9NKH7WAjGgq03/1uT4zvXCxSH0qdl/Eje6caKVQKnSjJmdfaTuwM
	hwmUs15YKtaF9kuyXp2eNKTNES+zCsx0vAjmrEqQh/4uKY+aJs4IBRxLtWjofxqz
	Rp0BZFdRAQbXvtg9qwNdlLTLqaxRALAAxaLe358mssyJ5hjJIRmQGh6y7OYbBtwj
	J8H4wRfEcT56CiwfOhVDxL3JPaw+XdlQEXfnvhHneRTvw7kh7G5BBkImDMo9oy92
	BBCiiykbg+2MHbGPTHF/gNvbWSHWcatu1rKqoYkGZwd58i8UJBhzZDI0IiZ7wPtC
	g5bWtw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q13yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 14:00:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ad0d8eff8so24190194241.1
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 06:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772200846; x=1772805646; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlqb7BDCgmRJ1hZWQTjrCQIUXtq6dQQDj7TPdTyfFFg=;
        b=RAHprqRj7HxeCkEUKPW4sPwx02uBD4rozpP5+hp5S1jXSq50JRXO/SjJXBth96dwmr
         mAIE60zoEl9ZOLIg2mPUlLe9TDspCIXELsqlKAo7TRuysLFIkFxJnVVYLmAiLqTPggBD
         72I6lHsv5WkqVA0agFHar9SJbiirdWFqrp8qT2CrMtZaNbr0nVZx1IvTPM41nlhF9tYa
         PIajY45gyNpj8CmVyDnlOg3ytox60nBP1oNm1/owte5kjPg/IOFC7O0Y/rSOQzBovO2v
         1/mPB3j8sC8JrKWNTY54gcUfMk8Qf+pFHVJtf5EBOHFKAiMi/Ul5T8P1dTrWvvBmp9gp
         GG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200846; x=1772805646;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlqb7BDCgmRJ1hZWQTjrCQIUXtq6dQQDj7TPdTyfFFg=;
        b=tCCDnZ0BL6aEIojKjRj2jypIHnYpk/vrKBPO5BygGc5+UzNx5KNMm2sgoq8EBwZFBf
         JAEG1pozpl0tBSYBrWd/1CiA4yLFUykOWe7pcmP0DDj5XXAcWJIL81SOcUgTEhXiaRud
         Nj9u+g53P7wva3etmYz8a1D+NgVbiALRNSP0JrjkZjUS+gS7ygg41VG05qu06uQ0UXjR
         UgZPOPxwMf9gnaCwKHOBf7tyqtHG69aZU9r7ky4dtjxRjiuTqyAXYwAjjpK68dFRbzQZ
         K7HEzTWO657j71Cd4owxY8DYicgUjqclKeATfQ7vjk59NitTHApdQPEJN9ovPFwq0Ctm
         KuEw==
X-Forwarded-Encrypted: i=1; AJvYcCVNvCD88DcRvu8qatdQ0Wu0edb05dYeJYszqUzhDSMD5LCEdor64bWBvH3/jRoAuLEMR8iNVQ5aGZI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/mLYTcsaEol2fV7Hw8Vg+bcCfFvuwS6+ecDx9bKkT7cKA8g91
	A0Y7hUB6xTTWLV0lqZHyQiT6PSvXiE6K9SEivMl3edPqcf4YBYwVrpIuotCb4RcmMzafwduscE1
	iL+9mA20jaxSbHBiS2wmg5FOHs/bFZplj4anUuOgLRrGEEVKVKfAjnXPrpKdKwpZt96kw
X-Gm-Gg: ATEYQzwNdm9G0+yyvNb3UQodZJVzG8wJ+8Rj40dLtxnOJHkRTkslKllh0r3wLLm4o1q
	47LEYrnYmkVGFaMFvMR55CPQIRGEP6GiS9gAr5nR0HPhkeBC/a9XFMPLGAQMMGt5xg2GkqCCxmh
	mNlZNg+oD/UEf5RkNB5beWSnvb7PmApN2c2vkkWI7zzHhcvk7nuSoI3Av0Y1esL57y+SBsw3qkF
	dLJIwOroF3yumYIHk+5dWIpoDLcf1zSNgSw/kPoBc8MChGhLFrXAdPq1Ho6zXSG4O4suHb4NZy3
	1XdcUMcXNy8PvIWYgcehm/ZU5Byght8jcrJdvSZhZ0H6bLRPLyu9la32EhXLSDPHa6Z2ye1wZgb
	gV6XWh2rw2/kAY7rbaDjWxuOh9odfnvkAoG37XpRGvG7GzssKDSZvGqgT6vFM
X-Received: by 2002:a05:6102:945:b0:5fd:b46b:d5a6 with SMTP id ada2fe7eead31-5ff1cf4a2edmr3779347137.12.1772200846090;
        Fri, 27 Feb 2026 06:00:46 -0800 (PST)
X-Received: by 2002:a05:6102:945:b0:5fd:b46b:d5a6 with SMTP id ada2fe7eead31-5ff1cf4a2edmr3779295137.12.1772200845537;
        Fri, 27 Feb 2026 06:00:45 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aeee867sm149340066b.66.2026.02.27.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:00:44 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 27 Feb 2026 14:00:43 +0000
Message-Id: <DGPSROCWMJWD.33FHG4JOPD2V8@oss.qualcomm.com>
Subject: Re: [PATCH v7] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        "Conor Dooley"
 <conor.dooley@microchip.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>,
        "Nutty Liu" <nutty.liu@hotmail.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260227121008.442241-1-tjytimi@163.com>
In-Reply-To: <20260227121008.442241-1-tjytimi@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNCBTYWx0ZWRfX7bcQGT/iW9gD
 6zIm0uYj6ESfYqFQc62xlhUttA6zkzB5LB5HY8WosBVZvmxa7CS52kcwfeh+JPE2uOoVWSAoQRJ
 72H0sV6FHbSm5jQCdSmip2IyEmRtDWqRJcSYZvnmV2i80PVFbFeeV0AmM1zSa9+6h51PnH+m2M2
 olSKv9qEeBtfJ3wWvZ1Tu7Ydd1tXniV6rlISLCzqvCfUYgwjo9EFUZA+hf3E3KeYrNTwLNCeORP
 aZUtT7uRmcflfm0u3ueOUpoA/mZ47zderfOXKXTCFAh2xgTA9qulExbX5klaTbwenprV4fvgdtc
 YU8Z6O4RyydpgYlSl4cmIeXB84+EO0u6VJOoSrpNYLYiYpxFURtd91PoflTSUPXwnOhNiyen3A3
 X5R3LLCvGm2o3gpflHu4XHGskRIlyJcWVaQf9FCxfb/iQNhowqCOiSE63sLlrCG26kXOx/xtwqf
 I9iblKBE+gw3SrO7xQg==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1a38e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=p71xfkkELbvJglz7_8IA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: RvNMtRjosilk6hWXq0Tx4MbG3pHprHk5
X-Proofpoint-GUID: RvNMtRjosilk6hWXq0Tx4MbG3pHprHk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_060048_600940_A35A28E6 
X-CRM114-Status: GOOD (  16.33  )
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

MjAyNi0wMi0yN1QyMDoxMDowOCswODowMCwgSmlueXUgVGFuZyA8dGp5dGltaUAxNjMuY29tPjoK
PiBDdXJyZW50bHksIGt2bV9hcmNoX3ZjcHVfbG9hZCgpIHVuY29uZGl0aW9uYWxseSByZXN0b3Jl
cyBndWVzdCBDU1JzLAo+IEhHQVRQLCBhbmQgQUlBIHN0YXRlLiBIb3dldmVyLCB3aGVuIGEgVkNQ
VSBpcyBsb2FkZWQgYmFjayBvbiB0aGUgc2FtZQo+IHBoeXNpY2FsIENQVSwgYW5kIG5vIG90aGVy
IEtWTSBWQ1BVIGhhcyBydW4gb24gdGhpcyBDUFUgc2luY2UgaXQgd2FzCj4gbGFzdCBwdXQsIHRo
ZSBoYXJkd2FyZSBDU1JzIGFuZCBBSUEgcmVnaXN0ZXJzIGFyZSBzdGlsbCB2YWxpZC4KPgo+IFRo
aXMgcGF0Y2ggb3B0aW1pemVzIHRoZSB2Y3B1X2xvYWQgcGF0aCBieSBza2lwcGluZyB0aGUgZXhw
ZW5zaXZlIENTUgo+IGFuZCBBSUEgd3JpdGVzIGlmIGFsbCB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnMgYXJlIG1ldDoKPiAxLiBJdCBpcyBiZWluZyByZWxvYWRlZCBvbiB0aGUgc2FtZSBDUFUgKHZj
cHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpLgo+IDIuIFRoZSBDU1JzIGFyZSBub3QgZGly
dHkgKCF2Y3B1LT5hcmNoLmNzcl9kaXJ0eSkuCj4gMy4gTm8gb3RoZXIgVkNQVSB1c2VkIHRoaXMg
Q1BVICh2Y3B1ID09IF9fdGhpc19jcHVfcmVhZChrdm1fZm9ybWVyX3ZjcHUpKS4KPgo+IFRvIGVu
c3VyZSB0aGlzIGZhc3QtcGF0aCBkb2Vzbid0IGJyZWFrIGNvcm5lciBjYXNlczoKPiAtIExpdmUg
bWlncmF0aW9uIGFuZCBWQ1BVIHJlc2V0IGFyZSBuYXR1cmFsbHkgc2FmZS4gS1ZNIGluaXRpYWxp
emVzCj4gICBsYXN0X2V4aXRfY3B1IHRvIC0xLCB3aGljaCBndWFyYW50ZWVzIHRoZSBmYXN0LXBh
dGggd29uJ3QgdHJpZ2dlci4KPiAtIFRoZSAnY3NyX2RpcnR5JyBmbGFnIHRyYWNrcyBydW50aW1l
IHVzZXJzcGFjZSBpbnRlcnZlbnRpb25zLiBJZgo+ICAgdXNlcnNwYWNlIG1vZGlmaWVzIGd1ZXN0
IGNvbmZpZ3VyYXRpb25zIChlLmcuLCBoZWRlbGVnIHZpYQo+ICAgS1ZNX1NFVF9HVUVTVF9ERUJV
Rywgb3IgQ1NScyBpbmNsdWRpbmcgQUlBIHZpYSBLVk1fU0VUX09ORV9SRUcpLAo+ICAgdGhlIGZs
YWcgaXMgc2V0IHRvIHNraXAgdGhlIGZhc3QgcGF0aC4KPgo+IFdpdGggdGhlICdjc3JfZGlydHkn
IHNhZmVndWFyZCBwcm92ZW4gZWZmZWN0aXZlLCBpdCBpcyBzYWZlIHRvCj4gaW5jbHVkZSBrdm1f
cmlzY3ZfdmNwdV9haWFfbG9hZCgpIGluc2lkZSB0aGUgc2tpcCBsb2dpYyBub3cuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+Cj4gLS0tCj4gIHY2IC0+IHY3
Ogo+ICAtIE1vdmVkIGt2bV9yaXNjdl92Y3B1X2FpYV9sb2FkKCkgaW50byB0aGUgZmFzdC1wYXRo
IHNraXAgbG9naWMsIGFzCj4gICAgc3VnZ2VzdGVkIGJ5IFJhZGltIEtyxI1tw6HFmS4KPiAgLSBW
ZXJpZmllZCB0aGUgZml4IGZvciB0aGUgSU1TSUMgaW5zdGFiaWxpdHkgaXNzdWUgcmVwb3J0ZWQg
aW4gdjMuCj4gICAgVGVzdGluZyB3YXMgY29uZHVjdGVkIG9uIFFFTVUgMTAuMC4yIHdpdGggZXhw
bGljaXRseSBlbmFibGVkIEFJQQo+ICAgIChgLW1hY2hpbmUgdmlydCxhaWE9YXBsaWMtaW1zaWNg
KS4gVGhlIGd1ZXN0IGJvb3RzIHN1Y2Nlc3NmdWxseSAKPiAgICB1c2luZyB2aXJ0aW8tbW1pbyBk
ZXZpY2VzIGxpa2UgdmlydGlvLWJsayBhbmQgdmlydGlvLW5ldC4KClJldmlld2VkLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgoKVGhhbmtzLgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
