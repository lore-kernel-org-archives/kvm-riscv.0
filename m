Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11638CD4851
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/X/sduH6TOqLiaav2MKUXrp98FEUy6touPDw+eFU/c=; b=sXJRGJvr8XjwO0
	PKdejlbRhWrIo9/wb/wvkIE67cVXOBq+7LaFgCsm/WaytPl/CRp9mAd96JKNRuRvpu/bVcl5vFI2S
	C8oog1cLxFQmYn98YNcYl4gZuuZ54RUfSSMSgXTTMjPnn8zXcLlW0V7f4HEUq3uxZYjHAqzQQ3m+F
	jAZ36a6nqFvf591+vn246BxSmybr6y6HNY+EvdRBFnIb5sWwVrDyTAHARRBnWZy9gXYuFupDTpJ68
	h/B+msbKMj2szkhNoaBYVA+XscckCju2mdep4GvwKPF9vcckiGvz+nKRAYniHsuwQfcKiMQr5SeFB
	ASi4hWH8Cty1ZGLVD7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM6-00000007XdB-3BQC;
	Fri, 15 May 2026 06:49:06 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM3-00000007Xbb-3Agn
	for kvm-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:49:04 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4303eb92930so6162370fac.3
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 23:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827742; cv=none;
        d=google.com; s=arc-20240605;
        b=KZl2k3qpTvtjrTezuIzgUS4k0FVA+fnqjcC2AzuTAC3oPTVZwMG4ftdIdeMEDBE3yN
         eF9cfJh/4pQJS0HQIR3HEsHvE8H/rgwLHkqdeG1E/4sOAQ/h2hSzq+GLdY5KarFwg9Mc
         OVy0z7KdnawuBwVC7MSawnWdbEHtNMYNKRnt8gRgVHGdX4BJKOK2KTxfiuv9Pd2sWveY
         muqgBshm0W53/W/CdJiZ2XXtT3UwUqYatpkp7NG6TwFgL+Qo7n/9ugYj9Zvm0IkgbwtR
         MLd4E9sh8Ox5OpKPFAz/ce8mvdbuwKi2viL+5+jrd+11nXzEk57AdZmM01YNXYOtxDOz
         iZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        fh=o8f3oTTQPL1pP7UwZ5qUHf4Mu1qGmBcNUSjZJwFEZoM=;
        b=ELfcIB2DYAc/0BopaqtRABp62ZLUn5X28dCkTcv+7/+eG4LwFsnA+paB7tF+gUj4RH
         mzfGrQL/8rv8p6V4TP0s8LAL74b88xNpeUCBbVl/LL2txiERDsuLeCVc2FPWfT9YISXg
         n7WFLiShirbDQXTix+EUYW3WeHAie3D7+M+0lgNWgoPnO3wnO5qYfA21q2FlJZ8eM8BE
         2kJWeyqvKAPLG7CgzHpkr8hnGWd7CC9But14tkUbwB7kqA59DbSXbeFqPPuRRb6iTQoc
         m/fe3xQrQcJIhw4YulrcM9W7tAIbxHGFlozPsrXkjgusVAOTwU2E9nNZABCL/EKjvGUd
         Ce4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778827742; x=1779432542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        b=wdfpT+RvT8QH9OS5WOo/4nSG0VxLrFKUkmzj0yslLp2bpHe1CP2HF7rnqH+UVNosyP
         +pM0N/MUTBqC2F8nNrYh8PVieO4YsbgWOjOgGn/0j1DuCQr0N5/Qgwyx/hupY77ws+Kk
         o0x1tj9lDmDLdzYGhs8J9rE5Pb1u32+P6VgTLYG5ZGXEFmPCO/jlMHcrFi+PhPKRmGPE
         gR+l8Oz55+vKHVPVnkCibAii8NhdINdrQC391ViuNuBcYPsdKEukvSR3uW/Z0h3qLc+7
         CG7zZhKzUgmwVcPz48BgQD1kBYTW82KXoqLQ5xdGepjKPmYWDr1qYZrk1bHuePIgg95h
         JOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827742; x=1779432542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHfxsuw0D4onwKk/YyQ8YkX6C3b41IlcaLUUVhpqyNo=;
        b=ga6cS9zA99EFo8ibK3gt91SKHrgwNgt30jmHbB2IfQb/A3gOzsClaDSOobDvfA1f4d
         K6ZnRJeTkkOnyZ0nnWbe2QwTzjocvVMHCr6VrIk3jc13wNCKeX/R5mMdGrAaLbgc3BAf
         RvPq5PRK/S1Fjb1OWLkYPug83PuLYVLgdatSnjwx6Seoxneq+UuGmNxs6ziO/9OcDlJC
         birB+RdGLZ2LLyZi6tfMrHYPxtZ8fo/+7T/0Qc5enS+j9iMdI1cwi2Uxr7UHAcA+/kXu
         ETIjGQb0mcsu1cKPfOihIPuoVb6fm+thoHNmnoNZmjth8N73vN6tVUbo2cV3vsXkT3ZH
         slhg==
X-Forwarded-Encrypted: i=1; AFNElJ8s6KbqLB2IuIg75wdhFq9A3p1PR6ywyET3cF6eSRXmXJuqiBC5NRsY8gnHSjFzPAIjDShglYs8ask=@lists.infradead.org
X-Gm-Message-State: AOJu0YxENcSpXrjtv8r0IST504eq6TWO2FMiyFFb8JG9q7WGktfsmj3F
	7tcZZtr3IRfEbJyJFFrvN9wY/0mxYPs4avfESzWCDCmCHHB3bzBauASa0IKUGXnlevKukIVZQ65
	FePa4VEK8NnxeePJBqa6UlMZ6rem+ArdatB7X5ip8Ew==
X-Gm-Gg: Acq92OGkm9yqkfjlKJCuhNypV+sIkmzfvA6kAl4zi9RbuiuSrDhb78MevM1Dym7QXIa
	SwVr3APNV6WQgjogYLKsKCeOvSU2vD8NsStI8noxljGQi3FU4mgEgzvWpEsaJy41Uz5KwV/HFed
	qVZ4nK3FnlZZhtFLY9y92PclJKQ+yFZHmrqhr4N2lZ+a1R+v3CRMZ0SpYlUILdcZ4uAm4dqLNNI
	BLV93CMS3eDwe0nmhAbOOTpel0yQ6+00aQx31MxjHNON6Mo7Eqkk3TxVKu1uYj2RNPYrkPADrPl
	1F8bZro9GuL5pMX51/PL7y79+shRLfca2howJ6R3gVIPUtIv5twEqF9/FmgFzZa2/XUEaFXUqbU
	CsnCxTo4wGQI2IsTrZ/JDe2nq2+DUEB+svfoCBA==
X-Received: by 2002:a05:6820:627:b0:69b:95dd:46f0 with SMTP id
 006d021491bc7-69c9437cddemr1610219eaf.33.1778827742447; Thu, 14 May 2026
 23:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260514173642.41448-1-osama.abdelkader@gmail.com> <20260514173642.41448-2-osama.abdelkader@gmail.com>
In-Reply-To: <20260514173642.41448-2-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 12:18:49 +0530
X-Gm-Features: AVHnY4LXgXrzLbMRAQUcA2m5MJLX3u-xm7PLLcuSO_7vFtenzJgf3TlQ9hZcJyI
Message-ID: <CAAhSdy2+CpDu4YFXVqSDji268fapqO3sgXOSUD+fNZs9Fdb2-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_234903_793519_2CD0FAAC 
X-CRM114-Status: GOOD (  15.36  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MDbigK9QTSBPc2FtYSBBYmRlbGthZGVyCjxvc2Ft
YS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZl
bnRfaW5mbygpIHJldHVybmVkIC1FTk9NRU0gZnJvbSB0aGUKPiBTQkkgZXh0ZW5zaW9uIGhhbmRs
ZXIsIHdoaWNoIGNhdXNlZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKQo+IHRvIGFib3J0IEtW
TV9SVU4gYW5kIHN1cmZhY2UgdGhlIGVycm9yIHRvIHVzZXJzcGFjZSBpbnN0ZWFkIG9mCj4gY29t
cGxldGluZyB0aGUgRUNBTEwgd2l0aCBhIG5lZ2F0aXZlIFNCSSBlcnJvciBpbiBhMC4KPiBVc2Ug
U0JJX0VSUl9GQUlMVVJFIGFuZCB0aGUgbm9ybWFsIHJldGRhdGEgcGF0aCwgbWF0Y2hpbmcgb3Ro
ZXIgUE1VCj4gaGFuZGxlcnMgYW5kIGt2bV9zYmlfZXh0X3BtdV9oYW5kbGVyIGNvbW1lbnQuCj4K
PiBGaXhlczogZTMwOWZkMTEzYjlmICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBnZXQgZXZlbnQg
aW5mbyBmdW5jdGlvbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBPc2FtYSBBYmRlbGthZGVyIDxvc2FtYS5hYmRlbGthZGVyQGdtYWlsLmNvbT4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0
aGlzIGFzIGZpeCBmb3IgTGludXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9wbXUuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRleCA5MWFhMDE1
NWE0MjAuLmJiNDZkY2JmYjI0ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IEBAIC01MDEsOCArNTAxLDEw
IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZlbnRfaW5mbyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJfbG93Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVpbmZv
ID0ga3phbGxvYyhzaG1lbV9zaXplLCBHRlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghZWluZm8p
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsgICAgICAgaWYgKCFlaW5mbykg
ewo+ICsgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0ZBSUxVUkU7Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV9yZWFk
X2d1ZXN0KHZjcHUsIHNobWVtLCBlaW5mbywgc2htZW1fc2l6ZSk7Cj4gICAgICAgICBpZiAocmV0
KSB7Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
