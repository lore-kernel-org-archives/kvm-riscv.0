Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6876DC83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY+3elXMLUGXziB+0919nY72+xy49bdQqzXyd5W/BrU=; b=vUctyNJZHsKSuT
	AZsnswKAa1mUu+s4HrExfLdUDeNK6p+/PFwaByOfhPoF28L+KZqZF5WiLy9BAWKf9N22bQ1W9vQgF
	bNHGASRajmk8D49T1IQNoIyLc1oTavTmLojOx55oAyMCn3Nkh0hnI7j4mfw42SgGVc3KBLDJp70G4
	BGNtt8NPS1ViT4Uw08aueDLiabYGh2fslo2wMpI8w54sAZZPf56vjGkwy3oWMp6iuErTSomHU0cIh
	s1d/iifLVfqW6aFgZ4+/Ih9BYOKveW+0JtFJMVxsPnmSM8P6RrhnOJ/tsGybcM/btWX0VlfqGXc+M
	CNfc2xakuOqBlRRZP8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRai-0000000F69I-0Pqg;
	Mon, 28 Jul 2025 17:24:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR75-0000000F2L0-1ZZP
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:54:13 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-87c017978e6so3525139f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753721650; x=1754326450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH510oq+ddwKySjTSU7h7Mjv+8k1DlfRXXv65SCkRG8=;
        b=Bu2NJTm4QifZyPqYGHN5M5N8R5LVxVM4KoMPGH7FtvopghHueYN8tT+4qsPmJrhPc0
         LUwS441lz6r6WHMVL1vdsbdqybIfJiZplAG9qJLfmJ8EQfkHqdeV2RDSHKgoHJSnVHob
         hXon4JpZFYknUXGv2k8rT/5j61WsdHBptvWJMBa8COD44/ffOUNSmMJPd3LzwD6vY4/w
         5jTC/BdYEc4b0wiHO6bMzx0ClGNs9/aYA6MwcOedOCCafCP8gaKq2lGN3zoJUWUqU9Px
         9pP2oVfDRNb2hpCnJ4dM3RRDkW3SFuJhnzxP/Bhj5lR6oR5X+aawE84egi353Umx40Gk
         u/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721650; x=1754326450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH510oq+ddwKySjTSU7h7Mjv+8k1DlfRXXv65SCkRG8=;
        b=N/JgKacJLs5ACkL1bWoy8+YYa1bDn1ohaQZqQeQ8xbV1kXKAxeJ1ddd/bMCTVF0rgi
         4jC5NxaTSM2VoImsUxikyls3FPBzWobGLRFZlc7LUleKInBx6WLdx94vbw4YR5jECHJl
         UwPACTNdWLa3wiITrl0saZ+ZJbSOUKMPBLiqTp+el+f9gfPqSEa9mXbIcIfW6t90s8ce
         FtSyU5JajaQl9VcNdu6TwEIR0TYY+sD/SWdPKcH4zRuVoGC7mL5OCPMOH4CG3mcfEoq+
         6NP5ssHA5tbyNmwMnXBxYsaM05/HAkYY4W0sjs6sZ1Mb0P8LnNW1X0fe34SyYMB4ILCA
         Zm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAF7CmYOcMwFntpt/QCQtYD7GEYQU8pcKQOZBkcaqoCWVLlILQ9bIXWHmceixrq0ztEIiMCXXJ1nc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxML2Mn7XrJ34sKc9YKiXXuHvZsmlfGjdOS2Z8De5nuuq6/tfax
	eRjEhhElQs3s4fLnldjYuHkUTtch4yPlNgRUkYMiDv5QkfvbLCUEAAPKLXtemI08VML43weAdXp
	pTURFo1ZJliXAGHJ/ZCO/8SSpxpMCwr8rTadWjSkxSQ==
X-Gm-Gg: ASbGnct5ibvKLcdyYx7S+TngsQQx83eXv8f4BMrt2P8ze/VQKgmZGXWD5bpTY9JZtyt
	Lv6Ae0J+XpB0h5O+9wfcWn8W+3kROxs8zDVOpsguSL/pbf7anHjYdm8LzNxMDa1YQ7ZwIsk2UZ7
	e5s/h2OS0w1v9kAvdXZs8BkHPnrbhRQWXRoNyw2u3mUtGY5aCI3RIGjBccEV9kMb170zKm2DErA
	60C7u0=
X-Google-Smtp-Source: AGHT+IE+ydlz1plQs5mKi/9M5YsolsQYwMvbn08BrO7ssd3p+pPCWkkLDRp1BiPYqlxZY55TBMCm6/WMQ6hV8/3ATig=
X-Received: by 2002:a05:6e02:3389:b0:3e2:9f5c:520f with SMTP id
 e9e14a558f8ab-3e3e92d90f2mr5397125ab.3.1753721650328; Mon, 28 Jul 2025
 09:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
 <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com> <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
In-Reply-To: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Jul 2025 22:23:57 +0530
X-Gm-Features: Ac12FXxqhCPoLRJ1O8eU-7ZYNbb9bkJ8jT__-z9EkgKxYTzx-2nDiU9AnbLeyyY
Message-ID: <CAAhSdy11ZTi60=sNXT+8VcA=NtNk_AQNWvPEUUh-ov_fnciH5Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_095411_416960_EAF7A5BA 
X-CRM114-Status: GOOD (  14.30  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMTA6MjDigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKPgo+IElsIGx1biAyOCBsdWcgMjAyNSwgMTg6MjEgQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IGhhIHNjcml0dG86Cj4gPgo+ID4gQ3VycmVu
dGx5LCB1c2Vyc3BhY2Ugb25seSBoYXMgYSB3YXkgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGVudGly
ZQo+ID4gU0JJIEZXRlQgZXh0ZW5zaW9uLiBXZSBkZWZpbml0ZWx5IG5lZWQgdG8gZXh0ZW5kIE9O
RV9SRUcKPiA+IGludGVyZmFjZSB0byBhbGxvdyB1c2Vyc3BhY2Ugc2F2ZS9yZXN0b3JlIFNCSSBG
V0ZUIHN0YXRlLiBJIGFtCj4gPiBzdXJlIHRoaXMgd2lsbCBoYXBwZW4gcHJldHR5IHNvb24gKHBy
b2JhYmx5IG5leHQgbWVyZ2Ugd2luZG93KS4KPiA+Cj4gPiBBdCB0aGUgbW9tZW50LCBJIGFtIG5v
dCBzdXJlIHdoZXRoZXIgdXNlcnNwYWNlIGFsc28gbmVlZHMgYQo+ID4gd2F5IHRvIGVuYWJsZS9k
aXNhYmxlIGluZGl2aWR1YWwgZmVhdHVyZXMgb2YgU0JJIEZXRlQgZXh0ZW5zaW9uLgo+ID4gV2hh
dCBkbyB5b3UgdGhpbmsgPwo+Cj4gWWVzLCB5b3UgZG8uIEZXRlQgZXh0ZW5zaW9ucyBhcmUgZXF1
aXZhbGVudCB0byBDUFUgZXh0ZW5zaW9ucy4gQnV0IGFsbAo+IHRoaXMgc2hvdWxkIGhhdmUgYmVl
biBkb25lIGJlZm9yZSBpbmNsdWRpbmcgQ2xlbWVudCdzIHdvcmsuIFdpdGhvdXQgaXQKPiB1c2Vy
c3BhY2UgaGFzIG5vIHdheSB0byBzdXBwb3J0IEZXRlQuCj4KPiBEcmV3LCBJIHNlZSB5b3UgaGF2
ZSBSZXZpZXdlZC1ieSBvbiB0aGUgcGF0Y2hlczsgcGxlYXNlIGtlZXAgYW4gZXllIG9uCj4gdGhp
cyBzdHVmZi4KPgo+IENhbiB5b3UgcmVzcGluIHdpdGggdGhlIGZpeCB0byB0aGUgU29CIGxpbmUg
YW5kIG5vIEZXRlQgc3VwcG9ydD8KClN1cmUsIEkgd2lsbCBzZW5kIHYyIFBSLgoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
