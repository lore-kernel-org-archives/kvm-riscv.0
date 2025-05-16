Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E10C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgjN0yQeQgygUEkrw6zwzafz3VmowukkLKOrWVra8uc=; b=fl0KEi7vIeeB3o
	eI0/zvRyMZneJuGEJBWsvGbiW+2ZCWDcC3LDX5Ust81FyaBWAtVeRj7Qnvz8mUG6tCJ3VEDdX69dY
	R9NPMG6aukWN7IvW0ddcAGq3SBDtnC3QWhkV3ZTd3dos5Ea4cZJj80XCLf3RxaBHyjDBo2nW5WypI
	tPsDSmvwJ1n9JOO53EGq48PlgtErFi5vopohJdY0TOf7XQHadCIgVAhP9guths4k+TkZLuqNWNnHU
	/ZkRJrnAVn1MtfCLAVtBmT0qDcANzaRA1Def2wb5VRVVw2C7F6OIzdcdLgb4rn79ngxBAFRIcsTJl
	S8KfnxF0beoc4opdcaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuLK-00000003PIM-2OGZ;
	Fri, 16 May 2025 12:39:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuLI-00000003PHX-0bRk
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 12:39:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad21a5466f6so617622066b.1
        for <kvm-riscv@lists.infradead.org>; Fri, 16 May 2025 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747399150; x=1748003950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=B+VaBZyVgGVg8bOM9jku/U1LqPkl2YNXaN65Su/xnW0EJqM8KjNc6wmwzIl4N8mngL
         XQfJOU7uucFBkcxdPVR7fo2O0v54zPdTuN+bIl9DbIa2pPn60ASzgKPIkYEMjn0dpidM
         QVbCI2qCdenCeh5DI9QWTeh6/jaO76nnj3X577lEZdRNXW2xYUjj0KW6kT2KSFP4YwMW
         z/yqTpNI5r3WjGsfxpOAE8A9ZCPia77NqW2R2EiUAIG7GaY0luTXd2hNZA/BpfcW0VMT
         LvTQSDON4v0kMWwH+Ma8KpoGqdH7DFUZc5f61Qzb9orC4Gu4/TPNnpt6YAx7iENxd27e
         82qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399150; x=1748003950;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=t5PgTvHja3P0uFoBRTc4piDaHgP/YGnAFjjQbeHXusku5EfGb/NVRgFKgvyg5tlAva
         nBp+vYxn2lj7ZQSztb8gEJWeVm4mdeV+Oa6EXca73Jk3ObfnVAFYuTHciQsWB7PkuYy8
         pWKUu6MU6XyURsfUzMJFGZYOvaL+EOyVMru1dLd0E2Tpdfw3qnZRG2eQBDDy+CeX9frr
         3nWLcw+GSL+BcVwdCgbk9ne7HY5IhWV5CqE1VqX78cZDW/mMNvGpCwYAQJU2QDHFvUSD
         BnDnL1BG16zFdsX+SfN1q8SC8Uy8YdSJcHkaDjLV7ohhNoIDK8+IVwgO4vTYkENzKjhS
         71ug==
X-Gm-Message-State: AOJu0YyqgSDmi2axCp3mRaXzFsBwGFTo/D218WAnG4id7qPS5XUBWUs8
	s30QpfdiCYmpUw0xORYeDNFTSq258DeCJvIHqYRJBDdIQU8tk9qdlFi8J3l/pDFLxhnMSXAajiG
	qnaF5vOE=
X-Gm-Gg: ASbGnctJ+X5PHQQHFZn+K9RFYExkkyzCE7YrNb5zVX6uGUJsauJGJLUoqa2biJKroE0
	DziHJ9uECUcaKLJmh1YToxvHT4JnQuNL3H/+SD3fq4nudl42fBnhXH5ka4vO2sIoZTNPaFIWj00
	Y9pOp7Ei4zM27IICitP6D4OT3vckzjGgTsgifG1+WfNKQAXDzsPWGVZR1EJOrN4v2vtJuXEQJ3/
	ywvwzIWI/qqey07hSLKsOR1nnc3WQuMrj+wtLskWjZYufpDOHHZ9beSn6dFKHPr5mHsgtGjKmRW
	uyQmfH28P8bwCmNOBCMa+llzLVrjoqlqfxdAyGzWt1X66QuD/6enSwsbgA==
X-Google-Smtp-Source: AGHT+IEIP3JUo4/gXsU3fbvKdiE+stLoARyyOdwaLPtOpDK0xW0RFEgVI9pNgG5UTxsDu4I2grbQIg==
X-Received: by 2002:a17:907:3fa0:b0:ad4:f5f1:28cf with SMTP id a640c23a62f3a-ad50f82067fmr632543466b.25.1747399150339;
        Fri, 16 May 2025 05:39:10 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383a6sm153554466b.120.2025.05.16.05.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:39:09 -0700 (PDT)
Date: Fri, 16 May 2025 14:39:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>
CC: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com> <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Message-ID: <70DD7215-76A0-493C-87CA-60A605842B44@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_053912_180770_A660D29A 
X-CRM114-Status: GOOD (  17.95  )
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

T24gTWF5IDE2LCAyMDI1IDI6MTg6MTggUE0gR01UKzAyOjAwLCBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPiB3cm90ZToKPk9uIEZyaSwgTWF5IDE2LCAyMDI1IGF0IDQ6NDHigK9BTSBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IFNjb3VudGVyZW4g
Q1NSIGNvbnRyb2xzIHRoZSBkaXJlY3QgYWNjZXNzIHRoZSBocG1jb3VudGVycyBhbmQgY3ljbGUv
Cj4+IGluc3RyZXQvdGltZSBmcm9tIHRoZSB1c2Vyc3BhY2UuIEl0J3MgdGhlIHN1cGVydmlzb3In
cyByZXNwb25zaWJpbGl0eQo+PiB0byBzZXQgaXQgdXAgY29ycmVjdGx5IGZvciBpdCdzIHVzZXIg
c3BhY2UuIFRoZXkgaHlwZXJ2aXNvciBkb2Vzbid0Cj4+IG5lZWQgdG8gZGVjaWRlIHRoZSBwb2xp
Y3kgb24gYmVoYWxmIG9mIHRoZSBzdXBlcnZpc29yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjM6Cj4+
IC0gUmVtb3ZlZCB0aGUgcmVkdW5kYW50IGRlY2xhcmF0aW9uCj4+IC0gTGluayB0byB2MjogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUxNS1maXhfc2NvdW50ZXJlbl92cy12Mi0xLTFm
ZDhkYzA2OTNlOEByaXZvc2luYy5jb20KPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBSZW1vdmUg
dGhlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24gaW5zdGVhZCBvZiBqdXN0IHNldHRpbmcgdGhl
IFRNIGJpdC4KPj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NTEzLWZpeF9zY291bnRlcmVuX3ZzLXYxLTEtYzFmNTJhZjkzYzc5QHJpdm9zaW5jLmNvbQo+PiAt
LS0KPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDQgLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gaW5kZXggNjBkNjg0Yzc2YzU4Li45YmZhYWU5YTEx
ZWEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPj4gQEAgLTExMSw3ICsxMTEsNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9j
cmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiAgewo+PiAgICAgICAgIGludCByYzsKPj4g
ICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4Owo+PiAtICAgICAgIHN0cnVjdCBr
dm1fdmNwdV9jc3IgKnJlc2V0X2NzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NzcjsKPj4K
Pj4gICAgICAgICBzcGluX2xvY2tfaW5pdCgmdmNwdS0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKPj4K
Pj4gQEAgLTE0Niw5ICsxNDUsNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+PiAgICAgICAgIGlmIChrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3Jf
Y29udGV4dCh2Y3B1LCBjbnR4KSkKPj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
Pgo+PiAtICAgICAgIC8qIEJ5IGRlZmF1bHQsIG1ha2UgQ1ksIFRNLCBhbmQgSVIgY291bnRlcnMg
YWNjZXNzaWJsZSBpbiBWVSBtb2RlICovCj4+IC0gICAgICAgcmVzZXRfY3NyLT5zY291bnRlcmVu
ID0gMHg3Owo+PiAtCj4+ICAgICAgICAgLyogU2V0dXAgVkNQVSB0aW1lciAqLwo+PiAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2luaXQodmNwdSk7Cj4+Cj4+Cj4+IC0tLQo+PiBiYXNlLWNv
bW1pdDogMDFmOTU1MDBhMTYyZmNhODhjZWZhYjllZDY0Y2VkZWQ1YWZhYmMxMgo+PiBjaGFuZ2Ut
aWQ6IDIwMjUwNTEzLWZpeF9zY291bnRlcmVuX3ZzLWZkZDg2MjU1YzdiNwo+PiAtLQo+Cj5PdmVy
YWxsLCB0aGlzIGxvb2tzIGdvb2QuCj4KPlJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+Cj5DdXJyZW50bHksIHRoZSBzY291bnRlcmVuLlRNIGJpdCBpcyBvbmx5
IHNldCBieSB0aGUgTGludXggU0JJIFBNVQo+ZHJpdmVyIGJ1dCBLVk0gUklTQy1WIG9ubHkgcHJv
dmlkZXMgU0JJIFBNVSBmb3IgZ3Vlc3Qgd2hlbgo+U3Njb2ZwbWYgaXMgYXZhaWxhYmxlIGluIGhv
c3Qgc28gd2UgbmVlZCB0aGUgYmVsb3cgaHVuayB0bwo+Y29tcGxldGVseSBnZXQgcmlkLW9mZiBz
Y291bnRlcmVuIGluaXRpYWxpemF0aW9uIGluIEtWTSBSSVNDLVYuCj4KPmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPmluZGV4
IDM1NmQ1Mzk3YjJhMi4uYmRmMzM1MmFjZjRjIDEwMDY0NAo+LS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TCj4rKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPkBAIC0xMzEsNiArMTMx
LDEyIEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4gICAgIGNzcncgQ1NSX0lFLCB6ZXJvCj4gICAg
IGNzcncgQ1NSX0lQLCB6ZXJvCj4KPisjaWZuZGVmIENPTkZJR19SSVNDVl9NX01PREUKPisgICAg
LyogRW5hYmxlIHRpbWUgQ1NSICovCj4rICAgIGxpIHQwLCAweDIKPisgICAgY3NydyBDU1JfU0NP
VU5URVJFTiwgdDAKPisjZW5kaWYKPisKPiAgICAgLyogTG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIg
Ki8KPiAgICAgbG9hZF9nbG9iYWxfcG9pbnRlcgo+Cj5AQCAtMjI2LDYgKzIzMiwxMCBAQCBTWU1f
Q09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+ICAgICAgKiB0byBoYW5kIGl0IHRvIHVzLgo+ICAg
ICAgKi8KPiAgICAgY3NyciBhMCwgQ1NSX01IQVJUSUQKPisjZWxzZQo+KyAgICAvKiBFbmFibGUg
dGltZSBDU1IgKi8KPisgICAgbGkgdDAsIDB4Mgo+KyAgICBjc3J3IENTUl9TQ09VTlRFUkVOLCB0
MAo+ICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfTV9NT0RFICovCj4KPiAgICAgLyogTG9hZCB0aGUg
Z2xvYmFsIHBvaW50ZXIgKi8KPgo+SSBoYXZlIHF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02
LjE2IHdpdGggdGhlIGFib3ZlIGh1bmsgc3F1YXNoZWQuCj4KPlRoYW5rcywKPkFudXAKPgo+LS0g
Cj5rdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj5rdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCll1
cCwgSSBoYWQgcGxhbm5lZCB0byBwb3N0IHNvbWV0aGluZyBsaWtlIHRoYXQgdG9vLCBidXQgZGlk
bid0IGdldCB0byBpdC4KClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
