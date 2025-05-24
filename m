Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CBBC54ED1
	for <kvm-riscv@archiver.kernel.org>; Sat, 24 May 2025 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8U/7ZgXGRB0trFQrUJcuKoCdkBD9eqHzMfscVk2rc0=; b=oDgtTkBcoUxp37
	Y0vX9vr7Gfcg/wEoL1URySQAqk8nwQtPo6Vj3cqfYW7Inj8Nb9Wit2p4srOGIQi/2rvBO6xZRgXYR
	5Zh7IhOlps/CwtAmUdYt4CBFf9RkWltQBz30MAXaDLWAyAV9VUSgMXb95ch1TrXYab7gBpmVSgyOL
	F0ESfs8U9Sc7OFBKRkVYsL1WD2Y75udfPF7ZYecq5ococ9d+edcAJ9HO78Lh9N8KSlibw3OAmg+Gi
	Zcolf51AElJgSAdm2zfexvwLUdnhXAv6tgQUa9AAOiSV0kG66qEBTPeq4SVUOMtMopBAWmQRGd5GA
	cEP9cZWs4Puc+CgwIrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIs7r-00000006165-01L3;
	Sat, 24 May 2025 16:53:35 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIs7n-0000000615N-39b2
	for kvm-riscv@lists.infradead.org;
	Sat, 24 May 2025 16:53:33 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso8460225ab.2
        for <kvm-riscv@lists.infradead.org>; Sat, 24 May 2025 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1748105611; x=1748710411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OwKoML0MAYDTPVb8TPExeUIOI27H3gCygqp9HjGFNzY=;
        b=oMiYl2CLKCfu1C0qfw4QAf6XwAnGLfqftqBYoWN4J6jwJIf8GsToR7dJ31Fe2SSqsh
         d8sjvBCU4XLRL+lo30c3VOLlG9ECA6pJqA9KXCwqTOFUrZZ6QBhQ0WT1TeAYo1pMdq1m
         /5H1g7/3BKeWQgwlQy1DBrtPWvj1OatNnCawJ9Tl/qlzDLJSrj82MSmxL1ZirqtZj7pU
         JWIDc3LVbO/HlQWAZF8ewAjbcw7IVT8/8WMWKc/2G0DysOfMte5dFxMEQIa/gcYlh6BY
         z2VJLWtVAHcogrOTH5VeC4cum+BZx3mUlco+fwWU13ijUIAdxL3g1/rqjiopIkjrmSGz
         LGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748105611; x=1748710411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwKoML0MAYDTPVb8TPExeUIOI27H3gCygqp9HjGFNzY=;
        b=IyEkjR5vcBWxx2cv4oRUgIqDgJ1snWASf0URkcFwibsEu78p15dnv8BKRG9LgrEIbU
         PlIz8z3HkmkIFQY2OR/rsMMygVyB3xU7pXU+taJRUscVKunLP1nC9ltcO0dCLpU3P5uZ
         J6z8pwxCChxi7TslvwedGFMCR75K8POQEBYPsOQILThZSiFJzxfKhbuVV1UzrxC1FBiF
         v/k5KmzrdckvFPpzSkLzLN5Tm/iXeX4BUplO9PPmdSe+84rDhnqt4+PZlBzQkNWh1IcT
         gD8eV1/ISnuy/X+4hLutonbKa3/eL/r/7rnEZWFDdYk6l/wA8/ndjC+8+DIomRRdutWl
         U2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUCQz3EWWcpggrjusKHWW6uGwd6M8V40Vab5IUWy2KznC/lxErVoSj3YBNVyAGJ7ux/3NKNyVcy51I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdi+PmqxRaC3H3jAxFkQ1eCBm+LD8Q8QQ2pGiocDjKuLn/gZYm
	Rh6GCZyB71+OnN3ld+xtqxCHG6qab/n5DnfjV65j5OncPe/i/JEDuNB70fixSUGxEowaPneJsAz
	io1Vrwtkw2Ncawu+5EinrYiKF8cShuaV0Aspv7A5H2g==
X-Gm-Gg: ASbGncv+IIuLg7T7Bu3o97PntBPJtEOfm2paV74O07J0waxOLkj1ecMYhI49pgPuGbO
	GBlCMAbGPi4i7jzhbTU+YcU5MZeNzIAKLXY3N3HkZvq/ef8lCY0Mmdw312sIgHtHbWI2i4mLXE+
	IiSfP8C0mIiFlpGs655+dnV6rTotvjO1xZdBXI4cfcBa0=
X-Google-Smtp-Source: AGHT+IG3vP7Okat+L0gtmmsR6qLRW5AcyZWw1gZgeAT1V7lWH3wF+08plur/vF9mezTOpwDjrxhK9jtoeEUsTU2WJM8=
X-Received: by 2002:a05:6e02:3981:b0:3dc:79e5:e696 with SMTP id
 e9e14a558f8ab-3dc9b6a1243mr30239315ab.11.1748105610710; Sat, 24 May 2025
 09:53:30 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 May 2025 22:23:19 +0530
X-Gm-Features: AX0GCFvRi28me7s3_9LFe9PyWAhydowqCM3SLbjRgOwG-lz7Nf5u5s4_a-20sKE
Message-ID: <CAAhSdy0H6GEBaY1NfCyF5O1PsHAmuxgW4mQyoC47bVFmMjqk-Q@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.16
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_095331_791878_AAD4D682 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

SGkgUGFvbG8sCgpXZSBoYXZlIHRoZSBmb2xsb3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2
LjE2OgoxKSBBZGQgdmVjdG9yIHJlZ2lzdGVycyB0byBnZXQtcmVnLWxpc3Qgc2VsZnRlc3QKMikg
VkNQVSByZXNldCByZWxhdGVkIGltcHJvdmVtZW50cwozKSBSZW1vdmUgc2NvdW50ZXJlbiBpbml0
aWFsaXphdGlvbiBmcm9tIFZDUFUgcmVzZXQKNCkgU3VwcG9ydCBWQ1BVIHJlc2V0IGZyb20gdXNl
cnNwYWNlIHVzaW5nIHNldF9tcHN0YXRlKCkgaW9jdGwKICAgIChOT1RFOiB3ZSBoYXZlIHJlLXVz
ZWQgS1ZNX01QX1NUQVRFX0lOSVRfUkVDRUlWRUQKICAgICBmb3IgdGhpcyBwdXJwb3NlIHNpbmNl
IGl0IGlzIGEgdGVtcG9yYXJ5IHN0YXRlLiBUaGlzIHdheSBvZgogICAgIFZDUFUgcmVzZXQgb25s
eSByZXNldHMgdGhlIHJlZ2lzdGVyIHN0YXRlIGFuZCBkb2VzIG5vdAogICAgIGFmZmVjdCB0aGUg
YWN0dWFsIFZDUFUgTVBfU1RBVEUuIFRoaXMgbmV3IG1lY2hhbmlzbQogICAgIG9mIFZDUFUgcmVz
ZXQgY2FuIGJlIHVzZWQgYnkgS1ZNIHVzZXIgc3BhY2UgdXBvbgogICAgIFNCSSBzeXN0ZW0gcmVz
ZXQgdG8gcmVzZXQgdGhlIHJlZ2lzdGVyIHN0YXRlIG9mIHRoZSBWQ1BVCiAgICAgaW5pdGlhdGlu
ZyBTQkkgc3lzdGVtIHJlc2V0LiApCgpQbGVhc2UgcHVsbC4KClJlZ2FyZHMsCkFudXAKClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODdlYzdkNTI0OWJiOGViZjQwMjYxNDIwZGEw
NjlmYTIzOGMyMTc4OToKCiAgS1ZNOiBSSVNDLVY6IHJlc2V0IHNtc3RhdGVlbiBDU1JzICgyMDI1
LTA1LTAxIDE4OjI2OjE0ICswNTMwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3Zt
LXJpc2N2LTYuMTYtMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc5MTdiZTE3MDky
ODE4OWZlZmFkNDkwZDFhMTIzN2ZkZmE2Yjg1NmY6CgogIFJJU0MtVjogS1ZNOiBsb2NrIHRoZSBj
b3JyZWN0IG1wX3N0YXRlIGR1cmluZyByZXNldCAoMjAyNS0wNS0yNAoyMTozMDo0NyArMDUzMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KS1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuMTYKCi0gQWRkIHZlY3RvciByZWdpc3Rl
cnMgdG8gZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0Ci0gVkNQVSByZXNldCByZWxhdGVkIGltcHJvdmVt
ZW50cwotIFJlbW92ZSBzY291bnRlcmVuIGluaXRpYWxpemF0aW9uIGZyb20gVkNQVSByZXNldAot
IFN1cHBvcnQgVkNQVSByZXNldCBmcm9tIHVzZXJzcGFjZSB1c2luZyBzZXRfbXBzdGF0ZSgpIGlv
Y3RsCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkF0aXNoIFBhdHJhICg1KToKICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3Rz
OiBBbGlnbiB0aGUgdHJhcCBpbmZvcm1hdGlvbiB3aWh0IHB0X3JlZ3MKICAgICAgS1ZNOiByaXNj
djogc2VsZnRlc3RzOiBEZWNvZGUgc3R2YWwgdG8gaWRlbnRpZnkgZXhhY3QgZXhjZXB0aW9uIHR5
cGUKICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgdmVjdG9yIGV4dGVuc2lvbiB0ZXN0
cwogICAgICBSSVNDLVY6IEtWTTogUmVtb3ZlIGV4cGVyaW1lbnRhbCB0YWcgZm9yIFJJU0MtVgog
ICAgICBSSVNDLVY6IEtWTTogUmVtb3ZlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24KClJhZGlt
IEtyxI1tw6HFmSAoNSk6CiAgICAgIEtWTTogUklTQy1WOiByZWZhY3RvciB2ZWN0b3Igc3RhdGUg
cmVzZXQKICAgICAgS1ZNOiBSSVNDLVY6IHJlZmFjdG9yIHNiaSByZXNldCByZXF1ZXN0CiAgICAg
IEtWTTogUklTQy1WOiByZW1vdmUgdW5uZWNlc3NhcnkgU0JJIHJlc2V0IHN0YXRlCiAgICAgIFJJ
U0MtVjogS1ZNOiBhZGQgS1ZNX0NBUF9SSVNDVl9NUF9TVEFURV9SRVNFVAogICAgICBSSVNDLVY6
IEtWTTogbG9jayB0aGUgY29ycmVjdCBtcF9zdGF0ZSBkdXJpbmcgcmVzZXQKCiBEb2N1bWVudGF0
aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgICAgICAgICAgICAgICAgICB8ICAxMSArKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggICAgICAgICAgICAgICAgICAgfCAgIDMgLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgICAgICAgICAgICAgfCAgMTcgKyst
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAgICAgICB8ICAg
MyArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3ZlY3Rvci5oICAgICAgICAgICB8
ICAgNiArLQogYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTAgKysKIGFyY2gvcmlzY3Yva3ZtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNCArLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNjQgKysrKystLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzIgKysrKy0KIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2hzbS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICstCiBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9zeXN0ZW0uYyAgICAgICAgICAgICAgICAgICB8ICAxMCArLQogYXJjaC9yaXNj
di9rdm0vdmNwdV92ZWN0b3IuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KIGFyY2gv
cmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICsrCiBp
bmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAr
CiAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgICAgICB8ICAy
MyArKystCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L2hhbmRsZXJzLlMg
ICB8IDEzOSArKysrKysrKysrKy0tLS0tLS0tLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgIHwgICAyICstCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jICAgICB8ICAgMiArLQogdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2VicmVha190ZXN0LmMgICAgfCAgIDIgKy0KIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgIHwgMTMyICsrKysrKysrKysrKysr
KysrKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9zYmlfcG11X3Rlc3QuYyAg
IHwgIDI0ICsrKy0KIDIyIGZpbGVzIGNoYW5nZWQsIDM3NCBpbnNlcnRpb25zKCspLCAxNTIgZGVs
ZXRpb25zKC0pCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
