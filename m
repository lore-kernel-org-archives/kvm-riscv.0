Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F3FC83F1B
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9nlx2I0Cn9YOzk0BZqH1q2Q6pCdTaPhZHuaaiPFwnY=; b=bNq1QQOu7jxysJ
	jV7lgD5bMbdxH64cpbgTNmlnUWU7ExdQkQJbOiQNzeGJFtGMsfDcUtxsJ5zNS07hpiJWpKYmLcvws
	o+56jNtFzOfcChrqv3kIkTgm5dlyuPbixNR7fulHtlxnXxOmw6mY5t8Xv9DsRICFNzDmrP1XytQh2
	wxX5mmd7ahFlknI885cGJhOPkcjQA3JCxFaexYAfAh4x3EPzGIl7yRFID6VIxCSwGesgAZbxh1/LV
	MWx8nGwYR0v6tB2rrROdXbblM0KLwGi5Z731XlM6nt/3WsNertV3qAjPb/MIomyXkT2IIZ8AMr4rO
	g/LE9BxaC+/lTNqX6Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIRf-00000009KWf-2vnk;
	Thu, 17 Jul 2025 06:50:19 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIRc-00000009KUu-3cXc
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:50:17 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-875acfc133dso24604439f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752735016; x=1753339816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRP0QV8PsF634DZbiH7Bzk9P/KhNWvkCg2Ntb8AXlf8=;
        b=e4rEa8ceLn7tsBQTziyIgGqkHjShvSoPq2xN6mI3WDD9mMokIJNhFl5/uci/L4dBF4
         UkAEUUbOQ3sTWzN0vBvQxDWP2Rg9UAL3GMe4W2ZHDs4yehwXEhGEhHrsYbdP6jPHIJr4
         1QkSLG2AlrkF2TApKdXRWweB+kFDuyKln/P5+Ooe78ey+zuSKvIxQq0+TNA2Z/a83Xno
         7S9aoEMKNQTDtTINVtC3iJxahi7aCioONd25Jt/G2ALVtYaEopYOW6KlL0J/sm4HWYj/
         3RHNX3ZvC+LLQzljhcrqltaUKMHgIWf7oxQB3dvsBo8UAjGL56wfmHiDXwY7db7duG8Z
         QuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735016; x=1753339816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRP0QV8PsF634DZbiH7Bzk9P/KhNWvkCg2Ntb8AXlf8=;
        b=s28tRzsrH5y1SKgCaMRVbePYyL+BgHtUWgO77Z1rMH8BjLbxYk3SfrqR0mcvKfn9Ck
         0yl9Yi3dgLW/jASXU+7flmvnvrwDT4Ln037TQQk00cMcEIxIE99d3iOvuwELau3dmuNF
         WWrgGKULhelIWm1mZMRzAUkPmaPXioMOCoRUdlwwaV0AmcrZHSlOSu8isvNQQUDLN9G4
         TOWv7n4LiwX++7hUfYvnDAsz9FRXYiND4l1zK4PXWiYxdcoFEsY/7EFO5F9DobqhKsk1
         Hu++MLf09MjKvJ9KFbnSGlgr9TsY2B7aQlIYQZJogWwmO6pdPDi4/0Y5LS+hV24wnGqD
         fcfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgxper8FyX76/6mV8O4UGeWUU/TiWhx7+jw5/Tq8c2IcC1bQZcc8Ge2W85sZQ7f8hUuiiiYIVTiSA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdqoZV+MpybPROKdBIWKa7UdLtnDG8J6wPKzD8jddGs0B1A2on
	OpU9PmqpwrO1BDVGbmSO+Kl1kCa/+3LZ8T6Xy4wfSwsAhZF6rLIB9unqTnuYbKN64lgSiuTjOsj
	6kbIAR29/yWlqC5uVabnvakeJbbA0IJpT1a7Lay8mFA==
X-Gm-Gg: ASbGncuzkmiW7bbSuw1WMoavwicyMiH9vfPcnkv5r3jdBoNwOn0FcbVf1SvIBaIJjQU
	ZCeL0Ohw14XnyWI6m0LSxIgflPeY3+Oxvv607c2UY6IulMtCyVfslzzJ5TUJJZYMUa2NxhIzrRt
	U3A+FNQWbFs/DEK3e8wQmdw9OuRGz71FwhDzIJ3tmYRZ1RG63HZdvTwbcM8PYfSFKxSfTK4hLgY
	P2kSkOBZG/sh10h
X-Google-Smtp-Source: AGHT+IFZ8nvXjCaZDaRw8/yf5Mquo02OxAogwOkqoPvU2H/adfyL7R+G1wf2juDA3dRWlbOsvfGrx3RO4c7yvPjrEd0=
X-Received: by 2002:a05:6602:b87:b0:873:3691:6fb8 with SMTP id
 ca18e2360f4ac-879c2a9ce57mr522646239f.8.1752735015916; Wed, 16 Jul 2025
 23:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <230d6c8c8b8dd83081fcfd8d83a4d17c8245fa2f.1731552790.git.zhouquan@iscas.ac.cn>
In-Reply-To: <230d6c8c8b8dd83081fcfd8d83a4d17c8245fa2f.1731552790.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 12:20:04 +0530
X-Gm-Features: Ac12FXxjsfWvqdAAcziMJWepGgazwPrr9F7mVz3S3QUEnBEAVtT1PWIUTzHtpEM
Message-ID: <CAAhSdy26sV0SKjzKJoWF9vH2gLsBnqRfV1rCrWGokM0E=w0nJg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use find_vma_intersection() to search for
 intersecting VMAs
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235016_899748_4F109913 
X-CRM114-Status: GOOD (  15.16  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNjo0M+KAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gVGhl
cmUgaXMgYWxyZWFkeSBhIGhlbHBlciBmdW5jdGlvbiBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24oKSBp
biBLVk0KPiBmb3Igc2VhcmNoaW5nIGludGVyc2VjdGluZyBWTUFzLCB1c2UgaXQgZGlyZWN0bHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vbW11LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMg
Yi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IGI2MzY1MGY5Yjk2Ni4uMzQ1MmE4Yjc3YWYz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vbW11LmMKPiBAQCAtNDg3LDEwICs0ODcsMTEgQEAgaW50IGt2bV9hcmNoX3ByZXBhcmVfbWVt
b3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgKiAgICAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgICAgICAgICovCj4gICAgICAg
ICBkbyB7Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gZmlu
ZF92bWEoY3VycmVudC0+bW0sIGh2YSk7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hOwo+ICAgICAgICAgICAgICAgICBodmFfdCB2bV9zdGFydCwgdm1fZW5kOwo+
Cj4gLSAgICAgICAgICAgICAgIGlmICghdm1hIHx8IHZtYS0+dm1fc3RhcnQgPj0gcmVnX2VuZCkK
PiArICAgICAgICAgICAgICAgdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKGN1cnJlbnQtPm1t
LCBodmEsIHJlZ19lbmQpOwo+ICsgICAgICAgICAgICAgICBpZiAoIXZtYSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPgo+ICAgICAgICAgICAgICAgICAvKgo+IC0tCj4gMi4zNC4x
Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
