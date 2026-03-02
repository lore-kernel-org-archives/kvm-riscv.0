Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62495EB363D
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 22:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS47wjVwgxqNBXVZcavpZrCWn7OaFCHWRmHXoMLF2QM=; b=xsoiaUrsxfCTQV
	DODLLHztG7QoN441WoA+OcTd7EIUWsoircgg9oQoJ81VqzKP22luY/SiM1ro+WSIJ4b3WLahWw0kn
	+6cEzbsKe9+aYVfaofGptrdnyQGsr2phqIpoj2/VNN7AedsFkoGXyzfZznZ7IHP8QNGDzZ9jqxMQX
	LkyAVAMjsrTn1UgvdD79TUcjHvg1jzw9Eu29rHtHBGHZCzV4kNHvoKLgpeURKmawOYKsrQ0a9qDtj
	nVU6Cgj4zQU7uYkuChStPQGBdKpWO9MKfmv7BdxoxuUv7GLcU/cx+VHEQt1U2chypOfhDqfBMKdvH
	MwS5bfttordk48zT3dOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBbM-0000000E6NH-0ND3;
	Mon, 02 Mar 2026 22:18:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBbJ-0000000E6MD-0gpF
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 22:18:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IFwAB3561927
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Mar 2026 22:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jzi6xUspl1H57VMYdStLRVZGkZtz1A2ALKD/Cg0yxQ=; b=O2l9ikoSTWGNyUIC
	/RkMVl/Ty+P1I4fF5G0pQePsr6Cj0YMA/Hr8hfBW5Tu91owY7AYzembkG9zO7kQu
	ueiBYCTHS4EEjQ83hxmKG8fVLsE8pg+NGW1jzZL6Q5SyfyEyGe+m8J05AdTml5Ji
	vla6qPm1eZTWKJ7FcbqrRZLzkHVNZWI4i0UvTEdj6vkCfJ9pzLd5bqABqrxkVwBf
	cpXvqlwHdeS4GoptiRS1jFR34/NWGbp28JY20w2NJFSlLotkQdAXudR8Zf6KMFtV
	lRS58rwBelV1Mp8zq+zvolVB3vg6KEn7V949N+Hp0GrghZBLYIDinBSlER57fthl
	HKh6+w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bva5ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 22:18:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso2001989eec.0
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 14:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772489931; x=1773094731; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5jzi6xUspl1H57VMYdStLRVZGkZtz1A2ALKD/Cg0yxQ=;
        b=UDNmVfd2EcVfwyVJBTQ9zEzbgmfNreBNrbJXeFqYqKl5wMbau8M9lR1qsnlB7bniUt
         qE3dS/UwffMlgoZE5V2SWciIVdt46IwasP69SzmoRMr1VOY5LdNja+/XMWT8tGwZXR04
         qDSBwHn1qLylIVEy2dCyhD8sjz3962zwO4RZLExSx3UOtY3RcgqSD/IMV2bOGJypO9Bd
         pY8Ya6+rhysXCGEDgceaNBaKNLtu9ic4EGxz8gZ9389QAOAMENcEg1Jmi+KxqMJ0ZLPk
         /0iXukWxT2LV9LYoK/+JuM6Bn/oZHNi5uV2umRcSrX2fzh4Sg/fw6L0Og8x7ghCmEwnS
         NT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489931; x=1773094731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jzi6xUspl1H57VMYdStLRVZGkZtz1A2ALKD/Cg0yxQ=;
        b=jKMIAAj3dJlZ4B3y+tQZGkuKVCg06ykFItsv//CQirU7uzvqkcKi6m7XrfB25fB1I3
         6urmWbCr7CddmLYOrHKedrS1NsxSW4RbvrHCwrzADCsh0KrVLu4FepgC5ybNP735OEdc
         0AlbfqStJrzpYtF9uXFmvbN/WSQxAoNHcpXJ4K6jE854/NryJrSvORt2xjxcVeId/UDN
         PcMeAVW1ETAabiexUWvv+xL3Y7IT98QPgYyvVgKRSgtkz8TNN7hst7FOKFzb1SRSdZ73
         82PyuqEZqtC3wSgiJz5q88fzUY7J2Pt9eotLU/W6w4MWcFbSa9kyJF87KtcgO6kt9AjA
         s/8g==
X-Forwarded-Encrypted: i=1; AJvYcCWfbsevDcMZpKb2BKHZnXJcI+G65m+u9XuaGD9vUroQzfIAHHhuOcCKAGRSlsTPXsMDQxzVwpcncLo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/aPfQyZcssvfYW1QxU5+VuBqZwAjoeFtQigA9vDfpt3VNGtz/
	H2cl4JvLz/xhNOHLFDIGEpOrweUjV+8E6fwLrLujs4F+wT6HVd73XjcE5H2UW/EMd6rTYcPzEQB
	kupon07BT2gD87Cim0j9b/FDBEsw6rZJhX+wyTjOaBOn6CSwDLwBMPC5r0BVOAddqpn5u
X-Gm-Gg: ATEYQzyw9bUPaMTR7riA1cx19bmclIDeywp6tsX53PCXlazhAI4qgJf8e5JIYAa8Bqx
	tK2r1KO5+2rCHZeILLvG8i1H0rD0T3H71ARr6RUTJotM5NVi9jic/5o58eI/nJxa4fMByogcaxT
	TajtgCdkocBtpZSJuAyahjuWsVb4JOmD4Ty/vun3y2gFGeld5qriPEbM7DMimNNuZGq/ICZEc1P
	yH8qodFFPwCELOmsKGJVzMcsil+pbDt+b8KdMeu+oDzSN7KG1Cnwc18G3lRI21h6Aq48P4p16Fo
	mrnnIBJHCEfwXpK8wZfOz2xyMxboNXAap7ap3DSSQMtST5Hy2xcE2ZkMiyhNgUQRlkuAlJMcKq9
	BTcrP5sCDfgxUYLFbZDch2yPheugnspM=
X-Received: by 2002:a05:7300:7309:b0:2ba:8496:498 with SMTP id 5a478bee46e88-2bde1ba0474mr4470664eec.7.1772489930706;
        Mon, 02 Mar 2026 14:18:50 -0800 (PST)
X-Received: by 2002:a05:7300:7309:b0:2ba:8496:498 with SMTP id 5a478bee46e88-2bde1ba0474mr4470647eec.7.1772489930109;
        Mon, 02 Mar 2026 14:18:50 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm7239828eec.2.2026.03.02.14.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:18:49 -0800 (PST)
Date: Mon, 2 Mar 2026 16:18:48 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Conor Dooley <conor.dooley@microchip.com>,
        Yong-Xuan Wang <yongxuan.wang@sifive.com>,
        Nutty Liu <nutty.liu@hotmail.com>, Paul Walmsley <pjw@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Message-ID: <24ev3x4ppteznxfdunzzcl5ra3n64oikjxbnuj2dqhwlvuu52k@aiujsgdy2nsk>
References: <20260227121008.442241-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227121008.442241-1-tjytimi@163.com>
X-Proofpoint-GUID: yPvR0LEA4ETbAA6JvOQqPlpIJtf7hFsv
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a60ccb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=KQEVWjvnPtaqH-4Khw8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: yPvR0LEA4ETbAA6JvOQqPlpIJtf7hFsv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NSBTYWx0ZWRfX3ZCSdrfCmEbV
 bV8hsOA7je+hKC30YkgEdB/iO27gsm5z8bhYyf43udUxlqwC2WMDVVF0ZlnOAH8T3xMl8JATJ3H
 j/k7wOHdxjE7F+8AL28g6AkR7uwhetyDWYd2jUAo1e/ZggvB+QM8iD8U9i3gulpb1xa9OV/AP9p
 MKRirtM8uw26ZJxWL79ZaiE9Z8QHmzZnI2A2Lc/fdvYlmZy8slZTRz4GQ0QkIS13B4Y0Jfui7DJ
 ZRiRJ7awmxJ6D/CiS8+XRygzq3eJQi+O40UvbCfz8fTXFkaQXZhyiNuYA10UEG4sCu+jDKFTYuX
 4/DOgUiH3vdAdxpV3RSTKK8EOXZpvlCXU0N8nBTMZVoox0xDTx0VGh8v2z7DjYr3O4Sbs0dwhic
 4/I4ANmiiPr7YTXWijWKku8PhLmJtwVKoBx2xdrQod6fmXJOlWcy6vwJU3Q5+Ddr+63hY2CaTL8
 sc1fESe2tSMBAplYLXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_141853_346463_C4F0D943 
X-CRM114-Status: GOOD (  29.03  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDg6MTA6MDhQTSArMDgwMCwgSmlueXUgVGFuZyB3cm90
ZToKPiBDdXJyZW50bHksIGt2bV9hcmNoX3ZjcHVfbG9hZCgpIHVuY29uZGl0aW9uYWxseSByZXN0
b3JlcyBndWVzdCBDU1JzLAo+IEhHQVRQLCBhbmQgQUlBIHN0YXRlLiBIb3dldmVyLCB3aGVuIGEg
VkNQVSBpcyBsb2FkZWQgYmFjayBvbiB0aGUgc2FtZQo+IHBoeXNpY2FsIENQVSwgYW5kIG5vIG90
aGVyIEtWTSBWQ1BVIGhhcyBydW4gb24gdGhpcyBDUFUgc2luY2UgaXQgd2FzCj4gbGFzdCBwdXQs
IHRoZSBoYXJkd2FyZSBDU1JzIGFuZCBBSUEgcmVnaXN0ZXJzIGFyZSBzdGlsbCB2YWxpZC4KPiAK
PiBUaGlzIHBhdGNoIG9wdGltaXplcyB0aGUgdmNwdV9sb2FkIHBhdGggYnkgc2tpcHBpbmcgdGhl
IGV4cGVuc2l2ZSBDU1IKPiBhbmQgQUlBIHdyaXRlcyBpZiBhbGwgdGhlIGZvbGxvd2luZyBjb25k
aXRpb25zIGFyZSBtZXQ6Cj4gMS4gSXQgaXMgYmVpbmcgcmVsb2FkZWQgb24gdGhlIHNhbWUgQ1BV
ICh2Y3B1LT5hcmNoLmxhc3RfZXhpdF9jcHUgPT0gY3B1KS4KPiAyLiBUaGUgQ1NScyBhcmUgbm90
IGRpcnR5ICghdmNwdS0+YXJjaC5jc3JfZGlydHkpLgo+IDMuIE5vIG90aGVyIFZDUFUgdXNlZCB0
aGlzIENQVSAodmNwdSA9PSBfX3RoaXNfY3B1X3JlYWQoa3ZtX2Zvcm1lcl92Y3B1KSkuCj4gCj4g
VG8gZW5zdXJlIHRoaXMgZmFzdC1wYXRoIGRvZXNuJ3QgYnJlYWsgY29ybmVyIGNhc2VzOgo+IC0g
TGl2ZSBtaWdyYXRpb24gYW5kIFZDUFUgcmVzZXQgYXJlIG5hdHVyYWxseSBzYWZlLiBLVk0gaW5p
dGlhbGl6ZXMKPiAgIGxhc3RfZXhpdF9jcHUgdG8gLTEsIHdoaWNoIGd1YXJhbnRlZXMgdGhlIGZh
c3QtcGF0aCB3b24ndCB0cmlnZ2VyLgo+IC0gVGhlICdjc3JfZGlydHknIGZsYWcgdHJhY2tzIHJ1
bnRpbWUgdXNlcnNwYWNlIGludGVydmVudGlvbnMuIElmCj4gICB1c2Vyc3BhY2UgbW9kaWZpZXMg
Z3Vlc3QgY29uZmlndXJhdGlvbnMgKGUuZy4sIGhlZGVsZWcgdmlhCj4gICBLVk1fU0VUX0dVRVNU
X0RFQlVHLCBvciBDU1JzIGluY2x1ZGluZyBBSUEgdmlhIEtWTV9TRVRfT05FX1JFRyksCj4gICB0
aGUgZmxhZyBpcyBzZXQgdG8gc2tpcCB0aGUgZmFzdCBwYXRoLgo+IAo+IFdpdGggdGhlICdjc3Jf
ZGlydHknIHNhZmVndWFyZCBwcm92ZW4gZWZmZWN0aXZlLCBpdCBpcyBzYWZlIHRvCj4gaW5jbHVk
ZSBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCgpIGluc2lkZSB0aGUgc2tpcCBsb2dpYyBub3cuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmlueXUgVGFuZyA8dGp5dGltaUAxNjMuY29tPgo+IC0tLQo+ICB2
NiAtPiB2NzoKPiAgLSBNb3ZlZCBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCgpIGludG8gdGhlIGZh
c3QtcGF0aCBza2lwIGxvZ2ljLCBhcwo+ICAgIHN1Z2dlc3RlZCBieSBSYWRpbSBLcsSNbcOhxZku
Cj4gIC0gVmVyaWZpZWQgdGhlIGZpeCBmb3IgdGhlIElNU0lDIGluc3RhYmlsaXR5IGlzc3VlIHJl
cG9ydGVkIGluIHYzLgo+ICAgIFRlc3Rpbmcgd2FzIGNvbmR1Y3RlZCBvbiBRRU1VIDEwLjAuMiB3
aXRoIGV4cGxpY2l0bHkgZW5hYmxlZCBBSUEKPiAgICAoYC1tYWNoaW5lIHZpcnQsYWlhPWFwbGlj
LWltc2ljYCkuIFRoZSBndWVzdCBib290cyBzdWNjZXNzZnVsbHkgCj4gICAgdXNpbmcgdmlydGlv
LW1taW8gZGV2aWNlcyBsaWtlIHZpcnRpby1ibGsgYW5kIHZpcnRpby1uZXQuCj4gCj4gIHY1IC0+
IHY2Ogo+ICBBcyBzdWdnZXN0ZWQgYnkgQW5kcmV3IEpvbmVzLCBjaGVja2luZyAnbGFzdF9leGl0
X2NwdScgZmlyc3QgKG1vc3QKPiAgbGlrZWx5IHRvIGZhaWwgb24gYnVzeSBob3N0cykgYW5kIHBs
YWNpbmcgdGhlIGV4cGVuc2l2ZQo+ICBfX3RoaXNfY3B1X3JlYWQoKSBsYXN0LCBza2lwcGluZyBf
X3RoaXNfY3B1X3dyaXRlKCkgaW4ga3ZtX2FyY2hfdmNwdV9wdXQoKQo+ICBpZiBrdm1fZm9ybWVy
X3ZjcHUgaXMgYWxyZWFkeSBzZXQgdG8gdGhlIGN1cnJlbnQgVkNQVS4KPiAKPiAgdjQgLT4gdjU6
Cj4gIC0gRHJvcHBlZCB0aGUgJ3ZjcHUtPnNjaGVkdWxlZF9vdXQnIGNoZWNrIGFzIEFuZHJldyBK
b25lcyBwb2ludGVkIG91dCwKPiAgICByZWx5aW5nIG9uICdsYXN0X2V4aXRfY3B1JywgJ2Zvcm1l
cl92Y3B1JywgYW5kICchY3NyX2RpcnR5Jwo+ICAgIGlzIHN1ZmZpY2llbnQgYW5kIHNhZmUuIFRo
aXMgZXhwYW5kcyB0aGUgb3B0aW1pemF0aW9uIHRvIGNvdmVyIG1hbnkKPiAgICB1c2Vyc3BhY2Ug
ZXhpdHMgKGUuZy4sIE1NSU8pIGFzIHdlbGwuCj4gIC0gQWRkZWQgYSBibG9jayBjb21tZW50IGlu
IGt2bV9hcmNoX3ZjcHVfbG9hZCgpIHRvIHdhcm4gZnV0dXJlCj4gICAgZGV2ZWxvcGVycyBhYm91
dCBtYWludGFpbmluZyB0aGUgJ2Nzcl9kaXJ0eScgZGVwZW5kZW5jeSwgYXMgQW5kcmV3J3MKPiAg
ICBzdWdnZXN0aW9uIHRvIHJlZHVjZSBmcmFnaWxpdHkuCj4gIC0gUmVtb3ZlZCB1bm5lY2Vzc2Fy
eSBzaW5nbGUtbGluZSBjb21tZW50cyBhbmQgZml4ZWQgaW5kZW50YXRpb24gbml0cy4KPiAKPiAg
djMgLT4gdjQ6Cj4gIC0gQWRkcmVzc2VkIEFudXAgUGF0ZWwncyByZXZpZXcgcmVnYXJkaW5nIGhh
cmR3YXJlIHN0YXRlIGluY29uc2lzdGVuY3kuCj4gIC0gSW50cm9kdWNlZCAnY3NyX2RpcnR5JyBm
bGFnIHRvIHRyYWNrIGR5bmFtaWMgdXNlcnNwYWNlIENTUi9DT05GSUcKPiAgICBtb2RpZmljYXRp
b25zIChLVk1fU0VUX09ORV9SRUcsIEtWTV9TRVRfR1VFU1RfREVCVUcpLCBmb3JjaW5nIGEgZnVs
bAo+ICAgIHJlc3RvcmUgd2hlbiBkZWJ1Z2dpbmcgb3IgbW9kaWZ5aW5nIHN0YXRlcyBhdCB1c2Vy
c3BhY2UuCj4gIC0gS2VwdCBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCgpIG91dCBvZiB0aGUgc2tp
cCBibG9jayB0byByZXNvbHZlIElNU0lDCj4gICAgVlMtZmlsZSBpbnN0YWJpbGl0eS4KPiAKPiAg
djIgLT4gdjM6Cj4gIHYyIHdhcyBtaXNzaW5nIGEgY3JpdGljYWwgY2hlY2sgYmVjYXVzZSBJIGdl
bmVyYXRlZCB0aGUgcGF0Y2ggZnJvbSBteQo+ICB3cm9uZyAoZXhwZXJpbWVudGFsKSBicmFuY2gu
IFRoaXMgaXMgZml4ZWQgaW4gdjMuIFNvcnJ5IGZvciBteSB0cm91YmxlLgo+IAo+ICB2MSAtPiB2
MjoKPiAgQXBwbHkgdGhlIGxvZ2ljIHRvIGFpYSBjc3IgbG9hZC4gVGhhbmtzIGZvciBBbmRyZXcg
Sm9uZXMncyBhZHZpY2UuCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAyNCArKysr
KysrKysrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAg
IHwgIDIgKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxj
b21tLmNvbT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
