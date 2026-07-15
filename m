Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED2C44508
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Gj6acoLJCuelotcQO+Qq4vvaLWZ4SERV3OSwydTuKA=; b=ftBel2/CFi6QP+
	xi/bNNRtUDGzhAgEAxerE4WfaMQlAjNQdgorjuDRnZ/dEVHF9Sm41jur9eA0BptF+7Zg7u4/xFW54
	7r0ijaz6C3EjCY/mOjveSeSTxaHj9gKuxhACsd4cGSLVWGkL0G9i0o1DB8p7bcWY3DnBoscbjpqV9
	Tx/G70ht7sPXBgTJYguoFH3I1Ep9z4IxfTY5PgQaSGW7QPwHHX8nGP6MpR7kzZVJgxwCuM3kjzW5N
	iQtm32muQNbS+JxFNH98E03tSvcClRXQjvmByf8/MrZkwd4jsbJwhB4cHQTHwYAp1QS2w+ctWhRYt
	TKinO5EC/Vyual4918VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz57-0000000Eqod-0kHF;
	Wed, 15 Jul 2026 12:51:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4w-0000000EqdW-37UU
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 12:51:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso10198965e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 05:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784119868; cv=none;
        d=google.com; s=arc-20260327;
        b=bapDhBpx56R5z5U3XmyamWZke4/uig2MfPrrV424mF+0QtNYGv1L1kxBMzCJ478HVg
         0T8L9M91uBOK90BuzpOHDivcEyazzf1ZAGsDSRWYaHUcmb4cKb9bl1L6fEKXdew8O6GS
         PQ6v6Ce1Vws3Y2ResaWYNoKHVgCRVKDFBmDC9gxvXioqKhzJiOhgavrJZStA6uwp8YYi
         O8+KI6qyns6/abAYI1anQ155ttuHiAnfYiKxVfbYJEunsmOln9fjQVdiNJYtVc7bxI7X
         jkeabda8b4g2T7dfc4Rb1eFAaEG84y6qVFv5UFjdHslR9qDwY2UXCS6nCyebTuRRiUlR
         9pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        fh=t18sf0GElFFtKa/UT0rTtUp7YMUHFdH2rlF6XrX72hU=;
        b=CTE8DEmZuvCJy1Bn2KZggitKRXIPWxFfFQ361LPtMU5mR21tM+yqRuXxdipZegXkJY
         CfDmV/VHkvVqNL1qCiV75aY0p8ArMLOkN3gVeazjceKc8sRlqQ5ue4jKQX54G3K+mjDZ
         sBeb+RosTEuewfWHoNLieXcY2ZGfg48QbG+v3XtFe+++i48ACDjHaO/7GPYS82f0VJiV
         fpx6uPafc41up5xtIRus0Fd91smIGG1K7vA4a27QOdVrLOL9cvwbsOV3DagHmEa6zi+H
         /eKqIC9XofJp2+Hefnp6Ri9x7FTJ/q4iRDa6d8KY7DuqMUkiaXzLTu3ei8vCd+KCx/np
         hJSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784119868; x=1784724668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        b=MyHYYQoPKwSysQHpMX75V/iGVhp7tahy12yGnBZWKwdBknug8gyzKrXI4X7j1PFEeo
         Xgz9FjT3DuBWtGjrYV5sNtPHmi+UWctDh5L5lchynUks+TGKV1zYXzEPXSFkQdePW7Y+
         Feky173fzorowU2JGw8qHxbo2Dd6NmUZPcDIpxUFLSi6MiVIKkXaqykCEEJiKW7d8wLw
         OZjExCvEcVUdK0632aC87c57G5Yh4xyrN4mxnrijaMFjmgSSaTx2A9oZ0bEkyVEU6GVQ
         Db45H4sa+ZGcBUAcoWXSLjSqEYFIot35WGQr4AQRUrckKYR+3tNP0MxbfMPCLvjtzE2e
         KNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119868; x=1784724668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIFT3gs8xN30+UUY/21zDr3vYrRwm2h3kXT62GHy6VI=;
        b=Ds8e6b94Ap2ZVOnaQ+XJqrm4nkTh7/0pOPIlw3+GCt3kED+rG/96wwCO+cLOEqyGfK
         5gY+hrf4+z9kXN35J1Y/Tpch9pYtWXs2yU2fyF9cqV38o85sHLiiAR0BdBxM2JP2tdGU
         mbMDZtXslw/Tf4c4WH4vUSAQ+2r3ksmUm9dCPIPJynxFEMChAY6+t76kJBBa1F42rAOL
         IrZHBDRLV1GpDsWDZ5NpzJOhIz7dR9ejmjpDsFc5D++OrnOsOjf8SY7V1yYcuSaeGfF4
         7ePTQJd0CjmdDHaPLW5ilcmUBOb/bdSonAK6WwGNsGMyPlpYfpOchZfASbyBW5mGkrB2
         NJYg==
X-Forwarded-Encrypted: i=1; AHgh+RojSXfpRhIJmbYOgBgHpP7svbhW0BQwO+T1flps5JyBNlnXWQ2WLVJOHppIIrf+J/I5H2zB8zNF5Xc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznmi2pQB/vILvgpU5DlgJUVp88PpnOaEi6KLaHza53UgMtyTNT
	rWDEJc7a4c9JhtXAAHEO+kML6mxWCpHM9wGLQQdHthqgArTZ9FZKaskjQ89rN9lqrbU3BxQZFz7
	KAOu5t5N8x+3971XrJF64bAXixDaoFXVoaCNojfPJBQ==
X-Gm-Gg: AfdE7ckWMLOqDnhbIktT7KzkBB2qbqiS88H3+t41ktS7FZIVajIw7Bst0VfZ9vndl7x
	sXg14/TK0es08AT7Db3PgamEbqmbWe6p9B/kBaIjAoylWWU1kAckABxmEme7kaltGNzfh5z6G2T
	5GpQEeFOmag9Spd703VDy9RSPMFfcnwo0wvQTSmvUYWeAr9m4EKSvOk6KA0dgyvZy3YArBqXrHX
	Y8O3j9XUisQ2lAzJh0auqf6323xKDh3e51hPYlp82he9OWT+iXz6W+1sJPAsP6WuRTYz4+VwrOg
	RxBqwUAyEvQ/MGwB2J6lwOSlCz1WdmcCbswvUG+bJ0mWAyyABNV2w4Z2psQw5YgDu5zOkk32Bat
	Se9GYCQxRNPaSSjrwZzknQ2bFF/A=
X-Received: by 2002:a05:600c:34c9:b0:493:f826:89a6 with SMTP id
 5b1f17b1804b1-493f87806ddmr186711985e9.0.1784119867968; Wed, 15 Jul 2026
 05:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260715030818.75657-1-min_halo@163.com>
In-Reply-To: <20260715030818.75657-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Jul 2026 18:20:55 +0530
X-Gm-Features: AUfX_myEAwkg-DK47-Nw8T398vurr_etEiC2Mn8n3DA4o5cqkrypTMsduIATEYE
Message-ID: <CAAhSdy1cSDB-8XbkjMzhZafvOwM=ghjcaoiGd3NXGxLnAUMzkw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix Spectre-v1 in vector register access
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055111_102057_0D842010 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgODozOOKAr0FNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiBVc2VyLWNvbnRyb2xsZWQgcmVnaXN0ZXIgaW5kaWNlcyBmcm9tIHRoZSBPTkVf
UkVHIGlvY3RsIGFyZSB1c2VkIHRvCj4gaW5kZXggaW50byB0aGUgdmVjdG9yIHJlZ2lzdGVyIGJ1
ZmZlciAodjAuLnYzMSkuIFNhbml0aXplIHRoZSBjYWxjdWxhdGVkCj4gb2Zmc2V0IHdpdGggYXJy
YXlfaW5kZXhfbm9zcGVjKCkgdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmRzCj4g
YWNjZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91IDx6aG91em9uZ21pbkBreWxp
bm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExpbnV4LTcuMi1yY1gKClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDE0ICsrKysr
KysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gaW5kZXggNjJkMmZiNzdiYjliLi4zNzA4NjE2ZTJj
MzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8
bGludXgva3ZtX2hvc3QuaD4KPiArI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9rdm1faXNhLmg+Cj4gQEAgLTEyOSwxMSArMTMwLDIwIEBAIHN0YXRpYyBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfdnJlZ19hZGRyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiAgICAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgfSBlbHNlIGlmIChyZWdfbnVtIDw9IEtWTV9SRUdfUklTQ1ZfVkVDVE9SX1JFRygzMSkp
IHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyByZWdfb2Zmc2V0Owo+ICsKPiAgICAg
ICAgICAgICAgICAgaWYgKHJlZ19zaXplICE9IHZsZW5iKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICBXQVJOX09OKCFjbnR4LT52ZWN0
b3IuZGF0YXApOwo+IC0gICAgICAgICAgICAgICAqcmVnX2FkZHIgPSBjbnR4LT52ZWN0b3IuZGF0
YXAgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAocmVnX251bSAtIEtWTV9SRUdfUklT
Q1ZfVkVDVE9SX1JFRygwKSkgKiB2bGVuYjsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAg
ICAgICAgICAgICogVGhlIHJlZ19udW0gaXMgZGVyaXZlZCBmcm9tIHRoZSB1c2Vyc3BhY2UtcHJv
dmlkZWQgT05FX1JFRwo+ICsgICAgICAgICAgICAgICAgKiBpZC4gU2FuaXRpemUgaXQgd2l0aCBh
cnJheV9pbmRleF9ub3NwZWMoKSB0byBwcmV2ZW50Cj4gKyAgICAgICAgICAgICAgICAqIHNwZWN1
bGF0aXZlIG91dC1vZi1ib3VuZHMgYWNjZXNzIHRvIHRoZSB2ZWN0b3IgcmVnaXN0ZXIKPiArICAg
ICAgICAgICAgICAgICogYnVmZmVyICgzMiB2ZWN0b3IgcmVnaXN0ZXJzOiB2MC4udjMxKS4KPiAr
ICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJlZ19vZmZzZXQgPSBhcnJheV9p
bmRleF9ub3NwZWMoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdfbnVtIC0g
S1ZNX1JFR19SSVNDVl9WRUNUT1JfUkVHKDApLCAzMik7Cj4gKyAgICAgICAgICAgICAgICpyZWdf
YWRkciA9IGNudHgtPnZlY3Rvci5kYXRhcCArIHJlZ19vZmZzZXQgKiB2bGVuYjsKPiAgICAgICAg
IH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICAgICAgICAgfQo+
IC0tCj4gMi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNr
ZWQgYnkgSGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
