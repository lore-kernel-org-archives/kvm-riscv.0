Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85665C83F1A
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 04:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghDp43KvZRIEtuPjLVQj3hIFVAA5uiaT0cDKkXwyR9A=; b=ADrxic5NYh1wJ3
	pV3nYhEIPeSRWJOGw7SDNZdNXH2U6MfWp0zc3bKX5o3k1IJP+5ZNbyUavzceTkeiqT5x5RHhmYT6u
	Rtze0XiEbYcs3J2qbKOZizsb3g+CG2yWwbuUPkKtN3Gc+hNpM5v80gB01pkrnrrU4aAhFIcQHOAgQ
	CUgKGsGPzShzxsOyD4MqTsgpcOigsvs4Yl0Gysnk8AKkKTbFAdMDI409U7c64Ea5bPvjmbTgEXc0v
	K16kC56qT8Tz93QEequYMC0kvia7z4gdy7nT68iBhdM5dfgbDH/JK/2skbFJk7rdfU8PfT6N+S07t
	9YldZJTlbFMf9CRTqjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccxu-0000000BgCD-1BxW;
	Fri, 18 Jul 2025 04:44:58 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccxs-0000000BgAv-20Oq
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 04:44:57 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3df3ce3ec91so6628945ab.2
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813896; x=1753418696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83O1oRzrZe3Tf7Tu6tuN/pr1ROh0NC7/xEo52yjes5Y=;
        b=naczrus1Tq87KIEJdd5IRl2AryXsqQCDtLqGkxOyl+uAol87k//LaBgDe3xtwuwD+i
         kO+zBZxwrYjIk60taZVtHutaovVy7aUx4Wl4w50sndIYjKcl65irNagwGldtY4zazukl
         Wk8lJTMp9QwMySpORkr0MccYNim/+pJSOldRrJLKtH/50ClULW1374VoRz5ySi5butMl
         4VbgvYr1gfwZhoPEC/d2xY7LtNFXwBqx3RpfYVUyDdzTdIZLoygLOoM+MV3ZIqVqUE4x
         +ikzyaSXEtElizXnxtPVjm4JoSwPZauijrMICd8Gov+75OXLllVDgCwRTG0ejEc6syGb
         uE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813896; x=1753418696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83O1oRzrZe3Tf7Tu6tuN/pr1ROh0NC7/xEo52yjes5Y=;
        b=D2GEIqe0lvgYe83WPT+1jw2zV7IQfXvrcjVSJdNiTQikuGkDMbotcJD1RSapcWhHw0
         jMym1MNuiWjzUB/pxPRio87QuaTWz7aDqTPsrRtoW7POL/2skMcjnvbIngCe0th9FC+C
         s6lW1f8IkG2Cn9Or8JZPHTP9CT8Ab8/noAgcKexBZYZimc6kbPtsWxK6UiassWH+PX/H
         C2zrujx8N6D/QC5MCuRlHFWeCQBqaU/9SPsVjMKqsUpezsUWPGBUDxyr6gmFJd7ZOxgR
         yKspLuBRYIf3MzBZoY9V7fJ+U7336vyq9eBNAuvtMWxmbVxAkaGPWDrBpeCvvCj083Wm
         j+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVGdo/q1nlubrSjy7XzHYkzx85lQw9pGiwCoolMei9CQRVbZQa5kIfwS9EK3ZTyHIYMHi9ROn3jqSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KAQlKO2vWOW+ajdLjjYNVdOJVaVnbRfmCpwUQPQpvAHYHqCp
	/7K6kRldUYAceouPd/11PaQW+lCYYUD3yFUaRHJO4F+Mz/X+uNrS+CdIPdtG9cSAxppwFrL+MVw
	iBvljmJYTC8n6ZkRJLHUiaMqqhaveZ992AFPhS5vK4A==
X-Gm-Gg: ASbGncs6JaYEv6QdNupf0VUyA1SiXmYTAkLruOkm3ZNyzFzn76HfhJHDVEBUo0DUkMQ
	TBxcoCpAyDGwUmMeBXdcVA6H8+EUZnOqtqgEf6lNve+s4EXurvFRwOSHo5DwzvicUwmfa42ZjTz
	bVZ/LtWT5mr91zuTbPfPWGtEgba7cmnQ1dv5AQYXkI/jg+V2uneBniveWhxzUCxe8ZIYV1tgVSQ
	plnJo9B
X-Google-Smtp-Source: AGHT+IEQ4otNtt6pp4gCO0IAJF0iXhgJzg+MtD1U6+aiOibg4+X80HGU1rRgRl9yQCkoPHu/mILJDq3l2KjWUtT69q8=
X-Received: by 2002:a05:6e02:3786:b0:3e2:9193:f37b with SMTP id
 e9e14a558f8ab-3e29193f441mr38720145ab.16.1752813895694; Thu, 17 Jul 2025
 21:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:14:43 +0530
X-Gm-Features: Ac12FXwDM51LcC52YMXP6x19jKkago_UCHpgC4vfOjbMUKEF0l7xeNYNTebWdEY
Message-ID: <CAAhSdy0t0UuLwBD5abY52dEaHtcai0uVDucY+vtrtxNj0uYQOw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to 3.0
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_214456_519520_2FE08E13 
X-CRM114-Status: GOOD (  15.07  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBVcGdyYWRlIHRoZSBTQkkgdmVyc2lvbiB0byB2My4wIHNv
IHRoYXQgY29ycmVzcG9uZGluZyBmZWF0dXJlcwo+IGNhbiBiZSBlbmFibGVkIGluIHRoZSBndWVz
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoK
RXh0ZW5kaW5nIHRoZSBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBLVk0gdXNlci1zcGFjZSBz
ZWxlY3QKU0JJIHZlcnNpb24gY2FuIGJlIGRvbmUgYXMgYSBzZXBhcmF0ZSBzZXJpZXMuCgpGb3Ig
dGhpcyBzZXJpZXMsIHdlIGNhbiBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2guCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gaW5kZXggNGVkNjIwM2NkZDMwLi4xOTQyOTllMGFiMGUg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBAQCAtMTEsNyArMTEs
NyBAQAo+Cj4gICNkZWZpbmUgS1ZNX1NCSV9JTVBJRCAzCj4KPiAtI2RlZmluZSBLVk1fU0JJX1ZF
UlNJT05fTUFKT1IgMgo+ICsjZGVmaW5lIEtWTV9TQklfVkVSU0lPTl9NQUpPUiAzCj4gICNkZWZp
bmUgS1ZNX1NCSV9WRVJTSU9OX01JTk9SIDAKPgo+ICBlbnVtIGt2bV9yaXNjdl9zYmlfZXh0X3N0
YXR1cyB7Cj4KPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
