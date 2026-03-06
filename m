Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E53CFCC04D
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsVDZiNIk0HXTDQ/02NvWkXFNgFkvpr0gQectUjGDpo=; b=SdEWxen26d8kvg
	q5MNzB+5qNg6IlP/5T0RKfjeKAF47XJFEM53AdML2t/r2bYhcGSjobdDGyty5pdV7zPfCyD3OcdId
	UWiVsiP5WCmFwNht+kNX8wS7BZGzhp0MBzj5pn6v+OP6T9ljQWAzXVklc70aqXDqeANrnYBTdwT0+
	oP5mLwz//Q6nXATU7VAc1QOJroi2iriIoVExf+LfyR1iNO9HwKyoDWCDK/ezC1pQa00ThDmSdxwmD
	WVtrMOn5dID8ywIU7EhMoQKhIIjieDCMG98EgX0DNdiuSbEn1Mhaj5PIEJJcDvRK5fSQDX2/5WSgK
	fXYLJokvrIzwMlvfSndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZzM-00000004Ktq-17qK;
	Fri, 06 Mar 2026 18:33:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZzK-00000004Kt8-0wZj
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:33:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1kWP667857
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOjsX7805KqWYH+aXeu7LUr4oQMPWCmHGnUP60pa98s=; b=F20kXJuO3ZBHogGD
	35JKLrIdtr2rzzN3v4c//D0jWTpfAWIgDHtrn6wTwSuPxHAjbZn3fnEMFJQ2X3og
	ZBltGkGfjEd8ulprAPtN/xCx0ev9+3CBPPK7wSpRxJranrM+aajICHk+45P40ifI
	kqymH3P2ZGwO5gS7N3cwzGrijojTRCQwsAnvYbbNSiYvl49Or0V797RPLbJbU7X7
	2UODohYAf3ho33kwYdYms/pcbrLh4BFlTydzLqUeVkqxSDHT1ZnzXgeg1H5horo9
	yJLqrey8DnkEsGcXFynCp+Vg7oKNAvS5e108FltmyHvHBvqkiKF57NuDm7PBfYFz
	d5kO7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye0b5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:33:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be191ce356so5919034eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822005; x=1773426805; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOjsX7805KqWYH+aXeu7LUr4oQMPWCmHGnUP60pa98s=;
        b=Ic2X8T1rDQSd3Np34R8fRGEtsBHGlGshu9p9Wx/FsG9YdK1KmGmPFFuA2ehDkiU9HM
         NBPp0IWvXE1TvVx37HWPkSIgTqiddwFOsSskxqeonqq2ctEJffflsLqfX+s3lem9p3fC
         jesstghTcGnxPMDoKdfzCmQdHkTyVuv4EE+AMdmxArkgnFyz/S9viQE4nXefNuWlTxn4
         3iYSt511LTNrX9xsivWCg/tdI6v5kbGV7CB5mylhiUEpca45mwKajrpRXEYrHLDe/eP5
         SVdyL4L6RBjsG5Cpp/BMYUMHoREE2BG6RM7ja0hVgwa8CGHWbFKZ51fnSx90dfsEipWZ
         DIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822005; x=1773426805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOjsX7805KqWYH+aXeu7LUr4oQMPWCmHGnUP60pa98s=;
        b=ENnjVb7U16sVUXfAucPm9SBFZtFzE/DM1jcspgfxQvEzrKMvlPZh35er3qZYshfFd1
         akiRJb+NY2yb3DVEcZbZ483KgOMB9CdRI4bgkKAsglSPdAj0IaOU2FmF9/nlT0nILaN1
         5M1aqTtz14GZvxgNnwQu60S1sN3CQi4gmIYX+S4lUa4PfiMjCGbv1zTQ9zosSyje0Bbf
         7vmMkQjjWLiuKZSbztn+tXbjh+sTCctRzT1QmG8KWm6isYp4f2w+BvlUXwkZuMhfZIoT
         W9Yc/WgMzuomCPjCg97zWhFDMYpy+123jKw7bz8s7SHglBtT/4pLEf3+hCYa9sL+ep8g
         VVsA==
X-Forwarded-Encrypted: i=1; AJvYcCXdoNHhjDpzEwyp+MgI2W7N1QaBuHv1JAi4z/uDRBNqKM2PFUxMMiPhx4w5D/v0/b1VFpXmvDTJzgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzASFPgqLe8DhWo4R7t0IW8+VdqAVR65wi7LNLnlcH4xPtUzIsu
	9QUlKwfUKUqO3wCwoibPiE5rsVQFP0oR+YbPhT2pxQzTtbeGicudNGhs9CINsHUivscybLWwlPb
	76X41RQJNsRCelPISFLJl7RHabSscfj1JuqDLGCoYAmQvkRd4TzOx7ODPGoZD0q4R/zdQ
X-Gm-Gg: ATEYQzxgjVr559Clgy0b1/QcgUwes7awfWn4BxTBi8oHApFkX5Ido3LXJia+KK2pa1d
	TY7+kkyukl+n3usJGnSny1GgoPb1iqGyTQcE4bA4TPcMNBNSsGq0JYGb4FKzk6P6LtYjCMEeWPp
	36yzXkKgJx7X1A28Q3C4o45hVLlqFsqbKTFJTiFz1i6VyOYcwnpqp0Ni+n/Ntvtk7uZgH5o0EGJ
	BRlSULSIDEj8ioEx70vP+EgOv8dXe9BeXwcGLpc9e9QoZkKAasmdtFY+uIO5ZCHON4m2I7UljyG
	XkkmakrGGHfXhDRRUOVBrobYkMBA1ocaL2JEp1o4hN3nqjJ3vqevqXyw04skcdAMW0JR1fOi643
	FvQsncjzMpsOBpX4bJlwsDnMANyshNaw=
X-Received: by 2002:a05:7300:bc0c:b0:2be:2645:af00 with SMTP id 5a478bee46e88-2be4e06402emr1281037eec.32.1772822004766;
        Fri, 06 Mar 2026 10:33:24 -0800 (PST)
X-Received: by 2002:a05:7300:bc0c:b0:2be:2645:af00 with SMTP id 5a478bee46e88-2be4e06402emr1281019eec.32.1772822004088;
        Fri, 06 Mar 2026 10:33:24 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm1680739eec.19.2026.03.06.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:23 -0800 (PST)
Date: Fri, 6 Mar 2026 12:33:22 -0600
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
Subject: Re: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <7fyxblojteftwub6qt3yw3fpeblx47jnsczh7gjoigtr4s2e52@twdir734dcnz>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
 <CAH1PCMZ_TWRgc97WgJf=NhOzm4MXNb3NLpp6+vKOVypPeRk9yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMZ_TWRgc97WgJf=NhOzm4MXNb3NLpp6+vKOVypPeRk9yg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NSBTYWx0ZWRfX/v2y9tT8xmzq
 rl9jAg4jnYojEGGOsWvnzK6u+6lDlAccN55PoAhpFHhsQTL7z8DHEl6P8tz1OJbhtbceXTbBcZo
 +zYnsfEfp6XDvin9YTjRT9K2y5aez0h2RykvN9Xr4sFT9IXNuHTejP0jHZlUPzj9s5c+8cPHCvX
 XhutHzzoZsnBXeGV6wertW0XoG299hRYim7x+Sh7G/I2ujPAYke915ZqsEWFpysn6ZKWgJ1ztbz
 RtLutcmoUi6f3+ezQovSSwzV7Zl7gbS8yvo8HnYWq97CwmdLwrDqS8wMwY3iPYYIAZSduXMeTSG
 KloUAfKBzblmgxB4BTee8HstX/wIhI7zEu/8oaMVeVpVCoyY4jzG7Lt9hJVJBowJexpMaJmmrUx
 jRiSfzJHPuMEfIfFPKhJuzKihpY8zCCKynFZyTSBPyZekyfs39AUvekrxu1TcXx4VqjrXJ2fQuw
 oMKiLpYqDIy63tRkSLg==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab1df5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C7EMcMZzq5Lp0VM51ccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: JfVa1UhomEuHJaFAWnO9_SBwyQ6W4b04
X-Proofpoint-ORIG-GUID: JfVa1UhomEuHJaFAWnO9_SBwyQ6W4b04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103326_293585_08E839EB 
X-CRM114-Status: GOOD (  38.57  )
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

T24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDg6MDg6MzhQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBIaSwgRHJldwo+IAo+IE9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEFuZHJl
dyBKb25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
UHJvdmlkZSBhIGJpdCB0byBjb252ZW5pZW50bHkgZGV0ZXJtaW5lIHdoZW4gUlZBMjNVNjQgaXMg
c3VwcG9ydGVkLgo+ID4gV2hpbGUgaXQncyBhbHJlYWR5IHBvc3NpYmxlIHRvIGRldGVybWluZSBS
VkEyM1U2NCBzdXBwb3J0IHdpdGggZml2ZQo+ID4gaHdwcm9iZSBjYWxscyBhbmQgZm91ciBwcmN0
bCBjYWxscyBpdCB3b3VsZCBiZSBlcnJvci1wcm9uZSB0byByZXF1aXJlCj4gPiBhbnl0aGluZyAo
YW5kIHdlIHByZXN1bWUgZXZlbnR1YWxseSBhbG1vc3QgZXZlcnl0aGluZykgdGhhdCBuZWVkcyB0
bwo+ID4gY2hlY2sgZm9yIFJWQTIzVTY0IHN1cHBvcnQgdG8gYWxsIGltcGxlbWVudCB0aG9zZSBj
YWxscyBhbmQgc3BlY2lmaWMKPiA+IGNoZWNrcy4gQW5kLCB3aGlsZSBSVkEyM1U2NCBpcyB0aGUg
SU1BIGJhc2Ugd2l0aCBtYW5kYXRlZCBleHRlbnNpb25zLAo+ID4gbW9zdCBzb2Z0d2FyZSB3aWxs
IGNvbnNpZGVyIGl0IGEgbmV3IGJhc2UuIEZvciB0aGVzZSByZWFzb25zLCBhZGQKPiA+IHRoZSBS
VkEyM1U2NCBiaXQgYXMgYSBiYXNlIGJlaGF2aW9yIGJpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4g
PiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICAgIHwgIDggKysr
Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwgIDMg
Ky0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgICAgfCA3
MiArKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL3do
aWNoLWNwdXMuYyAgICAgIHwgIDIgKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdAo+ID4gaW5kZXggOTcyMjZiN2M1OTM2Li42ZDkxNWU3YmE1OGEgMTAwNjQ0Cj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAgLTY3LDYgKzY3LDE0IEBAIFRoZSBm
b2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+ICAgICAgICBwcm9ncmFtcyAoaXQgbWF5IHN0
aWxsIGJlIGV4ZWN1dGVkIGluIHVzZXJzcGFjZSB2aWEgYQo+ID4gICAgICAgIGtlcm5lbC1jb250
cm9sbGVkIG1lY2hhbmlzbSBzdWNoIGFzIHRoZSB2RFNPKS4KPiA+Cj4gPiArICAqIDpjOm1hY3Jv
OmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfUlZBMjNVNjRgOiBTdXBwb3J0IGZvciBhbGwg
bWFuZGF0b3J5Cj4gPiArICAgIGV4dGVuc2lvbnMgb2YgUlZBMjNVNjQsIGFzIGRlZmluZWQgaW4g
dGhlIFJJU0MtViBQcm9maWxlcyBzcGVjaWZpY2F0aW9uCj4gPiArICAgIHN0YXJ0aW5nIGZyb20g
Y29tbWl0IGIxZDgwNjYwICgiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+ID4gKwo+ID4g
KyAgICBUaGUgUlZBMjNVNjQgYmFzZSBpcyBiYXNlZCB1cG9uIHRoZSBJTUEgYmFzZSBhbmQgdGhl
cmVmb3JlIElNQSBleHRlbnNpb24KPiA+ICsgICAga2V5cyAoZS5nLiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9LRVlfSU1BX0VYVF8wYDopIG1heSBiZSB1c2VkIHRvIHByb2JlCj4gPiArICAgIG9w
dGlvbmFsIGV4dGVuc2lvbnMuCj4gPiArCj4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9L
RVlfSU1BX0VYVF8wYDogQSBiaXRtYXNrIGNvbnRhaW5pbmcgdGhlIGV4dGVuc2lvbnMKPiA+ICAg
IHRoYXQgYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUgOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfQkFT
RV9CRUhBVklPUl9JTUFgOgo+ID4gICAgYmFzZSBzeXN0ZW0gYmVoYXZpb3IuCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+IGluZGV4IGZlZDllYTZmZDJiNS4uNzJkMmE0
ZDBiNzMzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4g
QEAgLTIxLDcgKzIxLDggQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ID4gICNkZWZpbmUgUklT
Q1ZfSFdQUk9CRV9LRVlfTUFSQ0hJRCAgICAgIDEKPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVf
S0VZX01JTVBJRCAgICAgICAyCj4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JF
SEFWSU9SICAgICAgICAzCj4gPiAtI2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BST0JF
X0JBU0VfQkVIQVZJT1JfSU1BICgxIDw8IDApCj4gPiArI2RlZmluZSAgICAgICAgICAgICAgICBS
SVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfSU1BICAgICAgICAgKDEgPDwgMCkKPiA+ICsjZGVm
aW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9SVkEyM1U2NCAg
ICAoMSA8PCAxKQo+ID4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wICAgIDQK
PiA+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfSU1BX0ZEICAgICAgICAg
ICAgKDEgPDwgMCkKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfSU1B
X0MgICAgICAgICAgICAgKDEgPDwgMSkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4gaW5k
ZXggMzFkMjIyMzAxYmYwLi40Yjk5ODFiMTVlYmUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jCj4gPiBAQCAtMjMsNiArMjMsNyBAQAo+ID4gICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4
dGVuc2lvbnMvdGhlYWRfaHdwcm9iZS5oPgo+ID4gICNpbmNsdWRlIDx2ZHNvL3ZzeXNjYWxsLmg+
Cj4gPgo+ID4gK2V4dGVybiBib29sIHJpc2N2X2hhdmVfdXNlcl9wbWxlbl83Owo+ID4KPiA+ICAj
ZGVmaW5lIEVYVF9LRVkoaXNhX2FyZywgZXh0LCBwdiwgbWlzc2luZykgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+IEBAIC0yMjIsNiArMjIzLDc1IEBAIHN0YXRpYyBib29sIGh3cHJvYmVfZXh0MF9oYXMo
Y29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMsIHU2NCBleHQpCj4gPiAgICAgICAgIHJldHVybiAo
cGFpci52YWx1ZSAmIGV4dCk7Cj4gPiAgfQo+ID4KPiA+ICsjZGVmaW5lIEhXUFJPQkVfRVhUMF9S
VkEyM1U2NCAoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgLyogSU1BIGlzIGFsd2F5cyBzdXBwb3J0ZWQgKi8gICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfSU1BX0ZEICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0lNQV9DICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgLyogQiBpcyBaYmEs
IFpiYiBhbmQgWmJzICovICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAg
IFJJU0NWX0hXUFJPQkVfRVhUX1pCQSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAg
XAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQkIgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWkJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiArICAgICAgIC8qIFpJQ1NSIGlzIGFsd2F5
cyBzdXBwb3J0ZWQgKi8gICAgICAgICAgICAgICAgICAgICAgICAgXAo+IAo+IEFib3V0IFppY3Ny
IGFsd2F5cz8KPiBJdCBpcyBub3Qgcmlnb3JvdXMgY29tcGFyZWQgdG8gdGhlIG90aGVyIGV4dGVu
c2lvbnMgdGhhdCBhcmUgY2hlY2tlZAo+IGV4cGxpY2l0bHkuCj4gCj4gV2l0aCB0aGUgZGVwcmVj
YXRlZCAncmlzY3YsaXNhJyBEVCBzdHJpbmcgKEFDUEkgZG9lc24ndCBkbyB0aGlzKSwKPiAiaSIg
aW1wbGllcyB6aWNzciAoYWxvbmcgd2l0aCB6aWNudHIsIHppZmVuY2VpLCB6aWhwbSkuIEJ1dCB3
aXRoCj4gJ3Jpc2N2LGlzYS1leHRlbnNpb25zJywgemljc3IgbXVzdCBiZSBsaXN0ZWQgZXhwbGlj
aXRseSwgaXQgaXMgbm90Cj4gYXV0b21hdGljYWxseSBkZXJpdmVkIGZyb20gImkiLiAoc2VlIGNw
dXRmZWF0dXJlLmMpCj4gCj4gQlRXLCB0aGlzIGFsc28gc2VydmVzIGFzIGFuIGV4YW1wbGUgd2hl
cmU6Cj4gIC0gUklTQ1ZfSVNBX0VYVF9aSUNTUiBleGlzdHMsICh5b3VyIHBhdGNoIDEwIGNoZWNr
ZWQgaXQpCj4gIC0gYnV0IG5vIGNvcnJlc3BvbmRpbmcgaHdwcm9iZSBleHBvcnQgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWklDU1IuCj4gCj4gU28sIGFzIEkgc3VnZ2VzdGVkLCBpdCdzIGJldHRlciB3ZSBk
ZXRlY3QgcnZhMjN1NjQgYXMgYSBjb21iaW5hdGlvbiBvZgo+IFJJU0NWX0lTQV9FWFRfLi4uOyBp
bnN0ZWFkIG9mIHVzaW5nIFJJU0NWX0hXUFJPQkVfRVhUXy4uLgoKSW5kZWVkLCB6aWNzciBtYWtl
cyBhIGdvb2QgY2FzZSBmb3IgdGhhdC4KCj4gCj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhU
X1pJQ05UUiAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBSSVND
Vl9IV1BST0JFX0VYVF9aSUhQTSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+
ICsgICAgICAgLyogWklDQ0lGIGlzIGluIEVYVDEgKi8gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiArICAgICAgIC8qIFpJQ0NSU0UgaXMgaW4gRVhUMSAqLyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAvKiBaSUNDQU1PQSBpcyBpbiBFWFQx
ICovICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWklDQ0xTTSAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiArICAg
ICAgIC8qIFpBNjRSUyBpcyBpbiBFWFQxICovICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRSAgICAgICAgICAg
ICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgLyogWklDNjRCIChjaGVjayBibG9jayBzaXpl
cyBhcmUgNjRiKSAqLyAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVf
RVhUX1pJQ0JPTSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBS
SVNDVl9IV1BST0JFX0VYVF9aSUNCT1AgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwK
PiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICAgICBcCj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pGSE1JTiAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9a
S1QgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgUklTQ1Zf
SFdQUk9CRV9JTUFfViAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiAr
ICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4gICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aVkJCICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWlZLVCAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiArICAgICAgIFJJU0NWX0hXUFJP
QkVfRVhUX1pJSElOVE5UTCAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAg
ICBSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAg
IFwKPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklNT1AgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICBcCj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pDTU9QICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VY
VF9aQ0IgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgUklT
Q1ZfSFdQUk9CRV9FWFRfWkZBICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4g
PiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pBV1JTICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9TVVBNIC8qIChjaGVjayBQ
TUxFTj03IHN1cHBvcnQpICovICAgIFwKPiA+ICspCj4gPiArCj4gPiArI2RlZmluZSBIV1BST0JF
X0VYVDFfUlZBMjNVNjQgKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0NJRiAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgXAo+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNDUlNFICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRf
WklDQ0FNT0EgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiArICAgICAgIFJJU0NW
X0hXUFJPQkVfRVhUX1pBNjRSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
KykKPiA+ICsKPiA+ICtzdGF0aWMgYm9vbCBod3Byb2JlX2hhc19ydmEyM3U2NChjb25zdCBzdHJ1
Y3QgY3B1bWFzayAqY3B1cykKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCByaXNjdl9od3Byb2Jl
IHBhaXI7Cj4gPiArCj4gPiArICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsKPiA+ICsgICAgICAgLyogQWRk
aXRpb25hbCBtYW5kYXRlcyBmb3IgWmljNjRiIGFuZCBTdXBtICovCj4gPiArICAgICAgIGlmIChy
aXNjdl9jYm9tX2Jsb2NrX3NpemUgIT0gNjQgfHwKPiA+ICsgICAgICAgICAgIHJpc2N2X2Nib3Bf
YmxvY2tfc2l6ZSAhPSA2NCB8fAo+ID4gKyAgICAgICAgICAgcmlzY3ZfY2Jvel9ibG9ja19zaXpl
ICE9IDY0IHx8Cj4gPiArICAgICAgICAgICAhcmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzcpCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gKyAgICAgICBod3Byb2JlX2lz
YV9leHQwKCZwYWlyLCBjcHVzKTsKPiA+ICsgICAgICAgaWYgKChwYWlyLnZhbHVlICYgSFdQUk9C
RV9FWFQwX1JWQTIzVTY0KSAhPSBIV1BST0JFX0VYVDBfUlZBMjNVNjQpCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gKyAgICAgICBod3Byb2JlX2lzYV9leHQxKCZw
YWlyLCBjcHVzKTsKPiA+ICsgICAgICAgaWYgKChwYWlyLnZhbHVlICYgSFdQUk9CRV9FWFQxX1JW
QTIzVTY0KSAhPSBIV1BST0JFX0VYVDFfUlZBMjNVNjQpCj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICt9Cj4gCj4gRm9y
IHJlY29yZCBwdXJwb3NlLCBJIGRvdWJsZSBjaGVja2VkIHRoZSBhYm92ZSBsaXN0IGFuZCBmdW5j
dGlvbjoKPiBhbGwgMzMgbWFuZGF0b3J5IGV4dGVuc2lvbnMgcmVxdWlyZWQgYnkgUlZBMjNVNjQg
YXJlIGNoZWNrZWQgaW4gdGhpcwo+IHBhdGNoLCBub25lIG1pc3NpbmcuCgpUaGFua3MhCmRyZXcK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
