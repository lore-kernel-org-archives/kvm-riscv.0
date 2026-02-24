Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F8F55425
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33Osl8x3klwI6s0AtAJ+n59KZNx3fxLPmwcFLVTaRaA=; b=o4web0DXLFfypf
	Hd6+yIgt1S3fflE9017eUJ++CX7+12zq9a2zX0BlxZNe26icfmsfzs20JBbYSmBDWW3FQOuXkr0hH
	aTjC4zeOtLa2ykfR1lZNdCrUfVJLp10MVc3nuvk7Qjkq9TIStjMmGSAfC978hch4wMDPXzk4wnO62
	0c1yHED/y6PpRdZxbqgPz3R6jcb8LofkeeJl23lW45uymzHfKYYwXSWZxY8Ux1f1asBtUSKeslhgh
	rs17o/rT14S1dL0GJXbOr6ZIl33TuGqGcgw4LDeiKZLSOG1dBYQq3SuJs6jo8LGhlfBSQzkeIWJT/
	wMMaKv01QElHLI2/JfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Sj-00000002uD7-1n67;
	Tue, 24 Feb 2026 23:05:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Sg-00000002uCO-2h1S
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 23:05:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHnrLi057298
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=; b=WGrIRmAPJnxWctHU
	NMzIyty/ExrDpLaWDqBLricPM0MQR8UtQ/S0GgyGKLbZoTyZ07OK1kiy3Ve88Hjq
	RDJonpzl3tL9oh3OeIVe3KTkD/pceWV6ICc5We/nrhaIvO0ibkvZWAie1lAp9UQS
	VVvWaGbD88aPAIGPZBUuZY+AqqmLq3fdBgZUWkyIwiZyVlvjpibRlUxdSM1X+WQ+
	eeodAKOalWvGX+yFXaGtATXNKjHC4NHPb3k+hgMtBaGC5lCGClTiMN4YB3DiWJG5
	1+By5hA0uJ3oz9u3GDX+oe5MUXULiIfSkGne04X7uxQOZEWKt4WopyB2qcljAoI0
	MLrd3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9saagd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:05:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124a95b6f61so21457318c88.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 15:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771974301; x=1772579101; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=;
        b=OLjhiBQmQmJACCUMdE18YeC5S+DCjCLDWzMSfWrdaf88zlhzo5ZIenYj7a/33P5OKM
         RNl2UgQl6e1JowK/cB1r0g14A5AfZBbTXduCvYWUI19vMtRRkzA4G4rHHQazcYkAfg8w
         o4d4dZJdmLI397PTc6fnq0YhAvBog+LC6MpmBDIwZeDERErLyHAn0FdymqKVkR1okopr
         fBkbqHw0H/JW36agRHIR88+s1tAG7geiLzaKzGilNc/U64PuyQSP35js4I4RxnyiRPGt
         mCH1kjKgAaGBDwPExcs0ZjowVllskTDvX/UtIl1feiyTKmQeElDCG/H1Aw1oOCDY1Ijp
         rRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974301; x=1772579101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=;
        b=aZgeOdCrWqOZ2+SCmwj5EkUrZMTIWR6ccAOKtE8TBNxvUX4V6MpwKCGDtzZwJDCZ9c
         RDil/qk0Bv2fW8OVO1sqbBRLTSj9u0d53DNkSitFAG3L93RoSMgKcKXa8nUSDRoJLaFE
         7aoErVbN//csS5DJpa3KpLoL+4K/QnfGvxy7MPrt5KI3Yf26bLHg8pGg6BIJohO9MJiq
         fm73z/9ofDKqajKlXRU4BVvH7wYoLJN+SfTVCYS0YhPmGPk5rb12BkYiRuBdC86tFLcu
         uXdkuN7y2vBp9AMYDLY20SKF4V5+GbtGIU/bmhfONMDqQ0RTdv1RPoxICVuGCxQw9Zms
         wPJw==
X-Forwarded-Encrypted: i=1; AJvYcCVnuW6/s52tNg2t3kMNz6UObv+V9o5QUTuv1hwk6FCjDBGborgaviFnOWyN/mknXLiHPGR0WS4cvD0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHq10OdTYNMLW+dEX90K4uQ4ayQOYRQaUETDvNOri6rSZeM/Lp
	m68+8EtUFSXcakLjjITC2oQs8zbITC0EoILTUGQpHdYv1ucfIUzKFZxLxv7O367zBK43keCTdu7
	sAuZtqGD/0x5+k7e9ebyMN1Ln5bu/RpDqRpiHEsGtZ8b+5caS3ga8wbyAmQJvJI8n33m/
X-Gm-Gg: ATEYQzzYXgBnNIAb9x8hFbKmRKDfiA8cThb/ARJ0kWTLndHvv4yYQEReoYtdWL3yVsF
	wFJEDtgalXFqwCJ2uaEcod6wv7kmXo1jZjPJ8/L3cM4+v+Y3T3dL39H1LyBDeixaLA7z8N3r7WG
	TwXYidke3DsWp1w7wICfBKxmnEvV5V9koakRCq5uSsIEQagKpjUBoycgLHG1qG0d9/n8MPgUiiN
	ggfDd2QxfeaOEQw08ZL33Y9n907B7nfoO6rPEhuI2fG8LSm8S41hpc01IHxU6sM35xaOGxR5wpP
	x4JD69Fo7B42geiOpaJi+S2gidEPdHcE6nsepCB6POWd7AS8py2ROSObB5o9vIcJtZFxNzXByZG
	bdeYnYxTDR5YISfmPvH6Lo3unhKupQ7Q=
X-Received: by 2002:a05:7022:2482:b0:119:e56b:c75b with SMTP id a92af1059eb24-1276ad356acmr6183545c88.32.1771974301077;
        Tue, 24 Feb 2026 15:05:01 -0800 (PST)
X-Received: by 2002:a05:7022:2482:b0:119:e56b:c75b with SMTP id a92af1059eb24-1276ad356acmr6183525c88.32.1771974300533;
        Tue, 24 Feb 2026 15:05:00 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm11691070c88.10.2026.02.24.15.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:04:59 -0800 (PST)
Date: Tue, 24 Feb 2026 17:04:56 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwNCBTYWx0ZWRfX0u1MC/j8OTYT
 zk/XzyaM/ZxwzLHu249tcDgkjwuxmeeR7CL1o0byZ8bG4fpUbsS7OvEbR77u6FKois6psoPvQ/w
 YrOVOgprdEuZI/9L+aW2BL9rktAEXQDzXTgd0yVI3j/obb7aElv/9IE61GVxg6T/mClawNIOvXt
 aaGgis1iR/wJ2urVhLV2hkWUDxVCbdfXr3cPqqnzD49qE5PgI9GKC9sZXgUwhM1cEEBSvC2Pjht
 TFH+WqmhS/vL8fcrf9lJqOVbFXzLsi1PWUppyw+OCkMxZEIsF9yCSCvnWiKqWgPaeMh205QnSkd
 rLUnNOjLv62Z46Ov5mf/EMY9YLCh8P8GR6p7VGk2jNVmH67Mfvmfq9SplEEnQWsCZXy7sZpVo3t
 pqEvBtHKfm8P/W8NG1rF5BFN6+Oa9WJXddiGUWA96H8rde7Hvm3qR7SQQoM15MOVdFchi4TNubI
 g+5bl9pTp4IIzxlxiag==
X-Proofpoint-ORIG-GUID: aZpf8RM6Ud4BbwOosnLvqfxDY3-bBPrc
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699e2e9d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1k2Rzbposw6HX_UEYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: aZpf8RM6Ud4BbwOosnLvqfxDY3-bBPrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_150502_705469_54C38E64 
X-CRM114-Status: GOOD (  25.09  )
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

T24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMDY6NDk6MThQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBIaSwgRHJldwo+IAo+IE9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEFuZHJl
dyBKb25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
QWRkIEIgdG8gaHdjYXAgYW5kIGVuc3VyZSB3aGVuIEIgaXMgcHJlc2VudCB0aGF0IFpiYSwgWmJi
LCBhbmQgWmJzCj4gPiBhcmUgYWxsIHNldC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdjYXAuaCB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYyAgICAgIHwgOCArKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+IAo+IEkgc2F3IHlvdSBjaG9zZSBub3QgdG8gYWRkIEIgdG8gaHdwcm9iZSBpbiB0aGlz
IHNlcmllcywgcGVyCj4geW91ciByZXZpZXcgb2YgbXkgcGF0Y2ggWzFdLiBJIGhhdmUgYSBkaWZm
ZXJlbnQgb3Bpbmlvbi4KPiAKPiBBcyB5b3Ugc2FpZCwgRkQsIEMsIGFuZCBWIGFyZSBhbGwgZXhw
b3J0ZWQgdGhyb3VnaCBib3RoIGh3Y2FwCj4gYW5kIGh3cHJvYmUuIEFkZGluZyBCIHRvIGh3cHJv
YmUgdG9vIGtlZXBzIHRoaW5ncyBjb25zaXN0ZW50LAo+IHVzZXJzIGNhbiBxdWVyeSBhbGwgdGhl
IHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBmcm9tIG9uZQo+IGludGVyZmFjZSB3aXRob3V0IG5l
ZWRpbmcgdG8ga25vdyB0aGF0IEIgaXMgbWlzc2luZyBpbiBod3Byb2JlCj4gYW5kIHRoYXQgdGhl
eSdkIGhhdmUgdG8gY2hlY2sgWmJhL1piYi9aYnMgdG8gaW5mZXIgQiBzdXBwb3J0Lgo+IAo+IFJl
bHlpbmcgb24gdGhlIHJ2YTIzdTY0IGJhc2UgYml0IHRvIGltcGx5IEIgYWxzbyBkb2Vzbid0IGNv
dmVyCj4gY2hpcHMgdGhhdCBpbXBsZW1lbnQgQiB3aXRob3V0IGJlaW5nIHJ2YTIzdTY0IGNvbXBs
aWFudC4gRWcuIG15Cj4gcGF0Y2hzZXQgWzJdIGFkZHMgc3VwcG9ydCBmb3IgZXhpc3RpbmcgKG5v
bi1ydmEyM3U2NCkgU29Dcy4KPgoKSSB0aGluayB3ZSBuZWVkIHRvIGNvbWUgdXAgd2l0aCBzb21l
IHNvcnQgb2YgcG9saWN5IGFzIHRvIHdoYXQgZ29lcyB0bwpod3Byb2JlIGFuZCB3aGF0IGRvZXNu
J3QuIElNTywgaHdjYXAgaXMgZWFzeS4gSWYgUklTQy1WIGRlZmluZXMgYSBzaW5nbGUKbGV0dGVy
IGV4dGVuc2lvbiwgc3VjaCBhcyBWIG9yIEIsIHRoZW4gd2Ugc2hvdWxkIGFkZCBpdCB0byBod2Nh
cC4gSG93ZXZlciwKZm9yIGh3cHJvYmUsIHdlIGNhbiBnbyB0d28gd2F5czoKCiAxLiBBZGQgZXZl
cnkgZXh0ZW5zaW9uLCBpbmNsdWRpbmcgJ2J1bmRsZScgZXh0ZW5zaW9ucywgd2hpY2ggYXJlIG5v
dGhpbmcKIG1vcmUgdGhhbiBhbiBhbGlhcyBmb3IgYSBjb2xsZWN0aW9uIG9mIGV4dGVuc2lvbnMu
IFRoaXMgaW5jbHVkZXMgc2luZ2xlCiBsZXR0ZXIgYnVuZGxlIGV4dGVuc2lvbnMgbGlrZSBCLgoK
IDIuIEFkZCBvbmx5IHVuaXF1ZSBleHRlbnNpb25zLCBpLmUuIG5vIHB1cmVseSBidW5kbGUgZXh0
ZW5zaW9ucyBnZXQKIGFkZGVkLgoKSWYgd2UgZ28gd2l0aCAoMiksIHRoZW4gdXNlcnNwYWNlIHdp
bGwgbmVlZCB0byB1c2UgdGhlIGJhc2UgYmVoYXZpb3JzCihwcm9maWxlcykgaW4gb3JkZXIgdG8g
Z2V0IGFueSBzb3J0IG9mIGJ1bmRsaW5nLCBidXQgSSB0aGluayBtb3N0IHBlb3BsZQphZ3JlZSB0
aGF0IHVzZXJzcGFjZSB3aWxsIHRhcmdldCBwcm9maWxlcywgc28gKDIpIHNlZW1zIHN1ZmZpY2ll
bnQuIEknbQpub3Qgc3VyZSBhYm91dCBhcHBsaWNhdGlvbnMgdGhhdCB3b24ndCB0YXJnZXQgcHJv
ZmlsZXMgYnV0IHdpbGwgd2FudCB0bwpjaGVjayBmb3IgYnVuZGxlIGV4dGVuc2lvbnMgcmF0aGVy
IHRoYW4gaW5kaXZpZHVhbCBleHRlbnNpb25zLiBTaG91bGQgd2UKdGFrZSBvbiB0aGUgbWFpbnRl
bmFuY2UgYnVyZGVuIG9mIGFkZGluZyBlYWNoIGJ1bmRsZSBleHRlbnNpb24gdG8gaHdwcm9iZQpm
b3IgdGhvc2U/IEluIHBhcnRpY3VsYXIsIEknbSBub3Qgc3VyZSBhYm91dCBCLCBiZWNhdXNlIGl0
J3MgYWxyZWFkeQphdmFpbGFibGUgaW5kZXBlbmRlbnRseSBvZiBhIGJhc2UgYmVoYXZpb3IgKHBy
b2ZpbGUpIHRocm91Z2ggaHdjYXAuCgpUaGFua3MsCmRyZXcKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
