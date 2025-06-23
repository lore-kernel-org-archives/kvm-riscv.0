Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA336C77B7C
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QlGCa95L2hPuT5nLvucMeDrky/hwEynti7p9MCTMGE=; b=opV4o4rQsMf7Zg
	KvSuiLsBlU/X676/t8EEfKAbzkl61Idi33heLB2+Gf/7C29N6Z7aidn7ETJhsK1F2CNFwRJqnLGzo
	dOkIRIQP9Xtp5QA9EhV3HgxZMVkz+23Ge7b4hbGVLbAFIn2Hpy8KFux/KNjt8whx6wFSx8yi+2wcn
	g2GZ21uTnA3EYPwqBG9UedQb8x7wr/I/P1XUXgRXk6LkHtKdMeFQfsa03fPAE3AI31cMSrh83gAXo
	d4nFUiCrNphL7ks3GfrSrVQ7U5/qNahN8fD/EwTh5l7LvwZoXQv1N0szrODMLWO33U0o/2JzluvaC
	f7m6Um0lRq7es1VKj9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkt6-00000003Xiw-25si;
	Mon, 23 Jun 2025 17:23:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThtE-00000002zSs-02ac
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 14:11:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-234d3261631so28657275ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750687875; x=1751292675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JU0VDAOl0xp48slJP1HnDa01/Cn9JLDzXpC7kAL+XI=;
        b=TvZCD/DA14RH07MEDQo3sJFA6PoffQYONY6g3r6CVaX60fe9lOgZCdxS3HgC3PRP0d
         Rf/YJZGtvfwI/Xt2eOzXAatVytd2Ufx0lTSrEHGBgEQVGzyp9gGe8VU5lovxTRx6uwAw
         U7vEo3wv4ej02aDDXU9EcV1YDMwo8ZGVFj0t3GDGn9f/Joe9vnrLrt5U+1gK0/m4afYO
         RWDjxGkktxx1PCcK1Bcu7rAuKACMRLJR1bEK7oXHO5B7hgLaW2aWVcNSBmLiGSWKbjdW
         /ZomA86R+Q3/GtVPwedtID8ry9ksDmx/Dd5xHJKX4M+VQMIHWM8tTNqE2b7NMvVMunGh
         1S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687875; x=1751292675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JU0VDAOl0xp48slJP1HnDa01/Cn9JLDzXpC7kAL+XI=;
        b=nsSKiPTZatE/VRujXgeXJCSp6RAlJObFW41BzNLJvJSkub3qR/JfCEcc+yz+UtCnz0
         e4khr5Tj1Q4tKYGqrgCYItlL2c5cflqGHYrGsRxggYNrjiJaPlGrSryNcNYb9eMS43wU
         mk43rCNCSIU83YKs3Nle1WEHOjMh0UcPsZ42hAhPmao303fD/lusB5uQnnWCc0lO3fJh
         y7W2S2H1ZbzBHB/bk5VtS+8Ph39A+JZHOhO3Ok9QEB08ifP6E+QETNVrKKuI0Qm/8ESS
         cSK26/craZ10Tur0rcG3wag/5m3x1p3R0Hiu7oiKPtdyGVEdcNUrR8ECC/OaU0rD83zN
         LSAA==
X-Forwarded-Encrypted: i=1; AJvYcCVqYx0WsboUqJseCuO341KUdvR5r2lXcj4NDLnWdAZgVqGocaxvsK6faZZnbpOQp807aWL0T3+1n1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAyC8iIvcINaFUWaZ1f03U8DQYC0aEHLyeZHMFP1xogAbMFEFb
	pD4o9pIKv4JHZ98nRpA6vlBc1Hk6SyqCBQmUuEHrXuxbArJYSclpQnjdvYB549OOvfU=
X-Gm-Gg: ASbGnctmSRRXJAOkKNKrCPQNXn5f4QKfYBt5WZbDAmRwdTv1EgJ4zSpJD9Dszu/TFSX
	LDD654VDsfdgfPT/o85bvlG7XFKxlM+yBBK2BQEzx5OKZtWDXhdQ0owzUwJ/NTPCtO2q/G9MFVH
	+ItCpN2GFSBQSwGRfsiKSNAL2oc3quf3ORY3JuU9iS4rWhWbH2Pg4tg9FGBD2B12XEY52egik5l
	MGyTn/2IYYFuZXi+gLxxxUzMImZs9Aph3rRkU/H1d7R4+znK+rZnKIrm9av1eQ2lCygCmHpGGvB
	LEm/tbedtBB9ELv7ZG1uZnbCxmj6DcEneIl7ISj37OZoYqDRpvCIDGY7qkgIDKRpkmZpdBIsU49
	dSK2zy9jqyNRT+9rgl4q6NGRQ3STYfM8=
X-Google-Smtp-Source: AGHT+IGKd+CQPsVgOF0ea1oG9ZNvhLvhM2VtRT+tIBXg+tti1smIEI0Ux7dKipDMeg942JOeQKTvfQ==
X-Received: by 2002:a17:903:330b:b0:238:121:b841 with SMTP id d9443c01a7336-2380121b84bmr5146845ad.17.1750687875096;
        Mon, 23 Jun 2025 07:11:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f8261sm84407015ad.221.2025.06.23.07.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:11:14 -0700 (PDT)
Message-ID: <f18f7a72-b896-47a6-8f7d-f504a1a89026@rivosinc.com>
Date: Mon, 23 Jun 2025 16:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction
 fault
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
 <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
 <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
 <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
 <CAPYmKFtCx0qg4fEOVAhthXYvhu-X0MR5zXZLVfSmbCmNMN=ZYg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFtCx0qg4fEOVAhthXYvhu-X0MR5zXZLVfSmbCmNMN=ZYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071116_060512_6BA569EC 
X-CRM114-Status: GOOD (  24.75  )
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

CgpPbiAyMy8wNi8yMDI1IDE2OjA5LCBYdSBMdSB3cm90ZToKPiBPbiBNb24sIEp1biAyMywgMjAy
NSBhdCA5OjQy4oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90
ZToKPj4KPj4KPj4KPj4gT24gMjMvMDYvMjAyNSAxNTozMCwgWHUgTHUgd3JvdGU6Cj4+PiBIaSBD
bMOpbWVudCwKPj4+Cj4+PiBPbiBNb24sIEp1biAyMywgMjAyNSBhdCA4OjM14oCvUE0gQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4KPj4+
PiBPbiAyMy8wNi8yMDI1IDE0OjEyLCBYdSBMdSB3cm90ZToKPj4+Pj4gSGkgQ2zDqW1lbnQsCj4+
Pj4+Cj4+Pj4+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDQ6MDXigK9QTSBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gT24gMjAvMDYvMjAyNSAxNDowNCwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+Pj4+IDIw
MjUtMDYtMjBUMTc6MTc6MjArMDg6MDAsIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29t
PjoKPj4+Pj4+Pj4gRGVsZWdhdGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBWUyBtb2Rl
IGluIGRlZmF1bHQgdG8gYXZvaWQgc3VjaAo+Pj4+Pj4+PiBleGNlcHRpb25zIGJlaW5nIHRyYXBw
ZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4+Pj4+Pj4+IC0t
LQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4+Pj4+Pj4+IEBAIC00OCw2ICs0
OCw3IEBACj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KEVYQ19JTlNUX0lMTEVHQUwpICAgIHwgXAo+Pj4+Pj4+Cj4+Pj4+Pj4gWW91IHNob3VsZCBhbHNv
IHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4aXQuCj4+Pj4+Pj4KPj4+
Pj4+PiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4+Pj4+Pj4gKEVY
Q19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1Ms
Cj4+Pj4+Pj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9BQ0NFU1MuKQo+Pj4+Pj4K
Pj4+Pj4+IEN1cnJlbnRseSwgT3BlblNCSSBkb2VzIG5vdCBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGV4
Y2VwdGlvbiBieSBkZWZhdWx0IGFuZAo+Pj4+Pj4gaGFuZGxlcyBtaXNhbGlnbmVkIGFjY2VzcyBi
eSBpdHNlbGYsIHRoaXMgaXMgKHBhcnRpYWxseSkgd2h5IHdlIGFkZGVkCj4+Pj4+PiB0aGUgRldG
VCBTQkkgZXh0ZW5zaW9uIHRvIHJlcXVlc3Qgc3VjaCBkZWxlZ2F0aW9uLiBTaW5jZSBzb21lIHN1
cGVydmlzb3IKPj4+Pj4+IHNvZnR3YXJlIGV4cGVjdCB0aGF0IGRlZmF1bHQsIHRoZXkgZG8gbm90
IGhhdmUgY29kZSB0byBoYW5kbGUgbWlzYWxpZ25lZAo+Pj4+Pj4gYWNjZXNzZXMgZW11bGF0aW9u
LiBTbyB0aGV5IHNob3VsZCBub3QgYmUgZGVsZWdhdGVkIGJ5IGRlZmF1bHQuCj4+Pj4+Cj4+Pj4+
IEl0IGRvZXNuJ3QgbWF0dGVyIHdoZXRoZXIgdGhlc2UgZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVk
IGluIG1lZGVsZWcuCj4+Pj4KPj4+PiBOb3Qgc3VyZSB0byB0b3RhbGx5IHVuZGVyc3RhbmQsIGJ1
dCBpZiB0aGUgZXhjZXB0aW9ucyBhcmUgbm90IGRlbGVnYXRlZAo+Pj4+IGluIG1lZGVsZWcsIHRo
ZXkgd29uJ3QgYmUgZGVsZWdhdGVkIHRvIFZTLW1vZGUgZXZlbiB0aG91Z2ggaGVkZWxlZyBiaXQK
Pj4+PiBpcyBzZXQgcmlnaHQgPyBUaGUgc3BlYyBzYXlzOgo+Pj4+Cj4+Pj4gQSBzeW5jaHJvbm91
cyB0cmFwIHRoYXQgaGFzIGJlZW4gZGVsZWdhdGVkIHRvIEhTLW1vZGUgKHVzaW5nIG1lZGVsZWcp
Cj4+Pj4gaXMgZnVydGhlciBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBpZiBWPTEgYmVmb3JlIHRoZSB0
cmFwIGFuZCB0aGUKPj4+PiBjb3JyZXNwb25kaW5nIGhlZGVsZWcgYml0IGlzIHNldC4KPj4+Cj4+
PiBZZXMsIHlvdSBhcmUgcmlnaHQuIFRoZSBpbGxlZ2FsIGluc24gZXhjZXB0aW9uIGlzIHN0aWxs
IHRyYXBwZWQgaW4gTQo+Pj4gbW9kZSBpZiBpdCBpcyBub3QgZGVsZWdhdGVkIGluIG1lZGVsZWcu
IEJ1dCBkZWxlZ2F0aW5nIGl0IGluIGhlZGVsZWcKPj4+IGlzIHN0aWxsIHVzZWZ1bC4gVGhlIG9w
ZW5zYmkgd2lsbCBjaGVjayBDU1JfSEVERUxFRyBpbiB0aGUgZnVuY3Rpb24KPj4+IHNiaV90cmFw
X3JlZGlyZWN0LiBJZiB0aGUgZXhjZXB0aW9uIGhhcyBiZWVuIGRlbGVnYXRlZCB0byBWUy1tb2Rl
IGluCj4+PiBDU1JfSEVETEVHLCBvcGVuc2JpIGNhbiBkaXJlY3RseSByZXR1cm4gYmFjayB0byBW
Uy1tb2RlLCB3aXRob3V0IHRoZQo+Pj4gb3ZlcmhlYWQgb2YgZ29pbmcgYmFjayB0byBIUy1tb2Rl
IGFuZCB0aGVuIGdvaW5nIGJhY2sgdG8gVlMtbW9kZS4KPj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4+
IEtWTSBpbiBIUy1tb2RlIGRvZXMgbm90IGhhbmRsZSBpbGxlZ2FsIGluc3RydWN0aW9uIG9yIG1p
c2FsaWduZWQKPj4+Pj4gYWNjZXNzIGFuZCBvbmx5IHJlZGlyZWN0cyB0aGVtIGJhY2sgdG8gVlMt
bW9kZS4gRGVsZWdhdGluZyBzdWNoCj4+Pj4+IGV4Y2VwdGlvbnMgaW4gaGVkZWxlZyBoZWxwcyBz
YXZlIENQVSB1c2FnZSBldmVuIHdoZW4gdGhleSBhcmUgbm90Cj4+Pj4+IGRlbGVnYXRlZCBpbiBt
ZWRlbGVnOiBvcGVuc2JpIHdpbGwgY2hlY2sgd2hldGhlciB0aGVzZSBleGNlcHRpb25zIGFyZQo+
Pj4+PiBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBhbmQgcmVkaXJlY3QgdGhlbSB0byBWUy1tb2RlIGlm
IHBvc3NpYmxlLiBUaGVyZQo+Pj4+PiBzZWVtcyB0byBiZSBubyBjb25mbGljdHMgd2l0aCBTU0Ug
aW1wbGVtZW50YXRpb24uIFBsZWFzZSBjb3JyZWN0IG1lIGlmCj4+Pj4+IEkgbWlzc2VkIGFueXRo
aW5nLgo+Pj4+Cj4+Pj4gQUZBSVUsIHRoaXMgbWVhbnMgdGhhdCBzaW5jZSBtZWRlbGVnIGJpdCBm
b3IgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3ZXJlCj4+Pj4gbm90IGRlbGVnYXRlZCB1cCB0byB0aGUg
aW50cm9kdWN0aW9uIG9mIHRoZSBGV0ZUIGV4dGVuc2lvbiwgVlMtbW9kZQo+Pj4+IGdlbmVyYXRl
ZCBtaXNhbGlnbmVkIGFjY2Vzc2VzIHdlcmUgaGFuZGxlZCBieSBPcGVuU0JJIHJpZ2h0ID8gTm93
IHRoYXQKPj4+PiB3ZSBhcmUgcmVxdWVzdGluZyBvcGVuU0JJIHRvIGRlbGVnYXRlIG1pc2FsaWdu
ZWQgYWNjZXNzZXMsIEhTLW1vZGUKPj4+PiBoYW5kbGVzIGl0J3Mgb3duIG1pc2FsaWduZWQgYWNj
ZXNzZXMgdGhyb3VnaCB0aGUgdHJhcCBoYW5kbGVyLiBXaXRoIHRoYXQKPj4+PiBjb25maWd1cmF0
aW9uLCBpZiBWUy1tb2RlIGdlbmVyYXRlIGEgbWlzYWxpZ25lZCBhY2Nlc3MsIGl0IHdpbGwgZW5k
IHVwCj4+Pj4gYmVpbmcgcmVkaXJlY3RlZCB0byBWUy1tb2RlIGFuZCB3b24ndCBiZSBoYW5kbGUg
YnkgSFMtbW9kZS4KPj4+Pgo+Pj4+IFRvIHN1bW1hcml6ZSwgcHJpb3IgdG8gRldGVCwgbWVkZWxl
ZyB3YXNuJ3QgZGVsZWdhdGluZyBtaXNhbGlnbmVkCj4+Pj4gYWNjZXNzZXMgdG8gUy1tb2RlOgo+
Pj4+Cj4+Pj4gLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRyYXAgdG8gTS1tb2RlIC0+
IE9wZW5TQkkgaGFuZGxlIGl0IC0+Cj4+Pj4gQmFjayB0byBWUy1tb2RlLCBtaXNhbGlnbmVkIGFj
Y2VzcyBmaXhlZCB1cCBieSBPcGVuU0JJCj4+Pgo+Pj4gWWVzLCB0aGlzIGlzIHdoYXQgSSB3YW50
IHRoZSBwcm9jZWR1cmUgb2YgaGFuZGxpbmcgaWxsZWdhbCBpbnNuCj4+PiBleGNlcHRpb25zIHRv
IGJlLiBBY3R1YWxseSBpdCBub3cgYmVoYXZlcyBhczoKPj4+Cj4+PiBWUy1tb2RlIGlsbGVnYWwg
aW5zbiBleGNlcHRpb24gLT4gdHJhcCB0byBNLW1vZGUgLT4gT3BlblNCSSBoYW5kbGVzIGl0Cj4+
PiAtPiBCYWNrIHRvIEhTLW1vZGUsIGRvZXMgbm90aGluZyAtPiBCYWNrIHRvIFZTLW1vZGUuCj4+
Pgo+Pj4gSSB3YW50IHRvIGF2b2lkIGdvaW5nIHRocm91Z2ggSFMtbW9kZS4KPj4KPj4gSGkgWHUs
Cj4+Cj4+IFllYWgsIHRoYXQgbWFrZSBzZW5zZSBhcyB3ZWxsIGJ1dCB0aGF0IHNob3VsZCBvbmx5
IGhhcHBlbiBpZiB0aGUgVlMtbW9kZQo+PiByZXF1ZXN0ZWQgbWlzYWxpZ25lZCBhY2Nlc3MgZGVs
ZWdhdGlvbiB2aWEgS1ZNIFNCSSBGV0ZUIGludGVyZmFjZS4gSQo+PiBrbm93IHRoYXQgY3VycmVu
dGx5IEtWTSBkb2VzIGRvIGFueXRoaW5nIHVzZWZ1bCBmcm9tIHRoZSBtaXNhbGlnbmVkCj4+IGV4
Y2VwdGlvbiBleGNlcHQgcmVkaXJlY3RpbmcgaXQgdG8gVlMtbW9kZSBidXQgSU1ITywgdGhhdCdz
IGEgcmVncmVzc2lvbgo+PiBJIGludHJvZHVjZWQgd2l0aCBGV0ZUIG1pc2FsaWduZWQgcmVxdWVz
dGVkIGRlbGVnYXRpb24uLi4KPj4KPj4+Cj4+Pj4KPj4+PiBOb3cgdGhhdCBMaW51eCB1c2VzIFNC
SSBGV0ZUIHRvIGRlbGVnYXRlcyBtaXNhbGlnbmVkIGFjY2Vzc2VzICh3aXRob3V0Cj4+Pj4gaGVk
ZWxlZyBiZWluZyBzZXQgZm9yIG1pc2FsaWduZWQgZGVsZWdhdGlvbiwgYnV0IHRoYXQgZG9lc24n
dCByZWFsbHkKPj4+PiBtYXR0ZXIsIHRoZSBvdXRjb21lIGlzIHRoZSBzYW1lKToKPj4+Pgo+Pj4+
IC0gVlMtbW9kZSBtaXNhbGlnbmVkIGFjY2VzcyAtPiB0cmFwIHRvIEhTLW1vZGUgLT4gcmVkaXJl
Y3Rpb24gdG8KPj4+PiBWUy1tb2RlLCBuZWVkcyB0byBoYW5kbGUgdGhlIG1pc2FsaWduZWQgYWNj
ZXNzIGJ5IGl0c2VsZgo+Pj4+Cj4+Pj4KPj4+PiBUaGlzIG1lYW5zIHRoYXQgcHJldmlvdXNseSwg
bWlzYWxpZ25lZCBhY2Nlc3Mgd2VyZSBzaWxlbnRseSBmaXhlZCB1cCBieQo+Pj4+IE9wZW5TQkkg
Zm9yIFZTLW1vZGUgYW5kIG5vdyB0aGF0IEZXRlQgaXMgdXNlZCBmb3IgZGVsZWdhdGlvbiwgdGhp
cyBpc24ndAo+Pj4+IHRydWUgYW55bW9yZS4gU28sIG9sZCBrZXJuZWwgb3Igc3VlcHJ2aXNvciBz
b2Z0d2FyZSB0aGF0ICBpbmNsdWRlZCBjb2RlCj4+Pj4gdG8gaGFuZGxlIG1pc2FsaWduZWQgYWNj
ZXNzZXMgd2lsbCBjcmFzaC4gRGlkIEkgbWlzc2VkIHNvbWV0aGluZyA/Cj4+Pgo+Pj4gR3JlYXQh
IFlvdSBtYWtlIGl0IHZlcnkgY2xlYXIhIFRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4gQnV0
IGV2ZW4KPj4+IHdoZW4gbWlzYWxpZ24gZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIHRvIEhTLW1v
ZGUsIEtWTSBzZWVtcyB0byBkbwo+Pj4gbm90aGluZyBidXQgcmVkaXJlY3QgdG8gVlMtbW9kZSB3
aGVuIFZNIGdldCB0cmFwcGVkIGR1ZSB0byBtaXNhbGlnbgo+Pj4gZXhjZXB0aW9ucy4KPj4KPj4g
RXhhY3RseSwgd2hpY2ggaXMgd2h5IEkgc2FpZCB0aGF0IGVpdGhlciBzZXR0aW5nIGhlZGVsZWcg
YnkgZGVmYXVsdCBvcgo+PiBub3Qgd2lsbCBsZWFkIHRvIHRoZSBzYW1lIG91dGNvbWUsIGllOiBW
Uy1tb2RlIG5lZWRzIHRvIGhhbmRsZSBhY2Nlc3MgYnkKPj4gaXRzZWxmICh3aGljaCBpcyBhIHJl
Z3Jlc3Npb24gaW50cm9kdWNlZCBieSBGV0ZUIHVzYWdlKS4KPj4KPj4KPj4+IFNvIG1heWJlIHdl
IGNhbiBkaXJlY3RseSBkZWxlZ2F0ZSB0aGUgbWlzYWxpZ25lZAo+Pj4gZXhjZXB0aW9ucyBpbiBo
ZWRlbGVnIHRvbyBiZWZvcmUgcnVubmluZyBWQ1BVIGFuZCByZXRyaWV2ZSB0aGVtIGFmdGVyCj4+
PiBWQ1BVIGV4aXN0cy4gQW5kIHRoZW4gdGhlIGhhbmRsaW5nIHByb2NlZHVyZSB3aWxsIGJlOgo+
Pj4KPj4+IFZTLW1vZGUgbWlzYWxpZ25lZCBleGNlcHRpb24gLT4gdHJhcCB0byBWUy1tb2RlIC0+
IFZTIGhhbmRsZXMgaXQgLT4KPj4+IEJhY2sgdG8gVlUtbW9kZS4KPj4KPj4gSSdkIGJldHRlciB3
YW50IHRvIGxldCB0aGUgSFMtbW9kZSBoYW5kbGUgdGhlIG1pc2FsaWduZWQgYWNjZXNzZXMgaWYg
bm90Cj4+IHJlcXVlc3RlZCB2aWEgdGhlIEtWTSBTQkkgRldGVCBpbnRlcmZhY2UgYnkgVlMtbW9k
ZSB0byBrZWVwIEhTLW1vZGUKPj4gZXhwZWN0ZWQgYmVoYXZpb3IuIEFzIHlvdSBwb2ludGVkIG91
dCwgdGhpcyBpcyBub3QgY3VycmVudGx5IHRoZSBjYXNlCj4+IGFuZCB0aGUgbWlzYWxpZ25lZCBl
eGNlcHRpb25zIGFyZSBkaXJlY3RseSByZWRpcmVjdGVkIHRvIFZTLW1vZGUsIHRoaXMKPj4gZGlm
ZmVycyBmcm9tIHdoYXQgd2FzIGFjdHVhbGx5IGRvbmUgcHJldmlvdXNseSB3aXRob3V0IEZXRlQg
KGllIE9wZW5TQkkKPj4gaGFuZGxlcyB0aGUgbWlzYWxpZ25lZCBhY2Nlc3MpLgo+Pgo+PiBUbyBz
dW1tYXJpemUsIEkgdGhpbmsgSFMtbW9kZSBzaG91bGQgZml4dXAgVlMtbW9kZSBtaXNhbGlnbmVk
IGFjY2Vzc2VzCj4+IHVubGVzcyByZXF1ZXN0ZWQgdmlhIEtWTSBTQkkgRldGVCBpbnRlcmZhY2Us
IGluIHdoaWNoIGNhc2UgaXQgd2lsbAo+PiBkZWxlZ2F0ZXMgdGhlbSAod2hpY2ggaXMgZG9uZSBi
eSB0aGUgRldGVCBzZXJpZXMpLiBUaGlzIHdvdWxkIG1hdGNoIHRoZQo+PiBIUy1tb2RlIDwtPiBP
cGVuU0JJIGJlaGF2aW9yLgo+IAo+IEdyZWF0ISBSb2dlciB0aGF0LiBIb3BlIGl0IGNhbiBiZSBm
aXhlZCBpbiB0aGUgZnV0dXJlLgoKQWhhaCAhIEknbGwgdGFrZSBhIGxvb2sgYXQgaXQgaWYgZXZl
cnlvbmUgYWdyZWVzIHRoYXQgaXQncyBhIHJlZ3Jlc3Npb24uCgpUaGFua3MsCgpDbMOpbWVudAoK
PiAKPj4KPj4gVGhhbmtzLAo+Pgo+PiBDbMOpbWVudAo+Pgo+Pj4KPj4+IFBsZWFzZSBjb3JyZWN0
IG1lIGlmIEkgbWlzc2VkIGFueXRoaW5nLgo+Pj4KPj4+IEJlc3QgUmVnYXJkcywKPj4+Cj4+PiBY
dSBMdQo+Pj4KPj4+Pgo+Pj4+IE5vdGU6IHRoaXMgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8g
eW91ciBzZXJpZXMgYnV0IG15IGludHJvZHVjdGlvbiBvZgo+Pj4+IEZXRlQgIQo+Pj4+Cj4+Pj4g
VGhhbmtzLAo+Pj4+Cj4+Pj4gQ2zDqW1lbnQKPj4+Pgo+Pj4+Pgo+Pj4+PiBCZXN0IFJlZ2FyZHMs
Cj4+Pj4+IFh1IEx1Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+IENs
w6ltZW50Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmtzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4+PiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+Pj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+Pj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo+Pj4+Pj4KPj4+Pgo+PgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
