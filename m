Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D09C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0O9IMhoiteIx6z8jxT+W1xoI5SBypGkRYpgvG6wUoU=; b=eV2smKVsX5O85d
	NoVAxrkJSPiJgao0XaQe25hhgoUR0rfyh2B2lAHkltTCWL4stUK3lu1q15jCxP3QFdElJYuw4wVu3
	3jc+wUIDqu3Xds89nU0YdI1cjlCJdLA31ZNx1kyfAGCB4zP3uOt3dlUuxtyEuSh/8b6RH1lIfsXSG
	ZOJQk5G2wY+EP+hDf0JmSmjhUCk7wndBvuQz88BS2O7G+vJKvOyKSm54pwGuv6NOJoJX0AcRLDhpT
	Oi5NN6tbiLrhCEBhFZj2GBeVavF5rgMJuAmhdkc6iEX9Sl1L/J0L0CeHIh/kqdxh0OGmT5Xws65J6
	VxD9jW3eJcvg3PbFSSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMey-00000003BMf-3Pbl;
	Fri, 23 May 2025 07:17:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMev-00000003BLs-32BZ
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 07:17:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a35c339e95so1088461f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747984656; x=1748589456; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av0wHf24aS4juStS1TN8W3ncbclQw1XJp/gFY5E/1Cs=;
        b=heJJT4SYyzr8QfuaOiNDGUoVtdzwo5IuwKtXR904UP1NMUAuMp4mYEiP3RlrcF4Fa0
         9qqRppkgXaGbof9f/PpvpYkZ5Y1l/N7k1fRoDVEkhrU4Zwz3WdIWIzk5WTlUNmCdv6eR
         8aZwq8qIk2UUJZ6MPi3MTPLFEWqLcuH5KHScxhlYRuWemUGEfuJPhZ8UJ3aS2/5TrTul
         1L9seenqwX9JMZ6+nT5x7ar3vENNIpq46BjnHWn5COzlVXKfbHv7F9Kh3wgOkKEZ+rVR
         FoGuOLTTbKtOjHHLU5vq5tG+OXoMpReDXqFkORFZ378KbonatFHlSuJxa7fHIu5nKe9Y
         OB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984656; x=1748589456;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Av0wHf24aS4juStS1TN8W3ncbclQw1XJp/gFY5E/1Cs=;
        b=aPjZZD3vK5YwmAC6nsZvDgd8kLMM9vmeGNfIDtJW0ixks2VzCU+Y63IFDhguUX3JuJ
         BO+yivUmFkpLypzEhHBJ62iR6bsQTu//Wljd8Fr25ToUKH5SqHAP3xGDI79vjyqmBEcJ
         k8kp9o3InjK5NC2PX1cob3EkfgPgI5mVaFyZjn/dBo52FeT0bbN4ID3c0yH6RvGK5HLS
         833OqqmIGsM++JXN0JoG7fLV3Qw9XZYJluGjY/+bx5taSbhVcHfUPmj2xqO3R1zMdC9R
         QCgIAO9pp9WexNBr23T4KxeK8z7wYSrLVshSnVkLv8FgCINbF5CfL6+1x4Iw7j2RYKD+
         XDyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPLWH5AA6bBLxstryJjS8KrEoDhqDJ9PaacxfJ+7BRiYQSDQMK9ilZA2Zl90Y/hN2pFnU9VOiYeh8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRSl9hcKSA/EaQFJHfvQ0CnVcpelS61kwbawiBvih9GZKIb9Ri
	BdFgnh+7slIe2Ut+hhmadVudfwMlkD/z/DjTWpUuIaXZlMwNFohfoTmE2nfXC3udY9UtmUT3rtZ
	4/gU0
X-Gm-Gg: ASbGncvwCVZpQE8mAGUWdH7m32Dm+INt8yuRGzcxU+h9Eg7Gd7gAAvFpn8z92DMj014
	EiS2bbBUlY1Kg0UESKd6lwDhTG0JqC2hjt7fa6d0jBiRRMKgpXFp4eqyldDwXDOyfjBFMXT5oBC
	zRLYiZ8kmiTnEzOP+oWQ6LP/wmG/QbP1XwScJNnZGChoYdYw0K4a4njiyF/joPUoM4egg4aoVR9
	TAApOZTZKz6so+uRT+BikPYt7sFGpuY+vX+JWmpOEuZzpW1Wy2nHFtuGkIn/g5t9uv4H+bfwcI3
	U95ZEYtwmw4DDxzfltnyOl4BRt92tuROmQaVWG7JoRBMUf9STL6AT7vSZgQUS2Axq0Yhb4ytGf5
	4CF0vakGcn3w=
X-Google-Smtp-Source: AGHT+IHny3D/gWDxUIqfuvTT+wNP4SQN43b5D98pz4Oyz+pD+zxR9Sz3GTWyxH2BvIqBfK8zfh4AVA==
X-Received: by 2002:a05:600c:4f8e:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44b8ab9bd9emr3386425e9.1.1747984655676;
        Fri, 23 May 2025 00:17:35 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm134133475e9.22.2025.05.23.00.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:17:35 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 09:17:34 +0200
Message-Id: <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
Cc: <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Anup Patel" <anup@brainfault.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, <kvm-riscv@lists.infradead.org>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
In-Reply-To: <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_001737_766946_1D8F0FFC 
X-CRM114-Status: GOOD (  12.16  )
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

MjAyNS0wNS0yMlQxNDo0Mzo0MC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8xNS8yNSA3OjM3IEFNLCBSYWRpbSBLcsOEbcODwqHDhSB3cm90ZToKPj4g
SGVsbG8sCj4+IAo+PiB0aGUgZGVzaWduIHN0aWxsIHJlcXVpcmVzIGEgZGlzY3Vzc2lvbi4KPj4g
Cj4+IFt2MyAxLzJdIHJlbW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRoYXQg
dGhlIEtWTSBjYXBhYmlsaXR5Cj4+IHdhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBh
bmQgcHJldmlld3MgYSBnZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQo+PiBsYWNrIG9mIHVzZXJzcGFj
ZSBjb250cm9sIG92ZXIgS1ZNIFNCSS4KPj4gCj4KPiBJIGFtIHN0aWxsIG1pc3NpbmcgdGhlIG1v
dGl2YXRpb24gYmVoaW5kIGl0LiBJZiB0aGUgbW90aXZhdGlvbiBpcyBTQkkgCj4gSFNNIHN1c3Bl
bmQsIHRoZSBQQVRDSDIgZG9lc24ndCBhY2hpZXZlIHRoYXQgYXMgaXQgZm9yd2FyZHMgZXZlcnkg
Y2FsbCAKPiB0byB0aGUgdXNlciBzcGFjZS4gV2h5IGRvIHlvdSB3YW50IHRvIGNvbnRyb2wgaHNt
IHN0YXJ0L3N0b3AgZnJvbSB0aGUgCj4gdXNlciBzcGFjZSA/CgpIU00gbmVlZHMgZml4aW5nLCBi
ZWNhdXNlIEtWTSBkb2Vzbid0IGtub3cgd2hhdCB0aGUgc3RhdGUgYWZ0ZXIKc2JpX2hhcnRfc3Rh
cnQgc2hvdWxkIGJlLgpGb3IgZXhhbXBsZSwgd2UgaGFkIGEgZGlzY3Vzc2lvbiBhYm91dCBzY291
bnRlcmVuIGFuZCByZWdhcmRsZXNzIG9mIHdoYXQKZGVmYXVsdCB3ZSBjaG9vc2UgaW4gS1ZNLCB0
aGUgdXNlcnNwYWNlIG1pZ2h0IHdhbnQgYSBkaWZmZXJlbnQgdmFsdWUuCkkgZG9uJ3QgdGhpbmsg
dGhhdCBIU00gc3RhcnQvc3RvcCBpcyBhIGhvdCBwYXRoLCBzbyB0cmFwcGluZyB0bwp1c2Vyc3Bh
Y2Ugc2VlbXMgYmV0dGVyIHRoYW4gYWRkaW5nIG1vcmUga2VybmVsIGNvZGUuCgpGb3J3YXJkaW5n
IGFsbCB0aGUgdW5pbXBsZW1lbnRlZCBTQkkgZWNhbGxzIHNob3VsZG4ndCBiZSBhIHBlcmZvcm1h
bmNlCmlzc3VlLCBiZWNhdXNlIFMtbW9kZSBzb2Z0d2FyZSB3b3VsZCBob3BlZnVsbHkgbGVhcm4g
YWZ0ZXIgdGhlIGZpcnN0CmVycm9yIGFuZCBzdG9wIHRyeWluZyBhZ2Fpbi4KCkFsbG93aW5nIHVz
ZXJzcGFjZSB0byBmdWxseSBpbXBsZW1lbnQgdGhlIGVjYWxsIGluc3RydWN0aW9uIG9uZSBvZiB0
aGUKbW90aXZhdGlvbnMgYXMgd2VsbCAtLSBTQkkgaXMgbm90IGEgcGFydCBvZiBSSVNDLVYgSVNB
LCBzbyBzb21lb25lIG1pZ2h0CmJlIGludGVyZXN0ZWQgaW4gYWNjZWxlcmF0aW5nIGEgZGlmZmVy
ZW50IE0tbW9kZSBzb2Z0d2FyZSB3aXRoIEtWTS4KCkknbGwgc2VuZCB2NCBsYXRlciB0b2RheSAt
LSB0aGVyZSBpcyBhIG1pc3NpbmcgcGFydCBpbiBbMi8yXSwgYmVjYXVzZQp1c2Vyc3BhY2UgYWxz
byBuZWVkcyB0byBiZSBhYmxlIHRvIGVtdWxhdGUgdGhlIGJhc2UgU0JJIGV4dGVuc2lvbi4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
