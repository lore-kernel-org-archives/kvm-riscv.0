Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7303105F7A6
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4HXInO9URVdSlR7oxaDcnoZKhhVszMoWHcqKtDF4cM=; b=qy0Q5XXKlwk1LC
	H6zUMb5Ke1WqjqjXOQmlG8thrx/NLDbU2a0G9EdgYV+qMcGU04qGeHPQ+2Ix2Z5k4gquGQKDr5oxn
	Em8enBkXp6k0RQl1pGi0k6eRMd6ijzmNOCsxdRVwEL4npjE8v5uRyxQVB6uHwlLjxKHcq6x3cjTMQ
	Qup7zoTti6d/wur6sRIUKhQaIwysvV6Nmk4DkS0VGn6wz2Eqi9zjGYg6Fnsp/q3CI6OBpGkSMnjUl
	S8wY60UzVfQVieesdrcK/IN1oo3o7j7iO/y47Xy7g7v0CeaJgRlpZ2NiiDuQdlvRLwbpfsOzSGAne
	zc2HcCrliJfm9Y/6rczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12qP-00000000Jai-1TB5;
	Fri, 13 Mar 2026 13:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12qM-00000000JZw-31ie
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:46:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9BJeW3906612
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=; b=LNOLWocu4MuP/OQS
	jEmTj2CrWERHrbNAoxG40KFmyvHUAOcfLnNxCom1H0yTtsdf80KJ2VaDllPUepaD
	+U+3YPNcwCVdFS9MueQzv+9d5Tl7RQAiqsSBaYjU7ZASqqdayNPCD++hK2RUlIzc
	zSa9VGUDZXHI8qh/SSKhGCoIoTfG5O6bn6+TIh1dpuzeQpPGLb42CJ9u7ki/tALm
	1FjXiL7fCCZGJr8E643gE/nahHPrSufOieECPTfSuKHI35rOAEDbpxUvuWKtKdyg
	UwnSJHMR6t5cfv5SbKZGVRRxyJJZxSDY/y3ySl2f/Q3bAjXZqdQlXjFEysvC0YdA
	+817tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8vcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:46:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1182211785a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409581; x=1774014381; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=Ukr5nNhF9MFi0iz/fzNZ1jI0ctedO8cTQ0F8prgk5+4Q2t3zKAsqQTZP1Xv55gIpsm
         PsiN9Kb+tcGiQ9bN53+mpq9hRWNGK4NrZgNHEKOBQNNCmd5WTJWt3RMArc0oDDFaM1/B
         HXl0DgWBTB0XklWYn2frREkW5ZPhjKy1L9J+LUk/VSKsF8tjoI4qttX2nzt+c1lMGXHl
         YkzWhlYrYV2srOBOlOBnG38D+WeolHckNmi9sDPdHBykMz/tY9HPlpI1h1MwSd+Nhkyc
         FpmCgTL0llVY2NE6WPyw+Owk1/pCCeXSnXSOUhg8e6VCX2kaZ3JaEbNtXuSaxbVwyPiH
         Ozzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409581; x=1774014381;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=LUNnhtQSUS1Q6kQWK5YqhTJQ+hQ22klm4UhiUUR4siGA0rKmDzQBT7ypsLLNv1A8H2
         LFwKn1mfZLmLYR+IP8Ahrz48kACRSoCeDENLaGA4uHPsGqU9aN3dSY91PHs1pSFE754/
         AKWzryj9Rk/QpCG0E3Qp7fGtP1K28bbEA4salnMuggLdxB+5BhpmcMnZWhkdjzNFCGXo
         AQNwOkK2eBQ/dK4Q0dNBf803Mjc5eWPyAtJkfW9LVPuORK2ZiBkrmRAy0RAF+K5X9rxB
         Vhb5j/vexxi4aW22J4+Kqmm0HEpvMMZ7TtC+LE+46iVOJsbQ+hqlCRuEINiowi+KIarL
         WVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdt3zgAdE/QrlqOW6Q+fmecjkk52sMLJg8uuubaxq51Kgq8e0wH+g1MQeK/6XkFavdT5cPTlxMK6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyElvMgUOwDTFQ7SU28dKHreJVw63KiLErXSL+ELbUb9kTzp2v
	PyfLcNNJbRhAMO/frlvTaEQKBzKs7H2Yb0YpzCgVPi3Z457jyWLofz+gHCDySPyxgdOq8aKcBax
	hxGkcC/hllKjhCDN2LMobuBdtOUmQ5JrGoQc9BnCh4J13IapSz1Y2wO65iDanEKOl8Qsz
X-Gm-Gg: ATEYQzxA5PsuQuTZfJiyvL8ndUiuZOKUx070K6MRW/9Onsr3ALQoAp39HdnCGyqrPpn
	4qVOnp2rjfHRkMj10Ej37he6oEfrrzzyatEuoAP8w/wsSgwbAgqNYTj9SMsOFgxNQeWdPLnJbj1
	yCtQwfJmxxTZV6/fYcbLy0ItN6SehR/+ZrCTFDs1tiVh5Upzbi8omKIzB4EPpdqLwXu780AeWFu
	rXGMZ3nOGJyidionhCvRqJGDal8vJwuy/zeRAYswwtSGWN5pCkWpL/gJeBbHZKPuzp5BcVSCFa1
	Usa2/wRUVgecRxB1QATAHzczlxzmIukvvNq7XtP7Nsh/G0EtjLzAX4IhwA+dLsDyUsYq9ESJ+Fn
	UcGhdIpdCYw6atS3Oz3C7uyOEerZams/NS1u3uREhiIp7fqhe9s2DOA9oJhOj
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446721185a.54.1773409581021;
        Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446717985a.54.1773409580598;
        Fri, 13 Mar 2026 06:46:20 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm551207205e9.10.2026.03.13.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:46:19 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:46:18 +0100
Message-Id: <DH1P89I0A7GY.3K7UNNNSS7LT@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 08/27] RISC-V: KVM: Factor-out VCPU config into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2xxot2kW1qCsOBQL7uj4NEyYCSAA2k6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX5NRsiPymU8Pd
 yENK6b9aHytXO1EDfrjjQMvBzX0mfjyMJgnorHV9awX1Oj3tzEJhUKVTHL8gFo2TXRmf/JCA/Qx
 YPuUEzWK0u2iz6hU9I6if3lo3EiabwiFLhSzaa5kbscPPVGrWibv0ztewFA0v6znTZ5QhH7+q9D
 v/KZdNHT0k9naOnvTqeayceu5XY7w7FjMUB3BTsiij8ND0N+RV5PrS3Tf5z8aZztx2+muj0nW3U
 4+9UVh9+q47acIWEl77ctVjfEUrLXX7WoCBpvmf9/J+BxOOiYadqs21uOrqbAKWmcqWSxQjkuEl
 u4U0QchtGFIwfRX1BKJxOzpAJufxUa4cBKQO32Tr8ELE/LNI8n8WuXT2c7NdwybILFoE4Ke8lHb
 TNC6Uf6jhQBI5gcL0qhsL9GmYJv9clCSnqDI3jppNTab9DGyt/wfxou6/1rqlcen/gRo8mF63R3
 hraM5cDd89VFqcy+1uw==
X-Proofpoint-GUID: 2xxot2kW1qCsOBQL7uj4NEyYCSAA2k6v
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b4152d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064622_880364_DA558FC6 
X-CRM114-Status: GOOD (  10.31  )
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

MjAyNi0wMS0yMFQxMzoyOTo1NCswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgVkNQVSBjb25maWcgZGVhbHMgd2l0aCBoaWRlbGVnLCBoZWRlbGVn
LCBoZW52Y2ZnLCBhbmQgaHN0YXRlZW5YCj4gQ1NSIGNvbmZpZ3VyYXRpb24gZm9yIGVhY2ggVkNQ
VS4gRmFjdG9yLW91dCBWQ1BVIGNvbmZpZyBpbnRvIHNlcGFyYXRlCj4gc291cmNlcyBzbyB0aGF0
IFZDUFUgY29uZmlnIGNhbiBkbyB0aGluZ3MgZGlmZmVyZW50bHkgZm9yIGd1ZXN0IEhTLW1vZGUK
PiBhbmQgZ3Vlc3QgVlMvVlUtbW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFu
dXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTg3MSw3ICs4MjAsNyBA
QCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAJ
c3RydWN0IGt2bV9ydW4gKnJ1biA9IHZjcHUtPnJ1bjsKPiAgCj4gIAlpZiAoIXZjcHUtPmFyY2gu
cmFuX2F0bGVhc3Rfb25jZSkKPiAtCQlrdm1fcmlzY3ZfdmNwdV9zZXR1cF9jb25maWcodmNwdSk7
Cj4gKwkJa3ZtX3Jpc2N2X3ZjcHVfY29uZmlnX3Jhbl9vbmNlKHZjcHUpOwo+ICAKPiAgCS8qIE1h
cmsgdGhpcyBWQ1BVIHJhbiBhdCBsZWFzdCBvbmNlICovCj4gIAl2Y3B1LT5hcmNoLnJhbl9hdGxl
YXN0X29uY2UgPSB0cnVlOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2NvbmZp
Zy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYwo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1
X2NvbmZpZ19yYW5fb25jZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCgpyYW5fb25jZSBpcyBhIGJp
dCBhd2t3YXJkIG5hbWUgc2luY2UgaXQgaGFzbid0IHJhbiBvbmNlLi4uCk1heWJlIF9vbmNlIG9y
IF9maXJzdF9ydW4/ICBOb3QgdGhhdCBpdCBtYXR0ZXJzLAoKUmV2aWV3ZWQtYnk6IFJhZGltIEty
xI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
