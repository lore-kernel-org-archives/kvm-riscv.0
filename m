Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA12FCC056
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw86k46d0nV9nuk7uvpIIVTxZeFhmVre5LqNn7f+zpM=; b=GvRYA8zEJkHe5N
	HTYhi76t0cTgXfRYGahzXr3LxApdKUTs7SqbG2dcud/DO3il/xPpudqN/FTq62wOqqBhJvo1Difrc
	cgXEmFhfnErX/bmMyeJanIbBXJJePz/Zl8aSwD4jAopxIiaEK5tTpEEon3qPylmY56DGt/o8qvXJi
	C4ZStqwZJqPrbOGJoTK58RTkCTLugZBDQzCfXk543xNf/KssVV7r+HBB3C9npHLqtiDzVRjcIcJ2F
	4x66h+v9su2z9wjjOFh7fV4czfSwTF19qng/wQlak5Dh/Z8Cg6pPCjoWFxfeiqpSy7YZFtrJoBRmm
	cgiahhMS4BWAsRL9zsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya0u-00000004L5p-0e3t;
	Fri, 06 Mar 2026 18:35:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya0s-00000004L4j-0A0n
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:35:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1nbd707442
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=; b=ILmPJVb2t/5n5Wkq
	W+CI6HNPAgybqw/FfJsR++RGB4AU5QXiMxM8k6RGxrQGLpMNR6UU3XCqmfc0ecOi
	Q86nDQkcYe3RH6mxwxKLEXTsD5ZTD9FLBxpD2t6N03EaTpDYxc8EKFBCPTcmmqnb
	GI1guRlDeJkA/EX4UN/5jxpfjc5ngTRPmONqCEajrce1hm2VSiQ9/6vrRvSgAzmU
	jB/C20ozpg4Um2gR7GPAEpA0QlyQzt4m7KaStURI2Nh/bAkZIGVGpu/2TWrNK2II
	oRnwL2m4jMPMi+1wys1px9FgofaE1corBN+AFg3T7OxISOQrtzk9oRU3LgValRzQ
	8qFIgg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrukak7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:35:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be07cafe1cso79173491eec.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822100; x=1773426900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=;
        b=D3x5rWiPh4CsslLkvCm/4V1Dmv4O9MkhkBxB4Ehmqdpv8o1sNYUFxQzxOhSvABmfeA
         O8+ZH+7Mk/BZAAVveWA7IKOzwT7oazeQ3AWLPcDCq0QhImtP37fb1nyp3awtSa002vxB
         5QmolLZLShSWSyizlw7aXV1mn5nq3YEGt3obN6BUdXRz7HaPSpXjd0RT1qE5rpJYhdmE
         5N/sLb9rvqoqNKpoY2eNgaNBBmuFW8FCWhHO9Jq828wx2pFomIz6ab+NjMQCN6BayzBY
         Jp6BUqlUgLlT7iUzGiCQj4omlLOZRm3fx7NhDRJSAxculURk9M8+/Oo6u6+sZu6BvSRu
         6btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822100; x=1773426900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=;
        b=ZcQ4CIjE3IEmDQXVJQVZ1rhEtqjpYWSgdy0/rel7eWt8fikEZlEHUAS8bcXPGG7Qnk
         NMDfRZKY3Je2Pd4lsvFZ7W7/NR/xvknzcOO7keZ1zrYqMdIkkx3bbD3Hrgd/z9+GGJ7P
         pzm6nmhJ6rIsmjoRG3sN3rKtGnzVXEmE3c9xhS1TBmXDBEDRuoChdwfgNYxkGSkdpypp
         yd4YBKgEVZWphFPeL5d9OjQea7ymunRrYURehYG571vRbqzIjn5I8IzX3Qq3F0aaHt7d
         9CDik6nUAhQCyW6sl819m+Ekt7v1gRSt1mJlhr2s1xyjTaEk/of3M/hS1TpbOZ5FxevU
         Mh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4PGBlyVft2zAYi0pjWCysrcKFhFyY33QBf7wuMXTTC+hjcuM8NEFcnErWakmY8nAY0jh+X6XkiI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF0uQ06SIXdnicNgTLrfb7w6WHADHxNglzSnMph7YYzHtN67t+
	iJkOjH8yRMcaYUqsF7OdwJ4yLcM8bONBJtRPlQE73rcdK6X9/FNS6DCv6TFAShyQ4mMDS2fXA5G
	YKk8/O67w/0AmmVcip8RoGMVHkbR9XyUT8bV/+3cgyaxY/00ZpYIf2HGaY0f+YYRdJW22
X-Gm-Gg: ATEYQzywCe5LJyYSIZB3HbS9u5huV/7MWV8C6VwQNJYUpFBaFFlsFoCSdc2hNKxtIao
	NSCgS/T7TvXrTM95pBv5qxwBdtcFQ6Don6xhHcEUf2xpAOwOhwiB4B/+ORixIah2eoRbnKAaAX2
	OEQ3ewRaFotxMkWV4IgPXdg8sBWjGlwTv94a6QQoSrvteNHClImVe9pXJXlBv6KEut7O/8TZXx1
	fsILFrSzgpr0s2Fw9v0Rz3S6XmdXvREKSPYclGsRtWC8TEF+82hAUDnngcG1zHB74dLd4IkuWa1
	xzcHiYFnZhRZNIESUtJY6fa/2JK4zVyjbp8fLrY0AHmoiiEpTEq45DEk7Wg2OPf94JBJYN+bLGl
	qD1rlgcwi6gciBZT2l5mdKgeiAQLZx2Y=
X-Received: by 2002:a05:7301:fa12:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be4de90d9bmr1378398eec.1.1772822099703;
        Fri, 06 Mar 2026 10:34:59 -0800 (PST)
X-Received: by 2002:a05:7301:fa12:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be4de90d9bmr1378378eec.1.1772822099160;
        Fri, 06 Mar 2026 10:34:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f670062sm1718228eec.0.2026.03.06.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:34:58 -0800 (PST)
Date: Fri, 6 Mar 2026 12:34:57 -0600
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
Subject: Re: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to
 output
Message-ID: <jlbtmuz3wlzup5cqpjp5rtpdcnhxi46ibxdulothylwcahrbe6@huyy47zy5nzp>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>
 <CAH1PCMaAiQC1+zqPeRQAFDQz6QG8DzV4FpYGhjPh1ymko_7TMg@mail.gmail.com>
 <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
 <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NiBTYWx0ZWRfX5cLlIImmv2jr
 1i9zGghP0QL+aaCo2Gk+plqNQx+CzJZJ/n2Z6fKkwFYocn20yuPN5jMzVHSVOaEzzVFjfsNhVA6
 0Ruj6KGWX3akQhRL27qMmiKCOdYSWMnfEiB/YH6EMFI/VJ5P4vvkl64HCWxYasfWM+mcRHbAuin
 FbrsW3FK5SwAz4NLG6HOZG82g3OtX+u0M0+SSoxdLjKY090QJvhDo9hWn4M44IqAA+EedBVzmdH
 PancDnM2QksE0iwIJy49Zq6354Li/LnvfyptnqiW8wIrVjWsbL8R7hDguyYVO9t8jOkqHKxzdyx
 6XQZWKt2CRfqFUylEpS/3TbnLX0cEiB4Wn66VEOUmrN64UIzAsFLBQrH4gyX8bkRrEC0hdz/kz2
 +vVbwhrcX6klQJBwCCShKXR0w9oZZvdIvqD9Fx8E77O24cGoM+Zw2GVDOC3TU2/o6Fq8rP21XXO
 xJUQArpH4AKtVp6j3QQ==
X-Proofpoint-ORIG-GUID: QfWGknQGnNrJp7IvZSkiwaKvayLudSJn
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab1e54 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rJBQKMjNdry9CuFLpqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: QfWGknQGnNrJp7IvZSkiwaKvayLudSJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103502_222626_FCB4BD0B 
X-CRM114-Status: GOOD (  20.42  )
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

T24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDg6NDc6NDJQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCA4OjA44oCvQU0gQW5kcmV3IEpvbmVzCj4gPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEZlYiAy
MSwgMjAyNiBhdCAwNjo1MjoxOVBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBPbiBG
cmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcgSm9uZXMKPiA+ID4gPGFuZHJldy5q
b25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE91dHB1dCB0aGUg
cnZhMjModXxzKTY0IElTQSBiYXNlcyB0aGF0IHRoZSBJU0EgZXh0ZW5zaW9ucyBwcm92aWRlIG9u
Cj4gPiA+ID4gbmV3ICdpc2EgYmFzZXMnIGxpbmVzIGJvdGggZm9yIHRoZSBMQ0Qgb2YgYWxsIGhh
cnRzIGFuZCBwZXIgaGFydCwgYXMKPiA+ID4gPiBzaG93biBpbiB0aGUgZXhhbXBsZSBvdXRwdXQg
YmVsb3cgd2hlbiBib290aW5nIHFlbXUgd2l0aAo+ID4gPiA+IC1jcHUgcnZhMjNzNjQsc3YzOT1v
bixwbXA9b246Cj4gPiA+ID4KPiA+ID4gPiBwcm9jZXNzb3IgICAgICAgOiAwCj4gPiA+ID4gaGFy
dCAgICAgICAgICAgIDogNAo+ID4gPiA+IGlzYSBiYXNlcyAgICAgICA6IHJ2NjRpbWEgcnZhMjN1
NjQKPiA+ID4gPiBpc2EgICAgICAgICAgICAgOiBydjY0aW1hZmRjYnZoX3ppY2JvbV96aWNib3Bf
emljYm96X3ppY2NhbW9hX3ppY2NpZl96aWNjbHNtX3ppY2Nyc2VfemljbnRyX3ppY29uZF96aWNz
cl96aWZlbmNlaV96aWhpbnRudGxfemloaW50cGF1c2VfemlocG1femltb3BfemE2NHJzX3phYW1v
X3phbHJzY196YXdyc196ZmFfemZobWluX3pjYV96Y2JfemNkX3pjbW9wX3piYV96YmJfemJzX3pr
dF96dmJiX3p2ZTMyZl96dmUzMnhfenZlNjRkX3p2ZTY0Zl96dmU2NHhfenZmaG1pbl96dmtiX3p2
a3Rfc21haWFfc21ucG1fc21zdGF0ZWVuX3NzYWlhX3NzY29mcG1mX3NzbnBtX3NzdGNfc3ZhZGVf
c3ZpbnZhbF9zdm5hcG90X3N2cGJtdAo+ID4gPiA+IG1tdSAgICAgICAgICAgICA6IHN2MzkKPiA+
ID4gPiBtdmVuZG9yaWQgICAgICAgOiAweDAKPiA+ID4gPiBtYXJjaGlkICAgICAgICAgOiAweDAK
PiA+ID4gPiBtaW1waWQgICAgICAgICAgOiAweDAKPiA+ID4gPiBoYXJ0IGlzYSBiYXNlcyAgOiBy
djY0aW1hIHJ2YTIzdTY0Cj4gPiA+ID4gaGFydCBpc2EgICAgICAgIDogcnY2NGltYWZkY2J2aF96
aWNib21femljYm9wX3ppY2Jvel96aWNjYW1vYV96aWNjaWZfemljY2xzbV96aWNjcnNlX3ppY250
cl96aWNvbmRfemljc3JfemlmZW5jZWlfemloaW50bnRsX3ppaGludHBhdXNlX3ppaHBtX3ppbW9w
X3phNjRyc196YWFtb196YWxyc2NfemF3cnNfemZhX3pmaG1pbl96Y2FfemNiX3pjZF96Y21vcF96
YmFfemJiX3pic196a3RfenZiYl96dmUzMmZfenZlMzJ4X3p2ZTY0ZF96dmU2NGZfenZlNjR4X3p2
ZmhtaW5fenZrYl96dmt0X3NtYWlhX3NtbnBtX3Ntc3RhdGVlbl9zc2FpYV9zc2NvZnBtZl9zc25w
bV9zc3RjX3N2YWRlX3N2aW52YWxfc3ZuYXBvdF9zdnBibXQKPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gKyAgICAgICAvKiBSVkEyM1M2NCAqLwo+ID4gPiA+ICsgICAgICAg
c2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJLCBleHRfbWFzayk7Cj4gPiA+ID4gKyAgICAg
ICAvKiBUT0RPOiBTczFwMTMgKi8KPiA+ID4gPiArICAgICAgIC8qIFN2YmFyZSwgU3YzOSAtLSBh
c3N1bWVkICovCj4gPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZBREUsIGV4
dF9tYXNrKTsKPiA+ID4gPiArICAgICAgIC8qIFRPRE86IFNzY2NwdHIsIFNzdHZlY2QsIFNzdHZh
bGEsIFNzY291bnRlcmVudyAqLwo+ID4gPgo+ID4gPiBGb3IgdGhpcywKPiA+ID4KPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TVlBCTVQsIGV4dF9tYXNrKTsKPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TVklOVkFMLCBleHRfbWFzayk7Cj4gPiA+ID4g
KyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZOQVBPVCwgZXh0X21hc2spOwo+ID4gPiA+
ICsgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1NTVEMsIGV4dF9tYXNrKTsKPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiwgZXh0X21hc2spOwo+ID4gPiA+
ICsgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1NTTlBNLCBleHRfbWFzayk7Cj4gPiA+ID4g
KyAgICAgICAvKiBUT0RPOiBTc3U2NHhsICovCj4gPiA+ID4gKyAgICAgICAvKiBUT0RPOiBTaGEg
PSBTc3N0YXRlZW4sIFNoY291bnRlcmVudywgU2h2c3R2YWxhLCBTaHR2YWxhLCBTaHZzdHZlY2Qs
IFNodnNhdHBhLCBTaGdhdHBhICovCj4gCj4gSGksIGRyZXcKPiAKPiBBYm91dCAnU2hhJywgeW91
ciByZWFkaW5nIG9mIHRoZSBwcm9maWxlL3NwZWMsIGRvIHlvdSBwcmVmZXIgdG8gZGVmaW5lCj4g
U2hhIGFzIGEgX0JVTkRMRSBvciBhcyBhIF9TVVBFUlNFVCgpIHdoaWNoIGhhcyBpdHMgb3duIGlk
Pwo+IAo+IEkgZGVmaW5lZCBpdCBhcyBfU1VQRVJTRVQoKSBpbiBteSBwYXRjaCA4LzggWzFdLCBi
dXQgd2l0aCB0b2RheSdzIGNvZGUKPiByZXZpZXcsIEkgZ3Vlc3MgYnVuZGxlIGlzIGEgYmV0dGVy
IGZpdC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gQlRXLCBTaGEgPSBIICsgNyBvdGhlcnMuIEl0
IGluY2x1ZGVzIEguCgpJIGFncmVlIGEgYnVuZGxlIGlzIG1vcmUgc3VpdGFibGUgZm9yIFNoYS4K
ClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
