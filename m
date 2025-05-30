Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B072BC5B543
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 May 2025 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9clhFQORE5IZm5v6KBn98VBCht9EtUPMVuKIkcUS2tk=; b=dh8G4lvARUAxjj
	5DGuGICfnrZXQx09G506OehzQGjQsRGtQkskgaDEQA5/NQT77PWBo8JOPI/hOmbfa5OnHvJbuxL0J
	wS6H4OY+dqjq8YSZWrHRbpmV3xqUMV8phIGBrWpvwUxl36ySQ52TzjPBTcvgUCz0cMCQtPDFNELVm
	6432L7NK/sWGo1KhpFRijZvOZfu7TOJ3yBxRqRUZDnH+8YNlwy4zGkxF4QFMunakx5c42fVcMH2RV
	E/hndoGF3vPHTu6+A03+Fwv3/6KJB2SRCJr40aDdpjrNbEcVEcHCnv4SFLWHQ6Tt5fY1v8ilpUktE
	59/i4YfYXQ6gk684Vvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5QG-00000001bTl-0upN;
	Fri, 30 May 2025 19:29:44 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5QD-00000001bSI-10Ic;
	Fri, 30 May 2025 19:29:43 +0000
Message-ID: <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748633376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkiGcg9Pp6HB9HenrxwiWzm/IMuLvXwvBc2ohIpTcuU=;
	b=qejIatAl3IVBpVjd5b1sjdObGZ7rJABj1bGentvPoaT9Gk2nMpl/NODNwtlNVuxD7mIwiW
	xTQUdOt6Gu3DaCC7BjJCdrWEHh521evt/yWAJJhiesYDNH5GuqToxdnr9DVQXVDc4uDjZ3
	Hq4CVYV8tCgSZSBhWUbuMlqAshgB7wA=
Date: Fri, 30 May 2025 12:29:30 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
 <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_122941_810180_9EF1482A 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDUvMzAvMjUgNDowOSBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IDIwMjUtMDUtMjlU
MTE6NDQ6MzgtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+Ogo+PiBP
biA1LzI5LzI1IDM6MjQgQU0sIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4+IEkgb3JpZ2luYWxs
eSBnYXZlIHVwIG9uIHRoZSBpZGVhLCBidXQgSSBmZWVsIGtpbmRhIGJhZCBmb3IgRHJldyBub3cs
IHNvCj4+PiB0cnlpbmcgYWdhaW46Cj4+IEkgYW0gc29ycnkgaWYgc29tZSBvZiBteSByZXBsaWVz
IGNhbWUgYWNyb3NzIGluIHRoZSB3cm9uZyB3YXkuIFRoYXQgd2FzCj4+IG5ldmVyCj4+IHRoZSBp
bnRlbnRpb24uCj4gSSBkaWRuJ3QgbWVhbiB0byBhY2N1c2UgeW91LCBteSBhcG9sb2dpZXMuICBJ
IGFncmVlIHdpdGggRHJldydzCj4gcG9zaXRpb25zLCBzbyB0byBleHBhbmQgb24gYSBxdWVzdGlv
biB0aGF0IHdhc24ndCB0b3VjaGVkIGluIGhpcyBtYWlsOgo+Cj4+PiBFdmVuIGlmIHVzZXJzcGFj
ZSB3YW50cyBTQkkgZm9yIHRoZSBNLW1vZGUgaW50ZXJmYWNlLCBzZWN1cml0eSBtaW5kZWQKPj4g
VGhpcyBpcyBwcm9iYWJseSBhIDNyZCBvbmUgPyBXaHkgd2Ugd2FudCBNLW1vZGUgaW50ZXJmYWNl
IGluIHRoZSB1c2VyCj4+IHNwYWNlID8KPiBJdCBpcyBhYm91dCB0dXJuaW5nIEtWTSBpbnRvIGFu
IElTQSBhY2NlbGVyYXRvci4KPgo+IEEgZ3Vlc3QgdGhpbmtzIGl0IGlzIHJ1bm5pbmcgaW4gUy9I
Uy1tb2RlLgo+IFRoZSBlY2FsbCBpbnN0cnVjdGlvbiB0cmFwcyB0byBNLW1vZGUuICBSSVNDLVYg
SCBleHRlbnNpb24gZG9lc24ndAo+IGFjY2VsZXJhdGUgTS1tb2RlLCBzbyB3ZSBoYXZlIHRvIGVt
dWxhdGUgdGhlIHRyYXAgaW4gc29mdHdhcmUuCldlIGRvbid0IG5lZWQgdG8gYWNjZWxlcmF0ZSBN
LW1vZGUuIFRoYXQncyB0aGUgYmVhdXR5IG9mIHRoZSBSSVNDLVYgSCAKZXh0ZW5zaW9uLgpUaGUg
SVNBIGlzIGRlc2lnbmVkIGluIHN1Y2ggYSB3YXkgdGhhdCB0aGUgU0JJIGlzIHRoZSBpbnRlcmZh
Y2UgYmV0d2VlbiAKdGhlIHN1cGVydmlzb3IgZW52aXJvbm1lbnQgKFZTL0hTKQphbmQgdGhlIHN1
cGVydmlzb3IgZXhlY3V0aW9uIGVudmlyb25tZW50IChIUy9NKS4KCgo+Cj4gVGhlIElTQSBkb2Vz
bid0IHNheSB0aGF0IE0tbW9kZSBtZWFucyBTQkkuICBXZSB0cnkgcmVhbGx5IGhhcmQgdG8gaGF2
ZQo+IFNCSSBvbiBhbGwgUklTQy1WLCBidXQgSSB0aGluayBLVk0gaXMgdGFraW5nIGl0IGEgYml0
IHRvbyBmYXIuCj4KPiBXZSBjYW4gZGlzY3VzcyBob3cgYmVzdCB0byBkZXNjcmliZSBTQkksIHNv
IHVzZXJzcGFjZSBjYW4gY2hvb3NlIHRvCj4gYWNjZWxlcmF0ZSB0aGUgTS1tb2RlIGluIEtWTSwg
YnV0IEkgdGhpbmsgdGhhdCB0aGUgYWJpbGl0eSB0byBlbXVsYXRlCj4gTS1tb2RlIGluIHVzZXJz
cGFjZSBzaG91bGQgYmUgcHJvdmlkZWQuCkkgYW0gc3RpbGwgdHJ5aW5nIHRvIHVuZGVyc3RhbmQg
dGhlIGFkdmFudGFnZXMgb2YgZW11bGF0aW5nIHRoZSBNLW1vZGUgCmluIHRoZSB1c2VyIHNwYWNl
LgpDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgPwpJIGFtIGFzc3VtaW5nIHlvdSBhcmUgbm90IGhp
bnRpbmcgTmVzdGVkIHZpcnR1YWxpemF0aW9uIHdoaWNoIGNhbiBiZSAKYWNoaWV2ZWQgd2l0aCBl
eGlzdGluZwpJU0EgcHJvdmlkZWQgbWVjaGFuaXNtcyBhbmQgYWNjZWxlcmF0ZWQgYnkgU0JJIE5B
Q0wuCgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
