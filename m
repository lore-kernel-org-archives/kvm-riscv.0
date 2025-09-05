Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CBDCA0FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XR6omZeDWH/NGa8qf7akMe5llm7YFp3tXT2vL+qPApY=; b=wpCZEI+N/PvyCA
	VOFI8kpEV/JvmFRhze+tlD+tjHPZxL6JkrfzBLokMWVK3DhDgRQyyNgKalL+jglsPsOczoc2Be2zH
	wnez0Pfj7ALVO0JtItjrQ88QkOzFoKpstFMB0KRh3Q4gCjsqu250gCHVs07lF4+uw1FykfWKjVlkE
	J+p1KyUl2vaZAOWs52NgXJyJZ74kPvMTYP6mHnqtHV+lTawK26gC1PljjHuZR4UBfmZIXu32LywGe
	t3woZ1PuJJiCsXByvZTA4P0efVETUdOzC8DBJxcB9NYNPzNV59Y2H8f4uQOgEEtuYtxrBiTBj52lP
	k7ZhC02P/ACFAVVRiGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR9y-000000007k3-31JR;
	Fri, 05 Sep 2025 07:47:02 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQII-0000000HOZw-188D
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 06:51:35 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3f30b2b2d46so16928265ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Sep 2025 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757055093; x=1757659893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgikJ/iqkuT1625UVuOS4SU35VzBlFe8raMxnT2R3Dc=;
        b=PIydbGClj06ra6xomFPcXRxHiaspflGCAuA8JoCSrg5J2ZoIsd+jA1dnQOnyIUEfpC
         yw9b4V8deQ1FWw4iXA7zI+90UKdIhMNIVQafTdtaRR6CK+vSru9awd238zPU0Ects0iZ
         va6/jJHhZR/OXOMurcBNVj1ZTUjiNwODzjXOCMhiM1P4F23CG8nXPKGgGaMPogbFJDFb
         6prm8wQ4scHGegFypRrCwVwpkPSDVx8POBOu8CV2Pe0kXN91HEhCpRubKIiDP5MEqeWV
         g1/sw5Nlsg+mBl2wpXk7yRFLarrFp50F+TuEhAKfvTNLiejdSlH2hfbPoLT651hfWs74
         E64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055093; x=1757659893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgikJ/iqkuT1625UVuOS4SU35VzBlFe8raMxnT2R3Dc=;
        b=mml7v95hXGxhxpM8nm6kNIP8rzaLtn58TmDpbmxdctE6cY5+HpKkaVNhkPDldR+B5w
         oF1j62WXm0juc3XI4S+UW4GsuPw6Ew7in50xmY1ygCnBPU+VZLMPmOAlbLzSSfpYvkMo
         XqgGZmD0mytUI6AgpdBXoYjuWKxuHF96aCZUBqQMBuxB4GV5zhCKm6WaGEHxXxVrGHJs
         OjuVFGXdrZINeVlOsJ5jyLyuj6HDyrcG8FVrvyp8z2TAWzS7+wJx/qjUFfGmsQZ58Fae
         NfqNZDJ+5f+6yBw58G6j9nBnW5c/ZX63w/6J0msgmTlap7cCvKodbKB6J8ceoMxh2Rd/
         I3RA==
X-Forwarded-Encrypted: i=1; AJvYcCWb5jIXNCTaO7ZumMX9c2jl1blKDXPtOa2X0qvXWvoBO0ct4a5YVwNhCsvTrtGwrMzYINwXWPc76MM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6hompfvBOFnIoKSSZ6eGntpxV7+MF7iEm7ddEaE6APnyh+h2
	mTaTrs6ttTxyQ5vJX4yr8I4IIZf8FKor9kuLncmsZqN4GcxhNE4gEHnLR8FmxEEHT1G86zILx2E
	Gmz6xaCRhUFCd0rY3ely7UiaS1nRKQdXhov2MppLA9g==
X-Gm-Gg: ASbGncsvfgAlVMSqurxuGUu7ynKm/4TPbWRlvzg6ZJ6s2fSxqu1r2FPpm4b5eZ99LMV
	a77GqkNxEKVKDYOasTOl/1QAV7IXG0cAIXu9nuztn8x8Ca/lho++jK4Nr0BCnAiI1Km0Z01C7/9
	NjIHNV1tCH9kBJ+rTT2F6RpNsHQ4YQQUXU5LHX9pPcrir2wr1Y/kyLJaY1jRX6qfnsfBkv/OfwH
	T8/PQC/KTLc/4ZA8TF/6CIQdTid6K0O3L8P6NQqGCRn0uoFBvU=
X-Google-Smtp-Source: AGHT+IE0GkMpVI891j1Kf9mcve+BS80twMvgJMvqpPq6yQxysHrWNfdqH0YTTj+8Uuey/zDVOIAMoM8LYJUem+o/IZw=
X-Received: by 2002:a92:c26d:0:b0:3ec:4b19:1cff with SMTP id
 e9e14a558f8ab-3f7c4fe66a2mr38800885ab.7.1757055092738; Thu, 04 Sep 2025
 23:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250821142542.2472079-1-guoren@kernel.org> <20250821142542.2472079-4-guoren@kernel.org>
In-Reply-To: <20250821142542.2472079-4-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Sep 2025 12:21:20 +0530
X-Gm-Features: Ac12FXxkuV6dW8S9O6tABOo6HAbMSLVVmeuqhJ5kGcoNWolAeIVa3ME0D57bFtU
Message-ID: <CAAhSdy2yFQYbrp8npzBUwtviJYVQ=vv1F_k3jybYBvheYMgaZQ@mail.gmail.com>
Subject: Re: [PATCH V4 RESEND 3/3] RISC-V: KVM: Prevent HGATP_MODE_BARE passed
To: guoren@kernel.org
Cc: troy.mitchell@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, fangyu.yu@linux.alibaba.com, guoren@linux.alibaba.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, 
	Nutty Liu <nutty.liu@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235134_547842_2D100918 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNzo1NuKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiB1cnJlbnQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCgpIGFzc3Vt
ZXMgSC1leHRlbnNpb24gbXVzdAoKcy91cnJlbnQvQ3VycmVudC8KCj4gaGF2ZSBIR0FUUF9NT0RF
X1NWMzlYNC9TVjMyWDQgYXQgbGVhc3QsIGJ1dCB0aGUgc3BlYyBhbGxvd3MKPiBILWV4dGVuc2lv
biB3aXRoIEhHQVRQX01PREVfQkFSRSBhbG9uZS4gVGhlIEtWTSBkZXBlbmRzIG9uCj4gIUhHQVRQ
X01PREVfQkFSRSBhdCBsZWFzdCwgc28gZW5oYW5jZSB0aGUgZ3N0YWdlLW1vZGUtZGV0ZWN0Cj4g
dG8gYmxvY2sgSEdBVFBfTU9ERV9CQVJFLgo+Cj4gTW92ZSBnc3RhZ2UtbW9kZS1jaGVjayBjbG9z
ZXIgdG8gZ3N0YWdlLW1vZGUtZGV0ZWN0IHRvIHByZXZlbnQKPiB1bm5lY2Vzc2FyeSBpbml0Lgo+
Cj4gUmV2aWV3ZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguZGV2Pgo+
IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5LmxpdUBob3RtYWlsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICB8IDM1ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IGluZGV4IDI0YzI3MGQ2ZDBlMi4uYjY3ZDYw
ZDcyMmMyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiBAQCAtMzIxLDcgKzMyMSw3IEBAIHZvaWQgX19pbml0IGt2
bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3Qodm9pZCkKPiAgICAgICAgIGlmICgoY3NyX3JlYWQo
Q1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWNTdYNCkgewo+
ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgPSBIR0FUUF9NT0RFX1NWNTdY
NDsKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gNTsKPiAt
ICAgICAgICAgICAgICAgZ290byBza2lwX3N2NDh4NF90ZXN0Owo+ICsgICAgICAgICAgICAgICBn
b3RvIGRvbmU7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFRyeSBTdjQ4eDQgRy1zdGFnZSBt
b2RlICovCj4gQEAgLTMyOSwxMCArMzI5LDMxIEBAIHZvaWQgX19pbml0IGt2bV9yaXNjdl9nc3Rh
Z2VfbW9kZV9kZXRlY3Qodm9pZCkKPiAgICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+
PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWNDhYNCkgewo+ICAgICAgICAgICAg
ICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgPSBIR0FUUF9NT0RFX1NWNDhYNDsKPiAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gNDsKPiArICAgICAgICAgICAg
ICAgZ290byBkb25lOwo+ICAgICAgICAgfQo+IC1za2lwX3N2NDh4NF90ZXN0Ogo+Cj4gKyAgICAg
ICAvKiBUcnkgU3YzOXg0IEctc3RhZ2UgbW9kZSAqLwo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9I
R0FUUCwgSEdBVFBfTU9ERV9TVjM5WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gKyAgICAgICBp
ZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9E
RV9TVjM5WDQpIHsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlID0gSEdB
VFBfTU9ERV9TVjM5WDQ7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xl
dmVscyA9IDM7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiArICAgICAgIH0KPiArI2Vs
c2UgLyogQ09ORklHXzMyQklUICovCj4gKyAgICAgICAvKiBUcnkgU3YzMng0IEctc3RhZ2UgbW9k
ZSAqLwo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjMyWDQgPDwg
SEdBVFBfTU9ERV9TSElGVCk7Cj4gKyAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4g
SEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjMyWDQpIHsKPiArICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlID0gSEdBVFBfTU9ERV9TVjMyWDQ7Cj4gKyAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDI7Cj4gKyAgICAgICAgICAgICAg
IGdvdG8gZG9uZTsKPiArICAgICAgIH0KPiArI2VuZGlmCj4gKwo+ICsgICAgICAgLyogS1ZNIGRl
cGVuZHMgb24gIUhHQVRQX01PREVfT0ZGICovCj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21v
ZGUgPSBIR0FUUF9NT0RFX09GRjsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVs
cyA9IDA7Cj4gKwo+ICtkb25lOgo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgMCk7Cj4g
ICAgICAgICBrdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfYWxsKCk7Cj4gLSNlbmRpZgo+ICB9
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3ZtL21h
aW4uYwo+IGluZGV4IDY3Yzg3NmRlNzRlZi4uOGVlN2FhYTc0ZGRjIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL21haW4uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+IEBAIC05
Myw2ICs5MywyMyBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9rdm1faW5pdCh2b2lkKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbW9k
ZV9kZXRlY3QoKTsKPiArICAgICAgIHN3aXRjaCAoa3ZtX3Jpc2N2X2dzdGFnZV9tb2RlKSB7Cj4g
KyAgICAgICBjYXNlIEhHQVRQX01PREVfU1YzMlg0Ogo+ICsgICAgICAgICAgICAgICBzdHIgPSAi
U3YzMng0IjsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEhHQVRQX01P
REVfU1YzOVg0Ogo+ICsgICAgICAgICAgICAgICBzdHIgPSAiU3YzOXg0IjsKPiArICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEhHQVRQX01PREVfU1Y0OFg0Ogo+ICsgICAgICAg
ICAgICAgICBzdHIgPSAiU3Y0OHg0IjsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAg
ICBjYXNlIEhHQVRQX01PREVfU1Y1N1g0Ogo+ICsgICAgICAgICAgICAgICBzdHIgPSAiU3Y1N3g0
IjsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBkZWZhdWx0OgoKTmVlZCBrdm1f
cmlzY3ZfbmFjbF9leGl0KCkgaGVyZS4KCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+ICsgICAgICAgfQo+ICsgICAgICAga3ZtX2luZm8oInVzaW5nICVzIEctc3RhZ2UgcGFnZSB0
YWJsZSBmb3JtYXRcbiIsIHN0cik7CgpNb3ZpbmcgdGhlIGt2bV9pbmZvKCkgb3ZlciBoZXJlIG5v
dyBwcmludHMgRy1zdGFnZSBtb2RlCmJlZm9yZSBhbm5vdW5jaW5nIGF2YWlsYWJsaXR5IG9mIGgt
ZXh0ZW5zaW9uIHdoaWNoIGxvb2tzIG9kZC4KSXQncyBiZXR0ZXIgdG8ga2VlcCBrdm1faW5mbygp
IGluIHRoZSBzYW1lIGxvY2F0aW9uIGFuZCBvbmx5Cm1vdmUgdGhlIHN3aXRjaC1jYXNlLgoKPgo+
ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX2RldGVjdCgpOwo+Cj4gQEAgLTEzNSwyNCAr
MTUyLDYgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3Zfa3ZtX2luaXQodm9pZCkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHJjKSA/IHNsaXN0IDogIm5vIGZlYXR1cmVzIik7Cj4gICAgICAg
ICB9Cj4KPiAtICAgICAgIHN3aXRjaCAoa3ZtX3Jpc2N2X2dzdGFnZV9tb2RlKSB7Cj4gLSAgICAg
ICBjYXNlIEhHQVRQX01PREVfU1YzMlg0Ogo+IC0gICAgICAgICAgICAgICBzdHIgPSAiU3YzMng0
IjsKPiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICBjYXNlIEhHQVRQX01PREVfU1Yz
OVg0Ogo+IC0gICAgICAgICAgICAgICBzdHIgPSAiU3YzOXg0IjsKPiAtICAgICAgICAgICAgICAg
YnJlYWs7Cj4gLSAgICAgICBjYXNlIEhHQVRQX01PREVfU1Y0OFg0Ogo+IC0gICAgICAgICAgICAg
ICBzdHIgPSAiU3Y0OHg0IjsKPiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICBjYXNl
IEhHQVRQX01PREVfU1Y1N1g0Ogo+IC0gICAgICAgICAgICAgICBzdHIgPSAiU3Y1N3g0IjsKPiAt
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICBkZWZhdWx0Ogo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsKPiAtICAgICAgIH0KPiAtICAgICAgIGt2bV9pbmZvKCJ1c2luZyAl
cyBHLXN0YWdlIHBhZ2UgdGFibGUgZm9ybWF0XG4iLCBzdHIpOwo+IC0KPiAgICAgICAgIGt2bV9p
bmZvKCJWTUlEICVsZCBiaXRzIGF2YWlsYWJsZVxuIiwga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX2Jp
dHMoKSk7Cj4KPiAgICAgICAgIGlmIChrdm1fcmlzY3ZfYWlhX2F2YWlsYWJsZSgpKQo+IC0tCj4g
Mi40MC4xCj4KCk90aGVyd2lzZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lLgoKSSB3aWxsIHRha2Ug
Y2FyZSBvZiBtaW5vciBjb21tZW50cyBtZW50aW9uZWQgYWJvdmUgYXQgdGhlCnRpbWUgb2YgbWVy
Z2luZyB0aGlzIHNlcmllcy4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
