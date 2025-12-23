Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990E1E6B26E
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 04:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o81apo9kzlbZpB+dVngHFBUt5y8KY3Egy3wyLmsqpkA=; b=M7a/U1bBj62p4o
	k7CEAbQLtQzrTvpUJ5wJEpXULGM/WEdbcmVXky0Hk5BiFmihTdT8USKaYyPdM+7el9F2n0YKot9qe
	SpPC/IXzJHkWuULp3vwGFMJbahofmFj35OhOssPy4yt/rQRtrMIt1e1tMUFromUHG8gH8MoSq9Whk
	OPzhWkGjNYwIN2qdWGcYSjmqcmB4iYroP5AYYFbU21Xdnv8r7BywJ9cnU0OZ6KqWnNqXHrg+lzeqN
	nS6gm9hvlDLZj8laRb1pGU47FJh7Sa4hYjWB3fzPO4NREivcx1XlyHosoh/r2PYFM59j3nxXrTNfx
	+J+YSrUarMHhly1d3xeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtzB-0000000EVG4-3qi8;
	Tue, 23 Dec 2025 04:27:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtzA-0000000EVFV-0Wnw
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 04:27:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so3807414a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 22 Dec 2025 20:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766464018; x=1767068818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ3tD45XzcEgQ7T192a3IA07CG+ZNFQQuaZLudrMyQU=;
        b=iJXT0dP1ZPRFKDK+FRaGCCZIq78NeJRFTqg+4xDI998vCJ8pNmwnryHamRai+FqTP9
         v+0J3GCbvh5ZU4Hop8MHx0jidLl9ZES9anrVGoQRIFmV3xsO874PFY46MI9kODDNjVge
         oiEtYgas8fLmqBoo12Vt+8vYR7a0nPwGIf44sBjQiL/HMkYFVUbt8hfoqu2BQRq+7GtK
         hxfVS46eafaGFRM+Lwusd/3Pa+i60zTHipk5Gv834hRpP91Hq/XOBuNBu7dzW/wOJJoq
         KbN9vuC3B08ZE7KGs375vR/NgLz9ODzFrl+g9PVf/jTLjiX6gCzZVm5aKlupXWPaaY33
         W2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766464018; x=1767068818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJ3tD45XzcEgQ7T192a3IA07CG+ZNFQQuaZLudrMyQU=;
        b=XLwJbamCNJ2HGWiX58KuwWzsju0b49ZUdzItysqzTbn12NTqkRI3KaGNfUzNXNJgQc
         klEKNiomrviglNFCRubT/uFE4e8xOElzkO3+1H4PT0rm8VHf9/23lkpdxTJMwPdtLQAs
         LgOdmDGT6Ev/Fz1rQKPgFaXj76u1QtzdB7HY6sx/yMZsG8Ig5PgJmxREwte5X4KCeTOC
         RYkx8V/C6Sg3ue5RWilMSRvq27TNlgacmzeNeWl7ohnBCs3AEj14BCsvwucDiJQLWNcb
         rd7gssDhNiHO0KjY0cic5nD/31VkYaMurq48eIQuOQ1L38O23/9HgFsXeQ49vNeS+Vh+
         kGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUtyT9ZPGiqR47j7eVpnndlpDb6T0USpcBU/qjCDPqN42oSrgU7VJej2lcMvzJjZIDS2DgvrzWyZmg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyosBug1aeqhlMAP8n4geWCo0IVvpW76PPsOK5iHnoRrzwnc5fO
	jByBtNu9PsukN1BvG9izPRpnga+0UOq06z69IcIjkdDjr9nagtX2k7mTd2kPgbru2y/5jCaMDN2
	inxVZ896+as+jp/MtKOfXiGUQSBEds4o=
X-Gm-Gg: AY/fxX65zrgio6xl5TEWMOOTdEpkaFKmBdgU0RqOn4MwD94yBa1SpIhiqDUOt6qTfWx
	CISEitEVljm4AyVVyp2tBgtH2DNvr+Aqbx6j2KM0XpCAh2fhVHDEVehGwaXSKcTAhs82fdydKT3
	slJkxE3Hg7+/J6p9W5g7kySElZqh8hCTM/Gb1/hrmHchUzQuBrmZmXvCqHfv64nRcwL3QVcDWuP
	TdX2leU3TM56HXImgsWuvJFb/GH+BLZwl172w2J8b76DHP+wv6QlTgJee6iX7R7UlEDi4heEIJ4
	uXo2
X-Google-Smtp-Source: AGHT+IEPyqsPeO6aTr7a1+qa+IWvSutJ6bA8q2StoHYn3dgBycTBccwz4+G2cUxDQyQ/460kIBB6sDviCRGemuCxf6c=
X-Received: by 2002:a17:907:86a4:b0:b7a:6178:2b4a with SMTP id
 a640c23a62f3a-b8036f2ae4cmr1483447466b.26.1766464017487; Mon, 22 Dec 2025
 20:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20251213150848.149729-1-jamestiotio@gmail.com> <20251222-4edd14c1464744ef9e24245d@orel>
In-Reply-To: <20251222-4edd14c1464744ef9e24245d@orel>
From: James R T <jamestiotio@gmail.com>
Date: Tue, 23 Dec 2025 12:26:20 +0800
X-Gm-Features: AQt7F2p8Lq_3pLPWCZGwO3DzpJjCobA3X5LEm--Rh0O0jr86bUAg0GosKKLbco4
Message-ID: <CAA_Li+srDoyr9eOqexHejviZddXPeq0eFjnf32OnGa_WPykQiA@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH 0/4] riscv: sbi: Add support to test PMU extension
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_202700_167162_37E3020A 
X-CRM114-Status: GOOD (  20.33  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgMToyNeKAr0FNIEFuZHJldyBKb25lcyA8YW5kcmV3Lmpv
bmVzQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBTYXQsIERlYyAxMywgMjAyNSBhdCAxMTowODo0
NFBNICswODAwLCBKYW1lcyBSYXBoYWVsIFRpb3ZhbGVuIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBz
ZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0ZXN0aW5nIG1vc3Qgb2YgdGhlIFNCSSBQTVUKPiA+IGV4
dGVuc2lvbiBmdW5jdGlvbnMuIFRoZSBmdW5jdGlvbnMgcmVsYXRlZCB0byBzaGFyZWQgbWVtb3J5
Cj4gPiAoRklEICM3IGFuZCAjOCkgYXJlIG5vdCB0ZXN0ZWQgeWV0Lgo+ID4KPiA+IFRoZSBmaXJz
dCAzIHBhdGNoZXMgYWRkIHRoZSByZXF1aXJlZCBzdXBwb3J0IGZvciBTQkkgUE1VIGFuZCBzb21l
Cj4gPiBoZWxwZXIgZnVuY3Rpb25zLCB3aGlsZSB0aGUgbGFzdCBwYXRjaCBhZGRzIHRoZSBhY3R1
YWwgdGVzdHMuCj4gPgo+ID4gSmFtZXMgUmFwaGFlbCBUaW92YWxlbiAoNCk6Cj4gPiAgIGxpYjog
cmlzY3Y6IEFkZCBTQkkgUE1VIENTUnMgYW5kIGVudW1zCj4gPiAgIGxpYjogcmlzY3Y6IEFkZCBT
QkkgUE1VIHN1cHBvcnQKPiA+ICAgbGliOiByaXNjdjogQWRkIFNCSSBQTVUgaGVscGVyIGZ1bmN0
aW9ucwo+ID4gICByaXNjdjogc2JpOiBBZGQgdGVzdHMgZm9yIFBNVSBleHRlbnNpb24KPiA+Cj4g
PiAgcmlzY3YvTWFrZWZpbGUgICAgICB8ICAgMiArCj4gPiAgbGliL3Jpc2N2L2FzbS9jc3IuaCB8
ICAzMSArKysKPiA+ICBsaWIvcmlzY3YvYXNtL3BtdS5oIHwgMTY3ICsrKysrKysrKysrKysrKysK
PiA+ICBsaWIvcmlzY3YvYXNtL3NiaS5oIHwgMTA0ICsrKysrKysrKysKPiA+ICBsaWIvcmlzY3Yv
cG11LmMgICAgIHwgMTY5ICsrKysrKysrKysrKysrKysKPiA+ICBsaWIvcmlzY3Yvc2JpLmMgICAg
IHwgIDczICsrKysrKysKPiA+ICByaXNjdi9zYmktdGVzdHMuaCAgIHwgICAxICsKPiA+ICByaXNj
di9zYmktcG11LmMgICAgIHwgNDYxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgcmlzY3Yvc2JpLmMgICAgICAgICB8ICAgMiArCj4gPiAgOSBmaWxlcyBj
aGFuZ2VkLCAxMDEwIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Jp
c2N2L2FzbS9wbXUuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvcmlzY3YvcG11LmMKPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yvc2JpLXBtdS5jCj4gPgo+ID4gLS0KPiA+IDIuNDMu
MAo+ID4KPgo+IEhpIEphbWVzLAo+Cj4gVGhhbmtzIGZvciBwb3N0aW5nIHRoaXMuIEknbGwgbG9v
ayBhdCBpdCBhcyBzb29uIGFzIHBvc3NpYmxlLCBidXQgSSdtCj4ganVnZ2xpbmcgc29tZSBvdGhl
ciBzdHVmZiByaWdodCBub3cgYW5kIGFsc28gcGxhbiB0byBiZSBvbiB2YWNhdGlvbiBmb3IKPiBh
IHdlZWsgc3RhcnRpbmcgdG9tb3Jyb3cuCj4KPiBUaGFua3MsCj4gZHJldwoKSGkgQW5kcmV3LAoK
Tm8gd29ycmllcy4gRmVlbCBmcmVlIHRvIGxvb2sgYXQgdGhlIHNlcmllcyB3aGVuZXZlciB5b3Ug
bWFuYWdlIHRvCmZpbmQgc29tZSB0aW1lIHRvIGRvIHNvLgoKQmVzdCByZWdhcmRzLApKYW1lcyBS
YXBoYWVsIFRpb3ZhbGVuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
