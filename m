Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDCFC36000
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSql9EO7E7ncvh2nQ/N1L4QAQNZnFIDkeWGeK2eyTgY=; b=liffEWm8VF44sa
	xgDWe12DGb5erUxSCmzfaCmhUAZhWjgeBak6z2eNOZHO1Q0RHr8TOdmA/NpAW9zkkYJ3xX3Mj7nke
	4BTL+e3JNDATY6Z1gwHFyEOY0KtJWtrN82kpCfhMV3m5odAg+Ghrn5kT4g2riXgzciC94jr8GT02+
	pFl2Wnm7ahVqe9q4nISejDBq5ek677mnLb8DJs8qyDLD8t+1nlZmCu+84Qcpi+0+Zf4D24PoXYYQl
	IO9+gpJOKt9qYsizNcXfMq8iY+L/eeIkVs7n8j7iXZAArg5rEhttkyN3d/i8+j9OizJaaSBwLPgC4
	7dNPco/hrzxmxKlaPGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvan-00000009Qjf-2YxT;
	Wed, 19 Mar 2025 15:44:29 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvTn-00000009PR7-2TPT
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 15:37:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30bee278c2aso10040261fa.0
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Mar 2025 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742398634; x=1743003434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kYpJ+YWIm5kyww839SjAlRO2YxcNKECluRgtWLf4Uk=;
        b=Y1nHLBK5DKU4fWwZeOjOE4TcRH9HezmInO1OMf1INHUB+hgSOrqKm6PQ0ImeTg8X4J
         sPWU18qa1LFOEvhZgLKyV+MZbMWA1mnzLlnafKlBeDjRg+84/SP/vUubKqBv0FwFuLz4
         X64oKkcArKcrbq+jn0Kl9j7sJMKNStRXUlABCnS/xWjkV9TurOHiwP3GCqnU/nwObNv/
         l7kdqjRw354cA2UG+dZe1j3WBDxrk5ubocVHWkYmUjubS0RSy6YjkhUgXdxa03P17G7a
         R6L9Ypu5pJRUW4r3pAXMZaO6k5l6tJvyegkcXETh3lCSbQmk0bI64xQvEVG6+ggo2xs0
         S+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398634; x=1743003434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kYpJ+YWIm5kyww839SjAlRO2YxcNKECluRgtWLf4Uk=;
        b=Dqd5hcphAq4wvLQNWpDlwA6MQ9FSWIjbMUssAPfLMN7O9q95svgxvqkqYx6pSdTRk+
         o7ZxMJHnnWMJEXZ0y1BRoLa4lDn1qe1L/Pmlovx67Wer68DBntTjE9hbqkMemkwVvMMx
         MbpWJ2557LzFL13latOXfHztZ9EvI1X+n2o6LqsINLYDnSygGptvkSIs761KSaftYAib
         +e70Z8Rd2XuXI+QN6Szh8nbCPJaHtwHqS+Rnj/y3NcCpQ2Hwg4rBIsfUBma3eyOmOlvC
         1t+1MAAo9DmxvNT2ltvGXo7brmLIfi9Eqip5XPtk58TcIZC5q8Z/n+ds2OUodRtFbBkO
         klLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqsm4x2WjqwPMMMY6jR8u4dtUfW/K6u9jy0BjMQxgvuLObnQIFbIAgI14ia0cCwbgdGDPkX4ep1u0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDV54rs1mTX84vtTGRYbITIJs+yeck5o0LM7gM9iv+YWovLgWL
	WWgJawO44CdInpwab9iPGLPg15Bj+6MDn36vW3sKmuI40/icRs2HWU4wh14FZxm5sTIZ01mOQ5w
	T0gWyxzk52gUly1eJshJvHqxzQXe8oB9zU3J3nA==
X-Gm-Gg: ASbGncuneGpKrbSGttRiDJKRe+jD1eVuIVNvfhxrmdncPxQmYvfaTOdK3KPPowckkpH
	wZBM09UqYxTwJiuDxoT2UbOXFaHmPzNuWWqbhK4EttILagfltR3fQGEH9Fnmk2YanYBWyIMhQXW
	EqLqY2CpSkOMVorvxgmu7EHvQBBRM=
X-Google-Smtp-Source: AGHT+IFCptMnikEraAGR3+R+hzqsR4hELpmCfLcM8ATnaG6QWGGUrAiiIW6drO0CCaxdf/r2HggliQzJYjThBHJXzdk=
X-Received: by 2002:a05:6512:10d6:b0:549:74a7:12ce with SMTP id
 2adb3069b0e04-54a30486a73mr4191860e87.14.1742398633481; Wed, 19 Mar 2025
 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
In-Reply-To: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Mar 2025 21:07:01 +0530
X-Gm-Features: AQ5f1Jr9D_EWjJlaE139cU_qW55S55FYO9cnnZl-zgNXH-UdMwd_lNid37mPFXQ
Message-ID: <CAK9=C2WKuqmTtNYmhN2bnpb9PEE+mGJem_obvWsPVU4QrJm4eQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083715_641792_513F30BD 
X-CRM114-Status: GOOD (  16.61  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgMToxMeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IER1cmluZyBhIG1vZHVsZSByZW1vdmFsLCBrdm1fZXhpdCBp
bnZva2VzIGFyY2ggc3BlY2lmaWMgZGlzYWJsZQo+IGNhbGwgd2hpY2ggZGlzYWJsZXMgQUlBLiBI
b3dldmVyLCB3ZSBpbnZva2UgYWlhX2V4aXQgYmVmb3JlIGt2bV9leGl0Cj4gcmVzdWx0aW5nIGlu
IHRoZSBmb2xsb3dpbmcgd2FybmluZy4gS1ZNIGtlcm5lbCBtb2R1bGUgY2FuJ3QgYmUgaW5zZXJ0
ZWQKPiBhZnRlcndhcmRzIGR1ZSB0byBpbmNvbnNpc3RlbnQgc3RhdGUgb2YgSVJRLgo+Cj4gWzI1
NDY5LjAzMTM4OV0gcGVyY3B1IElSUSAzMSBzdGlsbCBlbmFibGVkIG9uIENQVTAhCj4gWzI1NDY5
LjAzMTczMl0gV0FSTklORzogQ1BVOiAzIFBJRDogOTQzIGF0IGtlcm5lbC9pcnEvbWFuYWdlLmM6
MjQ3NiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4gWzI1NDY5LjAzMTgwNF0gTW9kdWxl
cyBsaW5rZWQgaW46IGt2bSgtKQo+IFsyNTQ2OS4wMzE4NDhdIENQVTogMyBVSUQ6IDAgUElEOiA5
NDMgQ29tbTogcm1tb2QgTm90IHRhaW50ZWQgNi4xNC4wLXJjNS0wNjk0Ny1nOTFjNzYzMTE4ZjQ3
LWRpcnR5ICMyCj4gWzI1NDY5LjAzMTkwNV0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFl
bXUgKERUKQo+IFsyNTQ2OS4wMzE5MjhdIGVwYyA6IF9fZnJlZV9wZXJjcHVfaXJxKzB4YTIvMHgx
NTAKPiBbMjU0NjkuMDMxOTc2XSAgcmEgOiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4g
WzI1NDY5LjAzMjE5N10gZXBjIDogZmZmZmZmZmY4MDA3ZGIxZSByYSA6IGZmZmZmZmZmODAwN2Ri
MWUgc3AgOiBmZjIwMDAwMDAwODhiZDUwCj4gWzI1NDY5LjAzMjI0MV0gIGdwIDogZmZmZmZmZmY4
MTMxY2VmOCB0cCA6IGZmNjAwMDAwODBiOTY0MDAgdDAgOiBmZjIwMDAwMDAwODhiYWY4Cj4gWzI1
NDY5LjAzMjI4NV0gIHQxIDogZmZmZmZmZmZmZmZmZmZmYyB0MiA6IDUyNDkyMDc1NzA2MzcyNjUg
czAgOiBmZjIwMDAwMDAwODhiZDkwCj4gWzI1NDY5LjAzMjMyOV0gIHMxIDogZmY2MDAwMDA5OGIy
MTA4MCBhMCA6IDAzN2Q1MjdhMTVlYjRmMDAgYTEgOiAwMzdkNTI3YTE1ZWI0ZjAwCj4gWzI1NDY5
LjAzMjM3Ml0gIGEyIDogMDAwMDAwMDAwMDAwMDAyMyBhMyA6IDAwMDAwMDAwMDAwMDAwMDEgYTQg
OiBmZmZmZmZmZjgxMjJkYmY4Cj4gWzI1NDY5LjAzMjQxMF0gIGE1IDogMDAwMDAwMDAwMDAwMGZm
ZiBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOiBmZmZmZmZmZjgxMjJkYzEwCj4gWzI1NDY5LjAz
MjQ0OF0gIHMyIDogZmY2MDAwMDA4MGMyMmViMCBzMyA6IDAwMDAwMDAyMDAwMDAwMjIgczQgOiAw
MDAwMDAwMDAwMDAwMDFmCj4gWzI1NDY5LjAzMjQ4OF0gIHM1IDogZmY2MDAwMDA4MGMyMmUwMCBz
NiA6IGZmZmZmZmZmODBjMzUxYzAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWzI1NDY5LjAzMjU4
Ml0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMyBzOSA6IDAwMDA1NTU1NmI3ZmI0OTAgczEwOiAwMDAw
N2ZmZmYwZTEyZmEwCj4gWzI1NDY5LjAzMjYyMV0gIHMxMTogMDAwMDdmZmZmMGUxM2U5YSB0MyA6
IGZmZmZmZmZmODEzNTRhYzcgdDQgOiBmZmZmZmZmZjgxMzU0YWM3Cj4gWzI1NDY5LjAzMjY2NF0g
IHQ1IDogZmZmZmZmZmY4MTM1NGFjOCB0NiA6IGZmZmZmZmZmODEzNTRhYzcKPiBbMjU0NjkuMDMy
Njk4XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogZmZmZmZmZmY4MDA3ZGIxZSBj
YXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+IFsyNTQ2OS4wMzI3MzhdIFs8ZmZmZmZmZmY4MDA3ZGIx
ZT5dIF9fZnJlZV9wZXJjcHVfaXJxKzB4YTIvMHgxNTAKPiBbMjU0NjkuMDMyNzk3XSBbPGZmZmZm
ZmZmODAwN2RiZmM+XSBmcmVlX3BlcmNwdV9pcnErMHgzMC8weDVlCj4gWzI1NDY5LjAzMjg1Nl0g
WzxmZmZmZmZmZjAxM2E1N2RjPl0ga3ZtX3Jpc2N2X2FpYV9leGl0KzB4NDAvMHg0MiBba3ZtXQo+
IFsyNTQ2OS4wMzM5NDddIFs8ZmZmZmZmZmYwMTNiNGU4Mj5dIGNsZWFudXBfbW9kdWxlKzB4MTAv
MHgzMiBba3ZtXQo+IFsyNTQ2OS4wMzUzMDBdIFs8ZmZmZmZmZmY4MDA5YjE1MD5dIF9fcmlzY3Zf
c3lzX2RlbGV0ZV9tb2R1bGUrMHgxOGUvMHgxZmMKPiBbMjU0NjkuMDM1Mzc0XSBbPGZmZmZmZmZm
ODAwMGMxY2E+XSBzeXNjYWxsX2hhbmRsZXIrMHgzYS8weDQ2Cj4gWzI1NDY5LjAzNTQ1Nl0gWzxm
ZmZmZmZmZjgwOWVjOWE0Pl0gZG9fdHJhcF9lY2FsbF91KzB4NzIvMHgxMzQKPiBbMjU0NjkuMDM1
NTM2XSBbPGZmZmZmZmZmODA5ZjVlMTg+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTQ4LzB4MTU2Cj4K
PiBJbnZva2UgYWlhX2V4aXQgYW5kIG90aGVyIGFyY2ggc3BlY2lmaWMgY2xlYW51cCBmdW5jdGlv
bnMgYWZ0ZXIga3ZtX2V4aXQKPiBzbyB0aGF0IGRpc2FibGUgZ2V0cyBhIGNoYW5jZSB0byBiZSBj
YWxsZWQgZmlyc3QgYmVmb3JlIGV4aXQuCj4KPiBGaXhlczogNTRlNDMzMjBjMmJhICgiUklTQy1W
OiBLVk06IEluaXRpYWwgc2tlbGV0YWwgc3VwcG9ydCBmb3IgQUlBIikKPgo+IFNpZ25lZC1vZmYt
Ynk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKUXVldWVkIHRoaXMgcGF0Y2gg
Zm9yIExpbnV4LTYuMTUgc2luY2UgdGhlIG1lcmdlIHdpbmRvdyBpcyBuZWFyLgoKVGhhbmtzLApB
bnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCAxZmE4
YmU1ZWU1MDkuLjRiMjQ3MDVkYzYzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tYWlu
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBAQCAtMTcyLDggKzE3Miw4IEBAIG1v
ZHVsZV9pbml0KHJpc2N2X2t2bV9pbml0KTsKPgo+ICBzdGF0aWMgdm9pZCBfX2V4aXQgcmlzY3Zf
a3ZtX2V4aXQodm9pZCkKPiAgewo+IC0gICAgICAga3ZtX3Jpc2N2X3RlYXJkb3duKCk7Cj4gLQo+
ICAgICAgICAga3ZtX2V4aXQoKTsKPiArCj4gKyAgICAgICBrdm1fcmlzY3ZfdGVhcmRvd24oKTsK
PiAgfQo+ICBtb2R1bGVfZXhpdChyaXNjdl9rdm1fZXhpdCk7Cj4KPiAtLS0KPiBiYXNlLWNvbW1p
dDogNDcwMWYzM2ExMDcwMmQ1ZmM1NzdjMzI0MzRlYjYyYWRkZTBhMWFlMQo+IGNoYW5nZS1pZDog
MjAyNTAzMTYta3ZtX2V4aXRfZml4LTc3Y2QwNjMyZDc0MAo+IC0tCj4gUmVnYXJkcywKPiBBdGlz
aCBwYXRyYQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
