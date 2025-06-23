Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F750C7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTwMPSPmphFD3ew315MIk6IU8YVYjtcLr83z83upeNg=; b=IBOsOATg5PUK8d
	tuBjiDiCc0sMA5QM920H6igIBhYzZlpT66jMEurJXRisJQV3WbheW/JLpLQhNYlLxMc7s+P/Q5rlR
	QDEvOKJzjQaSSg9A7K4sBt26owBuPqKjGvjc1rNJr1BRt/GZVeMJGnVU5UfF+7sZ0Aa7zvz2mTzwE
	YQb0zQuB8wI9VKHnuqKnIcofVhqptk+4/GPyL0SDMPj3VHjOFEzEHwUl6HdF8vNeRnXqUS/V/38Av
	mHuJMT1vtZT/F0lI8sQOP/9Sti1X+EpUolvfg9YaSZeXMgZM91gx5sQwrX35JQITfJaFz6AB2TQXA
	nkRRsgENqPS2kupBanKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqh-00000002SFL-0ppe;
	Mon, 23 Jun 2025 10:56:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2T-00000002Heu-0ZHA
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:04:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a528e301b0so207205f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750673071; x=1751277871; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=NTDhrfsGJfZAgTctrCflavoWgJSC7fXE9uJac7P+7OfZ0l5tKUM5rlpoXQU3GC3Uw3
         T2S6hK2VxOHC7THExsrC4Izw7pUPIqS5Q2d17YuVsqvhS3PyIRYtolRHWhCCRqgL1tc8
         Gsqb15w1OjocV1y+fdw9iEqMT2yiz1MjLfeiaeKAzv7QYCp1uKGHAwVeN9li12GaU24D
         OpStHmKfTMhsipCIznNCAfRnNWz+tjh2KIi0KjTyfjenqQtnpcAEmO9z9Ki2oiLz7ARm
         bmyqVy3F+PacY31Im9PNj3HL74y4ZxVmdT+dH+Kb+9RqnNwd/GjFitgZf9AMTXOESRy4
         iu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673071; x=1751277871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=j4ny/ei7qP8MBYMS+GbOKU3ua9lO6BHFe/OiA8PcDa8TTnEVIYb/3fkhe81kZkfq0g
         s/l6XrmZ5Kc4wjvWs6jVoco5RVgwIlxE5qXtuLZuh5DbdQbc0BX/GUHRCLNNiMIe/ue1
         vOrIs0m1YtaGxvOs8dXXxAMdUD7ANfXhzXs+oq4xDvd+6Zp8hk2n0YM9c3+om9BswTtU
         eb7gDdGLw+VDM23nxEE+FBX+ayylP3c7Da4Pk+ynyjZ+723Yfr+6OdN4r22FINaK7DzV
         gChdqE6WquNF/ewLDF3C5xZk5XxxPiAIWDlZJKdb1wrxIeB84GL5NPJcBrIuNG3OTuIu
         zSzA==
X-Forwarded-Encrypted: i=1; AJvYcCXgznLeXz7OUDPnnQJ2sE8rSMRTlF2wEYF5+cQuMEG/BFYfnyBT9fs8EFX1YQJqc0Pz6cva/aPFUXo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZnWMl/CI6M/NJD9NQY9T1Usao2M+G1CZLnbfDnk9eV67OtSF
	4jpXyMKWv4+X7OXtFBZJsxSEnTUYidKkmx8yXoy/YoRqtuBO/xK81PsZOmPi2EBqqTs=
X-Gm-Gg: ASbGnctX6GSqazK5+diSq6ghqfYbwjIrRmR5pZfr5Nb17RJe7aj5EWn43l1epxKVs9Y
	397crnEX2HKuVI3lWPe0njTPSbfCYIcmtuUyoyV0aeKvV/kYKyTHfUq5Ai5UGnnQ7cOuI2Yhizp
	C9876fkfEMlQMBbL3X6E6xQYv4nujQDPX54+TmObTBoXW192ZG9UAP9WwV2IqQUNPL5cME4WUHT
	3OhPmZM1cPllAoMoO/Uxb1RwDoXaaSCoLYKyRCE7QUidZnURcGpes4dpxa3iyAcpYbB4on2UjSC
	wnhmK4P4SebG5jkDM8apiCIABeM1FWQKHyJOLyS9xhE4vypGlAlTSzB9aH2bquWcywM=
X-Google-Smtp-Source: AGHT+IFs2pQCa+3bKTkdor2w3FPfdSYUbedMYRtHjGttAZlhUfRN/r/Qxtzp7NLRxL4SrXakOUW0PA==
X-Received: by 2002:a05:6000:24c8:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3a6d12e995amr3291773f8f.5.1750673071422;
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm9077130f8f.39.2025.06.23.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 23 Jun 2025 12:04:30 +0200
Message-Id: <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal
 instruction fault
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
In-Reply-To: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030433_181747_C0813820 
X-CRM114-Status: GOOD (  18.63  )
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

MjAyNS0wNi0yMlQxODoxMTo0OSswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgODowNOKAr1BNIFJh
ZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gMjAy
NS0wNi0yMFQxNzoxNzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+
Ogo+PiA+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgdG8gVlMgbW9kZSBpbiBk
ZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPj4gPiBleGNlcHRpb25zIGJlaW5nIHRyYXBwZWQgdG8gSFMg
YW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFh1IEx1
IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+PiA+IC0tLQo+PiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKPj4gPiBAQCAtNDgsNiArNDgsNyBAQAo+PiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfSU5TVF9JTExFR0FMKSAgICB8IFwKPj4KPj4g
WW91IHNob3VsZCBhbHNvIHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4
aXQuCj4KPiBJIG9ubHkgd2FudCB0byBkZWxlZ2F0ZSBpdCBieSBkZWZhdWx0LiBBbmQgS1ZNIG1h
eSBzdGlsbCB3YW50IHRvCj4gZGVsZWdhdGUgZGlmZmVyZW50IGV4Y2VwdGlvbnMgZm9yIGRpZmZl
cmVudCBWTXMgbGlrZSB3aGF0IGl0IGRvZXMgZm9yCj4gRVhDX0JSRUFLUE9JTlQuCgooSSB0aGlu
ayB3ZSBjb3VsZCBlYXNpbHkgcmVpbnRyb2R1Y2UgdGhlIGNvZGUgaWYgS1ZNIHdhbnRzIHRvIGRv
IHRoYXQgaW4KIHRoZSBmdXR1cmUuICBJIGFsc28gdGhpbmsgdGhhdCBpdCdzIGJhZCB0aGF0IHRo
aXMgcGF0Y2ggaXMgZG9pbmcgYW4KIG9ic2VydmFibGUgY2hhbmdlIHdpdGhvdXQgdXNlcnNwYWNl
IGludm9sdmVtZW50IC0tIHRoZSBjb3VudGluZyBvZiBLVk0KIFNCSSBQTVUgZXZlbnRzLCBidXQg
b3RoZXJzIHdpbGwgcHJvYmFibHkgZGlzYWdyZWUgd2l0aCBtZSBvbiB0aGlzLikKCj4gICAgICAg
ICAgICAgICAgIFNvIG1heWJlIGl0IGlzIGJldHRlciB0byByZXNlcnZlIHRoZXNlIGNvZGVzPwoK
UG9zc2libHksIHRoZSBjdXJyZW50IGlzIGFjY2VwdGFibGUgaWYgeW91IGhhdmUgY29uc2lkZXJl
ZCB0aGUKaW1wbGljYXRpb25zIG9uIFBNVSBldmVudHMuCgo+PiBBbmQgd2h5IG5vdCBkZWxlZ2F0
ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4+IChFWENfTE9BRF9NSVNBTElHTkVELCBFWENfU1RPUkVf
TUlTQUxJR05FRCwgRVhDX0xPQURfQUNDRVNTLAo+PiAgRVhDX1NUT1JFX0FDQ0VTUywgYW5kIEVY
Q19JTlNUX0FDQ0VTUy4pCj4KPiBUaGFua3MgZm9yIHRoZSByZW1pbmRlci4gSSB3aWxsIGhhdmUg
YSB0ZXN0IGFuZCByZXNlbmQgdGhlIHBhdGNoIGlmIGl0IHdvcmtzLgoKVGhlIG1pc2FsaWduZWQg
ZXhjZXB0aW9ucyBhcmUgYWxyZWFkeSBiZWluZyB3b3JrZWQgb24sIHNvIGRvbid0IHdhc3RlCnlv
dXIgdGltZSBvbiB0aGVtLCBzb3JyeS4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
