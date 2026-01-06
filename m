Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D2CCD0439
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 04:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iMJJj7h9dHvlIEeJIwCbl+IoXLBkTs2ZokwQSKLC6A=; b=KlVHZ98TpYgthC
	cC3nTlboiS/IvkwP3Ir4SmAp4HCv8qWRVBJCldbPjWuYK8/zSW9bFyIwXYwBPjceR1GwV0x7kLd/r
	5sYGexw5q66zknKcFhwZkYcsTMVE3V6nfCd3IfyARPDjBlBBMNJgeomEa0x+FSaY6jXcUHaeWzFj1
	aS9V+5omnKWP2klpOv2hmWEQeC8saTqRX4ONtzlp2WgTlrYmSszhOd7AZqRfEWTz9DHqNqOT8x3hM
	jUE4LrXYhqMobxfyNMCMv/2xgrCkdxBxvQOFUr+ngjdXi74e7Uqfim0mxtAvISL+PsRUzHQXvTO4p
	erCsW8Uv0r8G7ERBX7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7c-0000000CQ7s-47jL;
	Tue, 06 Jan 2026 04:56:45 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7a-0000000CQ79-1P7O
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 04:56:43 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-45a3145faddso234586b6e.2
        for <kvm-riscv@lists.infradead.org>; Mon, 05 Jan 2026 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675401; x=1768280201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=jn/VvSm5WWQH/5+24gHVtwYz2dt/Ezq82YxU7lU/bhTMpA1EtURZOfaaU/w0qckLGQ
         bnnba86FxEUeI1CbYt+u8NN5HKn8/Fp8SPYuJDKXnBuLE6Mm9lwEuu+KvQtfeuRCOTQB
         z7GQFXEcTklZDZGJ+bmswbGndK8CqXFPBc1EcnnR9GOcbIAJj8guKnZmHEKm4S3YZD/H
         kKtV20WLf2cTqaodkBpklIQLL/6hiLXvTtapIlF9vgyWUMwvut0/zs0IeOoZY5E6Ug2A
         HS8VbcMsHm0u56m8wj9Ws+3cTe3dMZCgZINdx8JgH39tTvVwzJ1ygm+6ERI1vvng0Na/
         pb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675401; x=1768280201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=H6LzeVwGs+kMPuFKybg+PMNO0VMhLcDHfYV53TFSqsEvyxhVM98skEIjI9bmihQaJ6
         lI7uxdGLEHASdlo69bC/hTtStes2545U7+p5Cg7/q3n4KoofUoZUXV4CfWmvK7wbVKdN
         uWPqFgV5dx0AIy7W23ZRhyeIvyLZtovvzauq8rNEXpI0BuKDFjTfBnrFN2wba+EQMyDN
         nRl4TWMzVqS/8lwENs9OJMKmVLkFOdFAfFz67MA7ubjjpKfCaAgqein3S9aSfEz1TU2z
         +ngckNUj/mKN1BdPKWb7fHDbFgLszvD21GfAIO55qew/8hgv4CB091dB7E32bMn13lvD
         88KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+edrYYJPiqHwe5Jabpk8KJOpflud82XaCL91BCCGafx7LMcfdzeJH9puu7Zxyj1FaCjdl6UYn/M0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5LJjV8+jvYxLVSw6w0K1VolbYiUocVoDKOtX1kgHHoTPjsNR
	nK7ZVNmH6sv2Mm//v2BG+8N72m1f4ZVKJQe+yabrjWjBI7xLozgtLOCco5DcgAAFMaLwjOTfNmj
	GwqnGleZaa9St1kiYntU3/yPVlXH1EGUbfL7JYsD2Tg==
X-Gm-Gg: AY/fxX7rPqCvuGsgEVBxXkJtCeZstXGLp6Q/wdYb6j9dIq9xAQwr/9oSF+rMbldH17o
	9iNfrb4dpG9DNjTMB+SfYqzcvHdBwP73ZMThUKlS3fLghWKDdefNVMDLPZQREQZOT4RacW0LsiB
	ckRoTyf/fuYILbMPwt4lEopuPYtT3l/9LcfVpOvk5b2GXXl6ePR2LW85cyvr7lEJCis0MjfmRGn
	bWF0h9sm916ocYjyKKy9vuujr2Qf21YlViUXA8QTMaWhvHg7wbHHaPeKJqCFF0ZlYKGNWG2am50
	Hu5LkGcHG7hr9h0cBScofm2xmNrBOg8+9PB0p7dP9Se1DHUh2U4wp1l7Pg==
X-Google-Smtp-Source: AGHT+IFYFZIDuKpjkDS72Ef6JCpoBzzGRuIzZj1eYSMd9ZLPsEbeYPPSGa4zpnzJp7w6utOo445xI/OFNWfh52Uwiq4=
X-Received: by 2002:a05:6820:f006:b0:65d:a21:d1f9 with SMTP id
 006d021491bc7-65f4799cc06mr1525576eaf.5.1767675400701; Mon, 05 Jan 2026
 20:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20251020042457.30915-1-luxu.kernel@bytedance.com> <20251020042457.30915-5-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042457.30915-5-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:29 +0530
X-Gm-Features: AQt7F2pAUL7KOytVD0mr7jwpoQ61NGCRNrXweF7HHu0OAcu7_RUK7gg5_B9FCMI
Message-ID: <CAAhSdy3btmd-G_335XjJ6O_+WFNyrq5wWYSEtEQHUeP1yKmLog@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205642_647023_D9CD6C0A 
X-CRM114-Status: GOOD (  12.83  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOTo1NeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IEV4dGVuZCB0aGUgS1ZNIElTQSBleHRlbnNpb24gT05FX1JF
RyBpbnRlcmZhY2UgdG8gYWxsb3cgS1ZNIHVzZXIgc3BhY2UKPiB0byBkZXRlY3QgYW5kIGVuYWJs
ZSBaYWxhc3IgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBYdSBM
dSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02
LjIwCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAyICsrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCj4gaW5kZXggZWYyN2Q0Mjg5ZGExMS4uNGZiYzMyZWY4ODhmYSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMTg1LDYgKzE4NSw3IEBAIGVudW0gS1ZNX1JJU0NW
X0lTQV9FWFRfSUQgewo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWklDQ1JTRSwKPiAgICAg
ICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1PLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRf
WkFMUlNDLAo+ICsgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkFMQVNSLAo+ICAgICAgICAgS1ZN
X1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gaW5kZXggY2Nl
NmEzOGVhNTRmMi4uNmFlNWY5ODU5ZjI1YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IEBAIC01
MCw2ICs1MCw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2Fycltd
ID0gewo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBQU1PKSwKPiAgICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihaQUJIQSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFDQVMpLAo+ICsgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFpBTEFTUiksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFM
UlNDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQVdSUyksCj4gICAgICAgICBLVk1fSVNB
X0VYVF9BUlIoWkJBKSwKPiBAQCAtMTg0LDYgKzE4NSw3IEBAIHN0YXRpYyBib29sIGt2bV9yaXNj
dl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQpCj4gICAgICAgICBj
YXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1POgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aQUJIQToKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVM6Cj4gKyAg
ICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pBTEFTUjoKPiAgICAgICAgIGNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkFMUlNDOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdS
UzoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkJBOgo+IC0tCj4gMi4yMC4xCj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
