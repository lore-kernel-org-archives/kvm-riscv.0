Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3C4E7718B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDFM4J9El9gG590gRaxQ6Je52VuGjQIAWbK7MHz6IZk=; b=W7GPk1fxhGnh6O
	cxkWpUiD9a10bNnDNpgwx54XPVJeElUaRRM0Anwmb0gw/zJ5WX0zm2yo1otwmCA7mE70N+LH05EoP
	/b7MqJWJi3WLfmV6JPv1mdYDu2vYRk5w/Gn0xGt2UHy/WXBfyXo0oUmG2lqiSm3fEIzzo+yGnKq2D
	vdRxpTVwG0tlVWaUe/QfW9lwP/dsd8O9HOR6xpMmKkwawdJH5HKT/o9qXo4cMPrnymBkTLNnWdATQ
	U8h2OaFOqylCP0F45hd8hlWKzNv9wtYCOgPNOz/YY3tfi1dfegwf2WgwvP00hT2uPak89VXv83X+r
	Y3FGEVGxB77uZhofbkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiq2-0000000A5Yp-2k03;
	Mon, 23 Dec 2024 13:51:14 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPipy-0000000A5Y1-1cjd
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 13:51:13 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a813899384so15073965ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Dec 2024 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734961869; x=1735566669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBUGbvOTK35f8UJtqBoqDjyz/sfzFGS+AJ+9yAi4e5I=;
        b=eTntlJUZ0kJ+aipSU1B1Qu88FjvVZA406nwgm2vL5YuN+kUlv4oD2zjjzFrEw5UC/3
         XAJ+esOPSyq4GZhnZVtH+BZsZyF9D2sJpxLfLpFHvqT21TMZRAVLZ3KJj8oAu8u7VAVV
         oCQl9FKa8W6zPDTwx84WILRdJNL9tGPRMU16thALIh+GOmuqFiGHiInqguMYURb4Rlfw
         hrZnjO8aWTCH+Z1jheh/4k1zorlkkfVT2zWpf0we4vfJRjaaShL23XuG1DmjdLrmGkDR
         OUcNtFrE4vCq4as1OP6GkOd97JyEO2NleDeqcgEjuWgut2QSPSfq7cqxzEMTg/8OaeG8
         lzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734961869; x=1735566669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBUGbvOTK35f8UJtqBoqDjyz/sfzFGS+AJ+9yAi4e5I=;
        b=m5EwbvD4VRVktGNwlTGD+gs1O5mC8ZcDwR1b0Go0JMOlIVWHvGG3mPjXRYAXDVGqId
         F/0sWXvqahBAI+WbiH6dOBw6C0vAznEBXEebhS1Whl7cLVsO1SzDOWHhJE6e9PQwsrN4
         c166QmTJQLFzKLbix89wkjr6S2EdCMJ6506bVMHztMFKfiAybO7tzkC/jOjUfvUWSM+w
         3mEWr3WyH4CQ5mTU88Vz0p266sxkK4WBrpHbvW2qP69LK6I9Y/VHyL/tnjwXFzfnhs+l
         dHj1NuXjAzS5C5H/zeba9iPYcWGqoYrrn6QHtRoNunzmBXeyuYl0kmJO+68Ew+9sEM4t
         gNSw==
X-Forwarded-Encrypted: i=1; AJvYcCXpFbBkkGsln2tM+eS/O+O4HLdCpLoEYM35oY5H1tAhGWrU4p8UXIM49bXo9kf2R+7BUiAqp77cNRw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2mQ36/JG0UBElKtP+kGF435tfbZIYNF9gYfcWhMLmVFh0KDaT
	p9UqPCWOxrWZkYO74ApNaOwqX+mybPU9gZTUgrcJfIBfNrdLayrVZGtCQbBZEm1+McpgAnjKXAf
	hwNVPCMSdn/hDFlVospC7vvgVcLjzuVhFUCNfDQ==
X-Gm-Gg: ASbGnctt8it9sJAo8XtSXvCj+K9GqI5Bdyl0EZegtKHOnSFLbTKgr32ZSew01wTElU6
	t15M3/biL0b6kORzv9L19M5jwAZOeTn9uxw0eQlc=
X-Google-Smtp-Source: AGHT+IHVkaJEErCuD3prh5w1E8qTx+W2cqJc7u6exkKNlpVGYeWLcnq7zk029yKzN8LpTkNzf1AFZ0W0DTXNOw/cscM=
X-Received: by 2002:a05:6e02:b42:b0:3a7:e67f:3c58 with SMTP id
 e9e14a558f8ab-3c2d1aa2b80mr109886385ab.3.1734961869289; Mon, 23 Dec 2024
 05:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com> <20241212-kvm_guest_stat-v1-1-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-1-d1a6d0c862d5@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Dec 2024 19:20:58 +0530
X-Gm-Features: AbW1kvYTtPTa3y6m7DD0FCrFgf0XJvu4Z-dbRYtVc6TLQHaQkADxyK7GuE7MGZU
Message-ID: <CAAhSdy1SGZTh4k1A22YWMeQ4ryCHeh3rV9feu+3SSF8b86J5nA@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: KVM: Redirect instruction access fault trap
 to guest
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_055110_692168_F5FC7411 
X-CRM114-Status: GOOD (  14.91  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoyNuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMu
Y24+Cj4KPiBUaGUgTS1tb2RlIHJlZGlyZWN0cyBhbiB1bmhhbmRsZWQgaW5zdHJ1Y3Rpb24gYWNj
ZXNzCj4gZmF1bHQgdHJhcCBiYWNrIHRvIFMtbW9kZSB3aGVuIG5vdCBkZWxlZ2F0aW5nIGl0IHRv
Cj4gVlMtbW9kZShoZWRlbGVnKS4gSG93ZXZlciwgS1ZNIHJ1bm5pbmcgaW4gSFMtbW9kZQo+IHRl
cm1pbmF0ZXMgdGhlIFZTLW1vZGUgc29mdHdhcmUgd2hlbiBiYWNrIGZyb20gTS1tb2RlLgo+Cj4g
VGhlIEtWTSBzaG91bGQgcmVkaXJlY3QgdGhlIHRyYXAgYmFjayB0byBWUy1tb2RlLCBhbmQKPiBs
ZXQgVlMtbW9kZSB0cmFwIGhhbmRsZXIgZGVjaWRlIHRoZSBuZXh0IHN0ZXAuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IGZhOThlNWMwMjRiMi4uYzlmOGIyMDk0
NTU0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMTg3LDYgKzE4Nyw3IEBAIGludCBrdm1fcmlz
Y3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwK
PiAgICAgICAgIGNhc2UgRVhDX1NUT1JFX01JU0FMSUdORUQ6Cj4gICAgICAgICBjYXNlIEVYQ19M
T0FEX0FDQ0VTUzoKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JFX0FDQ0VTUzoKPiArICAgICAgIGNh
c2UgRVhDX0lOU1RfQUNDRVNTOgo+ICAgICAgICAgICAgICAgICBpZiAodmNwdS0+YXJjaC5ndWVz
dF9jb250ZXh0LmhzdGF0dXMgJiBIU1RBVFVTX1NQVikgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl92Y3B1X3RyYXBfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gMTsKPgo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
